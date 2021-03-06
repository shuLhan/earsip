<%--
	Copyright 2016

	Author(s):
	- mhd.sulhan (ms@kilabit.info)
--%>
<%@ include file="init.jsp" %>
<%
String uk_peminjam_id	= "";
String nm_ptgs			= "";
String nm_pim_ptgs		= "";
String nm_peminjam		= "";
String nm_pim_peminjam	= "";
String tgl_pinjam		= "";
String tgl_batas		= "";
String tgl_kembali		= "";
String keterangan		= "";

try {
	String action	= request.getParameter ("action");
	String id 		= request.getParameter ("id");

	if (id == null) {
		_o = get_json_payload(request.getReader ());

		id					= _o.getString("id");
		uk_peminjam_id		= _o.getString("unit_kerja_peminjam_id");
		nm_ptgs				= _o.getString("nama_petugas");
		nm_pim_ptgs			= _o.getString("nama_pimpinan_petugas");
		nm_peminjam			= _o.getString("nama_peminjam");
		nm_pim_peminjam		= _o.getString("nama_pimpinan_peminjam");
		tgl_pinjam			= _o.getString("tgl_pinjam");
		tgl_batas			= _o.getString("tgl_batas_kembali");
		tgl_kembali			= _o.getString("tgl_kembali");
		keterangan			= _o.getString("keterangan");
	} else {
		uk_peminjam_id		= request.getParameter ("unit_kerja_peminjam_id");
		nm_ptgs				= request.getParameter ("nama_petugas");
		nm_pim_ptgs			= request.getParameter ("nama_pimpinan_petugas");
		nm_peminjam			= request.getParameter ("nama_peminjam");
		nm_pim_peminjam		= request.getParameter ("nama_pimpinan_peminjam");
		tgl_pinjam			= request.getParameter ("tgl_pinjam");
		tgl_batas			= request.getParameter ("tgl_batas_kembali");
		tgl_kembali			= request.getParameter ("tgl_kembali");
		keterangan			= request.getParameter ("keterangan");
	}

	if (action.equalsIgnoreCase ("create")) {
		q	=" insert into t_peminjaman ("
			+"   unit_kerja_peminjam_id"
			+" , nama_petugas"
			+" , nama_pimpinan_petugas"
			+" , nama_peminjam"
			+" , nama_pimpinan_peminjam"
			+" , tgl_pinjam"
			+" , tgl_batas_kembali"
			+" , tgl_kembali"
			+" , keterangan"
			+" , cabang_id"
			+")"
			+" values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?) returning id";

		db_ps = db_con.prepareStatement (q);
		db_ps.setInt	(1, Integer.parseInt(uk_peminjam_id));
		db_ps.setString (2, nm_ptgs);
		db_ps.setString (3, nm_pim_ptgs);
		db_ps.setString (4, nm_peminjam);
        db_ps.setString (5, nm_pim_peminjam);
		db_ps.setDate   (6, Date.valueOf(tgl_pinjam));
		db_ps.setDate   (7, Date.valueOf(tgl_batas));
		db_ps.setNull   (8, Types.DATE);
		db_ps.setString (9, keterangan);
		db_ps.setInt    (10, Integer.parseInt(_user_cid));

		rs = db_ps.executeQuery ();

		if (rs.next ()) {
			id = rs.getString ("id");
		}

		rs.close ();
		db_ps.close();
	} else if (action.equalsIgnoreCase ("update")) {
		// set arsip status pinjam to 0

		q	=" update	m_berkas"
			+" set		arsip_status_id = 0"
			+" where	id in ("
			+"		select	berkas_id as id"
			+"		from	t_peminjaman_rinci"
			+"		where	peminjaman_id = " + id
			+")";

		db_stmt = db_con.createStatement ();
		db_stmt.executeUpdate (q);

		q	=" delete from t_peminjaman_rinci"
			+" where peminjaman_id = " + id;
		db_stmt.executeUpdate (q);
		db_stmt.close();

		q	=" update	t_peminjaman"
			+" set		unit_kerja_peminjam_id = ?"
			+" , 		nama_petugas = ?"
			+" , 		nama_pimpinan_petugas = ?"
			+" ,		nama_peminjam = ?"
			+" ,		nama_pimpinan_peminjam = ?"
		    +" ,        tgl_pinjam = ?"
		    +" ,        tgl_batas_kembali = ?"
		    +" ,        tgl_kembali = ?"
		    +" ,        keterangan = ?"
			+" where	id = ?";

		db_ps = db_con.prepareStatement (q);
		db_ps.setInt(1, Integer.parseInt(uk_peminjam_id));
		db_ps.setString(2, nm_ptgs);
		db_ps.setString(3, nm_pim_ptgs);
		db_ps.setString(4, nm_peminjam);
		db_ps.setString(5, nm_pim_peminjam);
		db_ps.setDate(6, Date.valueOf(tgl_pinjam));
		db_ps.setDate(7, Date.valueOf(tgl_batas));
		db_ps.setNull(8, Types.DATE);
		db_ps.setString(9, keterangan);
		db_ps.setInt(10, Integer.parseInt(id));
		db_ps.executeUpdate ();
		db_ps.close();

	} else if (action.equalsIgnoreCase ("destroy")) {
		// set arsip status pinjam to 0
		db_stmt = db_con.createStatement ();
		q	=" update m_berkas  set arsip_status_id = 0"
			+" where id in ("
			+"	select	berkas_id as id"
			+"	from	t_peminjaman_rinci"
			+"	where	peminjaman_id = " + id
			+")" ;
		db_stmt.executeUpdate (q);

		q	=" delete from t_peminjaman_rinci"
			+" where peminjaman_id = " + id;
		db_stmt.executeUpdate (q);
		db_stmt.close();

		q =" delete from t_peminjaman where id = ?";
		db_ps = db_con.prepareStatement (q);
		db_ps.setInt (1, Integer.parseInt (id));
		db_ps.executeUpdate ();
		db_ps.close();
	}

	if (action.equalsIgnoreCase("create")
	|| action.equalsIgnoreCase("update")) {
		JSONArray berkas = new JSONArray (request.getParameter ("berkas_id"));
		int len	= berkas.length ();
		if (len > 0) {
			q = "";
			for (int i = 0; i < len; i++) {
				q	+=" insert into t_peminjaman_rinci (peminjaman_id, berkas_id)"
					+"	values ("+ id +","+ berkas.getString (i) +");";
				q +=" update m_berkas set arsip_status_id = 1 where id = "+ berkas.getString (i) +";";
			}

			db_stmt = db_con.createStatement ();
			db_stmt.executeUpdate (q);
			db_stmt.close();
		}
	}

	_r.put ("success"	, true);
	_r.put ("info"		, "Data peminjaman telah disimpan.");
} catch (Exception e) {
	_r.put ("success"	, false);
	_r.put ("info"		, e);
} finally {
	out.print (_r);
}
%>
