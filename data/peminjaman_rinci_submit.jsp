<%--
	Copyright 2016

	Author(s):
	- mhd.sulhan (ms@kilabit.info)
--%>
<%@ include file="init.jsp" %>
<%
try {
	String action = request.getParameter ("action");

	_o = get_json_payload(request.getReader ());

	int peminjaman_id= _o.getInt ("peminjaman_id");
	int berkas_id	= _o.getInt ("berkas_id");

	if (action.equalsIgnoreCase ("create")) {
		q	=" insert into t_peminjaman_rinci (peminjaman_id,berkas_id)"
			+" values (?, ?)";
		db_ps = db_con.prepareStatement (q);
		db_ps.setInt (1, peminjaman_id);
		db_ps.setInt (2, berkas_id);

	} else if (action.equalsIgnoreCase ("destroy")) {
		q	=" delete from t_peminjaman_rinci where peminjaman_id = ? and berkas_id = ?";
		db_ps = db_con.prepareStatement (q);
		db_ps.setInt (1, peminjaman_id);
		db_ps.setInt (2, berkas_id);
	}

	db_ps.executeUpdate ();
	db_ps.close();

	_r.put ("info"		, "Data peminjaman telah disimpan.");
} catch (Exception e) {
	_r.put ("success"	, false);
	_r.put ("info"		, e);
} finally {
	out.print (_r);
}

%>
