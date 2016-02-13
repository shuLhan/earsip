<%--
	Copyright 2016

	Author(s):
	- mhd.sulhan (ms@kilabit.info)
--%>
<%@ include file="init.jsp" %>
<%
try {
	String pemusnahan_id = request.getParameter ("pemusnahan_id");

	if (pemusnahan_id == null) {
		return;
	}

	q	=" select	A.berkas_id"
		+" ,		B.nama"
		+" ,		A.keterangan"
		+" ,		A.jml_lembar"
		+" ,		A.jml_set"
		+" ,		A.jml_berkas"
		+" from		t_pemusnahan_rinci	A"
		+" ,		m_berkas			B"
		+" where	pemusnahan_id	= ?"
		+" and		A.berkas_id		= B.id";

	db_ps = db_con.prepareStatement (q);
	db_ps.setInt(1, Integer.parseInt(pemusnahan_id));
	rs = db_ps.executeQuery ();

	_a = new JSONArray ();
	while (rs.next ()) {
		_o = new JSONObject ();
		_o.put("berkas_id"	, rs.getString ("berkas_id"));
		_o.put("nama"		, rs.getString ("nama"));
		_o.put("keterangan"	, rs.getString ("keterangan"));
		_o.put("jml_lembar"	, rs.getString ("jml_lembar"));
		_o.put("jml_set"	, rs.getString ("jml_set"));
		_o.put("jml_berkas"	, rs.getString ("jml_berkas"));
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
