<%--
	Copyright 2016

	Author(s):
	- mhd.sulhan (ms@kilabit.info)
--%>
<%@ include file="init.jsp" %>
<%
try {
	String status = request.getParameter("status");

	String q_s	=" select	distinct(id)"
		+" ,		unit_kerja_id"
		+" ,		kode"
		+" ,		tgl"
		+" ,		nama_petugas"
		+" ,		pj_unit_kerja"
		+" ,		pj_unit_arsip"
		+" ,		status";

	String q_f =" from t_pemindahan TPINDAH";

	String q_w =" where cabang_id = "+ _user_cid;

	if (status != null) {
		q_w +=" and TPINDAH.status = "+ Integer.parseInt(status);
	}

	String q_o =" order by tgl desc";

	// if Pusat Arsip
	if (_user_gid.equals ("3")) {
		q_f +=" , t_pemindahan_rinci TPINDAHRINCI";
		q_w +=" and TPINDAH.id = TPINDAHRINCI.pemindahan_id";
	} else {
		q_w +=" and unit_kerja_id = "+ _user_uk;
	}

	q = q_s + q_f + q_w + q_o;

	db_stmt	= db_con.createStatement ();
	rs		= db_stmt.executeQuery (q);

	_a = new JSONArray ();
	while (rs.next ()) {
		_o	= new JSONObject ();
		_o.put("id", rs.getInt("id"));
		_o.put("unit_kerja_id", rs.getInt("unit_kerja_id"));
		_o.put("kode", rs.getString("kode"));
		_o.put("tgl", rs.getString("tgl"));
		_o.put("status", rs.getInt("status"));
		_o.put("nama_petugas", rs.getString("nama_petugas"));
		_o.put("pj_unit_kerja", rs.getString("pj_unit_kerja"));
		_o.put("pj_unit_arsip", rs.getString("pj_unit_arsip"));

		_a.put (_o);
	}

	rs.close ();
	db_stmt.close ();

	_r.put ("data"		, _a);
}
catch (Exception e) {
	_r.put ("success"	, false);
	_r.put ("info"		, e);
} finally {
	out.print (_r);
}
%>
