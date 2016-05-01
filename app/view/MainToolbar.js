Ext.define ('Earsip.view.MainToolbar', {
	extend			: 'Ext.toolbar.Toolbar'
,	alias			: 'widget.maintoolbar'
,	id				: 'maintoolbar'
,	flex			: 1
,	height			: 42
,	cls				: 'maintoolbarbg'
,	initComponent	: function ()
	{
		Earsip.notif.mjraaktif = Ext.create('Ext.button.Button', {
			text: 'JRA aktif'
		,	action: 'openjraaktif'
		});
		Earsip.notif.mjrainaktif = Ext.create('Ext.button.Button', {
			text: 'JRA in-aktif'
		,	action: 'openjrainaktif'
		});
		Earsip.notif.mpindah = Ext.create('Ext.button.Button', {
			text: 'Pemindahan'
		,	action: 'openpindah'
		});
		Earsip.notif.mpinjam = Ext.create('Ext.button.Button', {
			text: 'Peminjaman'
		,	action: 'openpinjam'
		});

		this.callParent (arguments);
		if (this.items.length > 0) {
			this.do_load_menu ();
		}
	}
,	do_load_menu : function (comp, opts)
	{
		Ext.Ajax.request ({
			url		: 'data/menu.jsp'
		,	scope	: this
		,	success	: function (response) {
				var o = Ext.decode(response.responseText);

				if (o.success !== true) {
					Ext.msg.error (o.info);
					return;
				}

				this.suspendLayout = true;
				this.removeAll (true);

				this.add ({
					xtype	: 'tbspacer'
				,	width	: 80
				});
				this.add ('-');

				this.add ({
					text	: Earsip.branch_name
				});
				this.add ('-');

				for (var i = 0; i < o.menu.length; i++) {
					this.add (o.menu[i]);
					this.add ('-');
				}
				this.add ('->');
				this.add ('-');

				if (Earsip.is_p_arsip) {
					this.add(Earsip.notif.mjrainaktif);
					this.add ('-');
					this.add(Earsip.notif.mpindah);
					this.add ('-');
					this.add(Earsip.notif.mpinjam);
					this.add ('-');
				} else {
					this.add(Earsip.notif.mjraaktif);
					this.add ('-');
				}

				this.add ({
					iconCls	: 'app'
				,	text	: Earsip.username
				,	menu	: {
						xtype	: 'menu'
					,	items	: [{
							text	: 'Ubah Password'
						,	action	: 'edit'
						,	iconCls	: 'edit'
						},{
							text	: 'Logout'
						,	action	: 'logout'
						,	iconCls	: 'logout'
						}]
					}
				});

				this.suspendLayout = false;
				this.doLayout();

				this.do_load_notif_jra_aktif();
				this.do_load_notif_jra_inaktif();
				this.do_load_notif_pindah();
				this.do_load_notif_pinjam();
			}
		,	failure	: function (response) {
				Ext.msg.error ('Server error: data menu tidak dapat diambil!');
			}
		});
	}

,	do_load_notif_jra_aktif: function()
	{
		var store = Ext.getStore('BerkasJRA');

		store.load({
			scope: this
		,	callback: function(records, op, success)
			{
				if (records.length <= 0) {
					return;
				}

				Earsip.notif.mjraaktif.setText('JRA Aktif '
					+'<span class="notif">'
						+ records.length
					+'</span>');
			}
		});
	}

,	do_load_notif_jra_inaktif: function()
	{
		var store = Ext.getStore('BerkasJRA');

		store.load({
			scope: this
		,	callback: function(records, op, success)
			{
				if (records.length <= 0) {
					return;
				}

				Earsip.notif.mjrainaktif.setText('JRA in-aktif '
					+'<span class="notif">'
						+ records.length
					+'</span>');
			}
		});
	}

,	do_load_notif_pindah: function()
	{
		var store = Ext.getStore('Pemindahan');

		store.load({
			scope: this
		,	params: {
				status: 0
			}
		,	callback: function(records, op, success)
			{
				if (records.length <= 0) {
					return;
				}

				Earsip.notif.mpindah.setText('Pemindahan '
					+'<span class="notif">'
						+ records.length
					+'</span>');
			}
		});
	}

,	do_load_notif_pinjam: function()
	{
		var store = Ext.getStore('NotifPeminjaman');

		store.load({
			scope: this
		,	callback: function(records, op, success)
			{
				if (records.length <= 0) {
					return;
				}

				Earsip.notif.mpinjam.setText('Peminjaman '
					+'<span class="notif">'
						+ records.length
					+'</span>');
			}
		});
	}
});
