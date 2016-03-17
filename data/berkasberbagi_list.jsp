<%--
	Copyright 2013 - x10c.Lab

	Author(s):
	- mhd.sulhan (ms@kilabit.org)
--%>
<%@ include file="init.jsp" %>
<%
String		data		= "";
int			i			= 0;
try {
	String	id			= request.getParameter ("id");
	String	pid			= request.getParameter ("pid");
	String	peg_id		= request.getParameter ("peg_id");
	String	nama		= "";

	if (id.equalsIgnoreCase ("0")) {
		q	=" select	distinct"
			+" 			A.pegawai_id"
			+" ,		B.nama"
			+" from		m_berkas	as A"
			+" ,		m_pegawai	as B"
			+" where	A.akses_berbagi_id in (3,4)"
			+" and		A.pegawai_id	= B.id"
			+" union all"
			+" select	distinct"
			+" 			A.pegawai_id"
			+" ,		C.nama"
			+" from		m_berkas			as A"
			+" ,		m_berkas_berbagi	as B"
			+" ,		m_pegawai			as C"
			+" where	("
			+"				A.akses_berbagi_id	in (1,2)"
			+"		and		A.id				= B.berkas_id"
			+"		and		B.bagi_ke_peg_id	= "+ _user_id
			+" )"
			+" and		A.pegawai_id		= C.id"
			+" order by pegawai_id";

		db_stmt	= db_con.createStatement ();
		rs	= db_stmt.executeQuery (q);
		_a	= new JSONArray ();

		while (rs.next ()) {
			peg_id	= rs.getString ("pegawai_id");
			nama	= rs.getString ("nama");
			_o		= new JSONObject ();

			_o.put ("id", peg_id);
			_o.put ("pid", 0);
			_o.put ("nama", nama);
			_o.put ("pegawai_id", peg_id);
			_o.put ("tipe_file", 0);

			_a.put (_o);
		}

		rs.close ();
		db_stmt.close ();

		_r.put ("success", true);
		_r.put ("data", _a);

		return;
	}

	q	=" select	m_berkas.id"
		+" ,		pid"
		+" ,		tipe_file"
		+" ,		mime"
		+" ,		sha"
		+" ,		pegawai_id"
		+" ,		unit_kerja_id"
		+" ,		berkas_klas_id"
		+" ,		berkas_tipe_id"
		+" ,		nama"
		+" ,		tgl_unggah"
		+" ,		coalesce (tgl_dibuat, tgl_unggah) as tgl_dibuat"
		+" ,		nomor"
		+" ,		pembuat"
		+" ,		judul"
		+" ,		masalah"
		+" ,		jra_aktif"
		+" ,		jra_inaktif"
		+" ,		status"
		+" ,		status_hapus"
		+" ,		akses_berbagi_id"
		+" ,		n_output_images"
		+" from		m_berkas";

	if (pid.equalsIgnoreCase ("0")) {
		q += " where	akses_berbagi_id in (3,4)"
			+" and		pegawai_id = "+ peg_id
			+" union all"
			+" select	m_berkas.id"
			+" ,		pid"
			+" ,		tipe_file"
			+" ,		mime"
			+" ,		sha"
			+" ,		pegawai_id"
			+" ,		unit_kerja_id"
			+" ,		berkas_klas_id"
			+" ,		berkas_tipe_id"
			+" ,		nama"
			+" ,		tgl_unggah"
			+" ,		coalesce (tgl_dibuat, tgl_unggah) as tgl_dibuat"
			+" ,		nomor"
			+" ,		pembuat"
			+" ,		judul"
			+" ,		masalah"
			+" ,		jra_aktif"
			+" ,		jra_inaktif"
			+" ,		status"
			+" ,		status_hapus"
			+" ,		akses_berbagi_id"
			+" ,		n_output_images"
			+" from		m_berkas"
			+" ,		m_berkas_berbagi"
			+" where	akses_berbagi_id in (1,2)"
			+"	and		berkas_id		= m_berkas.id"
			+"	and		bagi_ke_peg_id	= "+ _user_id
			+" and		pegawai_id		= "+ peg_id;
	} else if (id.equalsIgnoreCase ("0")) {
		q	+=" where id = "+ pid;
	} else {
		q	+=" where pid = "+ id;
	}

	q += " order by tipe_file, nama";

	db_stmt = db_con.createStatement ();
	rs		= db_stmt.executeQuery (q);
	_a		= new JSONArray();

	while (rs.next ()) {
		_o = new JSONObject();

		_o.put("id"				, rs.getInt("id"));
		_o.put("pid"			, rs.getInt("pid"));
		_o.put("tipe_file"		, rs.getInt("tipe_file"));
		_o.put("mime"			, rs.getString("mime"));
		_o.put("sha"			, rs.getString("sha"));
		_o.put("pegawai_id"		, rs.getInt("pegawai_id"));
		_o.put("unit_kerja_id"	, rs.getInt("unit_kerja_id"));
		_o.put("berkas_klas_id"	, rs.getInt("berkas_klas_id"));
		_o.put("berkas_tipe_id"	, rs.getInt("berkas_tipe_id"));
		_o.put("nama"			, rs.getString("nama"));
		_o.put("tgl_unggah"		, rs.getString("tgl_unggah"));
		_o.put("tgl_dibuat"		, rs.getString("tgl_dibuat"));
		_o.put("nomor"			, rs.getString("nomor"));
		_o.put("pembuat"		, rs.getString("pembuat"));
		_o.put("judul"			, rs.getString("judul"));
		_o.put("masalah"		, rs.getString("masalah"));
		_o.put("jra_aktif"		, rs.getInt("jra_aktif"));
		_o.put("jra_inaktif"	, rs.getInt("jra_inaktif"));
		_o.put("status"			, rs.getInt("status"));
		_o.put("status_hapus"		, rs.getInt("status_hapus"));
		_o.put("akses_berbagi_id"	, rs.getInt("akses_berbagi_id"));
		_o.put("n_output_images"	, rs.getInt("n_output_images"));

		_a.put(_o);
	}

	rs.close();
	db_stmt.close();

	_r.put("success", true);
	_r.put("data", _a);
}
catch (Exception e) {
	_r.put("success", false);
	_r.put("info", e);
}
finally {
	out.print(_r);
}
%>
