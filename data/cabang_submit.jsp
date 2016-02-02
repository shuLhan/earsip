<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.lang.StringBuilder" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="org.json.JSONObject" %>
<%
Connection			db_con	= null;
PreparedStatement	db_stmt	= null;
String				db_url	= "";
String				q		= "";
String				data	= "";

BufferedReader	reader		= null;
StringBuilder	sb			= new StringBuilder();
JSONObject		o			= null;
String			line		= "";
String			action		= "";
try {
	db_con = (Connection) session.getAttribute ("db.con");

	if (db_con == null || (db_con != null && db_con.isClosed ())) {
		response.sendRedirect (request.getContextPath());
		return;
	}

	action	= request.getParameter ("action");

	reader	= request.getReader ();
	line	= reader.readLine ();
	while (line != null) {
		sb.append (line + "\n");
		line = reader.readLine();
	}
	reader.close();

	data			= sb.toString();
	o				= (JSONObject) new JSONObject (data);

	String id		= o.getString ("id");
	String nama		= o.getString ("nama");
	String kota		= o.getString ("kota");
	String alamat	= o.getString ("alamat");
	String telepon	= o.getString ("telepon");
	String fax		= o.getString ("fax");

	if (action.equalsIgnoreCase ("create")) {
		q	=" insert into m_cabang (nama, kota, alamat, telepon, fax)"
			+" values (?, ?, ?, ?, ?)";
		db_stmt = db_con.prepareStatement (q);
		db_stmt.setString (1, nama);
		db_stmt.setString (2, kota);
		db_stmt.setString (3, alamat);
		db_stmt.setString (4, telepon);
		db_stmt.setString (5, fax);

	} else if (action.equalsIgnoreCase ("update")) {
		q	=" update	m_cabang "
			+" set		nama    = ?"
			+" ,		kota    = ?"
			+" ,		alamat  = ?"
			+" ,		telepon = ?"
			+" ,		fax     = ?"
			+" where	id      = ?";
		db_stmt = db_con.prepareStatement (q);
		db_stmt.setString (1, nama);
		db_stmt.setString (2, kota);
		db_stmt.setString (3, alamat);
		db_stmt.setString (4, telepon);
		db_stmt.setString (5, fax);
		db_stmt.setInt (6, Integer.parseInt (id));

	} else if (action.equalsIgnoreCase ("destroy")) {
		q	=" delete from m_cabang where id = ?";
		db_stmt = db_con.prepareStatement (q);
		db_stmt.setInt (1, Integer.parseInt (id));
	}

	db_stmt.executeUpdate ();
	out.print ("{success:true}");
}
catch (Exception e) {
	out.print("{success:false,info:'"+ e.toString().replace("'","''") +"'}");
}
%>
