<%--
	Copyright 2016

	Author(s):
	- sulhan (ms@kilabit.info)
--%>
<%@ include file="init.jsp" %>
<%
String action			= "";
String id				= "";
String uk_id			= "";
String kode				= "";
String tgl				= "";
String nm_petugas		= "";
String status			= "";
String pj_unit_kerja	= "";
String pj_unit_arsip	= "";

try {
	action	= request.getParameter ("action");
	id		= request.getParameter ("id");

	if (id == null) {
		_o = get_json_payload(request.getReader ());

		id				= _o.getString("id");
		uk_id			= _o.getString ("unit_kerja_id");
		kode			= _o.getString ("kode");
		tgl				= _o.getString ("tgl");
		nm_petugas		= _o.getString ("nama_petugas");
		status			= _o.getString ("status");
		pj_unit_kerja	= _o.getString ("pj_unit_kerja");
		pj_unit_arsip	= _o.getString ("pj_unit_arsip");
	} else {
		uk_id			= request.getParameter ("unit_kerja_id");
		kode			= request.getParameter ("kode");
		tgl				= request.getParameter ("tgl");
		nm_petugas		= request.getParameter ("nama_petugas");
		status			= request.getParameter ("status");
		pj_unit_kerja	= request.getParameter ("pj_unit_kerja");
		pj_unit_arsip	= request.getParameter ("pj_unit_arsip");
	}

	if (status == null || status.equals ("")) {
		status = "0";
	}

	if (uk_id == null || uk_id.equals ("")) {
		uk_id = (String) session.getAttribute ("user.unit_kerja_id");
	}

	if (action.equalsIgnoreCase ("create")) {
		q	=" 	insert into t_pemindahan ("
			+"	unit_kerja_id"
			+",	kode"
			+",	tgl"
			+",	pj_unit_kerja"
			+", cabang_id)"
			+" 	values (?, ?, ?, ?, ?)";

		db_ps = db_con.prepareStatement (q);
		db_ps.setInt (1, Integer.parseInt (uk_id));
		db_ps.setString (2, kode);
		db_ps.setDate (3, Date.valueOf (tgl));
		db_ps.setString (4, pj_unit_kerja);
		db_ps.setInt (5, Integer.parseInt (_user_cid));

	} else if (action.equalsIgnoreCase ("update")) {
		q	=" 	update	t_pemindahan "
			+" 	set	unit_kerja_id = ?"
			+",	kode = ?"
			+",	tgl = ?"
			+", status = ?"
			+", nama_petugas = ?"
			+",	pj_unit_kerja = ?"
			+", pj_unit_arsip = ?"
			+" where	id	 = ?";

		db_ps = db_con.prepareStatement (q);
		db_ps.setInt (1, Integer.parseInt (uk_id));
		db_ps.setString (2, kode);
		db_ps.setDate (3, Date.valueOf (tgl));
		db_ps.setInt (4, Integer.parseInt(status));
		db_ps.setString (5, nm_petugas);
		db_ps.setString (6, pj_unit_kerja);
		db_ps.setString (7, pj_unit_arsip);
		db_ps.setInt (8, Integer.parseInt (id));

	} else if (action.equalsIgnoreCase ("destroy")) {
		q	="	delete from	t_pemindahan_rinci"
			+"	where		pemindahan_id	= ?";

		db_ps = db_con.prepareStatement (q);
		db_ps.setInt (1, Integer.parseInt (id));
		db_ps.executeUpdate ();
		db_ps.close ();

		q	=" delete from t_pemindahan where id = ?";
		db_ps = db_con.prepareStatement (q);
		db_ps.setInt (1, Integer.parseInt (id));
	}

	db_ps.executeUpdate ();
	db_ps.close ();

	_r.put ("info", "Data pemindahan telah tersimpan");
} catch (Exception e) {
	_r.put ("success"	, false);
	_r.put ("info"		, e);
} finally {
	out.print (_r);
}
%>
