Ext.require ([
	'Earsip.store.SharedList'
,	'Earsip.store.UnitKerja'
,	'Earsip.store.KlasArsip'
,	'Earsip.store.TipeArsip'
]);

Ext.define ('Earsip.view.SharedList', {
	extend		: 'Ext.grid.Panel'
,	alias		: 'widget.sharedlist'
,	itemId		: 'sharedlist'
,	store		: 'SharedList'
,	title		: 'Berkas Berbagi'
,	columns		: [{
		text		: 'Nama'
	,	dataIndex	: 'nama'
	,	flex		: 1
	,	hideable	: false
	,	renderer	: function (v, md, r)
		{
			if (r.get ('tipe_file') == 0) {
				return "<span class='dir'>"+ v +"</span>";
			} else {
				return "<a class='doc' target='_blank'"
					+" href='data/download.jsp"
					+"?berkas="+ r.get('sha') +"&nama="+ v +"'>"
					+ v +"</a>";
			}
		}
	},{
		text		: 'Unit Kerja'
	,	dataIndex	: 'unit_kerja_id'
	,	renderer	: store_renderer ('id', 'nama', Ext.getStore ('UnitKerja'))
	},{
		text		: 'Klasifikasi'
	,	width		: 150
	,	dataIndex	: 'berkas_klas_id'
	,	renderer	: store_renderer ('id', 'nama', Ext.getStore ('KlasArsip'))
	},{
		text		: 'Tipe'
	,	width		: 150
	,	dataIndex	: 'berkas_tipe_id'
	,	renderer	: store_renderer ('id', 'nama', Ext.getStore ('TipeArsip'))
	},{
		text		: 'Tanggal Dibuat'
	,	dataIndex	: 'tgl_dibuat'
	,	width		: 150
	}]
,	dockedItems	: [{
		xtype		: 'toolbar'
	,	dock		: 'top'
	,	flex		: 1
	,	items		: [{
			text		: 'Refresh'
		,	itemId		: 'refresh'
		,	iconCls		: 'refresh'
		},'-',{
			text		: 'Kembali'
		,	itemId		: 'dirup'
		,	iconCls		: 'dirup'
		}]
	}]
,	listeners	: {
		activate : function (comp)
		{
			this.getStore ().load ();
		}
	}

,	initComponent	: function ()
	{
		this.callParent (arguments);
	}

,	do_load_list : function (berkas_id)
	{
		this.getStore ().load ({
			params	: {
				berkas_id : berkas_id
			}
		,	callback : function (records, op, success)
			{
				if (success == false) {
					Ext.Msg.alert ('Kesalahan', 'Koneksi ke server mengalami gangguan.');
				} else {
					Earsip.share.id = records[0].get ('id');
					Earsip.share.pid = records[0].get ('pid');
				}
			}
		});
	}

,	do_load_up_list : function (pid)
	{
		this.getStore ().load ({
			params	: {
				berkas_pid : pid
			}
		,	callback : function (records, op, success)
			{
				if (success == false) {
					Ext.Msg.alert ('Kesalahan', 'Koneksi ke server mengalami gangguan.');
				} else {
					Earsip.share.id = records[0].get ('id');
					Earsip.share.pid = records[0].get ('pid');

					var akses = records[0].get ('akses_berbagi_id');
					if (akses != 0) {
						Earsip.share.pid = 0;
					}
				}
			}
		});
	}
});
