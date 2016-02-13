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

	String pemusnahan_id = o.getString ("pemusnahan_id");
	String nomor  	 = o.getString ("nomor");	
	

	

	if (action.equalsIgnoreCase ("destroy")) {
		q	=" delete from t_pemusnahan_tim"
			+" where pemusnahan_id = ? and nomor = ?";
		db_stmt = db_con.prepareStatement (q);
		db_stmt.setInt (1, Integer.parseInt (pemusnahan_id));
		db_stmt.setInt (2, Integer.parseInt (nomor));
	}

	db_stmt.executeUpdate ();
	out.print ("{success:true}");
}
catch (Exception e) {
	out.print("{success:false,info:'"+ e.toString().replace("'","''") +"'}");
}
%>
