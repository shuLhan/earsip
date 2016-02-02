<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.lang.StringBuilder" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="org.json.JSONObject" %>
<%
Connection			db_con	= null;
PreparedStatement	db_stmt	= null;
ResultSet			rs		= null;
String				db_url	= "";
String				q		= "";

BufferedReader	reader	= null;
StringBuilder	sb		= new StringBuilder();
JSONObject		o		= null;
String			line	= "";
String			data	= "";

String			action			= "";
String			id				= "";
String			nip				= "";
String			nama			= "";
String			cabang_id		= "";
String			unit_kerja_id	= "";
String			jabatan_id		= "";
String			grup_id			= "";
String			password		= "";
String			status			= "";
try {
	db_con = (Connection) session.getAttribute ("db.con");

	if (db_con == null || (db_con != null && db_con.isClosed ())) {
		response.sendRedirect (request.getContextPath());
		return;
	}

	action			= request.getParameter ("action");
	id				= request.getParameter ("id");

	if (id == null) {
		reader	= request.getReader ();
		line	= reader.readLine ();
		while (line != null) {
			sb.append (line + "\n");
			line = reader.readLine();
		}
		reader.close();

		data			= sb.toString();
		o				= (JSONObject) new JSONObject (data);
		id				= o.getString ("id");
		nip				= o.getString ("nip");
		nama			= o.getString ("nama");
		cabang_id		= o.getString ("cabang_id");
		unit_kerja_id	= o.getString ("unit_kerja_id");
		jabatan_id		= o.getString ("jabatan_id");
		grup_id			= o.getString ("grup_id");
		status			= o.getString ("status");

		if (status.equalsIgnoreCase ("true")) {
			status = "1";
		} else {
			status = "0";
		}
	} else {
		nip				= request.getParameter ("nip");
		nama			= request.getParameter ("nama");
		cabang_id		= request.getParameter ("cabang_id");
		unit_kerja_id	= request.getParameter ("unit_kerja_id");
		jabatan_id		= request.getParameter ("jabatan_id");
		grup_id			= request.getParameter ("grup_id");
		password		= request.getParameter ("password");
		status			= request.getParameter ("status");
	}

	if (action.equalsIgnoreCase ("create")) {
		// check if NIP already exist.
		q	=" select	1 as exist"
			+" from		m_pegawai "
			+" where	nip = ?";

		db_stmt = db_con.prepareStatement (q);
		db_stmt.setString (1, nip);
		rs = db_stmt.executeQuery ();

		if (rs.next ()) {
			out.print ("{success:false,info:'Pegawai dengan NIP \""+ nip +"\" sudah ada'}");
			return;
		}

		// insert new pegawai
		q	=" insert into m_pegawai (nip, nama, cabang_id, unit_kerja_id, jabatan_id, grup_id, psw)"
			+" values (?, ?, ?, ?, ?, ?, md5(?))";
		db_stmt = db_con.prepareStatement (q);
		db_stmt.setString (1, nip);
		db_stmt.setString (2, nama);
		db_stmt.setInt (3, Integer.parseInt (cabang_id));
		db_stmt.setInt (4, Integer.parseInt (unit_kerja_id));
		db_stmt.setInt (5, Integer.parseInt (jabatan_id));
		db_stmt.setInt (6, Integer.parseInt (grup_id));
		db_stmt.setString (7, password);

		db_stmt.executeUpdate ();

		/* create pegawai berkas */
		q	=" select	id"
			+" from		m_pegawai"
			+" where	nip = ?";

		db_stmt = db_con.prepareStatement (q);
		db_stmt.setString (1, nip);

		rs = db_stmt.executeQuery ();

		if (rs.next ()) {
			q	=" insert into m_berkas (pid, pegawai_id, nama)"
				+" values (0, ?, ?)";

			id = rs.getString ("id");

			db_stmt = db_con.prepareStatement (q);
			db_stmt.setInt (1, Integer.parseInt (id));
			db_stmt.setString (2, nama);

			db_stmt.executeUpdate ();
		}

		out.print ("{success:true,info:'Data pegawai \""+ nama +"\" telah tersimpan.'}");
	} else if (action.equalsIgnoreCase ("update")) {
		q	=" update	m_pegawai "
			+" set		nip				= ?"
			+" ,		nama			= ?"
			+" ,		cabang_id		= ?"
			+" ,		unit_kerja_id	= ?"
			+" ,		jabatan_id		= ?"
			+" ,		grup_id			= ?"
			+" ,		status			= ?";
		if (! password.isEmpty () || ! password.equals ("")) {
			q	+=" ,	psw				= md5(?)";
		}
		q	+=" where	id				= ?";
		
		db_stmt = db_con.prepareStatement (q);
		db_stmt.setString (1, nip);
		db_stmt.setString (2, nama);
		db_stmt.setInt (3, Integer.parseInt (cabang_id));
		db_stmt.setInt (4, Integer.parseInt (unit_kerja_id));
		db_stmt.setInt (5, Integer.parseInt (jabatan_id));
		db_stmt.setInt (6, Integer.parseInt (grup_id));
		db_stmt.setInt (7, Integer.parseInt (status));

		if (! password.isEmpty () || ! password.equals ("")) {
			db_stmt.setString (8, password);
			db_stmt.setInt (9, Integer.parseInt (id));
		} else {
			db_stmt.setInt (8, Integer.parseInt (id));
		}

		db_stmt.executeUpdate ();

		// update root folder name in berkas
		q	="update m_berkas set nama = ? where pegawai_id = ? and pid = 0";

		db_stmt = db_con.prepareStatement (q);
		db_stmt.setString (1, nama);
		db_stmt.setInt (2, Integer.parseInt (id));

		db_stmt.executeUpdate ();

		out.print ("{success:true,info:'Data pegawai \""+ nama +"\" telah tersimpan.'}");
	} else if (action.equalsIgnoreCase ("destroy")) {
		q	=" select delete_pegawai ("+ id +") as del_stat ";

		Statement stmt = db_con.createStatement ();

		rs = stmt.executeQuery (q);

		if (! rs.next ()) {
			out.print ("{success:false,info:'Gagal menghapus data pegawai!'}");
			return;
		}

		String del_stat = rs.getString ("del_stat");

		if (del_stat.equalsIgnoreCase ("failure")) {
			out.print ("{success:false,info:'Data pegawai tidak dapat dihapus karena memiliki berkas!'}");
			return;
		}
		out.print ("{success:true,info:'Data pegawai \""+ nama +"\" telah dihapus.'}");
	}
}
catch (Exception e) {
	out.print("{success:false,info:'"+ e.toString().replace("'","''") +"'}");
}
%>
