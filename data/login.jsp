<%@ page import="java.io.File" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Properties" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="org.sirr.*" %>

<%!
public int get_max_log_fail(Connection db_con)
{
	ResultSet rs = null;
	Statement db_stmt = null;
	String q = "select max_log_fail from m_syslog";
	int DEF_MAX_LOG = 5;
	int max_log_fail = DEF_MAX_LOG;

	try {
		db_stmt = db_con.createStatement();
		rs = db_stmt.executeQuery(q);
		if (!rs.next()) {
			return DEF_MAX_LOG;
		}

		max_log_fail = rs.getInt("max_log_fail");

		if (max_log_fail < 0) {
			max_log_fail = DEF_MAX_LOG;
		}

		rs.close();
		db_stmt.close();
	} catch (Exception e) {
		return DEF_MAX_LOG;
	} finally {
		return max_log_fail;
	}
}

public int get_log_fail_count(Connection db_con, String usernip)
{
	ResultSet rs = null;
	PreparedStatement ps = null;
	String q = "select log_fail_count from m_pegawai where nip = ?";
	int log_fail_count = 0;

	try {
		ps = db_con.prepareStatement(q);
		ps.setString(1, usernip);

		rs = ps.executeQuery();
		if (!rs.next()) {
			return 0;
		}

		log_fail_count = rs.getInt("log_fail_count");

		rs.close();
		ps.close();
	} catch (Exception e) {
		return 0;
	} finally {
		return log_fail_count;
	}
}

public Boolean is_allow_to_login(Connection db_con, String usernip)
{
	ResultSet rs = null;
	Statement db_stmt = null;
	String q = "select max_log_fail from m_syslog";

	int max_log_fail = get_max_log_fail(db_con);
	int log_fail_count = get_log_fail_count(db_con, usernip);

	if (log_fail_count >= max_log_fail) {
		return false;
	}

	return true;
}

public void increase_log_fail_count(Connection db_con, String nip)
{
	PreparedStatement ps;
	String q = "update m_pegawai set log_fail_count = log_fail_count + 1"
			+" where nip = ?";

	try {
		ps = db_con.prepareStatement(q);
		ps.setString(1, nip);
		ps.executeUpdate();

		ps.close();
	} catch (Exception e) {
	}
}

public void reset_log_fail_count(Connection db_con, String nip)
{
	PreparedStatement ps = null;
	String q = "update m_pegawai set log_fail_count = 0 where nip = ?";

	try {
		ps = db_con.prepareStatement(q);
		ps.setString(1, nip);
		ps.executeUpdate();

		ps.close();
	} catch (Exception e) {
	}
}
%>

<%
Connection			db_con				= null;
PreparedStatement	db_pstmt			= null;
Statement			db_stmt				= null;
ResultSet			rs					= null;
Cookie				c_sid				= null;
Cookie				c_user				= null;
Cookie				c_user_id			= null;
Cookie				c_user_uk_id		= null;
Cookie				c_user_grup_id		= null;
Cookie				c_user_nip			= null;
Cookie				c_user_name			= null;
Cookie				c_user_cabang_id	= null;
Cookie				c_user_branch_name	= null;
ActiveUser			active_user			= null;
String				q					= "";
String				sid					= "";
String				user_id				= "";
String				user_uk_id			= "";
String				user_grup_id		= "";
String				user_name			= "";
String				user_nip			= "";
String				user_psw			= "";
String				user_cabang_id		= "";
String				user_branch_name	= "";
String				dir_name			= "";
String				psw_is_expired		= "";
String				c_path				= request.getContextPath ();
int					c_max_age			= 60 * 60 * 24 * 30; // 30 days

JSONObject			_r					= new JSONObject ();

_r.put("success", false);

