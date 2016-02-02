Ext.require ('Earsip.store.Cabang');

Ext.define ('Earsip.view.Cabang', {
	extend		: 'Ext.grid.Panel'
,	alias		: 'widget.mas_cabang'
,	title		: 'Data Cabang'
,	itemId		: 'mas_cabang'
,	store		: 'Cabang'
,	closable	: true
,	plugins		:
	[
		Ext.create ('Earsip.plugin.RowEditor')
	]
,	columns		: [{
		text		: 'Nama'
	,	dataIndex	: 'nama'
	,	width		: 160
	,	editor		: {
			xtype		: 'textfield'
		,	allowBlank	: false
		}
	},{
		text		: 'Kota'
	,	dataIndex	: 'kota'
	,	width		: 200
	,	editor		: {
			xtype		: 'textfield'
		,	allowBlank	: false
		}
	},{
		text		: 'Alamat'
	,	dataIndex	: 'alamat'
	,	flex		: 1
	,	editor		: {
			xtype		: 'textfield'
		,	allowBlank	: false
		}
	},{
		text		: 'Telepon'
	,	dataIndex	: 'telepon'
	,	editor		: {
			xtype		: 'textfield'
		}
	},{
		text		: 'Fax'
	,	dataIndex	: 'fax'
	,	editor		: {
			xtype		: 'textfield'
		}
	}]
,	dockedItems	: [{
		xtype		: 'toolbar'
	,	dock		: 'top'
	,	flex		: 1
	,	items		: [{
			text		: 'Tambah'
		,	itemId		: 'add'
		,	iconCls		: 'add'
		},'-',{
			text		: 'Refresh'
		,	itemId		: 'refresh'
		,	iconCls		: 'refresh'
		,	handler		:function (b)
			{
				b.up ('grid').do_refresh ();
			}
		},'->',{
			text		: 'Hapus'
		,	itemId		: 'del'
		,	iconCls		: 'del'
		,	disabled	:true
		}]
	}]

,	listeners	:{
		selectionchange	:function (model, data, e)
		{
			var s = ! (data.length > 0);

			this.down ('#del').setDisabled (s);

			if (s) {
				return;
			}
		}
	}

,	do_refresh	:function ()
	{
		this.getStore ().load ();
	}

,	do_add : function (b)
	{
		var editor = this.getPlugin ('roweditor');

		editor.cancelEdit ();
		editor.action = 'add';
		var r = Ext.create ('Earsip.model.Cabang', {
				id		: 0
			,	nama	: ''
			,	kota	: ''
			,	alamat	: ''
			,	telepon	: ''
			,	fax		: ''
			});

		this.getStore ().insert (0, r);
		editor.startEdit (0, 0);
	}

,	do_delete : function (b)
	{
		Ext.Msg.confirm ('Konfirmasi'
		, 'Apakah anda yakin mau menghapus cabang?'
		, function (b)
		{
			if (b == 'no') {
				return;
			}
			var data	= this.getSelectionModel ().getSelection ();
			var store	= this.getStore ();

			if (data.length <= 0) {
				return;
			}

			store.remove (data);
			store.sync ();
		}
		, this);
	}

,	initComponent : function (opt)
	{
		this.callParent (opt);

		this.down ("#add").on ("click", this.do_add, this);
		this.down ("#del").on ("click", this.do_delete, this);
	}
});
