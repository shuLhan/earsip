<%--
	Copyright 2016

	Author(s):
	- mhd.sulhan (ms@kilabit.info)
--%>
<%@ include file="init.jsp" %>
<%
int id = 0;
int metoda_id = 0;
String nm_ptgs = "";
String tgl = "";
String pj_unit_kerja = "";
String pj_berkas_arsip = "";

try {
	String action	= request.getParameter ("action");
	String req_id	= request.getParameter ("id");

	if (req_id == null) {
		_o = get_json_payload(request.getReader ());

		id				= _o.getInt("id");
		metoda_id		= _o.getInt("metoda_id");
		nm_ptgs			= _o.getString("nama_petugas");
		tgl				= _o.getString ("tgl");
		pj_unit_kerja	= _o.getString ("pj_unit_kerja");
		pj_berkas_arsip	= _o.getString ("pj_berkas_arsip");
	} else {
		if (!req_id.equals("")) {
			id = Integer.parseInt(req_id);
		}

		metoda_id		= Integer.parseInt(request.getParameter ("metoda_id"));
		nm_ptgs			= request.getParameter ("nama_petugas");
		tgl				= request.getParameter ("tgl");
		pj_unit_kerja	= request.getParameter ("pj_unit_kerja");
		pj_berkas_arsip	= request.getParameter ("pj_berkas_arsip");
	}

	if (action.equalsIgnoreCase ("create")) {
		q	=" insert into t_pemusnahan ("
			+"   metoda_id"
			+" , nama_petugas"
			+" , tgl"
			+" , pj_unit_kerja"
			+" , pj_berkas_arsip"
			+" , cabang_id"
			+" ) values (?, ?, ?, ?, ?, ?) returning id";

		db_ps = db_con.prepareStatement (q);
		db_ps.setInt	(1, metoda_id);
		db_ps.setString	(2, nm_ptgs);
		db_ps.setDate 	(3, Date.valueOf (tgl));
		db_ps.setString	(4, pj_unit_kerja);
        db_ps.setString	(5, pj_berkas_arsip);
        db_ps.setInt	(6, Integer.parseInt(_user_cid));

		rs = db_ps.executeQuery ();

		if (rs.next ()) {
			id = Integer.parseInt(rs.getString ("id"));
		}

		rs.close ();
		db_ps.close ();

	} else if (action.equalsIgnoreCase ("update")) {
		q	=" update	t_pemusnahan"
			+" set		metoda_id		= ?"
			+" , 		nama_petugas	= ?"
			+" , 		tgl				= ?"
			+" ,		pj_unit_kerja	= ?"
			+" ,		pj_berkas_arsip	= ?"
			+" where	id				= ?";

		db_ps = db_con.prepareStatement (q);
		db_ps.setInt  	(1, metoda_id);
		db_ps.setString	(2, nm_ptgs);
		db_ps.setDate 	(3, Date.valueOf (tgl));
		db_ps.setString	(4, pj_unit_kerja);
        db_ps.setString	(5, pj_berkas_arsip);
		db_ps.setInt 	(6, id);
		db_ps.executeUpdate ();
	}

	if (id > 0) {
		q	=" update m_berkas  set arsip_status_id = 0"
			+" where id in (select berkas_id as id from t_pemusnahan_rinci where pemusnahan_id = " + id + ")" ;

		db_stmt = db_con.createStatement ();
		db_stmt.executeUpdate (q);

		q	=" delete from m_arsip"
			+" where berkas_id in (select id from m_berkas where id in "
			+" (select berkas_id as id from t_pemusnahan_rinci where pemusnahan_id = " + id + ")"
			+" )";
		db_stmt.executeUpdate (q);

		q	=" delete from t_pemusnahan_rinci"
			+" where pemusnahan_id = " + id;
		db_stmt.executeUpdate (q);

		q	=" delete from t_pemusnahan_tim"
			+" where pemusnahan_id = " + id;
		db_stmt.executeUpdate (q);

		if (action.equalsIgnoreCase ("destroy")) {
			q =" delete from t_pemusnahan where id = ?";

			db_ps = db_con.prepareStatement (q);
			db_ps.setInt (1, id);
			db_ps.executeUpdate ();

		} else {
			JSONArray berkas = new JSONArray (request.getParameter ("berkas"));
			int len	= berkas.length ();

			if (len > 0) {
				String q_in = "";
				String q_up = "";

				for (int i = 0; i < len; i++) {
					JSONObject	obj			= berkas.getJSONObject (i);
					String		berkas_id	= obj.getString ("berkas_id");

					q_in +=" Insert into t_pemusnahan_rinci (pemusnahan_id, berkas_id, keterangan, jml_lembar, jml_set, jml_berkas)"
					   +" values("+ id
					   +" ,"+ berkas_id
					   +" ,'" + obj.getString ("keterangan") + "'"
					   +" ," + obj.getString ("jml_lembar")
					   +" ," + obj.getString ("jml_set")
					   +" ," + obj.getString ("jml_berkas") + ");";

					q_up +=" update m_berkas set arsip_status_id = 3 where id = "+ berkas_id +" or pid = "+ berkas_id + ";";
				}

				db_stmt.executeUpdate (q_in);
				db_stmt.executeUpdate (q_up);
			}

			String tims = request.getParameter("tims");
			JSONArray tims_json = new JSONArray (tims);
			len	= tims_json.length ();

			_r.put("tims", tims);

			if (len > 0) {
				q = " insert into t_pemusnahan_tim (pemusnahan_id, nomor, nama, jabatan) values";

				for (int i = 0; i < len; i++) {
					if (i > 0) {
						q += ",";
					}

					JSONObject obj = tims_json.getJSONObject (i);
					q +=" ("+ id
					   +" ," + (i+1)
					   +" ,'" + obj.getString ("nama") + "'"
					   +" ,'" + obj.getString ("jabatan") +"')";
				}

				_r.put("tims", q);

				db_stmt.executeUpdate (q);
			}
		}
	}

	_r.put ("info", "Data pemusnahan telah disimpan.");
} catch (Exception e) {
	_r.put ("success"	, false);
	_r.put ("info"		, e);
} finally {
	out.print (_r);
}
%>