try {
	db_con = (Connection) session.getAttribute ("db.con");

	if (db_con == null || (db_con != null && db_con.isClosed ())) {
		Properties props = new Properties ();

		ServletContext	context		= session.getServletContext ();
		InputStream		is			= context.getResourceAsStream ("/WEB-INF"+ File.separator +"web.conf");

		props.load (is);

		String		db_url		= props.getProperty ("db");
		String		db_class	= props.getProperty ("db.class");

		Class.forName (db_class);
		db_con			= DriverManager.getConnection (db_url, props);
		session.setAttribute ("db.class", (Object) db_class);
		session.setAttribute ("db.url", (Object) db_url);
		session.setAttribute ("db.con", (Object) db_con);
	}

	user_nip	= request.getParameter ("user_nip");
	user_psw	= request.getParameter ("user_psw");

	Boolean ok = is_allow_to_login(db_con, user_nip);

	if (!ok) {
		_r.put("info", "Maksimal gagal login terlampaui, silahkan hubungi"
			+" Administrator untuk mendapatkan password yang baru");
		return;
	}

	q	=" select	PEG.id"
		+" ,		PEG.unit_kerja_id"
		+" ,		PEG.grup_id"
		+" ,		PEG.nama"
		+" ,		PEG.psw_expire > current_date as psw_is_expired"
		+" ,		PEG.cabang_id"
		+" ,		CABANG.nama as cabang_nama"
		+" from		m_pegawai		PEG"
		+" ,		m_unit_kerja	UK"
		+" ,		m_grup			GRUP"
		+" ,		m_cabang		CABANG"
		+" where	PEG.nip				= ?"
		+" and		PEG.psw				= md5(?)"
		+" and		PEG.status			= 1"
		+" and		PEG.unit_kerja_id	= UK.id"
		+" and		PEG.grup_id			= GRUP.id"
		+" and		PEG.cabang_id		= CABANG.id";

	db_pstmt = db_con.prepareStatement (q);
	db_pstmt.setString (1, user_nip);
	db_pstmt.setString (2, user_psw);

	rs = db_pstmt.executeQuery ();

	if (! rs.next ()) {
		increase_log_fail_count(db_con, user_nip);

		_r.put("info", "NIP atau Password anda salah/tidak ada!");
		return;
	}

	user_id			= rs.getString ("id");
	user_uk_id		= rs.getString ("unit_kerja_id");
	user_grup_id	= rs.getString ("grup_id");
	user_name		= rs.getString ("nama");
	psw_is_expired	= rs.getString ("psw_is_expired");
	user_cabang_id	= rs.getString ("cabang_id");
	user_branch_name= rs.getString ("cabang_nama");

	active_user = new ActiveUser (Long.parseLong (user_id));

	session.setAttribute ("user", active_user);
	session.setAttribute ("user.id", user_id);
	session.setAttribute ("user.nip", user_nip);
	session.setAttribute ("user.unit_kerja_id", user_uk_id);
	session.setAttribute ("user.grup_id", user_grup_id);
	session.setAttribute ("user.nama", user_name);
	session.setAttribute ("user.cabang_id", user_cabang_id);
	session.setAttribute ("user.cabang_nama", user_branch_name);

	c_sid				= new Cookie ("earsip.sid", session.getId ());
	c_user				= new Cookie ("earsip.user", active_user.toString());
	c_user_id			= new Cookie ("earsip.user.id", user_id);
	c_user_nip			= new Cookie ("earsip.user.nip", user_nip);
	c_user_uk_id		= new Cookie ("earsip.user.unit_kerja_id", user_uk_id);
	c_user_grup_id		= new Cookie ("earsip.user.grup_id", user_grup_id);
	c_user_name			= new Cookie ("earsip.user.nama", user_name);
	c_user_cabang_id	= new Cookie ("earsip.user.cabang_id", user_cabang_id);
	c_user_branch_name	= new Cookie ("earsip.user.cabang_nama", user_branch_name);

	c_sid.setMaxAge (c_max_age);
	c_sid.setPath (c_path);
	c_user.setMaxAge (c_max_age);
	c_user.setPath (c_path);
	c_user_id.setMaxAge (c_max_age);
	c_user_id.setPath (c_path);
	c_user_nip.setMaxAge (c_max_age);
	c_user_nip.setPath (c_path);
	c_user_uk_id.setMaxAge (c_max_age);
	c_user_uk_id.setPath (c_path);
	c_user_grup_id.setMaxAge (c_max_age);
	c_user_grup_id.setPath (c_path);
	c_user_name.setMaxAge (c_max_age);
	c_user_name.setPath (c_path);
	c_user_cabang_id.setMaxAge (c_max_age);
	c_user_cabang_id.setPath (c_path);
	c_user_branch_name.setMaxAge (c_max_age);
	c_user_branch_name.setPath (c_path);

	response.addCookie (c_sid);
	response.addCookie (c_user);
	response.addCookie (c_user_id);
	response.addCookie (c_user_nip);
	response.addCookie (c_user_uk_id);
	response.addCookie (c_user_grup_id);
	response.addCookie (c_user_name);
	response.addCookie (c_user_cabang_id);
	response.addCookie (c_user_branch_name);

	// create root folder if not exist
	q =" select id from m_berkas where pid = 0 and pegawai_id = ? ";

	db_pstmt = db_con.prepareStatement (q);
	db_pstmt.setInt (1, Integer.parseInt(user_id));

	rs = db_pstmt.executeQuery ();

	if (! rs.next ()) {
		q	=" insert into m_berkas (pid, pegawai_id, nama)"
			+" values (0, ?, ?)";

		db_pstmt = db_con.prepareStatement (q);
		db_pstmt.setInt (1, Integer.parseInt (user_id));
		db_pstmt.setString (2, user_name);

		db_pstmt.executeUpdate ();
	}

	_r.put("success", true);
	_r.put("user_name", user_name);
	_r.put("branch_name", user_branch_name);
	_r.put("is_pusatarsip", (user_grup_id.equals("3") ? 1 : 0));

	if (psw_is_expired.equalsIgnoreCase ("f")) {
		_r.put("psw_is_expired", 1);
	} else {
		_r.put("psw_is_expired", 0);
	}

	rs.close ();
	reset_log_fail_count(db_con, user_nip);
}
catch (Exception e) {
	_r.put("success", false);
	_r.put("info", e);
} finally {
	out.print(_r);
}
%>
