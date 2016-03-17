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
	String nama		= _o.getString ("nama");
	String kota		= _o.getString ("kota");
	String alamat	= _o.getString ("alamat");
	String telepon	= _o.getString ("telepon");
	String fax		= _o.getString ("fax");

	if (action.equalsIgnoreCase ("create")) {
		q	=" insert into m_cabang (nama, kota, alamat, telepon, fax)"
			+" values (?, ?, ?, ?, ?)";
		db_ps = db_con.prepareStatement (q);
		db_ps.setString (1, nama);
		db_ps.setString (2, kota);
		db_ps.setString (3, alamat);
		db_ps.setString (4, telepon);
		db_ps.setString (5, fax);

	} else if (action.equalsIgnoreCase ("update")) {
		q	=" update	m_cabang "
			+" set		nama    = ?"
			+" ,		kota    = ?"
			+" ,		alamat  = ?"
			+" ,		telepon = ?"
			+" ,		fax     = ?"
			+" where	id      = ?";
		db_ps = db_con.prepareStatement (q);
		db_ps.setString (1, nama);
		db_ps.setString (2, kota);
		db_ps.setString (3, alamat);
		db_ps.setString (4, telepon);
		db_ps.setString (5, fax);
		db_ps.setInt (6, Integer.parseInt (id));

	} else if (action.equalsIgnoreCase ("destroy")) {
		q	=" delete from m_cabang where id = ?";
		db_ps = db_con.prepareStatement (q);
		db_ps.setInt (1, Integer.parseInt (id));
	}

	db_ps.executeUpdate ();
	db_ps.close();

	_r.put ("info", "Data cabang telah tersimpan.");
} catch (Exception e) {
	_r.put ("success"	, false);
	_r.put ("info"		, e);
} finally {
	out.print (_r);
}
%>
