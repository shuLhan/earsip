<%--
	Copyright 2016

	Author(s):
	- mhd.sulhan (ms@kilabit.info)
--%>
<%@ include file="init.jsp" %>
<%
String			action			= "";
String			id				= "";
String			nip				= "";
String			nama			= "";
String			cabang_id		= "";
String			unit_kerja_id	= "";
String			jabatan_id		= "";
String			grup_id			= "";
String			password		= "";
String			status			= "";
try {
	action			= request.getParameter ("action");
	id				= request.getParameter ("id");

	if (id == null) {
		_o = get_json_payload(request.getReader ());

		id				= _o.getString ("id");
		nip				= _o.getString ("nip");
		nama			= _o.getString ("nama");
		cabang_id		= _o.getString ("cabang_id");
		unit_kerja_id	= _o.getString ("unit_kerja_id");
		jabatan_id		= _o.getString ("jabatan_id");
		grup_id			= _o.getString ("grup_id");
		status			= _o.getString ("status");
	} else {
		nip				= request.getParameter ("nip");
		nama			= request.getParameter ("nama");
		cabang_id		= request.getParameter ("cabang_id");
		unit_kerja_id	= request.getParameter ("unit_kerja_id");
		jabatan_id		= request.getParameter ("jabatan_id");
		grup_id			= request.getParameter ("grup_id");
		password		= request.getParameter ("password");
		status			= request.getParameter ("status");
	}

	if (action.equalsIgnoreCase ("create")) {
		// check if NIP already exist.
		q	=" select	1 as exist"
			+" from		m_pegawai "
			+" where	nip = ?";

		db_ps = db_con.prepareStatement (q);
		db_ps.setString (1, nip);
		rs = db_ps.executeQuery ();

		if (rs.next ()) {
			throw new Exception("Pegawai dengan NIP '"+ nip +"' sudah ada");
		}

		// insert new pegawai
		q	=" insert into m_pegawai (nip, nama, cabang_id, unit_kerja_id, jabatan_id, grup_id, psw, status)"
			+" values (?, ?, ?, ?, ?, ?, md5(?), ?)";
		db_ps = db_con.prepareStatement (q);
		db_ps.setString (1, nip);
		db_ps.setString (2, nama);
		db_ps.setInt (3, Integer.parseInt (cabang_id));
		db_ps.setInt (4, Integer.parseInt (unit_kerja_id));
		db_ps.setInt (5, Integer.parseInt (jabatan_id));
		db_ps.setInt (6, Integer.parseInt (grup_id));
		db_ps.setString (7, password);
		db_ps.setInt (8, Integer.parseInt (status));

		db_ps.executeUpdate ();

		/* create pegawai berkas */
		q	=" select	id"
			+" from		m_pegawai"
			+" where	nip = ?";

		db_ps = db_con.prepareStatement (q);
		db_ps.setString (1, nip);

		rs = db_ps.executeQuery ();

		if (rs.next ()) {
			q	=" insert into m_berkas (pid, pegawai_id, nama)"
				+" values (0, ?, ?)";

			id = rs.getString ("id");

			db_ps = db_con.prepareStatement (q);
			db_ps.setInt (1, Integer.parseInt (id));
			db_ps.setString (2, nama);

			db_ps.executeUpdate ();
		}

	} else if (action.equalsIgnoreCase ("update")) {
		q	=" update	m_pegawai "
			+" set		nip				= ?"
			+" ,		nama			= ?"
			+" ,		cabang_id		= ?"
			+" ,		unit_kerja_id	= ?"
			+" ,		jabatan_id		= ?"
			+" ,		grup_id			= ?"
			+" ,		status			= ?";
		if (! password.isEmpty () || ! password.equals ("")) {
			q	+=" ,	psw				= md5(?)";
		}
		q	+=" where	id				= ?";
		
		db_ps = db_con.prepareStatement (q);
		db_ps.setString (1, nip);
		db_ps.setString (2, nama);
		db_ps.setInt (3, Integer.parseInt (cabang_id));
		db_ps.setInt (4, Integer.parseInt (unit_kerja_id));
		db_ps.setInt (5, Integer.parseInt (jabatan_id));
		db_ps.setInt (6, Integer.parseInt (grup_id));
		db_ps.setInt (7, Integer.parseInt (status));

		if (! password.isEmpty () || ! password.equals ("")) {
			db_ps.setString (8, password);
			db_ps.setInt (9, Integer.parseInt (id));
		} else {
			db_ps.setInt (8, Integer.parseInt (id));
		}

		db_ps.executeUpdate ();

		// update root folder name in berkas
		q	="update m_berkas set nama = ? where pegawai_id = ? and pid = 0";

		db_ps = db_con.prepareStatement (q);
		db_ps.setString (1, nama);
		db_ps.setInt (2, Integer.parseInt (id));

		db_ps.executeUpdate ();

	} else if (action.equalsIgnoreCase ("destroy")) {
		q	=" select delete_pegawai ("+ id +") as del_stat ";

		Statement stmt = db_con.createStatement ();

		rs = stmt.executeQuery (q);

		if (! rs.next ()) {
			throw new Exception("Gagal menghapus data pegawai!");
		}

		String del_stat = rs.getString ("del_stat");

		if (del_stat.equalsIgnoreCase ("failure")) {
			throw new Exception("Data pegawai tidak dapat dihapus karena memiliki berkas!");
		}
	}

	_r.put ("info", "Data pegawai telah tersimpan.");
} catch (Exception e) {
	_r.put ("success"	, false);
	_r.put ("info"		, e);
} finally {
	out.print (_r);
}
%>
