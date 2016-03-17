<%--
	Copyright 2016

	Author(s):
	- mhd.sulhan (ms@kilabit.info)
--%>
<%@ include file="init.jsp" %>
<%
String action, id, uk_id, kode, nama, ket;
int jra_aktif, jra_inaktif, mode_arsip_id;

try {
	action = request.getParameter ("action");
	id = request.getParameter ("id");

	if (id == null) {
		_o = get_json_payload(request.getReader ());

		id				= _o.getString ("id");
		uk_id 			= _o.getString ("unit_kerja_id");
		kode			= _o.getString ("kode");
		nama			= _o.getString ("nama");
		ket				= _o.getString ("keterangan");
		jra_aktif		= _o.getInt ("jra_aktif");
		jra_inaktif		= _o.getInt ("jra_inaktif");
		mode_arsip_id	= _o.getInt ("mode_arsip_id");
	} else {
		uk_id 			= request.getParameter ("unit_kerja_id");
		kode			= request.getParameter ("kode");
		nama			= request.getParameter ("nama");
		ket				= request.getParameter ("keterangan");
		jra_aktif		= Integer.parseInt (request.getParameter ("jra_aktif"));
		jra_inaktif		= Integer.parseInt (request.getParameter ("jra_inaktif"));
		mode_arsip_id	= Integer.parseInt (request.getParameter ("mode_arsip_id"));
	}

	if (action.equalsIgnoreCase ("create")) {
		q	=" insert into r_berkas_klas (unit_kerja_id, kode, nama, keterangan, jra_aktif, jra_inaktif, mode_arsip_id)"
			+" values (?, ?, ?, ?, ?, ?, ?)";
		db_ps = db_con.prepareStatement (q);
		db_ps.setInt (1, Integer.parseInt(uk_id));
		db_ps.setString (2, kode);
		db_ps.setString (3, nama);
		db_ps.setString (4, ket);
		db_ps.setInt (5, jra_aktif);
		db_ps.setInt (6, jra_inaktif);
		db_ps.setInt (7, mode_arsip_id);

	} else if (action.equalsIgnoreCase ("update")) {
		q	=" update	r_berkas_klas "
			+" set		unit_kerja_id 	= ?"
			+" , 		kode		 	= ?"
			+" , 		nama		 	= ?"
			+" ,		keterangan		= ?"
			+" ,		jra_aktif		= ?"
			+" ,		jra_inaktif		= ?"
			+" ,		mode_arsip_id	= ?"
			+" where	id				= ?";

		db_ps = db_con.prepareStatement (q);
		db_ps.setInt(1, Integer.parseInt (uk_id));
		db_ps.setString (2, kode);
		db_ps.setString (3, nama);
		db_ps.setString (4, ket);
		db_ps.setInt (5, jra_aktif);
		db_ps.setInt (6, jra_inaktif);
		db_ps.setInt (7, mode_arsip_id);
		db_ps.setInt (8, Integer.parseInt (id));

	}else if (action.equalsIgnoreCase ("destroy")) {
		q	=" delete from r_berkas_klas where id = ?";
		db_ps = db_con.prepareStatement (q);
		db_ps.setInt (1, Integer.parseInt (id));
	}

	db_ps.executeUpdate ();
	db_ps.close();

	_r.put ("info", "Data klasifikasi berkas telah tersimpan.");
} catch (Exception e) {
	_r.put ("success"	, false);
	_r.put ("info"		, e);
} finally {
	out.print (_r);
}
%>
