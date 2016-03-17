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

	String id		= _o.getString ("id");
	String kode		= _o.getString ("kode");
	String nama		= _o.getString ("nama");
	String pimpinan	= _o.getString ("nama_pimpinan");
	String ket		= _o.getString ("keterangan");

	if (action.equalsIgnoreCase ("create")) {
		q	=" insert into m_unit_kerja (kode, nama, nama_pimpinan, keterangan, urutan)"
			+" values (?, ?, ?, ?, (select max (urutan) + 1 from m_unit_kerja))";
		db_ps = db_con.prepareStatement (q);
		db_ps.setString (1, kode);
		db_ps.setString (2, nama);
		db_ps.setString (3, pimpinan);
		db_ps.setString (4, ket);

	} else if (action.equalsIgnoreCase ("update")) {
		q	=" update	m_unit_kerja "
			+" set		kode			= ?"
			+" ,		nama			= ?"
			+" ,		nama_pimpinan	= ?"
			+" ,		keterangan		= ?"
			+" where	id				= ?";
		db_ps = db_con.prepareStatement (q);
		db_ps.setString (1, kode);
		db_ps.setString (2, nama);
		db_ps.setString (3, pimpinan);
		db_ps.setString (4, ket);
		db_ps.setInt (5, Integer.parseInt (id));

	} else if (action.equalsIgnoreCase ("destroy")) {
		q	=" delete from m_unit_kerja where id = ?";
		db_ps = db_con.prepareStatement (q);
		db_ps.setInt (1, Integer.parseInt (id));
	}

	db_ps.executeUpdate ();
	db_ps.close();

	_r.put ("info", "Data unit kerja telah tersimpan.");
} catch (Exception e) {
	_r.put ("success"	, false);
	_r.put ("info"		, e);
} finally {
	out.print (_r);
}
%>
