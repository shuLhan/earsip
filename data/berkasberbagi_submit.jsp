<%--
	Copyright 2013 - x10c.Lab

	Author(s):
	- mhd.sulhan (ms@kilabit.org)
--%>
<%@ include file="init.jsp" %>
<%
try {
	String		berkas_id		= request.getParameter ("berkas_id");
	String		hak_akses_id	= request.getParameter ("hak_akses_id");
	JSONArray	pegs			= new JSONArray (request.getParameter ("bagi_ke_peg_id"));

	q	=" delete from m_berkas_berbagi"
		+" where berkas_id = "+ berkas_id;

	db_stmt = db_con.createStatement ();
	db_stmt.executeUpdate (q);

	q	=" update m_berkas set akses_berbagi_id = "+ hak_akses_id +" where id = "+ berkas_id +";";

	int len = pegs.length ();
	if (len > 0) {
		q	+=" insert into m_berkas_berbagi (berkas_id, bagi_ke_peg_id)"
			+ " values ";

		for (int i = 0; i < len; i++) {
			if (i > 0) {
				q += ",";
			}
			q +=" ("+ berkas_id +","+ pegs.getString (i) +")";
		}
	}

	db_stmt.executeUpdate (q);

	_r.put("info", "Data berkas berbagi telah tersimpan.");
}
catch (Exception e) {
	_r.put("success", false);
	_r.put("info", e);
} finally {
	out.print(_r);
}
%>
