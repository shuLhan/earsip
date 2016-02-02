Ext.Loader.setConfig ({ enabled: true });

Ext.define ('Earsip', {
	singleton		: true
,	pageSize		:20
,	username		: ''
,	is_p_arsip		: false
,	repo_path		: ''
,	acl				: 0
,	win_viewer		: undefined
,	berkas			: {
		id				: 0
	,	pid				: 0
	,	tree			: {
			id				: 0
		,	pid				: 0
		}
	}
,	share			: {
		id				: 0
	,	pid				: 0
	,	peg_id			: 0
	,	hak_akses_id	: 0
	}
,	arsip			: {
		id				: 0
	,	pid				: 0
	,	tree			: {
			id				: 0
		,	pid				: 0
		,	unit_kerja_id	: 0
		,	kode_rak		: ''
		,	kode_box		: ''
		,	kode_folder		: ''
		,	type			: ''
		}
	}
,	reset : function ()
	{
		this.berkas.id			= 0;
		this.berkas.pid			= 0;
		this.berkas.tree.id		= 0;
		this.berkas.tree.pid	= 0;
		this.share.id			= 0;
		this.share.pid			= 0;
		this.share.peg_id		= 0;
		this.share.hak_akses_id	= 0;
		this.arsip.id			= 0;
		this.arsip.pid			= 0;
		this.arsip.tree.id		= 0;
		this.arsip.tree.pid		= 0;
		this.arsip.tree.unit_kerja_id	= 0;
		this.arsip.tree.kode_rak		= '';
		this.arsip.tree.kode_box		= '';
		this.arsip.tree.kode_folder		= '';
		this.arsip.tree.type			= '';
	}
});

Ext.msg = function ()
{
	var msgCt;

	return {
		display : function (title, format, cls, delay)
		{
			if (!msgCt) {
				msgCt = Ext.DomHelper.insertFirst (document.body, {id:'msg-div'}, true);
			}
			var s = Ext.String.format.apply (String, Array.prototype.slice.call(arguments, 1));
			var m = Ext.DomHelper.append(msgCt
					, '<div class="'+ cls +'"><h3>' + title + '</h3><p>' + s + '</p></div>'
					, true);
			m.hide();
			m.slideIn('t').ghost("t", { delay: delay, remove: true});
		}

	,	info : function (format)
		{
			this.display ('Informasi', format, 'msg-info', 2000);
		}

	,	error : function (format)
		{
			this.display ('Kesalahan', format, 'msg-error', 4000);
		}

	,	init : function ()
		{
		}
    };
}();

Ext.define ('Earsip.plugin.RowEditor', {
	extend				: 'Ext.grid.plugin.RowEditing'
,	action				: 'none'	/* none, add, edit */
,	alias				: 'widget.roweditor'
,	pluginId			: 'roweditor'
,	saveText			: 'Simpan'
,	cancelText			: 'Batal'
,	clicksToEdit		: 2
,	clicksToMoveEditor	: 1
,	errorSummary		: false
,	listeners			: {
		beforeedit			: function (ed, e)
		{
			if (Earsip.acl < 3) {
				return false;
			}
			return true;
		}
	,	edit				: function (editor, e)
		{
			editor.action = 'none';
			editor.grid.store.sync ({
				params	: editor.grid.params
			});
		}
	,	canceledit			: function (editor)
		{
			if (editor.action == 'add') {
				editor.grid.store.removeAt (0);
				editor.grid.getSelectionModel ().select (0);
			}
		}
	}
});

function combo_renderer (v, col)
{
	var combo = col.getEditor ();
	var i = combo.store.find (combo.valueField, v, 0, false, true, true);
	if (i < 0) {
		return v;
	}
	var rec = combo.store.getAt (i);
	return rec ? rec.get(combo.displayField) : "";
}

function store_renderer (valueField, displayField, store)
{
	return function (v) {
		var i = store.find (valueField, v, 0, false, true, true);
		if (i < 0) {
			return "";
		}
		var rec = store.getAt (i);
		return rec ? rec.get (displayField) : "";
	}
}

function date_renderer (valueField)
{
	if (valueField == 'null') return '-';
	return Ext.util.Format.date(valueField,'d F Y');
}

