Ext.define ('Earsip.store.NotifPeminjaman', {
	extend		: 'Ext.data.Store'
,	storeId		: 'NotifPeminjaman'
,	model		: 'Earsip.model.Peminjaman'
,	autoSync	: false
,	proxy		: {
		type		: 'ajax'
	,	api			: {
			read		: 'data/peminjaman_notif.jsp'
		}
	,	reader		: {
			type		: 'json'
		,	root		: 'data'
		}
	}
});
