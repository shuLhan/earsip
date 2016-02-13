<%--
	Copyright 2016

	Author(s):
	- mhd.sulhan (ms@kilabit.info)
--%>
<%@ include file="init.jsp" %>
<%
try {
	q	=" select		id"
		+" ,			unit_kerja_peminjam_id"
		+" ,			nama_petugas"
		+" ,			nama_pimpinan_petugas"
		+" ,			nama_peminjam"
		+" ,			nama_pimpinan_peminjam"
		+" ,			tgl_pinjam"
		+" ,			tgl_batas_kembali"
		+" ,			tgl_kembali"
		+" ,			keterangan"
		+" from			t_peminjaman A"
		+" where		A.cabang_id = "+ _user_cid
		+" order by tgl_pinjam desc ";

	db_stmt	= db_con.createStatement ();
	rs		= db_stmt.executeQuery (q);

	_a = new JSONArray ();
	while (rs.next ()) {
		_o	= new JSONObject ();
		_o.put("id",						rs.getInt("id"));
		_o.put("unit_kerja_peminjam_id",	rs.getInt("unit_kerja_peminjam_id"));
		_o.put("nama_petugas",				rs.getString("nama_petugas"));
		_o.put("nama_pimpinan_petugas",		rs.getString("nama_pimpinan_petugas"));
		_o.put("nama_peminjam",				rs.getString("nama_peminjam"));
		_o.put("nama_pimpinan_peminjam",	rs.getString("nama_pimpinan_peminjam"));
		_o.put("tgl_pinjam",				rs.getString("tgl_pinjam"));
		_o.put("tgl_batas_kembali",			rs.getString("tgl_batas_kembali"));
		_o.put("tgl_kembali",				rs.getString("tgl_kembali"));
		_o.put("keterangan",				rs.getString("keterangan"));
		_o.put("status",					(rs.getDate("tgl_kembali") == null ? 0 : 1));

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
