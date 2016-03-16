<%--
	Copyright 2016.

	Author(s):
	- mhd.sulhan (ms@kilabit.org)
--%>
<%@ include file="init.jsp" %>
<%
try {
	q	=" select	id"
		+" ,		nama"
		+" ,		keterangan"
		+" from		r_pemusnahan_metoda"
		+" order by id, nama";

	db_stmt = db_con.createStatement ();
	rs = db_stmt.executeQuery (q);

	_a = new JSONArray ();
	while (rs.next ()) {
		_o	= new JSONObject ();

		_o.put("id"			, rs.getInt("id"));
		_o.put("nama"		, rs.getString("nama"));
		_o.put("keterangan"	, rs.getString("keterangan"));

		_a.put (_o);
	}

	rs.close ();
	db_stmt.close ();

	_r.put ("success"	, true);
	_r.put ("data"		, _a);

} catch (Exception e) {
	_r.put ("success"	, false);
	_r.put ("info"		, e);
} finally {
	out.print (_r);
}
%>
