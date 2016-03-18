<%--
	Copyright 2016

	Author(s):
	- mhd.sulhan (ms@kilabit.info)
--%>
<%@ include file="init.jsp" %>
<%
try {
	String user_id		= (String) session.getAttribute ("user.id");
	String grup_id		= (String) session.getAttribute ("user.grup_id");

	q	=" select	id"
		+" ,		nama"
		+" ,		nomor"
		+" ,		pembuat"
		+" ,		judul"
		+" ,		masalah"
		+" ,		jra_aktif"
		+" ,		jra_inaktif"
		+" ,		status"
		+" ,		status_hapus"
		+" ,		arsip_status_id"
		+" from		m_berkas"
		+" where 	status_hapus	= 1"
		+" and		unit_kerja_id is not null"; // non root directory

	if (Integer.parseInt(grup_id) == 3) //  pusat arsip group
	{
		q	+=" and status = 0";
	} else {
		q	+=" and 	status = 1"
			+" and 	pegawai_id = " + user_id;
	}

	q	+=" order by nama";

	db_stmt = db_con.createStatement ();
	rs		= db_stmt.executeQuery (q);
	_a		= new JSONArray();

	while (rs.next ()) {
		_o = new JSONObject();
		_o.put("id", rs.getInt("id"));
		_o.put("nama", rs.getString("nama"));
		_o.put("nomor", rs.getString("nomor"));
		_o.put("pembuat", rs.getString("pembuat"));
		_o.put("judul", rs.getString("judul"));
		_o.put("masalah", rs.getString("masalah"));
		_o.put("jra_aktif", rs.getInt("jra_aktif"));
		_o.put("jra_inaktif", rs.getInt("jra_inaktif"));
		_o.put("status", rs.getInt("status"));
		_o.put("status_hapus", rs.getInt("status_hapus"));
		_o.put("arsip_status_id", rs.getInt("arsip_status_id"));

		_a.put(_o);
	}

	rs.close();

	_r.put("data", _a);
}
catch (Exception e) {
	_r.put("success", false);
	_r.put("info", e);
}
finally {
	out.print (_r);
}
%>
