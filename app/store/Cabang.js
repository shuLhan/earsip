Ext.define ('Earsip.model.Cabang', {
	extend		:'Ext.data.Model'
,	idProperty	:'id'
,	fields		:[
		'id'
	,	'nama'
	,	'kota'
	,	'alamat'
	,	'telepon'
	,	'fax'
	]
});

Ext.define ('Earsip.store.Cabang', {
	extend		: 'Ext.data.Store'
,	storeId		: 'Cabang'
,	model		: 'Earsip.model.Cabang'
,	autoLoad	: true
,	autoSync	: false
,	proxy		: {
		type		: 'ajax'
	,	api			: {
			read		: 'data/cabang.jsp'
		,	create		: 'data/cabang_submit.jsp?action=create'
		,	update		: 'data/cabang_submit.jsp?action=update'
		,	destroy		: 'data/cabang_submit.jsp?action=destroy'
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
