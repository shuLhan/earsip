<%--
	Copyright 2013 - x10c.Lab

	Author(s):
	- mhd.sulhan (ms@kilabit.org)
--%>
<%@ include file="../init.jsp" %>
<%
try {
	q	=" select	distinct(B.unit_kerja_id) as id "
		+" ,		UK.nama"
		+" from		m_berkas B"
		+" ,		m_pegawai P"
		+" ,		m_unit_kerja UK"
		+" where 	B.status		= 0"
		+" and		B.pegawai_id	= P.id"
		+" and		P.unit_kerja_id	= UK.id"
		+" and		P.cabang_id		= "+ _user_cid;

	if (!_user_gid.equals ("3")) {
		q	+="	and	UK.id = "+ _user_uk;
	}

	q	+=" order by UK.nama ";

	db_stmt	= db_con.createStatement ();
	rs		= db_stmt.executeQuery (q);

	_a		= new JSONArray ();
	while (rs.next ()) {
		_o	= new JSONObject ();
		_o.put ("id"			, rs.getInt ("id"));
		_o.put ("nama"			, rs.getString ("nama"));

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
