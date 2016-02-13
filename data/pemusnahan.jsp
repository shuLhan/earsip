<%--
	Copyright 2016

	Author(s):
	- mhd.sulhan (ms@kilabit.info)
--%>
<%@ include file="init.jsp" %>
<%
try {
	q	=" select		distinct (A.id)"
		+" ,			A.metoda_id"
		+" ,			A.nama_petugas"
		+" ,			A.tgl"
		+" ,			A.pj_unit_kerja"
		+" ,			A.pj_berkas_arsip"
		+" from			t_pemusnahan A"
		+" left join	t_pemusnahan_rinci B "
		+" on			A.id			= B.pemusnahan_id"
		+" where		A.cabang_id		= ?";

	db_ps = db_con.prepareStatement (q);
	db_ps.setInt(1, Integer.parseInt(_user_cid));

	rs = db_ps.executeQuery ();

	_a = new JSONArray ();
	while (rs.next ()) {
		_o = new JSONObject ();

		_o.put("id"					, rs.getString ("id"));
		_o.put("metoda_id"			, rs.getString ("metoda_id"));
		_o.put("nama_petugas"		, rs.getString ("nama_petugas"));
		_o.put("tgl"				, rs.getString ("tgl"));
		_o.put("pj_unit_kerja"		, rs.getString ("pj_unit_kerja"));
		_o.put("pj_berkas_arsip"	, rs.getString ("pj_berkas_arsip"));
		_a.put (_o);
	}

	rs.close ();
	db_ps.close ();

	_r.put ("data"		, _a);
} catch (Exception e) {
	_r.put ("success"	, false);
	_r.put ("info"		, e);
} finally {
	out.print (_r);
}
%>
