Ext.require ([
	'Earsip.view.Trash'
]);

Ext.define ('Earsip.controller.BerkasTree', {
	extend	: 'Ext.app.Controller'
,	refs	: [{
		ref		: 'mainview'
	,	selector: 'mainview'
	},{
		ref		: 'berkastree'
	,	selector: 'berkastree'
	},{
		ref		: 'berkaslist'
	,	selector: 'berkaslist'
	}]

,	init	: function ()
	{
		this.control ({
			'berkastree': {
				selectionchange : this.dir_selected
			}
		,	'berkastree button[itemId=refresh]': {
				click : this.do_refresh
			}
		,	'berkastree button[itemId=trash]': {
				click : this.do_open_trash
			}
		});
	}

,	dir_selected : function (tree, records, opts)
	{
		if (records.length > 0) {
			Earsip.berkas.id	= records[0].get ('id');
			Earsip.berkas.pid	= records[0].get ('parentId');

			this.getBerkaslist ().do_load_list (Earsip.berkas.id);
		}
	}

,	do_refresh : function ()
	{
		this.getBerkastree ().do_load_tree ();
		Earsip.berkas.id	= 0;
		Earsip.berkas.pid	= 0;
	}

,	do_open_trash : function (b)
	{
		var tabpanel = this.getMainview ().down ('#content_tab');

		Earsip.acl = b.acl;

		var c = tabpanel.getComponent (b.itemId);
		if (c == undefined) {
			tabpanel.add ({
				xtype	: b.itemId
			});
		}
		tabpanel.setActiveTab (b.itemId);
	}
});
