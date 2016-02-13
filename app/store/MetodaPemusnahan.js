Ext.define ('Earsip.model.MetodaPemusnahan', {
	extend		:'Ext.data.Model'
,	idProperty	:'id'
,	fields		:[
		'id'
	,	'nama'
	,	'keterangan'
	]
});

Ext.define ('Earsip.store.MetodaPemusnahan', {
	extend		: 'Ext.data.Store'
,	storeId		: 'MetodaPemusnahan'
,	model		: 'Earsip.model.MetodaPemusnahan'
,	autoSync	: false
,	proxy		: {
		type		: 'ajax'
	,	api			: {
			read		: 'data/pemusnahan_metoda.jsp'
		,	create		: 'data/pemusnahan_metoda_submit.jsp?action=create'
		,	update		: 'data/pemusnahan_metoda_submit.jsp?action=update'
		,	destroy		: 'data/pemusnahan_metoda_submit.jsp?action=destroy'
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
