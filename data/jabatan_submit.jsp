<%--
	Copyright 2016

	Author(s):
	- mhd.sulhan (ms@kilabit.info)
--%>
<%@ include file="init.jsp" %>
<%
String			action		= "";
String			id			= "";
String			nama		= "";
String			ket			= "";

try {
	action	= request.getParameter ("action");
	id 		= request.getParameter ("id");
	
	if (id == null) {
		_o = get_json_payload(request.getReader ());
		
		id		= _o.getString ("id");
		nama	= _o.getString ("nama");
		ket		= _o.getString ("keterangan");

	} else {
		nama			= request.getParameter ("nama");
		ket				= request.getParameter ("keterangan");
	}
	
	if (action.equalsIgnoreCase ("create")) {
		q	=" insert into r_jabatan (nama, keterangan, urutan)"
			+" values (?, ?, (select max (urutan) + 1 from r_jabatan))";
		db_ps = db_con.prepareStatement (q);
		db_ps.setString (1, nama);
		db_ps.setString (2, ket);

	} else if (action.equalsIgnoreCase ("update")) {
		q	=" update	r_jabatan "
			+" set 		nama		 	= ?"
			+" ,		keterangan		= ?"
			+" where	id				= ?";
		
		db_ps = db_con.prepareStatement (q);
		db_ps.setString (1, nama);
		db_ps.setString (2, ket);
		db_ps.setInt (3, Integer.parseInt (id));

	}else if (action.equalsIgnoreCase ("destroy")) {
		q	=" delete from r_jabatan where id = ?";
		db_ps = db_con.prepareStatement (q);
		db_ps.setInt (1, Integer.parseInt (id));
	}

	db_ps.executeUpdate ();
	db_ps.close();

	_r.put ("info", "Data jabatan telah tersimpan.");
} catch (Exception e) {
	_r.put ("success"	, false);
	_r.put ("info"		, e);
} finally {
	out.print (_r);
}
%>
