Ext.require ([
	'Earsip.store.KlasArsip'
,	'Earsip.store.UnitKerja'
,	'Earsip.store.ModeArsip'
,	'Earsip.view.KlasArsipWin'
]);

var groupingFeature = Ext.create('Ext.grid.feature.Grouping',{
        groupHeaderTpl: 'Unit Kerja : {name} ({rows.length} Klas)'
    });

Ext.define ('Earsip.view.KlasArsip', {
	extend		: 'Ext.grid.Panel'
,	alias		: 'widget.ref_klasifikasi_arsip'
,	itemId		: 'ref_klasifikasi_arsip'
,	title		: 'Referensi Klasifikasi Berkas'
,	store		: 'KlasArsip'
,	closable	: true
,	features	: [groupingFeature]
,	columns		: [{
		xtype		: 'rownumberer'
	},{
		text		: 'Unit Kerja ID'
	,	dataIndex	: 'unit_kerja_id'
	,	flex		: 1
	,	hidden		: true
	,	hideable	: false
	,	renderer	: store_renderer ('id', 'nama', Ext.getStore ('UnitKerja'))
	},{
		text		: 'Kode'
	,	dataIndex	: 'kode'
	,	width		: 120
	, 	groupable	: false
	},{
		text		: 'Nama Klasifikasi'
	,	dataIndex	: 'nama'
	,	width		: 180
	, 	groupable	: false
	},{
		text		: 'JRA Aktif'
	,	dataIndex	: 'jra_aktif'
	,	width		: 80
	},{
		text		: 'JRA Inaktif'
	,	dataIndex	: 'jra_inaktif'
	,	width		: 80
	},{
		text		: 'Mode Arsip'
	,	dataIndex	: 'mode_arsip_id'
	,	width		: 120
	,	renderer	: store_renderer ('id', 'nama', Ext.getStore ('ModeArsip'))
	},{
		text		: 'Keterangan'
	,	dataIndex	: 'keterangan'
	,	flex		: 2
	, 	groupable	: false
	}]
,	dockedItems	: [{
		xtype		: 'toolbar'
	,	dock		: 'top'
	,	flex		: 1
	,	items		: [{
			text		: 'Tambah'
		,	itemId		: 'add'
		,	action		: 'add'
		,	iconCls		: 'add'
		},'-',{
			text		: 'Ubah'
		,	itemId		: 'edit'
		,	iconCls		: 'edit'
		,	action		: 'edit'
		,	disabled	: true
		},'-',{
			text		: 'Refresh'
		,	itemId		: 'refresh'
		,	action		: 'refresh'
		,	iconCls		: 'refresh'
		},'->',{
			text		: 'Hapus'
		,	itemId		: 'del'
		,	action		: 'del'
		,	iconCls		: 'del'
		,	disabled	: true
		}]
	}]
,	listeners		: {
		removed			: function (comp)
		{
			this.destroy ();
		}
	,	selectionchange : function (m, r)
		{
			var b_edit		= this.down ('#edit');
			var b_del		= this.down ('#del');

			b_edit.setDisabled (! r.length);
			b_del.setDisabled (! r.length);

			if (r.length > 0) {
				if (this.win == undefined) {
					this.win = Ext.create ('Earsip.view.KlasArsipWin', {});
				}
				this.win.down ('form').loadRecord (r[0]);
			}
		}
	}

,	do_add : function (button)
	{
		if (this.win == undefined) {
			this.win = Ext.create ('Earsip.view.KlasArsipWin', {});
		}
		this.win.down ('form').getForm ().reset ();
		this.win.show ();
		this.win.action = 'create';
	}

,	do_edit : function (b)
	{
		if (this.win == undefined) {
			this.win = Ext.create ('Earsip.view.KlasArsipWin', {});
		}
		this.win.show ();
		this.win.action = 'update';
	}

,	do_refresh : function (button)
	{
		this.getStore ().load ();
	}

,	do_delete : function (button)
	{
		Ext.Msg.confirm ('Konfirmasi'
		, 'Apakah anda yakin mau menghapus data klasifikasi berkas?'
		, function (b)
		{
			if (b == 'no') {
				return;
			}
			var d = this.getSelectionModel ().getSelection ();

			if (d.length <= 0) {
				return;
			}

			var s = this.getStore ();
			s.remove (d);
			s.sync ();
		}
		, this);
	}

,	do_submit : function (b)
	{
		var win		= b.up ('#klas_arsip_win');
		var form	= win.down ('form').getForm ();

		if (! form.isValid ()) {
			Ext.msg.error ('Silahkan isi semua kolom yang kosong terlebih dahulu');
			return;
		}

		form.submit ({
			scope	: this
		,	params	: {
				action	: win.action
			}
		,	success	: function (form, action)
			{
				if (action.result.success == true) {
					Ext.msg.info (action.result.info);
					form.reset ();
					win.hide ();
					this.getStore ().load ();
				} else {
					Ext.msg.error (action.result.info);
				}
			}
		,	failure	: function (form, action)
			{
				Ext.msg.error (action.result.info);
			}
		});
	}

,	win_on_beforeclose : function (panel)
	{
		this.getSelectionModel ().deselectAll ();
	}

,	initComponent : function (opt)
	{
		this.callParent (opt);

		this.down ("#add").on ("click", this.do_add, this);
		this.down ("#edit").on ("click", this.do_edit, this);
		this.down ("#del").on ("click", this.do_delete, this);
		this.down ("#refresh").on ("click", this.do_refresh, this);

		if (this.win == undefined) {
			this.win = Ext.create ('Earsip.view.KlasArsipWin', {});

			this.win.down ("#save").on ("click", this.do_submit, this);
			this.win.on ("beforeclose", this.win_on_beforeclose, this);
		}
	}
});
