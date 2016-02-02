<%--
	Copyright 2016

	Author(s):
	- mhd.sulhan (ms@kilabit.info)
--%>
<%@ include file="init.jsp" %>
<%
try {
	q	=" select	id"
		+" ,		cabang_id"
		+" ,		unit_kerja_id"
		+" ,		grup_id"
		+" ,		jabatan_id"
		+" ,		nip"
		+" ,		nama"
		+" ,		status"
		+" from		m_pegawai"
		+" order by nama";

	db_stmt	= db_con.createStatement ();
	rs		= db_stmt.executeQuery (q);

	_a = new JSONArray ();
	while (rs.next ()) {
		_o	= new JSONObject ();
		_o.put("id"				, rs.getInt("id"));
		_o.put("cabang_id"		, rs.getInt("cabang_id"));
		_o.put("unit_kerja_id"	, rs.getInt("unit_kerja_id"));
		_o.put("grup_id"		, rs.getInt("grup_id"));
		_o.put("jabatan_id"		, rs.getInt("jabatan_id"));
		_o.put("nip"			, rs.getString("nip"));
		_o.put("nama"			, rs.getString("nama"));
		_o.put("status"			, rs.getInt("status"));

		_a.put (_o);
	}

	rs.close ();
	db_stmt.close ();

	_r.put ("success"	, true);
	_r.put ("data"		, _a);
}
catch (Exception e) {
	_r.put ("success"	, false);
	_r.put ("info"		, e);
} finally {
	out.print (_r);
}
%>
