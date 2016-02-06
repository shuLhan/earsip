<%--
	Copyright 2016

	Author(s):
	- sulhan (ms@kilabit.info)
--%>
<%@ include file="init.jsp" %>
<%
try {
	String action			= request.getParameter ("action");
	String id				= request.getParameter ("id");
	String uk_id			= request.getParameter ("unit_kerja_id");
	String kode				= request.getParameter ("kode");
	String tgl				= request.getParameter ("tgl");
	String nm_petugas		= request.getParameter ("nama_petugas");
	String status			= request.getParameter ("status");
	String pj_unit_kerja	= request.getParameter ("pj_unit_kerja");
	String pj_unit_arsip	= request.getParameter ("pj_unit_arsip");

	if (status == null || status.equals ("") || status.equals ("0")) {
		status = "0";
	} else {
		status = "1";
	}

	if (uk_id == null || uk_id.equals ("")) {
		uk_id = (String)session.getAttribute ("user.unit_kerja_id");
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

	_r.put ("success"	, true);
	_r.put ("info"		, "Data pemindahan telah tersimpan");
} catch (Exception e) {
	_r.put ("success"	, false);
	_r.put ("info"		, e);
} finally {
	out.print (_r);
}
%>
