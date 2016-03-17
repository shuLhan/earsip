<%--
	Copyright 2016

	Author(s):
	- mhd.sulhan (ms@kilabit.info)
--%>
<%@ include file="init.jsp" %>
<%
String			action			= "";
String			id				= "";
String			berkas_klas_id	= "";
String			ket				= "";

try {
	action	= request.getParameter ("action");
	id 		= request.getParameter ("id");
	
	if (id == null) {
		_o = get_json_payload(request.getReader ());

		id				= _o.getString ("id");
		berkas_klas_id	= _o.getString ("berkas_klas_id");
		ket				= _o.getString ("keterangan");
	} else {
		berkas_klas_id	= request.getParameter ("berkas_klas_id");
		ket				= request.getParameter ("keterangan");
	}
	
	if (action.equalsIgnoreCase ("create")) {
		q	=" insert into r_ir (berkas_klas_id, keterangan)"
			+" values (?, ?)";
		db_ps = db_con.prepareStatement (q);
		db_ps.setInt	  (1, Integer.parseInt(berkas_klas_id));
		db_ps.setString (2, ket);

	} else if (action.equalsIgnoreCase ("update")) {
		q	=" update	r_ir "
			+" set		berkas_klas_id 	= ?"
			+" ,		keterangan		= ?"
			+" where	id				= ?";
		
		db_ps = db_con.prepareStatement (q);
		db_ps.setInt(1, Integer.parseInt (berkas_klas_id));
		db_ps.setString (2, ket);
		db_ps.setInt (3, Integer.parseInt (id));

	}else if (action.equalsIgnoreCase ("destroy")) {
		q	=" delete from r_ir where id = ?";
		db_ps = db_con.prepareStatement (q);
		db_ps.setInt (1, Integer.parseInt (id));
	}

	db_ps.executeUpdate ();
	db_ps.close();

	_r.put ("info", "Data indeks relatif telah tersimpan.");
} catch (Exception e) {
	_r.put ("success"	, false);
	_r.put ("info"		, e);
} finally {
	out.print (_r);
}
%>
