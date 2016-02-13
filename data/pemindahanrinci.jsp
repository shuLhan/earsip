<%--
	Copyright 2016

	Author(s):
	- sulhan (ms@kilabit.info)
--%>
<%@ include file="init.jsp" %>
<%
try {
	String pemindahan_id = request.getParameter ("pemindahan_id");

	if (pemindahan_id == null) {
		return;
	}

	q	=" SELECT	A.pemindahan_id"
		+" ,		A.berkas_id"
		+" ,		B.nama"
		+" ,		B.arsip_status_id"
		+" ,		B.jra_aktif"
		+" ,		B.jra_inaktif"
		+" ,		C.kode_folder"
		+" ,		C.kode_rak"
		+" ,		C.kode_box"
		+" FROM		t_pemindahan_rinci A"
		+" LEFT JOIN	m_berkas B"
		+" ON			A.berkas_id = B.id"
		+" LEFT	JOIN	m_arsip C"
		+" ON			B.id = C.berkas_id"
		+" WHERE		A.pemindahan_id = ?"
		+" ORDER BY B.nama";

	db_ps = db_con.prepareStatement (q);
	db_ps.setInt(1, Integer.parseInt(pemindahan_id));

	rs = db_ps.executeQuery ();

	_a = new JSONArray ();
	while (rs.next ()) {
		_o = new JSONObject ();
		_o.put("pemindahan_id"	, rs.getString ("pemindahan_id"));
		_o.put("berkas_id"		, rs.getString ("berkas_id"));
		_o.put("nama"			, rs.getString ("nama"));
		_o.put("jra_aktif"		, rs.getString ("jra_aktif"));
		_o.put("jra_inaktif"	, rs.getString ("jra_inaktif"));
		_o.put("arsip_status_id", rs.getString ("arsip_status_id"));
		_o.put("kode_folder"	, rs.getString ("kode_folder"));
		_o.put("kode_rak"		, rs.getString ("kode_rak"));
		_o.put("kode_box"		, rs.getString ("kode_box"));

		_a.put (_o);
	}

	rs.close ();
	db_ps.close ();

	_r.put ("data", _a);
} catch (Exception e) {
	_r.put ("success"	, false);
	_r.put ("info"		, e);
} finally {
	out.print (_r);
}
%>
