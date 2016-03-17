<%--
	Copyright 2016

	Author(s):
	- mhd.sulhan (ms@kilabit.info)
--%>
<%@ include file="init.jsp" %>
<%
try {
	String action = request.getParameter ("action");

	_o = get_json_payload(request.getReader ());

	String id	= _o.getString ("id");
	String nama	= _o.getString ("nama");
	String ket	= _o.getString ("keterangan");

	if (action.equalsIgnoreCase ("create")) {
		q	=" insert into r_berkas_tipe (nama, keterangan)"
			+" values (?, ?)";
		db_ps = db_con.prepareStatement (q);
		db_ps.setString (1, nama);
		db_ps.setString (2, ket);

	} else if (action.equalsIgnoreCase ("update")) {
		q	=" update	r_berkas_tipe "
			+" set		nama		= ?"
			+" ,		keterangan	= ?"
			+" where	id			= ?";
		db_ps = db_con.prepareStatement (q);
		db_ps.setString (1, nama);
		db_ps.setString (2, ket);
		db_ps.setInt (3, Integer.parseInt (id));

	} else if (action.equalsIgnoreCase ("destroy")) {
		q	=" delete from r_berkas_tipe where id = ?";
		db_ps = db_con.prepareStatement (q);
		db_ps.setInt (1, Integer.parseInt (id));
	}

	db_ps.executeUpdate ();
	db_ps.close();

	_r.put ("info", "Data tipe berkas telah tersimpan.");
} catch (Exception e) {
	_r.put ("success"	, false);
	_r.put ("info"		, e);
} finally {
	out.print (_r);
}

%>
