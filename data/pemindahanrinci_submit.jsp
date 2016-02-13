<%--
	Copyright 2016

	Author(s):
	- sulhan (ms@kilabit.info)
--%>
<%@ include file="init.jsp" %>
<%
String			action			= "";
String			pemindahan_id	= "";
String			berkas_id		= "";
String			nama            = "";
String			arsip_status_id = "";
String			kode_folder     = "";
String			kode_rak        = "";
String			kode_box        = "";
try {
	action			= request.getParameter ("action");
	pemindahan_id	= request.getParameter ("pemindahan_id");
	berkas_id		= request.getParameter ("berkas_id");

	if (pemindahan_id == null || berkas_id == null) {
		_o = get_json_payload(request.getReader());

		pemindahan_id	= _o.getString ("pemindahan_id");
		berkas_id 		= _o.getString ("berkas_id");
		nama			= _o.getString ("nama");
		arsip_status_id = _o.getString ("arsip_status_id");
		kode_folder     = _o.getString ("kode_folder");
		kode_rak        = _o.getString ("kode_rak");
		kode_box        = _o.getString ("kode_box");
	} else {
		nama			= request.getParameter ("nama");
		arsip_status_id = request.getParameter ("arsip_status_id");
		kode_folder     = request.getParameter ("kode_folder");
		kode_rak        = request.getParameter ("kode_rak");
		kode_box        = request.getParameter ("kode_box");
	}

	if (action.equalsIgnoreCase ("create")) {
		q	=" insert into t_pemindahan_rinci (pemindahan_id, berkas_id)"
			+" values (?, ?)";

		db_ps = db_con.prepareStatement (q);
		db_ps.setInt (1, Integer.parseInt (pemindahan_id));
		db_ps.setInt (2, Integer.parseInt (berkas_id));
	} else if (action.equalsIgnoreCase ("update")) {
		q	=" update 	m_berkas"
			+" set 		status = 0"
			+" where 	id = ? or pid = ?";

		db_ps = db_con.prepareStatement (q);
		db_ps.setInt (1, Integer.parseInt (berkas_id));
		db_ps.setInt (2, Integer.parseInt (berkas_id));

		db_ps.executeUpdate ();

		q	=" select * from m_arsip where berkas_id = "+berkas_id;

		db_stmt	= db_con.createStatement ();
		rs		= db_stmt.executeQuery (q);

		if (rs.next ()) {
			q	=" update 	m_arsip"
				+" set 		kode_folder = ?"
				+" , 		kode_rak = ?"
				+" , 		kode_box = ?"
				+" where	berkas_id = ?";
		} else {
			q	=" insert into 	m_arsip"
				+" ( 		kode_folder"
				+" , 		kode_rak"
				+" , 		kode_box"
				+" ,		berkas_id)"
				+" values 	(?, ?, ?, ?)";
		}

		db_ps = db_con.prepareStatement (q);

		db_ps.setString (1, kode_folder);
		db_ps.setString (2, kode_rak);
		db_ps.setString (3, kode_box);
		db_ps.setInt (4, Integer.parseInt (berkas_id));

		rs.close ();
	} else if (action.equalsIgnoreCase ("destroy")) {
		q	=" delete from t_pemindahan_rinci where pemindahan_id = ? and berkas_id = ?";
		db_ps = db_con.prepareStatement (q);
		db_ps.setInt (1, Integer.parseInt (pemindahan_id));
		db_ps.setInt (2, Integer.parseInt (berkas_id));
	}

	db_ps.executeUpdate ();
	db_ps.close ();

	_r.put ("info", "Data berkas telah tersimpan");
} catch (Exception e) {
	_r.put ("success"	, false);
	_r.put ("info"		, e);
} finally {
	out.print (_r);
}
%>
