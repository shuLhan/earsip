Ext.require ([
	'Earsip.view.AdmSistem'
,	'Earsip.view.Cabang'
,	'Earsip.view.UnitKerja'
,	'Earsip.view.Pegawai'
,	'Earsip.view.TipeArsip'
,	'Earsip.view.MetodaPemusnahan'
,	'Earsip.view.KlasArsip'
,	'Earsip.view.RefIndeksRelatif'
,	'Earsip.view.Jabatan'
,	'Earsip.view.Arsip'
,	'Earsip.view.Peminjaman'
, 	'Earsip.view.Pemindahan'
,	'Earsip.view.Pemusnahan'
,	'Earsip.view.BerkasJRA'
,	'Earsip.view.TransferBerkas'
,	'Earsip.view.LapBerkasJRA'
,	'Earsip.view.LapBerkasMusnah'
]);

Ext.define ('Earsip.controller.MainToolbar', {
	extend	: 'Ext.app.Controller'
,	refs	: [{
		ref		: 'mainview'
	,	selector: 'mainview'
	},{
		ref		: 'loginwindow'
	,	selector: 'loginwindow'
	},{
		ref		: 'maintoolbar'
	,	selector: 'maintoolbar'
	}]

,	init	: function ()
	{
		this.control ({
			'maintoolbar menu > menuitem': {
				click: this.menuitem_on_click
			}

		,	'maintoolbar button[action=openjraaktif]': {
				click: this.open_jra_aktif
			}
		,	'maintoolbar button[action=openjrainaktif]': {
				click: this.open_jra_inaktif
			}
		,	'maintoolbar button[action=openpindah]': {
				click: this.open_notif_pindah
			}
		,	'maintoolbar button[action=openpinjam]': {
				click: this.open_notif_pinjam
			}

		,	'maintoolbar menuitem[action=edit]': {
				click: this.do_ganti_password
			}
		,	'maintoolbar menuitem[action=logout]': {
				click: this.do_logout
			}
		});
	}

,	menuitem_on_click : function (button)
	{
		if (button.itemId == null) {
			return;
		}
		if (button.itemId == 'trans_transfer_berkas') {
			var win = Ext.create('Earsip.view.TransferBerkas', {});
			win.show ();
			return;
		}

		var tabpanel = this.getMainview ().down ('#content_tab');

		Earsip.acl = button.acl;

		var c = tabpanel.getComponent (button.itemId);
		if (c == undefined) {
			tabpanel.add ({
				xtype	: button.itemId
			});
			c = tabpanel.getComponent (button.itemId);
		}
		if (c.do_refresh) {
			c.do_refresh ();
		}
		tabpanel.setActiveTab (button.itemId);
	}

,	open_jra_aktif: function()
	{
		var tabs = this.getMainview().down('#content_tab');
		var tab = tabs.child('#notifikasi');
		tabs.setActiveTab(tab);
	}
,	open_jra_inaktif: function()
	{
		var tabs = this.getMainview().down('#content_tab');
		var tab = tabs.child('#notifikasi');
		tabs.setActiveTab(tab);

		var subtab = tab.child('#berkas_jra');
		tab.setActiveTab(subtab);
	}
,	open_notif_pindah: function()
	{
		var tabs = this.getMainview().down('#content_tab');
		var tab = tabs.child('#notifikasi');
		tabs.setActiveTab(tab);

		var subtab = tab.child('#notif_pemindahan');
		tab.setActiveTab(subtab);
	}
,	open_notif_pinjam: function()
	{
		var tabs = this.getMainview().down('#content_tab');
		var tab = tabs.child('#notifikasi');
		tabs.setActiveTab(tab);

		var subtab = tab.child('#notif_peminjaman');
		tab.setActiveTab(subtab);
	}

,	do_ganti_password : function (button)
	{
		var win = Ext.create('Earsip.view.GantiPasswordWin', {});
		win.show ();
	}

,	do_logout : function (button)
	{	
		this.getMainview ().down ('#content_tab').do_remove_closable_tab ();
		Ext.Ajax.request ({
			url		: 'data/logout.jsp'
		,	scope	: this
		,	success	: function (response)
			{
				var o = Ext.decode(response.responseText);
				if (o.success == true) {
					this.getMainview ().open_view_login (this.getLoginwindow ());
					Earsip.reset ();
				} else {
					Ext.msg.error (o.info);
				}
			}
		,	failure	: function (response)
			{
				Ext.msg.error ('Server error: tidak dapat keluar dari aplikasi!');
			}
		});
	}
});
