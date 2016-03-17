<%--
	Copyright 2016

	Author(s):
	- mhd.sulhan (ms@kilabit.info)
--%>
<%@ include file="init.jsp" %>
<%
PreparedStatement	mc_ps		= null;
ResultSet			mc_rs		= null;
int					menu_id		= 0;
String				menu_name	= "";
String				menu_index	= "";
String				menu_acl	= "";
try {
	String tmp = (String) session.getAttribute ("user.grup_id");
	if (tmp == null) {
		throw new Exception("User ID tidak diketahui!");
	}

	int grup_id	= Integer.parseInt (tmp);

	q	=" select	MENU.id"
		+" ,		MENU.nama"
		+" ,		MENU.icon"
		+" ,		MENU.nama_ref"
		+" ,		MAKSES.hak_akses_id"
		+" from		m_menu		MENU"
		+" ,		menu_akses	MAKSES"
		+" where	MENU.id				= MAKSES.menu_id"
		+" and		MAKSES.grup_id		= ?"
		+" and		MAKSES.hak_akses_id > 0"
		+" and		MENU.pid			= ?";

	db_ps = db_con.prepareStatement (q);

	db_ps.setInt (1, grup_id);
	db_ps.setInt (2, 0);

	JSONArray menus = new JSONArray();
	rs = db_ps.executeQuery ();

	while (rs.next ()) {
		JSONObject menu = new JSONObject();

		menu_id		= rs.getInt ("id");
		menu_name	= rs.getString ("nama");
		menu_index	= rs.getString ("nama_ref");

		menu.put("text", menu_name);
		menu.put("itemId", menu_index);
		menu.put("iconCls", rs.getString("icon"));

		mc_ps = db_con.prepareStatement(q);
		mc_ps.setInt(1, grup_id);
		mc_ps.setInt(2, menu_id);

		mc_rs = mc_ps.executeQuery();

		if (mc_rs.next ()) {
			JSONObject submenu = new JSONObject();

			submenu.put("xtype", "menu");

			JSONArray menu_items = new JSONArray();

			do {
				JSONObject mitem = new JSONObject();

				menu_id		= mc_rs.getInt ("id");
				menu_name	= mc_rs.getString ("nama");
				menu_index	= mc_rs.getString ("nama_ref");
				menu_acl	= mc_rs.getString ("hak_akses_id");

				mitem.put("text", menu_name);
				mitem.put("itemId", menu_index);
				mitem.put("acl", menu_acl);
				mitem.put("iconCls", mc_rs.getString("icon"));

				menu_items.put(mitem);
			} while (mc_rs.next ());

			submenu.put("items", menu_items);

			menu.put("menu", submenu);
		}

		menus.put(menu);
	}

	rs.close ();

	_r.put("menu", menus);
}
catch (Exception e) {
	_r.put ("success"	, false);
	_r.put ("info"		, e);
} finally {
	out.print (_r);
}
%>
