<%--
	Copyright 2016

	Author(s):
	- mhd.sulhan (ms@kilabit.info)
--%>
<%@ include file="init.jsp" %>
<%
try {
	String action		= request.getParameter("action");
	String id			= request.getParameter("id");
	String tgl_kembali	= request.getParameter("tgl_kembali");

	q	=" update	t_peminjaman"
		+" set		tgl_kembali = ?"
		+" where	id = ?";

	db_ps = db_con.prepareStatement (q);
	db_ps.setDate (1, Date.valueOf(tgl_kembali));
	db_ps.setInt (2, Integer.parseInt(id));
	db_ps.executeUpdate ();
	db_ps.close();

	db_stmt = db_con.createStatement ();
	q	=" update m_berkas  set arsip_status_id = 0"
		+" where id in (select berkas_id as id from t_peminjaman_rinci where peminjaman_id = " + id + ")" ;
	db_stmt.executeUpdate (q);
	db_stmt.close();

	_r.put("info", "Data Pengembalian berhasil disimpan");
} catch (Exception e) {
	_r.put ("success"	, false);
	_r.put ("info"		, e);
} finally {
	out.print (_r);
}
%>
