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

	q	=" select	" 
		+" 			nama"
		+" ,		jabatan"
		+" from		t_pemusnahan_tim"
		+" where	pemusnahan_id = ?";

	db_ps = db_con.prepareStatement (q);
	db_ps.setInt(1, Integer.parseInt(pemusnahan_id));
	rs = db_ps.executeQuery ();

	_a = new JSONArray ();
	while (rs.next ()) {
		_o = new JSONObject ();
		_o.put("nama"	, rs.getString ("nama"));
		_o.put("jabatan", rs.getString ("jabatan"));
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
