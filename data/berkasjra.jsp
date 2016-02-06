<%--
	Copyright 2016

	Author(s):
	- mhd.sulhan (ms@kilabit.info)
--%>
<%@ include file="init.jsp" %>
<%
try {
	String user_id = (String) session.getAttribute ("user.id");
	String grup_id = (String) session.getAttribute ("user.grup_id");
	String jra_query_text = "";
	String status	= "";

	int start	= Integer.parseInt (request.getParameter ("start"));
	int limit	= Integer.parseInt (request.getParameter ("limit"));
	int total   = 0;
	
	if (grup_id.equals ("3")) {
		jra_query_text = "jra_inaktif";
		status = "0";
	}
	else {
		jra_query_text = "jra_aktif";
		status = "1";
	}

	q	=" select	count (m_berkas.*)		as total"
		+" from		m_berkas"
		+" ,		m_pegawai"
		+" where	m_berkas.status			= "+ status
		+" and		m_berkas.status_hapus	= 1"
		+" and		m_berkas.arsip_status_id in (0,1)"
		+" and		m_berkas.pegawai_id		= m_pegawai.id"
		+" and		m_pegawai.cabang_id		= "+ _user_cid
		+" and		datediff('month', current_date, dateadd ('year'," + jra_query_text + ",tgl_dibuat)) <= 3"; // 3 months difference between berkas current age and berkas tgl_jra

	if (!grup_id.equals ("3")) {
		q +=" and pegawai_id = " + user_id;
	}

	db_stmt = db_con.createStatement ();
	rs		= db_stmt.executeQuery (q);

	if (rs.next ()) {
		total = rs.getInt ("total");
	}

	rs.close ();
	db_stmt.close ();

	q	=" select	m_berkas.id"
		+" ,		pid"
		+" ,		tipe_file"
		+" ,		mime"
		+" ,		sha"
		+" ,		pegawai_id"
		+" ,		m_berkas.unit_kerja_id"
		+" ,		berkas_klas_id"
		+" ,		berkas_tipe_id"
		+" ,		m_berkas.nama"
		+" ,		tgl_unggah"
		+" ,		coalesce (tgl_dibuat, tgl_unggah) as tgl_dibuat"
		+" ,		nomor"
		+" ,		pembuat"
		+" ,		judul"
		+" ,		masalah"
		+" ,		jra_aktif"
		+" ,		jra_inaktif"
		+" ,		m_berkas.status"
		+" ,		status_hapus"
		+" ,		akses_berbagi_id"
		+" ,		age (tgl_dibuat) as usia"
		+" ,		get_berkas_path (pid) as lokasi"
		+" ,		Date (dateadd ('year'," + jra_query_text + ",tgl_dibuat)) as tgl_jra"
		+" ,		n_output_images"
		+" from		m_berkas"
		+" ,		m_pegawai"
		+" where	m_berkas.status			= "+ status
		+" and		m_berkas.status_hapus	= 1"
		+" and		m_berkas.arsip_status_id in (0,1)"
		+" and		m_berkas.pegawai_id		= m_pegawai.id"
		+" and		m_pegawai.cabang_id		= "+ _user_cid
		+" and		datediff('month', current_date, dateadd ('year'," + jra_query_text + ",tgl_dibuat)) <= 3"; // 3 months difference between berkas current age and berkas tgl_jra

		if (!grup_id.equals ("3")) {
			q +=" and pegawai_id = " + user_id;
		}
		q	+=	"	order by tipe_file, nama"
			+	"	limit "+ limit +" offset "+ start;

	db_stmt = db_con.createStatement ();
	rs		= db_stmt.executeQuery (q);

	_a = new JSONArray ();
	while (rs.next ()) {
		_o = new JSONObject();

		_o.put("id"					, rs.getInt ("id"));
		_o.put("pid"				, rs.getInt ("pid"));
		_o.put("tipe_file"			, rs.getString ("tipe_file"));
		_o.put("mime"				, rs.getString ("mime"));
		_o.put("sha"				, rs.getString ("sha"));
		_o.put("pegawai_id"			, rs.getInt ("pegawai_id"));
		_o.put("unit_kerja_id"		, rs.getInt ("unit_kerja_id"));
		_o.put("berkas_klas_id"		, rs.getInt ("berkas_klas_id"));
		_o.put("berkas_tipe_id"		, rs.getInt ("berkas_tipe_id"));
		_o.put("nama"				, rs.getString ("nama"));
		_o.put("tgl_unggah"			, rs.getString ("tgl_unggah"));
		_o.put("tgl_dibuat"			, rs.getString ("tgl_dibuat"));
		_o.put("nomor"				, rs.getString ("nomor"));
		_o.put("pembuat"			, rs.getString ("pembuat"));
		_o.put("judul"				, rs.getString ("judul"));
		_o.put("masalah"			, rs.getString ("masalah"));
		_o.put("jra_aktif"			, rs.getInt ("jra_aktif"));
		_o.put("jra_inaktif"		, rs.getInt ("jra_inaktif"));
		_o.put("status"				, rs.getInt ("status"));
		_o.put("status_hapus"		, rs.getInt ("status_hapus"));
		_o.put("akses_berbagi_id"	, rs.getInt ("akses_berbagi_id"));
		_o.put("usia"				, rs.getString ("usia"));
		_o.put("lokasi"				, rs.getString ("lokasi"));
		_o.put("tgl_jra"			, rs.getString ("tgl_jra"));
		_o.put("n_output_images"	, rs.getInt ("n_output_images"));

		_a.put(_o);
	}

	rs.close ();
	db_stmt.close ();

	_r.put ("success"	, true);
	_r.put ("data"		, _a);
	_r.put ("total"		, total);
}
catch (Exception e) {
	_r.put ("success"	, false);
	_r.put ("info"		, e);
} finally {
	out.print (_r);
}
%>
