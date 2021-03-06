Ext.define ('Earsip.model.TipeArsip', {
	extend		:'Ext.data.Model'
,	idProperty	:'id'
,	fields		:[
		'id'
	,	'nama'
	,	'keterangan'
	]
});

Ext.define ('Earsip.store.TipeArsip', {
	extend	: 'Ext.data.Store'
,	model	: 'Earsip.model.TipeArsip'
,	storeId	: 'TipeArsip'
,	autoSync: false
,	autoLoad: true
,	proxy	: {
		type	: 'ajax'
	,	api		: {
			read	: 'data/tipearsip.jsp'
		,	create	: 'data/tipearsip_submit.jsp?action=create'
		,	update	: 'data/tipearsip_submit.jsp?action=update'
		,	destroy	: 'data/tipearsip_submit.jsp?action=destroy'
		}
	,	reader	: {
			type	: 'json'
		,	root	: 'data'
		}
	,	writer	: {
			type	: 'json'
		}
	}
});
