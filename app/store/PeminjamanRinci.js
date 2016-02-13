Ext.define ('Earsip.model.PeminjamanRinci', {
	extend		:'Ext.data.Model'
,	fields		:[
		'peminjaman_id'
	,	'berkas_id'
	,	'nama'
	,	'nomor'
	,	'pembuat'
	,	'judul'
	,	'masalah'
	,	'jra_aktif'
	,	'jra_inaktif'
	,	'status'
	,	'status_hapus'
	,	'arsip_status_id'
	]
});

Ext.define ('Earsip.store.PeminjamanRinci', {
	extend		: 'Ext.data.Store'
,	storeId		: 'PeminjamanRinci'
,	model		: 'Earsip.model.PeminjamanRinci'
,	autoSync	: false
,	autoLoad	: false
,	proxy		: {
		type		: 'ajax'
	,	api			: {
			read		: 'data/peminjaman_rinci.jsp'
		,	create		: 'data/peminjaman_rinci_submit.jsp?action=create'
		,	destroy		: 'data/peminjaman_rinci_submit.jsp?action=destroy'
		}
	,	reader		: {
			type		: 'json'
		,	root		: 'data'
		}
	,	writer		: {
			type		: 'json'
		}
	}
});