/* Add clear function to remove all data from grid, without sync */
Ext.override (Ext.grid.Panel, {
	clearData: function ()
	{
		this.getStore ().loadData ([], false);
	}
});

Ext.application ({
	name		: 'Earsip'
,	appFolder	: 'app'
,	stores		: [
		'Berkas'
	,	'BerkasInAktif'
	,	'BerkasTree'
	,	'BerkasBerbagi'
	,	'BerkasBerbagiList'
	,	'Cabang'
	,	'User'
	,	'Grup'
	,	'MenuAccess'
	,	'UnitKerja'
	,	'Pegawai'
	,	'Jabatan'
	,	'MetodaPemusnahan'
	,	'ModeArsip'
	,	'KlasArsip'
	,	'TipeArsip'
	,	'IndeksRelatif'
	,	'Peminjaman'
	,	'PeminjamanRinci'
	,	'BerkasPinjam'
	,	'Pemindahan'
	,	'PemindahanRinci'
	,	'BerkasPindah'
	,	'Arsip'
	,	'Arsip.UnitKerja'
	,	'Arsip.Rak'
	,	'Arsip.Box'
	,	'Arsip.Folder'
	,	'Pemusnahan'
	,	'PemusnahanRinci'
	,	'TimPemusnahan'
	,	'BerkasMusnah'
	,	'BerkasJRA'
	,	'LapBerkasJRA'
	,	'LapBerkasMusnah'
	,	'NotifPeminjaman'
	]
,	views		: [
		'Main'
	,	'MainToolbar'

	,	'Berkas'
	,	'BerkasTree'
	,	'BerkasList'
	,	'BerkasForm'
	,	'WinUploadSingle'
	,	'BerkasBerbagiWin'
	,	'CariBerkasWin'

	,	'BerkasBerbagiTree'
	,	'BerkasBerbagiList'
	,	'BerkasBerbagi'

	,	'AdmSistem'

	,	'UnitKerja'
	,	'Pegawai'
	,	'PegawaiWin'

	,	'KlasArsip'
	,	'KlasArsipWin'

	,	'TipeArsip'
	,	'TipeARsipWin'

	,	'RefIndeksRelatif'
	,	'RefIndeksRelatifWin'

	,	'MetodaPemusnahan'
	,	'Jabatan'

	,	'Peminjaman'
	,	'PeminjamanWin'
	,	'Pemindahan'
	,	'PemindahanWin'
	,	'PemindahanRinciWin'
	,	'Pemusnahan'
	,	'PemusnahanWin'
	,	'NotifPemindahan'
	,	'NotifPemindahanWin'

	,	'BerkasJRA'
	,	'BerkasJRAList'

	,	'TransferBerkas'
	,	'LapBerkasJRA'
	,	'LapBerkasMusnah'
	,	'Notifikasi'
	,	'NotifikasiPeminjaman'

	,	'Cabang'
	]
,	controllers	: [
		'Login'
	,	'MainToolbar'
	]

,	launch		: function ()
	{
		Ext.form.field.Date.prototype.format = 'd F Y';
		Ext.form.field.Date.prototype.submitFormat = 'Y-m-d';

		var win			= Ext.create ('Earsip.view.LoginWindow', {});
		var mainview	= Ext.create ('Earsip.view.Main', {});
		var viewport	= Ext.create ('Ext.container.Viewport', {
			layout	: 'fit'
		,	items	: [ mainview ]
		});

		viewport.show ();

		Earsip.repo_path = _g_repo_path;

		if (! is_login) {
			win.show ();
			return;
		}

		win.hide ();
		Earsip.username = _g_username;

		mainview.getLayout ().setActiveItem ('main');

		var main		= mainview.getLayout ().getActiveItem ();
		var tb			= main.getDockedComponent ('maintoolbar');
		var berkas_tree	= main.down ('#berkastree');
		var tabpanel	= mainview.down ('#content_tab');
		var notif		= tabpanel.down ('#notifikasi');

		tb.do_load_menu ();
		berkas_tree.do_refresh ();

		Earsip.is_p_arsip = (is_pusatarsip == 1 ? true : false);

		notif.do_load_items ();
	}
});
