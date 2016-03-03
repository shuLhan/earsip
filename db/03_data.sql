INSERT INTO m_sysconfig (repository_root, max_upload_size) values ('/repository', 5000);

---{{{ m_grup
INSERT INTO m_grup (nama, keterangan) VALUES ('Administrator', 'Admin aplikasi');
INSERT INTO m_grup (nama, keterangan) VALUES ('Pusat Berkas', 'Mengatur seluruh arsip aktif');
INSERT INTO m_grup (nama, keterangan) VALUES ('Pusat Arsip', 'Mengatur seluruh arsip inaktif');
INSERT INTO m_grup (nama, keterangan) VALUES ('Administrator Cabang', 'Administrator cabang');
---}}}

---{{{ m_menu
INSERT INTO m_menu (id, pid, icon, nama_ref, nama) VALUES ( 1,  0, 'system', 'adm', 'Administrasi');
INSERT INTO m_menu (id, pid, icon, nama_ref, nama) VALUES ( 2,  1, 'module', 'adm_sistem', 'Sistem');
INSERT INTO m_menu (id, pid, icon, nama_ref, nama) VALUES ( 3,  1, 'module', 'adm_hak_akses', 'Hak Akses');
INSERT INTO m_menu (id, pid, icon, nama_ref, nama) VALUES (10,  0,    'ref', 'ref', 'Referensi');
INSERT INTO m_menu (id, pid, icon, nama_ref, nama) VALUES (11, 10, 'module', 'ref_tipe_arsip', 'Tipe Berkas');
INSERT INTO m_menu (id, pid, icon, nama_ref, nama) VALUES (12, 10, 'module', 'ref_klasifikasi_arsip', 'Klasifikasi Berkas');
INSERT INTO m_menu (id, pid, icon, nama_ref, nama) VALUES (13, 10, 'module', 'ref_indeks_relatif', 'Indeks Relatif');
INSERT INTO m_menu (id, pid, icon, nama_ref, nama) VALUES (14, 10, 'module', 'ref_jabatan', 'Jabatan');
INSERT INTO m_menu (id, pid, icon, nama_ref, nama) VALUES (15, 10, 'module', 'ref_metoda_pemusnahan', 'Metoda Pemusnahan');
INSERT INTO m_menu (id, pid, icon, nama_ref, nama) VALUES (20,  0,    'ref', 'mas', 'Master');
INSERT INTO m_menu (id, pid, icon, nama_ref, nama) VALUES (21, 20, 'module', 'mas_cabang', 'Cabang');
INSERT INTO m_menu (id, pid, icon, nama_ref, nama) VALUES (22, 20, 'module', 'mas_unit_kerja', 'Unit Kerja');
INSERT INTO m_menu (id, pid, icon, nama_ref, nama) VALUES (23, 20, 'module', 'mas_pegawai', 'Pegawai');
INSERT INTO m_menu (id, pid, icon, nama_ref, nama) VALUES (24, 20, 'module', 'mas_arsip', 'Arsip');
INSERT INTO m_menu (id, pid, icon, nama_ref, nama) VALUES (30,  0,  'trans', 'trans', 'Transaksi');
INSERT INTO m_menu (id, pid, icon, nama_ref, nama) VALUES (31, 30, 'module', 'trans_pemindahan', 'Pemindahan');
INSERT INTO m_menu (id, pid, icon, nama_ref, nama) VALUES (32, 30, 'module', 'trans_peminjaman', 'Peminjaman');
INSERT INTO m_menu (id, pid, icon, nama_ref, nama) VALUES (33, 30, 'module', 'trans_pemusnahan', 'Pemusnahan');
INSERT INTO m_menu (id, pid, icon, nama_ref, nama) VALUES (34, 30, 'module', 'trans_transfer_berkas', 'Transfer berkas');
INSERT INTO m_menu (id, pid, icon, nama_ref, nama) VALUES (40,  0,    'doc', 'lap', 'Laporan');
INSERT INTO m_menu (id, pid, icon, nama_ref, nama) VALUES (41, 40, 'module', 'lap_berkas_jra', 'Berkas JRA');
INSERT INTO m_menu (id, pid, icon, nama_ref, nama) VALUES (42, 40, 'module', 'lap_berkas_musnah', 'Berkas Musnah');
---}}}

---{{{ m_cabang
COPY m_cabang (id, nama, alamat, kota, telepon, fax)
FROM stdin WITH DELIMITER ';';
1;KANTOR PUSAT;JL. PEMUDA 142;SEMARANG;024 3547541;024 3554016
2;KC. DEMAK;JL. SULTAN FATAH NO. 41;DEMAK;0291 681750;681747
3;KC. KENDAL;JL. SOEKARNO HATTA NO. 228;KENDAL;0294 381324;381005
4;KCP. PASAR BOJA;KOMPLEK PASAR BOJA JL. RAYA PEMUDA NO. 34;KENDAL;0294 571254;571254
5;KCP. PASAR WELERI;KOMPLEK PASAR WELERI JL. RAYA WELERI NO. A 12-13;KENDAL;0294 644508;642017
6;KC. PURWODADI;JL. LETJEN S.PARMAN NO. 16;PURWODADI;0292 421172;421404
7;KCP. PASAR KOTA PURWODADI;PASAR KOTA JL. A.YANI 10 H-2;PURWODADI;0292 421658;421568
8;KCP. PASAR WIROSARI;JL. GAJAH MADA 81 B;PURWODADI;0292 761372;761372
9;KC. SALATIGA;JL. PEMUDA NO. 1;SALATIGA;0298 324750;324751
10;KC. UTAMA;JL. PEMUDA NO. 142;SEMARANG;024 3554025;3520181
11;KCP. SETWILDA;JL. PAHLAWAN NO. 7;SEMARANG;024 6717911;6712196
12;KC. SEMARANG;JL. BRIGJEN SUDIARTO 196-198;SEMARANG;024 6717911;6712196
13;KCP. BANYUMANIK;JL. SUKUN RAYA RUKO B-1;SEMARANG;024 76920511;7465701
14;KCP. IAIN;JL. WALISONGO 3-5;SEMARANG;024 7601266;7608613
15;KCP. PASAR JOHAR;JL. PEMUDA NO.3;SEMARANG;024 3544512;3545068
16;KCP. METRO PETERONGAN;JL. MT. HARYONO NO.970;SEMARANG;024 8447247;8454229
17;KCP. PLAZA SIMPANG LIMA;JL. SIMPANG LIMA PLAZA;SEMARANG;024 8415303;8448925
18;KCP. POLINES;JL. PROF. SUDIARTO TEMBALANG;SEMARANG;024 7474034;7474034
19;KCP. PASAR GAYAMSARI;KOMPLEK PASAR GAYAMSARI;SEMARANG;024 6720050;76745404
20;KCP. PASAR KAGOK;JL. SULTAN AGUNG NO.104;SEMARANG;024 8500610;8447654
21;KCP. PASAR SATRIOWIBOWO;JL. TELOGOSARI RAYA II NO.47;SEMARANG;024 6720054;6700281
22;KCP. SAMPANGAN;JL. LAMONGAN RAYA NO.5;SEMARANG;024 8415690;8415690
23;KCP. UDINUS;JL. NAKULO I NO.5;SEMARANG;024 3563640;3554310
24;KCP. UNISSULA;JL. RAYA KALIGAWE KM.4;SEMARANG;024 6583936;6583936
25;KCP. UNNES;JL. KELUD RAYA NO.2;SEMARANG;024 8415102;8443979
26;KC. UNGARAN;JL. DIPONEGORO NO. 25;UNGARAN;024 6921294;6921429
27;KCP. PASAR BABADAN;KOMPLEK PS.BABADAN BLOK A-14 JL. JEND SUDIRMAN;UNGARAN;024 6924830;6924830
28;KCP. UNGARAN KOTA;UNGARAN PLAZA BLOK 9, 10;UNGARAN;024 6924268;769137111
29;KC. BOYOLALI;JL. MERBABU NO.3;BOYOLALI;0276 321233;321430
30;KCP. PASAR KARANGGEDE;JL. PRAWIRODIGDOYO NO. 3 H;BOYOLALI;0298 610700;610701
31;KCP. PASAR SIMO;JL. KIOS PASAR SIMO NO. 9;BOYOLALI;0276 3331034;3294732
32;KCP. SUNGGINGAN;JL. PANDANARAN NO. 329;BOYOLALI;0276 322977;322977
33;KC. KARANGANYAR;JL. LAWU NO. 363;KARANGANYAR;0271 495140;495959
34;KCP. JATIPURO;JL. JATIPURO;KARANGANYAR;0271 495537;495537
35;KCP. PASAR KARANGPANDAN;JL. LAWU 78;KARANGANYAR;0271 6492008;6492009
36;KCP. PASAR PALUR;KOMPLEK UNIV. SURAKARTA (UNSA);KARANGANYAR;0271 827477;827477
37;KCP. KERJO;JL. RAYA KWADUNGAN;KARANGAYAR;0271 7079810;6493165
38;KC. KLATEN;JL. PEMUDA UTARA NO. 108;KLATEN;0272 323045;322785
39;KCP. PEDAN;JL. PEMUDA NO 40 MIPITAN;KLATEN;0272 897949;897949
40;KCP. PLASA KLATEN;JL. RONGGOWARSITO 25 KLATEN;KLATEN;0272 323497;324053
41;KCP. PRAMBANAN;JL. RAYA KLATEN YOGYAKARTA;KLATEN;0274 498400;498300
42;KCP. PASAR JATINOM;PS.GABUS JATINOM NO 98;KLATEN;0272 337338;337301
43;KCP. PASAR WEDI;JL. SULTAN AGUNG NO 10 KLATEN;KLATEN;0272 325223;323304
44;KC. SRAGEN;JL. RAYA SUKOWATI 154 A;SRAGEN;0271 891644;891224
45;KCP. GEMOLONG;JL. RAYA SUKOWATI NO. 8;SRAGEN;0271 7006640;6811789
46;KCP. PASAR KOTA SRAGEN;KOMPLEK PASAR KOTA LT. II;SRAGEN;0271 890322;890322
47;KCP. MOJOLABAN;JL. PEMUDA NO. 186-B;SUKOHARJO;0271 612234;
48;KC. SUKOHARJO;JL. JEND. SUDIRMAN NO. 80;SUKOHARJO;0271 593323;593562
49;KCP. PASAR NGUTER;JL. KOMPLEK PASAR NGUTER NO.1A;SUKOHARJO;0271 591662;591662
50;KCP. PASAR TAWANGSARI;JL. PATIMURA NO. 20;SUKOHARJO;0272 881133;881133
51;KC. SURAKARTA;JL. SLAMET RIYADI NO. 20;SURAKARTA;0271 647298;647297
52;KCP. GADING;JL. VETERAN NO. 8E PS. KLIWON;SURAKARTA;0271 656155;662149
53;KCP. KARTASURO;JL. KOMPLEK PASAR KARTASURO;SURAKARTA;0271 781527;781527
54;KCP. DELANGGU;JL. RAYA DELANGGU NO 67;SURAKARTA;0272 552668;552668
55;KCP. PASAR NUSUKAN;JL. ADI SUMARMO NO. 31 B;SURAKARTA;0271 717146;735241
56;KCP. UMS;JL. KOMPLEK UMS SURAKARTA;SURAKARTA;0271 715350;718022
57;KC. WONOGIRI;JL. RAYA WONOGIRI NO. 19;WONOGIRI;0273 321064;321731
58;KCP. BATURETNO;JL. SOLO PACITAN BATURETNO;WONOGIRI;0273 461070;462470
59;KCP. PASAR JATISRONO;KOMPLEK PS. JATISRONO;WONOGIRI;0273 411020;411764
60;KCP. PASAR PRACIMANTORO;KOMPLEK PS. PRACIMANTORO;WONOGIRI;0273 5328585;5328586
61;KCP. PURWANTORO;JL. RAYA PURWANTORO PONOROGO NO.14;WONOGIRI;0273 415064;
62;KCP. RSU WONOGIRI;JL. A.YANI NO 40 WONOGIRI;WONOGIRI;0273 321733;322785
63;KCP. PASAR KLAMPOK;JL. A YANI NO 43 PURWAREJA;BANJARNEGARA;0286 476249;479249
64;KC. BANJARNEGARA;JL. LETJEN SUPRAPTO NO.50-51;BANJARNEGARA;0286 591119;591319
65;KCP. KARANGKOBAR;JL. RAYA KARANGKOBAR WANAYASA KM.1;BANJARNEGARA;0286 5988223;
66;KCP. WANADADI;JL. KH. AHMAD DAHLAN NO. 4;BANJARNEGARA;;
67;KCP. WANGON;JL. RAYA WANGON RT.02 RW.01;BANYUMAS;;
68;KC. CILACAP;JL. MAYJEN SUTOYO NO.7;CILACAP;0282 534987;521882
69;KCP. CILACAP KOTA;JL. GATOT SUBROTO NO 17;CILACAP;0282 521733;521733
70;KCP. MAJENANG;JL. KAPTEN SUYONO 22;CILACAP;0280 621327;621328
71;KCP. PASAR KROYA;JL. GATOT SUBROTO NO.134;CILACAP;0282 492159;494832
72;KCP. SIDAREJA;JL. YOS SUDARSO NO.42 B;CILACAP;0280 524467;524467
73;KC. PURBALINGGA;JL. JEND. SUDIRMAN NO. 212;PURBALINGGA;0281 892873;891368
74;KCP. PASAR KOTA PURBALINGGA;JL. A. YANI NO. 65;PURBALINGGA;0281 893239;893239
75;KCP. PASAR BOBOTSARI;JL. BRIGJEN SUWONDO NO. 26;PURBALINGGA;0281 759059;759059
76;KC. PURWOKERTO;JL. GATOT SUBROTO NO.101;PURWOKERTO;0281 631673;631674
77;KCP. PASAR AJIBARANG;PASAR AJIBARANG RUKO NO.5;PURWOKERTO;0281 571357;571357
78;KCP. PASAR SOKARAJA;JL. JEND SUDIRMAN NO.64;PURWOKERTO;0281 694858;694858
79;KCP. PASAR WAGE;JL. DI PANJAITAN NO.78;PURWOKERTO;0281 637853;637584
80;KCP. SUMPIUH;JL. RAYA SUMPIUH NO.143;PURWOKERTO;0282 497705;
81;KCP. BANDAR;JL. RAYA BANDAR;BANDAR;0285 689287;
82;KC. BATANG;JL. JEND. SUDIRMAN NO. 263;BATANG;0285 391214;391559
83;KCP. PASAR KOTA BATANG;JL. JEND. SUDIRMAN NO. 263;BATANG;0285 392489;392489
84;KCP. PASAR LIMPUNG;JL. KOMPLEK PASAR LIMPUNG;BATANG;0285 4468372;4468372
85;KC. BREBES;JL. DIPONEGORO NO. 113-115;BREBES;0283 673444;673076
86;KCP. BUMIAYU;JL. RAYA JATISAWIT NO. 20 A-B;BREBES;0289 432282;432282
87;KCP. PASAR KETANGGUNGAN;JL. JEND. SUDIRMAN NO. 106;BREBES;;
88;KCP. KEDUNGWUNI;JL. RAYA GEMBONG NO. 30;KEDUNGWUNI;0285 4483331;4483335
89;KC. KAJEN;JL. RINJANI NO. 1A KAJEN;PEKALONGAN;0285 381705;381732
90;KC. PEKALONGAN;JL. ALOON-ALOON NO. 1;PEKALONGAN;0285 435089;411930
91;KCP. PASAR WIRADESA;JL. KOMPLEK RUKO PASAR;PEKALONGAN;0285 4416860;4416809
92;KC. PEMALANG;JL. JEND. SUDIRMAN TIMUR NO.76;PEMALANG;0284 321545;321545
93;KCP. PASAR COMAL;JL. A. YANI NO. 72;PEMALANG;0285 577737;577737
94;KCP. KOTA PEMALANG;JL.KH SAMANHUDI NO.03 PEMALANG;PEMALANG;0284 323120;323120
95;KCP. PASAR RANDUDONGKAL;JL. JEND. SUDIRMAN RUKO NO. 5;PEMALANG;0284 584294;584294
96;KC. SLAWI;JL. DR. SUTOMO NO. 20;SLAWI;0283 492802;491334
97;KC. TEGAL;JL. PEMUDA NO. 5;TEGAL;0283 354933;351021
98;KCP. PASAR BANJARAN;JL. RAYA TEMBOK BANJARAN;TEGAL;0283 442084;443253
99;KCP. PASAR PAGI;JL. A. YANI NO. 166;TEGAL;0283 318133;350411
100;KC. KEBUMEN;JL. PAHLAWAN NO.177;KEBUMEN;0287 381542;381442
101;KCP. GOMBONG;KOMP PS WONOKRIYO BLOK A 13-14;KEBUMEN;0287 472520;472510
102;KCP. KUTOWINANGUN;JL. RAYA KUTOWINANGUN;KEBUMEN;0287 661307;661628
103;KCP. PASAR KARANGANYAR;JL. REVOLUSI NO 119;KEBUMEN;0287 551039;551732
104;KCP. PASAR PREMBUN;JL. RAYA PREMBUN 135;KEBUMEN;0287 662290;662600
105;KC. MAGELANG;JL. ALOON-ALOON SELATAN NO. 11;MAGELANG;0293 362047;362392
106;KCP. BANDONGAN;JL. R.ABDULLAH NO 20;MAGELANG;0293 369486;3694
107;KCP. PASAR BOROBUDUR;JL. PRAMUDYAWARDHANI NO 1;MAGELANG;0293 788442;788442
108;KCP. PASAR GRABAG;KOMPLEK PS.GRABAG;MAGELANG;0293 3216778;3216779
109;KCP. PASAR REJOWINANGUN;JL. JEND.SUDIRMAN NO A.12;MAGELANG;0293 3660600;366909
110;KCP. MUNTILAN;JL. PEMUDA NO 45 MUNTILAN;MUNTILAN;0293 587105;587100
111;KC. PURWOREJO;JL. A YANI NO.20;PURWOREJO;0275 321235;321691
112;KCP. PASAR BALEDONO;KOMP PS BALEDONO KIOS 11 A;PURWOREJO;0275 323211;323248
113;KCP. PASAR KUTOARJO;JL. TANJUNG ANOM 50 KUTOARJO;PURWOREJO;0275 642115;642425
114;KC. TEMANGGUNG;JL. S.PARMAN NO. 33;TEMANGGUNG;0293 491210;491374
115;KCP. PARAKAN;JL. WONOSOBO NO 204 PARAKAN;TEMANGGUNG;0293 596569;596569
116;KCP. PASAR NGADIREJO;JL.RAYA NGADIREJO NO.50;TEMANGGUNG;0293 591294;591344
117;KC. WONOSOBO;JL. ANGKATAN 45 NO.1;WONOSOBO;0286 321500;321832
118;KCP. PASAR KERTEK;KOMP PS KERTEK KIOS NO F 16-19;WONOSOBO;0286 329234;329025
119;KC. BLORA;JL. PEMUDA NO. 57;BLORA;0296 531285;531353
120;KCP. CEPU;JL. RAYA MUSTIKA PLASA NO.10 A;BLORA;0296 4233218;425178
121;KCP. PASAR BLORA;JL. MR. ISKANDAR NO. 7;BLORA;0296 423318;425178
122;KC. JEPARA;JL. PEMUDA NO. 1;JEPARA;0291 591116;593565
123;KCP. PECANGAAN;JL. RAYA PECANGAAN NO. 93;JEPARA;0291 755107;755107
124;KCP. PASAR BANGSRI;JL. RAYA BANGSRI NO. 57;JEPARA;0291 771410;771410
125;KCP. PASAR KOTA JEPARA;JL. MT. HARYONO BLOK B NO. 3;JEPARA;0291 593911;593911
126;KCP. PASAR MAYONG;JL. RAYA MAYONG NO. 72;JEPARA;0291 755874;755874
127;KC. KUDUS;JL. JEND. SUDIRMAN NO. 158;KUDUS;0291 432583;431783
128;KCP. KUDUS PLASA;JL. KUDUS PLASA BLOK A 5 LT.1;KUDUS;0291 439076;442077
129;KCP. PASAR KLIWON KUDUS;JL. CEMPAKA RUKO BLOK B 20;KUDUS;0291 440453;440453
130;KC. PATI;JL. JEND. SUDIRMAN NO. 52;PATI;0295 382165;382656
131;KCP. PASAR JUANA;JL. KOMPLEK RUKO PORDA;PATI;0295 472325;471220
132;KCP. TAYU;JL. DIPONEGORO NO. 58;PATI;0295 452703;452251
133;KC. REMBANG;JL. KARTINI NO. 10;REMBANG;0295 693433;693150
134;KCP. KOTA REMBANG;JL.PEMUDA NO.9;REMBANG;0295 692577;693463
135;KC. JAKARTA;JL. PANGLIMA POLIM RAYA 25 JKT;JAKARTA SELATAN;021 72786144;
\.

-- reset sequence
SELECT setval(pg_get_serial_sequence ('m_cabang', 'id')
		        ,       coalesce (max(id), 0) + 1
		        ,       false) as "m_cabang sequence"
FROM m_cabang;
---}}}

---{{{ m_unit_kerja: insert new data to m_unit_kerja
COPY m_unit_kerja (id, direksi_id, divisi_id, kode, nama, nama_pimpinan, keterangan, urutan)
	FROM stdin WITH DELIMITER ';';
1;0;0;HT;Staff Direksi;;;1
2;0;0;DIRUT;Direktur Utama;Supriyatno;;2
3;0;0;DIRUM;Direktur Umum;Radjim;;3
4;0;0;DIRUS;Direktur Unit Usaha Syariah;;;4
5;0;0;DIRSAR;Direktur Pemasaran; ;;5
6;0;0;DIROPS;Direktur Operasional;Banbang Widianto;;6
7;0;0;DIRKEP;Direktur Kepatuhan;Rahadi Widiyanto;;7
8;2;0;SEKPER;Sekretaris Perusahaan;Windoyo;;8
9;3;0;PRC;Divisi Perencanaan dan Pengembangan;Wijoyo;;9
10;6;0;DT;Divisi Dana dan Treasury;Ony Suharsono;;10
11;3;0;PMS;Divisi Pemasaran;Pujiono;;11
12;5;0;KRD;Divisi Kredit;Eko Budi Maryanto;;12
13;4;0;SYAR;Divisi Syariah;Moh. Zaenal;;13
14;3;0;UM;Divisi Umum;Muji Hari Susanto;;14
15;7;0;SDM;Divisi SDM;Bambang Suryanto;;15
16;7;0;SKKMR;Satuan Kerja Kepatuhan dan Manajemen Risiko;Lulus Rahmat Mulyono;;16
17;2;0;SKAI;Satuan Kerja Audit Intern;Djoko Achmad Pitoyo;;17
18;6;0;TIAK;Divisi TSI dan Akuntansi ;Sri Sudarso;;18
19;2;0;AMU;Tim AMU;Agus Sri Subiyakto;;19
20;2;0;TAF;Tim Anti Fraud;Joko Yunarso;;20
21;7;0;APT;Tim APU dan PPT;;;21
22;2;0;RPK;Tim Restrukturisasi dan Penyelesaian Kredit;;;22
23;0;0;CAB;Cabang;;;23
\.

-- reset sequence
SELECT setval(pg_get_serial_sequence ('m_unit_kerja', 'id')
		        ,       coalesce (max(id), 0) + 1
		        ,       false) as "m_unit_kerja sequence"
FROM m_unit_kerja;
---}}}

---{{{ r_jabatan
INSERT INTO r_jabatan (nama, keterangan, urutan) VALUES ('Direktur Utama', 'Jabatan utama Direktur', 2);
INSERT INTO r_jabatan (nama, keterangan, urutan) VALUES ('Teknisi', 'Teknisi', 1);
---}}}

---{{{ m_pegawai
INSERT INTO m_pegawai (cabang_id, unit_kerja_id, grup_id, jabatan_id, nip, nama, psw, status) VALUES (1, 18, 1, 2, 'adminpusat', 'Admin Pusat', '3f5212d11b73d0912028b1f33a35ae34', 1);
INSERT INTO m_pegawai (cabang_id, unit_kerja_id, grup_id, jabatan_id, nip, nama, psw, status) VALUES (1, 2, 2, 2, 'berkaspusat', 'User Pusat Berkas', 'c059505d033ba5052761ae76d27b3cb5', 1);
INSERT INTO m_pegawai (cabang_id, unit_kerja_id, grup_id, jabatan_id, nip, nama, psw, status) VALUES (1, 14, 3, 2, 'arsippusat', 'User Pusat Arsip', '901c9c0333ada72b02d0ab2e5669144c', 1);
---}}}

---{{{ r_mode_arsip
INSERT INTO r_mode_arsip VALUES
(1, 'Musnah'),
(2, 'Permanen');
---}}}

---{{{ r_berkas_klas: insert new data
COPY r_berkas_klas(id, unit_kerja_id, kode, nama, keterangan, jra_aktif, jra_inaktif, mode_arsip_id)
	FROM stdin WITH DELIMITER ';';
1;1;HT.01.01;Surat Keputusan Direksi;Naskah-naskah yang berkaitan dengan proses penyusunan dan penerbitan Surat Keputusan Direksi.;3;10;1
2;1;HT.01.02;Surat Edaran Direksi;Naskah - naskah yang berkaitan dengan proses penyusunan dan penerbitan Surat Edaran.;3;10;1
3;1;HT.01.03;Surat Perintah Direksi;Naskah-naskah yang berkaitan dengan proses penerbitan Surat Perintah Direksi.;3;10;1
4;1;HT.01.04;Kerjasama;Naskah-naskah yang berkaitan dengan Kesepakatan, Perjanjian Kerjasama antara Direktur Utama/Direksi/Pejabat yang mendapat kuasa Direksi  dengan Pihak Ketiga.;3;10;1
5;2;DIRUT.01;Rapat;;3;10;2
6;2;DIRUT.01.01;Rapat Intern;;3;10;2
7;2;DIRUT.01.02;Rapat Ekstern;;3;10;2
8;2;DIRUT.02;Pembinaan;;3;10;2
9;2;DIRUT.02.01;Pembinaan Ke Unit-unit Operasional;;3;10;2
10;2;DIRUT.03;Berita Acara Serah Terima Jabatan;;3;10;1
11;2;DIRUT.03.01;Berita Acara Serah Terima Jabatan;;3;10;1
12;2;DIRUT.04;Ijin;;3;10;1
13;2;DIRUT.04.01;Naskah-naskah yang berkaitan dengan ijin Direktur Utama kepada Pemegang Saham Pengendali atau Dewan Komisaris;;3;10;1
14;2;DIRUT.05;Lain-lain;;3;10;1
15;2;DIRUT.05.01;Naskah-naskah yang berkaitan dengan kegiatan/aktivitas Direktur Utama di lembaga ekstern;;3;10;1
16;2;DIRUT.14;Undangan;;3;10;2
17;2;DIRUT.14.01;Undangan Intern;Naskah-naskah yang berkaitan dengan undangan dari Direktur Utama untuk pihak intern Bank Jateng.;3;10;2
18;2;DIRUT.14.02;Undangan Ekstern;;3;10;2
19;2;DIRUT.15;Laporan;;3;10;2
20;2;DIRUT.15.01;Laporan Berkala;Naskah-naskah yang berkaitan dengan laporan dari tahap persiapan, pelaksanaan, hingga pembuatan laporan secara berkala (harian, mingguan, dua mingguan, bulanan, triwulan, semesteran, tahunan).;3;10;2
21;2;DIRUT.15.02;Laporan Insidentil ;Naskah-naskah yang berkaitan dengan laporan Direktur Utama mulai dari tahap persiapan, pelaksanaan hingga pembuatan laporan secara insidentil.;3;10;2
22;3;DIRUM.01;Rapat;;3;10;2
23;3;DIRUM.01.01;Rapat Intern;Naskah-naskah yang berkaitan dengan rapat Direktur Umum dengan pihak intern dalam membahas kasus-kasus tertentu atau rapat rutin dari tahap persiapan, pelaksanaan, pembuatan notulen hasil rapat.;3;10;2
24;3;DIRUM.01.02;Rapat Ekstern;Naskah-naskah yang berkaitan dengan rapat Direktur Umum dengan pihak ekstern mulai dari tahap persiapan, pelaksanaan sampai pembuatan notulen hasil rapat.;3;10;2
25;3;DIRUM.02;Pembinaan;;3;10;2
26;3;DIRUM.02.01;Pembinaan Ke Unit-unit Operasional;Naskah-naskah yang berkaitan dengan surat pembinaan Direktur Umum ke Unit-unit operasional berkaitan dengan evaluasi kinerja, pencapaian target dll.;3;10;2
27;3;DIRUM.03;Berita Acara Serah Terima Jabatan;;3;10;1
28;3;DIRUM.03.01;Berita Acara Serah Terima Jabatan;Naskah-naskah yang berkaitan dengan Berita Acara Serah Terima Jabatan dalam hal Direktur Umum melaksanakan perjalanan dinas lebih dari 3 (tiga) hari.;3;10;1
29;3;DIRUM.04;Ijin;;3;10;1
30;3;DIRUM.04.01;Naskah-naskah yang berkaitan dengan ijin Direktur Umum kepada Direktur Utama atau Dewan Komisaris;Naskah-naskah yang berkaitan dengan surat permohonan ijin dari Direktur Umum kepada Direktur Utama atau Dewan Komisaris.;3;10;1
31;3;DIRUM.05;Lain-lain;;3;10;1
32;3;DIRUM.05.01;Naskah-naskah yang berkaitan dengan kegiatan/aktivitas Direktur Umum di lembaga ekstern;Naskah-naskah yang berkaitan dengan kegiatan / aktivitas Direktur Umum di lembaga ekstern.;3;10;1
33;3;DIRUM.14;Undangan;;3;10;2
34;3;DIRUM.14.01;Undangan Intern;Naskah-naskah yang berkaitan dengan undangan dari Direktur Umum kepada pihak intern.;3;10;2
35;3;DIRUM.14.02;Undangan Ekstern;Naskah-naskah yang berkaitan dengan undangan dari Direktur Umum kepada pihak ekstern.;3;10;2
36;3;DIRUM.15;Laporan;;3;10;2
37;3;DIRUM.15.01;Laporan Berkala;Naskah-naskah yang berkaitan dengan laporan dari tahap persiapan, pelaksanaan hingga pembuatan laporan secara berkala (harian, mingguan, dua mingguan, bulanan, triwulanan, semesteran dan tahunan).;3;10;2
38;3;DIRUM.15.02;Laporan Insidentil;Naskah-naskah yang berkaitan dengan laporan dari tahap persiapan, pelaksanaan, pembuatan laporan secara insidentil.;3;10;2
39;4;DIRUS.01;Rapat;;3;10;2
40;4;DIRUS.01.01;Rapat Intern;Naskah-naskah yang berkaitan dengan rapat Direktur Pemasaran dengan pihak intern dalam membahas kasus-kasus tertentu atau rapat rutin dari tahap persiapan, pelaksanaan sampai notulen hasil rapat. ;3;10;2
41;4;DIRUS.01.02;Rapat Ekstern;Naskah-naskah yang berkaitan dengan rapat Direktur Unit Usaha Syariah dengan pihak ekstern mulai dari tahap persiapan, pelaksanaan sampai notulen hasil rapat;3;10;2
42;4;DIRUS.02;Pembinaan;;3;10;2
43;4;DIRUS.02.01;Pembinaan Ke Unit-unit Operasional;Naskah-naskah yang berkaitan surat pembinaan Direktur Unit Usaha Syariah ke unit-unit operasional, berkaitan dengan evaluasi kinerja, pencapaian target, dll.;3;10;2
44;4;DIRUS.03;Berita Acara Serah Terima Jabatan;;3;10;1
45;4;DIRUS.03.01;Berita Acara Serah Terima Jabatan;Naskah-naskah yang berkaitan dengan Berita Acara Serah Terima Jabatan dalam hal Direktur Usaha Syariah melaksanakan perjalanan dinas lebih dari 3 (tiga) hari.  ;3;10;1
46;4;DIRUS.04;Ijin;;3;10;1
47;4;DIRUS.04.01;Naskah-naskah yang berkaitan dengan ijin Direktur Usaha Syariah kepada Dirut, Pemegang Saham Pengendali atau Dewan Komisaris;;3;10;1
48;4;DIRUS.05;Lain-lain;;3;10;1
49;4;DIRUS.05.01;Naskah-naskah yang berkaitan dengan kegiatan/aktivitas Direktur Umum di lembaga ekstern;;3;10;1
50;4;DIRUS.06;Kebijakan Direktur Unit Usaha Syariah pada Divisi Syariah;;3;10;1
51;4;DIRUS.06.01;Naskah-naskah yang berkaitan dengan semua kebijakan Direktur Unit Usaha Syariah kepada Divisi Syariah;;3;10;1
52;4;DIRUS.14;Undangan;;3;10;2
53;4;DIRUS.14.01;Undangan Intern;Naskah-naskah yang berkaitan dengan undangan dari Direktur Usaha Syariah untuk pihak intern Bank Jateng.;3;10;2
54;4;DIRUS.14.02;Undangan Ekstern;Naskah-naskah yang berkaitan dengan undangan dari Direktur Unit Usaha Syariah kepada pihak ekstern.;3;10;2
55;4;DIRUS.15;Laporan;;3;10;2
56;4;DIRUS.15.01;Laporan Berkala;Naskah-naskah yang berkaitan dengan laporan dari tahap persiapan, pelaksanaan, hingga pembuatan laporan secara berkala;3;10;2
57;4;DIRUS.15.02;Laporan Insidental;Naskah-naskah yang berkaitan dengan laporan dari tahap persiapan, pelaksanaan, hingga pembuatan laporan secara insidentil.;3;10;2
58;5;DIRSAR.01;Rapat;;3;10;2
59;5;DIRSAR.01.01;Rapat Intern;;3;10;2
60;5;DIRSAR.01.02;Rapat Ekstern;Naskah-naskah yang berkaitan dengan rapat Direktur Pemasaran dengan pihak ekstern mulai dari tahap persiapan, pelaksanaan sampai notulen hasil rapat.;3;10;2
61;5;DIRSAR.02;Pembinaan;;3;10;2
62;5;DIRSAR.02.01;Pembinaan Ke Unit-unit Operasional;;3;10;2
63;5;DIRSAR.03;Berita Acara Serah Terima Jabatan;;3;10;1
64;5;DIRSAR.03.01;Berita Acara Serah Terima Jabatan;Naskah-naskah yang berkaitan dengan Berita Acara Serah Terima Jabatan dalam hal Direktur Pemasaran melaksanakan perjalanan dinas lebih dari 3 (tiga) hari.  ;3;10;1
65;5;DIRSAR.04;Ijin;;3;10;1
66;5;DIRSAR.04.01;Naskah-naskah yang berkaitan dengan ijin Dir.Pemasaran  kepada Dirut, Pemegang Saham Pengendali atau Dewan Komisaris;Naskah-naskah yang  berkaitan dengan ijin Direktur pemasaran kepada Dirut, Pemegang saham Pengendali, atau Dewan Komisaris.;3;10;1
67;5;DIRSAR.05;Lain-lain;;3;10;1
68;5;DIRSAR.05.01;Naskah-naskah yang berkaitan dengan kegiatan/aktivitas Direktur Pemasaran di lembaga ekstern;Naskah-naskah yang berkaitan dengan kegiatan / aktivitas Direktur Pemasaran di lembaga ekstern.;3;10;1
69;5;DIRSAR.14;Undangan;;3;10;2
70;5;DIRSAR.14.01;Undangan Intern;Naskah-naskah yang berkaitan dengan undangan dari Direktur  Pemasaran untuk pihak intern Bank Jateng.;3;10;2
71;5;DIRSAR.14.02;Undangan Ekstern;Naskah-naskah yang berkaitan dengan undangan dari Direktur Pemasaran kepada pihak ekstern Bank Jateng.;3;10;2
72;5;DIRSAR.15;Laporan;;3;10;2
73;5;DIRSAR.15.01;Laporan Berkala;Naskah-naskah yang berkaitan dengan laporan dari tahap persiapan, pelaksanaan, hingga pembuatan laporan secara berkala;3;10;2
74;5;DIRSAR.15.02;Laporan Insidental;Naskah-naskah yang berkaitan dengan laporan dari tahap persiapan, pelaksanaan, hingga pembuatan laporan secara insidentil.;3;10;2
75;6;DIROPS.01;Rapat;;3;10;2
76;6;DIROPS.01.01;Rapat Intern;Naskah-naskah yang berkaitan dengan rapat Direktur Operasional dengan pihak intern dalam membahas kasus-kasus tertentu atau rapat rutin dari tahap persiapan, pelaksanaan, pembuatan notulen hasil rapat. ;3;10;2
77;6;DIROPS.01.02;Rapat Ekstern;Naskah-naskah yang berkaitan dengan rapat Direktur Operasional dengan pihak ekstern mulai dari tahap persiapan, pelaksanaan, pembuatan notulen hasil rapat.;3;10;2
78;6;DIROPS.02;Pembinaan;;3;10;2
79;6;DIROPS.02.01;Pembinaan Direktur Operasional ke Unit-unit Operasional;Naskah-naskah yang berkaitan dengan surat-surat pembinaan dari Direktur Operasional kepada Unit-unit Operasional perihal evaluasi kinerja, Akuntansi, Teknologi Informasi, pencapaian target dll.;3;10;2
80;6;DIROPS.03;Berita Acara Serah Terima Jabatan;;3;10;1
81;6;DIROPS.03.01;Berita Acara Serah Terima Jabatan;Naskah-naskah yang berkaitan dengan Berita Acara Serah Terima Jabatan Direktur Operasional dalam hal Direktur Operasional melaksanakan perjalanan dinas melebihi dari 3 (tiga) hari.;3;10;1
82;6;DIROPS.04;Ijin;;3;10;1
83;6;DIROPS.04.01;Naskah-naskah yang berkaitan dengan ijin Direktur Operasional kepada Dirut, Pemegang Saham Pengendali atau Dewan Komisaris;Naskah-naskah yang berkaitan dengan permohonan ijin dari Direktur Operasional kepada Direktur Utama atau Dewan Komisaris Bank.;3;10;1
84;6;DIROPS.05;Lain-lain;;3;10;1
85;6;DIROPS.05.01;Naskah-naskah yang berkaitan dengan kegiatan/aktivitas Direktur Operasional di lembaga ekstern;Naskah-naskah yang berkaitan dengan kegiatan / aktivitas Direktur Operasional di lembaga ekstern.;3;10;1
86;6;DIROPS.14;Undangan;;3;10;2
87;6;DIROPS.14.01;Undangan Intern;Naskah-naskah yang berkaitan dengan undangan dari Direktur Operasional kepada pihak intern.;3;10;2
88;6;DIROPS.14.02;Undangan Ekstern;Naskah-naskah yang berkaitan dengan undangan dari Direktur Operasional kepada pihak ekstern.;3;10;2
89;6;DIROPS.15;Laporan;;3;10;2
90;6;DIROPS.15.01;Laporan Berkala;Naskah-naskah yang berkaitan dengan laporan dari tahap persiapan, pelaksanaan, pembuatan laporan secara berkala (harian, mingguan, dua mingguan, bulanan, triwulanan, semesteran dan tahunan).;3;10;2
91;6;DIROPS.15.02;Laporan Insidentil;Naskah-naskah yang berkaitan dengan laporan dari tahap persiapan, pelaksanaan hingga pembuatan laporan secara insidentil.;3;10;2
92;7;DIRKEP.01;Rapat;;3;10;2
93;7;DIRKEP.01.01;Rapat Intern;Naskah-naskah yang berkaitan dengan rapat Direktur Kepatuhan dengan pihak Intern dalam membahas kasus-kasus tertentu atau rapat rutin dari tahap persiapan, pelaksanaan, pembuatan notulen hasil rapat. ;3;10;2
94;7;DIRKEP.01.02;Rapat Ekstern;Naskah-naskah yang berkaitan dengan rapat Direktur Kepatuhan dengan pihak ekstern mulai dari tahap persiapan, pelaksanaan, pembuatan notulen hasil rapat,;3;10;2
95;7;DIRKEP.02;Pembinaan;;3;10;2
96;7;DIRKEP.02.01;Pembinaan ke Unit-unit Operasional;Naskah-naskah yang berkaitan dengan penyampaian hasil ranking DPK, Kepatuhan terhadap ketentuan dll. ke Unit-unit operasional.;3;10;2
97;7;DIRKEP.03;Berita Acara Serah Terima Jabatan;;3;10;1
98;7;DIRKEP.03.01;Berita Acara Serah Terima Jabatan;Naskah-naskah yang berkaitan dengan Berita Acara Serah Terima Jabatan Direktur Kepatuhan dalam hal Direktur Kepatuhan melaksanakan perjalanan dinas melebihi dari 7 (tujuh) hari.;3;10;1
99;7;DIRKEP.04;Ijin;;3;10;1
100;7;DIRKEP.04.01;Naskah-naskah yang berkaitan dengan ijin Direktur Kepatuhan kepada Dirut, Pemegang Saham Pengendali atau Dewan Komisaris;Naskah-naskah yang berkaitan dengan permohonan ijin dari Direktur Kepatuhan kepada Direktur Utama atau Dewan Komisaris Bank.;3;10;1
101;7;DIRKEP.05;Lain-lain;;3;10;1
102;7;DIRKEP.05.01;Naskah-naskah yang berkaitan dengan kegiatan/aktivitas Direktur Kepatuhan di lembaga ekstern;Naskah-naskah yang berkaitan dengan kegiatan / aktivitas Direktur Kepatuhan di lembaga ekstern.;3;10;1
103;7;DIRKEP.14;Undangan;;3;10;2
104;7;DIRKEP.14.01;Undangan Intern;Naskah-naskah yang berkaitan dengan undangan dari Direktur Kepatuhan kepada pihak intern.;3;10;2
105;7;DIRKEP.14.02;Undangan Ekstern;Naskah-naskah yang berkaitan dengan undangan dari Direktur Kepatuhan kepada pihak ekstern.;3;10;2
106;7;DIRKEP.15;Laporan;;3;10;2
107;7;DIRKEP.15.01;Laporan Berkala;Naskah-naskah yang berkaitan dengan laporan dari tahap persiapan, pelaksanaan, pembuatan laporan ke Direktur Utama dan Dewan Komisaris secara berkala (harian, mingguan, dua mingguan, bulanan, triwulanan, semesteran, tahunan).;3;10;2
108;7;DIRKEP.15.02;Laporan Insidentil;Naskah-naskah yang berkaitan dengan laporan dari tahap persiapan,pelaksanaan, pembuatan laporan ke KPK, PPATK dll. Secara insidentil.;3;10;2
109;8;SEKPER.01;TIM HUKUM DAN REGULASI;;0;0;1
110;8;SEKPER.01.01;Perjanjian;;5;5;1
111;8;SEKPER.01.02;Perijinan;;5;5;1
112;8;SEKPER.01.03;Penyelesaian Kasus Hukum;;5;5;1
113;8;SEKPER.01.10;Surat Intern;;2;2;2
114;8;SEKPER.01.11;Surat Ekstern;;2;2;2
115;8;SEKPER.02;TIM HUMAS;;0;0;1
116;8;SEKPER.02.01;Kunjungan;;5;5;2
117;8;SEKPER.02.02;Jumpa Media Masa;;5;5;2
118;8;SEKPER.02.03;Kliping;;5;5;2
119;8;SEKPER.02.04;Sponsor;;5;5;2
120;8;SEKPER.02.05;Pengaduan Nasabah;;5;5;2
121;8;SEKPER.02.06;Pengelolaan Website;;5;5;2
122;8;SEKPER.02.10;Surat Intern;;2;2;2
123;8;SEKPER.02.11;Surat Ekstern;;2;2;2
124;8;SEKPER.03;SUB DIVISI SEKRETARIAT DAN PROTOKOLER;;0;0;1
125;8;SEKPER.03.01;Pengurusan Naskah;;2;2;2
126;8;SEKPER.03.02;Protokoler;;2;2;2
127;8;SEKPER.03.10;Surat Intern;;2;2;2
128;8;SEKPER.03.11;Surat Ekstern;;2;2;2
129;9;PRC.01;SUB DIVISI PERENCANAAN;;0;0;1
130;9;PRC.01.01;Rencana Bisnis Bank dan Evaluasi;;3;12;2
131;9;PRC.01.01.A;- Dokumen Usulan Penyusunan RBB;;3;12;2
132;9;PRC.01.01.B;- Dokumen Penyelenggaraan Rapat;;3;12;2
133;9;PRC.01.01.C;- Dokumen Rencana Bisnis Bank ;;3;12;2
134;9;PRC.01.01.D;- Dokumen Rencana Kerja Fungsional (RKF) ;;2;12;2
135;9;PRC.01.02;Anggaran;;3;12;2
136;9;PRC.01.02.A;- Dokumen Penyusunan Breakdown Anggaran Tahunan;;3;12;2
137;9;PRC.01.02.B;- Statistik (Bulanan/Triwulanan);;2;12;2
138;9;PRC.01.02.C;- Laporan Realisasi Rencana Bisnis Bank ke OJK (Triwulanan) ;;3;12;2
139;9;PRC.01.03;Monitoring;;3;12;2
140;9;PRC.01.03.A;- Dokumen Evaluasi Program Kerja Fungsi (Bulanan);;3;12;2
141;9;PRC.01.03.B;- Dokumen permohonan ijin pelampauan biaya dari Kantor Cabang / Kantor Cabang Pembantu;;1;12;2
142;9;PRC.01.03.C;- Dokumen Rencana Kerja Operasional (RKO) dari Kantor Cabang/ Kantor Cabang Pembantu;;1;12;2
143;9;PRC.01.04;Lain-lain;;3;12;1
144;9;PRC.01.04.A;- Dokumen Rapat Umum Pemegang Saham;;10;12;1
145;9;PRC.01.04.B;- Dokumen/Surat dari Dewan Komisaris dan Direksi;;3;12;1
146;9;PRC.01.04.C;- Dokumen Group Dinamis dan Chief Ekonomist Bank Jateng;;2;12;1
147;9;PRC.01.04.D;- Dokumen/Surat dari Divisi/Fungsi lain di Kantor Pusat (Internal);;1;12;1
148;9;PRC.01.04.E;- Dokumen/Surat Eksternal (OJK, ASBANDA, BI dll);;2;12;1
149;9;PRC.02;TIM RISET DAN PENGEMBANGAN KORPORASI;;0;0;1
150;9;PRC.02.01;Penelitian dan Pengembangan;;10;12;1
151;9;PRC.02.02;Jaringan Kantor;;10;12;1
152;9;PRC.02.02.A;- Dokumen – dokumen yang berkaitan dengan penataan dan pengembangan (Pembukaan/Pemindahan Alamat/Penutupan) Jaringan Kantor / Layanan (Kantor Cabang/KCP/KK/PP/ATM/Mobkas/EDC dsb) ;;10;12;1
153;9;PRC.02.02.B;- Dokumen surat usulan / data kuesioner potensi penataan dan pengembangan jaringan kantor dari Cabang.;;10;12;1
154;9;PRC.02.02.C;- Dokumen studi kelayakan;;10;12;1
155;9;PRC.02.02.D;- Dokumen usulan Direksi;;10;12;1
156;9;PRC.02.02.E;- Dokumen permohonan ijin kepada Bank Indonesia / OJK.;;10;12;1
157;9;PRC.02.02.F;- Dokumen surat perijinan / penegasan dari Bank Indonesia / OJK.;;10;12;1
158;9;PRC.02.03;Kerjasama Penelitian dan Praktek Kerja Lapangan;;10;12;1
159;9;PRC.02.03.A;- Dokumen – dokumen yang berkaitan dengan penelitiaan ataupun praktek kerja lapangan yang di lakukan di Bank Jateng oleh pihak luar dalam rangka keprntingan dunia pendidikan dan pengembangan Bank.;;10;12;1
160;9;PRC.02.03.B;- Dokumen perjanjian kerjasama (MoU) ttg pelaksanaan penelitian / praktek kerja lapangan.;;10;12;1
161;9;PRC.02.03.C;- Dokumen surat permohonan ijin penelitian / praktek kerja lapangan dari pihak luar.;;1;1;2
162;9;PRC.02.03.D;- Dokumen usulan ijin prinsip pelaksanaan penelitian / praktek kerja lapangan kepada Direksi;;1;1;2
163;9;PRC.02.03.E;- Dokumen hasil penelitian / laporan pelaksanaan praktek kerja lapangan yang telah dilaksanakan.;;1;1;2
164;9;PRC.02.03.F;- Dokumen Rencana Bisnis Bank;;1;2;1
165;9;PRC.02.03.G;- Dokumen Statistik Keuangan / Daerah;;1;2;1
166;9;PRC.02.03.H;- Laporan – laporan ;;10;12;1
167;9;PRC.03;TIM PENGEMBANGAN USAHA DAN PEMBINAAN CABANG ;;0;0;1
168;9;PRC.03.01;Pembinaan Cabang dan Anak Perusahaan;;2;2;2
169;9;PRC.03.01.A;- Dokumen Monitoring dan Pembinaan Cabang;;2;2;2
170;9;PRC.03.01.B;- Dokumen Monitoring dan Pengembangan Anak Perusahaan;;2;2;2
171;9;PRC.03.02;Modal Saham;;2;12;1
172;9;PRC.03.02.A;- Dokumen monitoring/surat menyurat terkait Modal Saham;;2;12;1
173;9;PRC.03.02.B;- Surat Kolektif Saham (Recipies Saham);;10;12;1
174;9;PRC.03.03;ORTALA;;2;12;1
175;9;PRC.04;ADMIN DIVISI PERENCANAAN;;0;0;1
176;9;PRC.04.01;- Undangan;;1;12;2
177;9;PRC.04.02;- Surat Perintah Perjalanan Dinas;;1;12;2
178;9;PRC.04.03;- Surat Ijin;;1;12;2
179;9;PRC.04.04;- Surat-surat Internal Bank Jateng;;1;12;2
180;9;PRC.04.05;- Surat-surat Eksernal;;2;12;2
181;9;PRC.04.06;- Surat Keluar Divisi Perencanaan;;3;12;2
182;9;PRC.04.07;- Personal File Kadiv;;10;12;2
183;9;PRC.14;UNDANGAN;;1;1;2
184;9;PRC.14.01;Undangan Intern;;1;1;2
185;9;PRC.14.02;Undangan Ekstern;;1;1;2
186;9;PRC.15;LAPORAN;;2;3;1
187;9;PRC.15.01;Laporan Berkala;;2;3;1
188;9;PRC.15.02;Laporan Insidentil;;2;3;1
189;10;DT.01;SUB DIVISI TREASURY DAN TRADING;;0;0;1
190;10;DT.01.01;Analis Pengelolaan Likuiditas dan Pelaporan;;2;3;2
191;10;DT.01.02;Dealer;;2;3;2
192;10;DT.01.02;Seksi Monitoring dan Pelaporan;;2;3;2
193;10;DT.02;SUB DIVISI SETTLEMENT;;0;0;1
194;10;DT.02.01;Analis Dokumen Antar Bank;;2;3;2
195;10;DT.02.02;Analis Settlement;;2;3;2
196;10;DT.03;SUB DIVISI KEBIJAKAN DANA DAN JASA DALAM NEGERI;;0;0;1
197;10;DT.03.01;Analis Kebijakan Dana;;2;3;2
198;10;DT.03.02;Analis Jasa dan Operasional Layanan;;2;3;2
199;10;DT.03.03;Analis Financial dan APEX Bank;;2;3;2
200;10;DT.03.04;Analis e-Channel;;2;3;2
201;10;DT.03.05;Seksi Card Center;;2;3;2
202;10;DT.03.06;Seksi Rekonsiliasi dan Monitoring;;2;3;2
203;10;DT.04;SUB DIVISI TRANSAKSI LUAR NEGERI;;0;0;1
204;10;DT.04.01;Seksi Pelayanan dan Perdagangan Luar Negeri;;1;3;2
205;10;DT.04.02;Seksi Hubungan Koresponden Luar Negeri;;2;3;2
206;10;DT.04.03;Seksi Administrasi dan Pelaporan;;2;3;2
207;11;PMS.01;SUB DIVISI PENGEMBANGAN PEMASARAN;;3;5;2
208;11;PMS.01.01;PROMOSI;;3;5;2
209;11;PMS.01.01.A;Promosi melalui Surat Kabar;;3;5;2
210;11;PMS.01.01.B;Promosi melalui Televisi;;3;5;2
211;11;PMS.01.01.C;Promosi melalui Radio;;3;5;2
212;11;PMS.01.01.D;Promosi melalui Billboard;;3;5;2
213;11;PMS.01.02;UNDIAN TABUNGAN BIMA;;3;5;2
214;11;PMS.01.02.A;Koordinator Semarang dan Cabang Utama;;3;5;2
215;11;PMS.01.02.B;Koordinator Surakarta;;3;5;2
216;11;PMS.01.02.C;Koordinator Purwokerto;;3;5;2
217;11;PMS.01.02.D;Koordinator Tegal;;3;5;2
218;11;PMS.01.02.E;Koordinator Pati;;3;5;2
219;11;PMS.01.02.F;Koordinator Magelang;;3;5;2
220;11;PMS.01.03;EVALUASI PRODUK dan REDESIGN BROSUR;;3;5;2
221;11;PMS.01.03.A;Produk Tabungan;;3;5;2
222;11;PMS.01.03.B;Produk Giro;;3;5;2
223;11;PMS.01.03.C;Produk Deposito;;3;5;2
224;11;PMS.01.03.D;Produk DPLK;;3;5;2
225;11;PMS.01.04;PELAPORAN DIVISI PEMASARAN;;5;5;1
226;11;PMS.01.04.A;RKF Tahunan;;5;5;1
227;11;PMS.01.04.B;RKF Bulanan;;5;5;1
228;11;PMS.01.04.C;POA;;5;5;1
229;11;PMS.01.05;SURAT MASUK;;3;5;2
230;11;PMS.01.05.A;Seksi Analis Produk;;3;5;2
231;11;PMS.01.05.B;Seksi Perencanaan dan Pengembangan Pemasaran;;3;5;2
232;11;PMS.01.05.C;Seksi Promosi;;3;5;2
233;11;PMS.01.06;SURAT KELUAR;;3;5;2
234;11;PMS.01.06.A;Seksi Analis Produk;;3;5;2
235;11;PMS.01.06.B;Seksi Perencanaan dan Pengembangan Pemasaran;;3;5;2
236;11;PMS.01.06.C;Seksi Promosi;;3;5;2
237;11;PMS.01.07;RAPAT SUBDIV PENGEMBANGAN PEMASARAN;;3;5;2
238;11;PMS.02;TIM PEMASAR;;0;0;1
239;11;PMS.02.01;SOSIALISASI PRODUK / LAYANAN;;3;5;2
240;11;PMS.02.01.A;Wilayah Koordinator Semarang dan Cabang Utama;;3;5;2
241;11;PMS.02.01.A;Surat Masuk;;5;10;2
242;11;PMS.02.01.B;Wilayah Koordinator Surakarta;;3;5;2
243;11;PMS.02.01.B;Surat Keluar;;5;10;2
244;11;PMS.02.01.C;Wilayah Koordinator Purwokerto;;3;5;2
245;11;PMS.02.01.C;Laporan Hasil Investasi;;5;10;2
246;11;PMS.02.01.D;Wilayah Koordinator Tegal;;3;5;2
247;11;PMS.02.01.D;Laporan Safe Deposit Box;;5;10;2
248;11;PMS.02.01.E;Wilayah Koordinator Magelang;;3;5;2
249;11;PMS.02.01.E;Laporan Obligasi;;5;10;2
250;11;PMS.02.01.G;Wilayah Koordinator Pati;;3;5;2
251;11;PMS.02.01.G;Specimen;;5;10;2
252;11;PMS.02.01.G;Daftar Deposito;;5;10;2
253;11;PMS.02.01.G;Penempatan dan Pencairan ke Bank Lain;;5;10;2
254;11;PMS.02.01.G;Rekening Koran DPLK;;5;10;2
255;11;PMS.02.01.G;Custody Mandiri;;5;10;2
256;11;PMS.02.01.G;Laporan OJK Berkala;;5;10;2
257;11;PMS.02.01.G;Laporan Pajak;;5;10;2
258;11;PMS.02.01.G;Laporan Sosialisasi DPLK;;5;10;2
259;11;PMS.02.01.G;Surat Peringatan;;5;10;2
260;11;PMS.02.01.G;Laporan Keuangan;;5;10;2
261;11;PMS.02.01.G;Liabilitas ke OJK;;5;10;2
262;11;PMS.02.01.G;Berkas Audit DPLK;;5;10;2
263;11;PMS.02.01.G;Daftar Tutup Rekening;;5;10;2
264;11;PMS.02.01.G;File SKB;;5;10;2
265;11;PMS.02.02;GATHERING;;3;5;2
266;11;PMS.02.02.A;Wilayah Koordinator Semarang dan Cabang Utama;;3;5;2
267;11;PMS.02.02.B;Wilayah Koordinator Surakarta;;3;5;2
268;11;PMS.02.02.C;Wilayah Koordinator Purwokerto;;3;5;2
269;11;PMS.02.02.D;Wilayah Koordinator Tegal;;3;5;2
270;11;PMS.02.02.E;Wilayah Koordinator Magelang;;3;5;2
271;11;PMS.02.02.F;Wilayah Koordinator Pati;;3;5;2
272;11;PMS.02.03;LITERASI KEUANGAN Dan EDUKASI NASABAH;;3;5;2
273;11;PMS.02.03.A;Wilayah Koordinator Semarang dan Cabang Utama;;3;5;2
274;11;PMS.02.03.A;Wilayah Koordinator Semarang dan Cabang Utama;;3;5;2
275;11;PMS.02.03.B;Wilayah Koordinator Surakarta;;3;5;2
276;11;PMS.02.03.B;Wilayah Koordinator Surakarta;;3;5;2
277;11;PMS.02.03.C;Wilayah Koordinator Purwokerto;;3;5;2
278;11;PMS.02.03.C;Wilayah Koordinator Purwokerto;;3;5;2
279;11;PMS.02.03.D;Wilayah Koordinator Tegal;;3;5;2
280;11;PMS.02.03.D;Wilayah Koordinator Tegal;;3;5;2
281;11;PMS.02.03.E;Wilayah Koordinator Magelang;;3;5;2
282;11;PMS.02.03.E;Wilayah Koordinator Magelang;;3;5;2
283;11;PMS.02.03.F;Wilayah Koordinator Pati;;3;5;2
284;11;PMS.02.03.F;Wilayah Koordinator Pati;;3;5;2
285;11;PMS.02.04;MONITORING GO TO SCHOOL;;3;5;2
286;11;PMS.02.04;RAPAT KOORDINASI TIM PEMASAR ;;3;5;2
287;11;PMS.03;D P L K;;0;0;1
288;11;PMS.03.01;MONITORING KINERJA DPLK;;5;10;2
289;12;KRD.01;TIM ANALIS KREDIT KORPORASI;;0;0;1
290;12;KRD.01.01;KREDIT SINDIKASI;;3;5;2
291;12;KRD.01.01.A;- Info memo dari Arranger;;3;5;2
292;12;KRD.01.01.A;- Berkas info memo;;3;5;2
293;12;KRD.01.01.A;- Laporan Keuangan;;3;5;2
294;12;KRD.01.01.A;- Feasibility Study;;3;5;2
295;12;KRD.01.01.A;- NDA;;3;5;2
296;12;KRD.01.01.A;- Informasi BI;;3;5;2
297;12;KRD.01.01.A;- Analisa Kredit;;3;5;2
298;12;KRD.01.01.A;- Second Opinion dari SKKMR;;3;5;2
299;12;KRD.01.01.A;- Konsultasi Dewan Komisaris;;3;5;2
300;12;KRD.01.01.A;- Persetujuan Kredit dari PPK tertinggi;;3;5;2
301;12;KRD.01.01.A;- Surat Persetujuan ke Arranger;;3;5;2
302;12;KRD.01.01.A;- Perjanjian Kredit;;3;5;2
303;12;KRD.01.01.A;- Korespondensi;;3;5;2
304;12;KRD.01.01.A;- Penarikan Kredit;;3;5;2
305;12;KRD.01.01.A;- Pembayaran Angsuran Pokok dan Bunga Kredit;;3;5;2
306;12;KRD.01.01.A;- Laporan Site Visit;;3;5;2
307;12;KRD.01.01.A;- Progress Proyek;;3;5;2
308;12;KRD.01.01.A;- Laporan Keuangan triwulanan, semeter, dan tahunan setelah kredit;;3;5;2
309;12;KRD.01.02;KREDIT BILATERAL;;3;5;2
310;12;KRD.01.02.A;- Berkas pengajuan kredit;;3;5;2
311;12;KRD.01.02.A;- Laporan Keuangan;;3;5;2
312;12;KRD.01.02.A;- Feasibility Study;;3;5;2
313;12;KRD.01.02.A;- Informasi BI;;3;5;2
314;12;KRD.01.02.A;- Analisa Kredit;;3;5;2
315;12;KRD.01.02.A;- Second Opinion dari SKKMR;;3;5;2
316;12;KRD.01.02.A;- Konsultasi Dewan Komisaris;;3;5;2
317;12;KRD.01.02.A;- Persetujuan Kredit dari PPK tertinggi;;3;5;2
318;12;KRD.01.02.A;- Surat Persetujuan ke Kantor Cabang;;3;5;2
319;12;KRD.01.02.A;- Laporan Realisasi dari Kantor Cabang;;3;5;2
320;12;KRD.01.02.A;- Penarikan Kredit;;3;5;2
321;12;KRD.01.03;PENOLAKAN KREDIT;;3;5;2
322;12;KRD.01.03.A;- Analisa kredit;;3;5;2
323;12;KRD.01.03.A;- Surat Pemberitahuan ke Kantor Cabang;;3;5;2
324;12;KRD.02;TIM ANALIS KREDIT RITEL DAN KONSUMER;;0;0;1
325;12;KRD.02.01;REVIEW KREDIT RETAIL dan KONSUMER;;3;5;2
326;12;KRD.02.01.A;- Berkas Pengajuan;;3;5;2
327;12;KRD.02.01.A;- Analisa Kredit/Hasil Review;;3;5;2
328;12;KRD.02.01.A;- Persetujuan Kantor Pusat;;3;5;2
329;12;KRD.02.01.A;- Laporan Realisasi Kredit;;3;5;2
330;12;KRD.02.02;LAPORAN MONITORING KREDIT;;3;5;2
331;12;KRD.02.02.A;- Hasil Monitoring Kredit Cabang;;3;5;2
332;12;KRD.02.02.A;- Analisa Moitoring;;3;5;2
333;12;KRD.02.02.A;- Laporan Keuangan;;3;5;2
334;12;KRD.02.03;SURAT KE CABANG;;3;5;2
335;12;KRD.02.04;SURAT ANTAR DIVISI;;3;5;2
336;12;KRD.02.05;SURAT EKSTERNAL;;3;5;2
337;12;KRD.03;SUB DIVISI KEBIJAKAN KREDIT;;0;0;1
338;12;KRD.03.01;KEBIJAKAN KREDIT;;10;10;2
339;12;KRD.03.01.A;Kebijakan Perkreditan;;10;10;2
340;12;KRD.03.01.B;Peraturan Pemerintah dan Bank Indonesia (OJK);;10;10;2
341;12;KRD.03.01.C;Draft SK ke Direksi;;10;10;2
342;12;KRD.03.01.D;Usulan Kebijakan Kredit;;10;10;2
343;12;KRD.03.01.E;Bank Garansi /Transaksi Luar Negeri;;10;10;2
344;12;KRD.03.01.F;Perjanjian Kerjasama Asuransi;;10;10;2
345;12;KRD.03.01.G;Perjanjian Kerjasama KJPP;;10;10;2
346;12;KRD.03.01.H;Surat Ke Cabang;;10;10;2
347;12;KRD.03.01.I;Surat Ke Komisaris;;10;10;2
348;12;KRD.03.01.J;Surat Antar Divisi;;10;10;2
349;12;KRD.03.01.K;Laporan Tingkat Kesehatan Bank;;10;10;2
350;12;KRD.03.01.L;Laporan BMPK;;10;10;2
351;12;KRD.03.01.M;Laporan Rencana dan Realisasi Kredit;;10;10;2
352;12;KRD.03.01.N;Laporan Roadshow;;10;10;2
353;12;KRD.03.01.O;Survei Kredit Perbankan Indonesia;;10;10;2
354;12;KRD.03.01.P;LHP dan Bukti Peyelesaian;;10;10;2
355;12;KRD.03.01.Q;Notulen Rapat;;10;10;2
356;12;KRD.03.01.R;Materi Pelatihan;;10;10;2
357;12;KRD.03.02;ADMINISTRASI dan PELAPORAN KREDIT;;10;10;2
358;12;KRD.03.02.A;Laporan ATMR;;10;10;2
359;12;KRD.03.02.B;Laporan LHBU;;10;10;2
360;12;KRD.03.02.C;Laporan GCG;;10;10;2
361;12;KRD.03.03;LAIN-LAIN;;10;10;2
362;12;KRD.04;SUB DIVISI LAYANAN MIKRO DAN KREDIT PROGRAM;;0;0;1
363;12;KRD.04.01;KEBIJAKAN KREDIT PROGRAM;;3;5;2
364;12;KRD.04.01.A;Perjanjian Kerjasama Eksternal;;3;5;2
365;12;KRD.04.01.B;KUR;;3;5;2
366;12;KRD.04.01.C;KKPE;;3;5;2
367;12;KRD.04.01.D;KUPS;;3;5;2
368;12;KRD.04.01.E;KUMK;;3;5;2
369;12;KRD.04.01.F;KARSA;;3;5;2
370;12;KRD.04.01.G;PUNDI;;3;5;2
371;12;KRD.04.01.H;TABUR PUJA;;3;5;2
372;12;KRD.04.01.I;RESI GUDANG;;3;5;2
373;12;KRD.04.02;TIM LAYANAN MIKRO;;3;5;2
374;12;KRD.04.02.A;Perjanjian Kerjasama;;3;5;2
375;12;KRD.04.02.B;Laporan Monitoring;;3;5;2
376;12;KRD.04.02.C;KMJS;;3;5;2
377;12;KRD.04.02.D;MICRO BANKING;;3;5;2
378;12;KRD.04.03;ADMINISTRASI dan PELAPORAN;;3;5;2
379;12;KRD.04.03.A;FLPP;;3;5;2
380;12;KRD.04.03.B;KKPE;;3;5;2
381;12;KRD.04.03.C;KUPS;;3;5;2
382;12;KRD.04.03.D;YAYASAN DAKAB;;3;5;2
383;12;KRD.04.03.E;LINKAGE PROGRAM;;3;5;2
384;12;KRD.04.03.F;SAPD PUNDI;;3;5;2
385;12;KRD.04.03.G;IEPC I;;3;5;2
386;12;KRD.04.03.H;KUMK;;3;5;2
387;12;KRD.04.03.I;KPKM CHANELLING;;3;5;2
388;12;KRD.04.03.J;KUAUBP;;3;5;2
389;12;KRD.04.03.K;KUT 1988/1999;;3;5;2
390;12;KRD.04.03.L;KUK DAS;;3;5;2
391;12;KRD.04.03.M;KUHR;;3;5;2
392;12;KRD.04.03.N;KUPA;;3;5;2
393;12;KRD.04.04;KEMITRAAN;;3;5;2
394;12;KRD.05;KESEKRETARIATAN;;0;0;1
395;12;KRD.05.01;Pengumuman;;1;1;2
396;12;KRD.05.02;Undangan;;1;1;2
397;12;KRD.05.03;Ijin dan SPPD;;1;1;2
398;12;KRD.05.04;Lain-lain;;1;1;2
399;13;SYAR.01;SUB DIVISI UMUM SYARIAH (USD);;0;0;1
400;13;SYAR.01.01;Surat masuk (internal Kanpus);;5;10;2
401;13;SYAR.01.02;Surat keluar (internal Kanpus);;5;10;2
402;13;SYAR.01.03;Surat masuk (Bank Jateng);;5;10;2
403;13;SYAR.01.04;Surat keluar (Bank Jateng);;5;10;2
404;13;SYAR.01.05;Surat masuk (selain Bank Jateng);;5;10;2
405;13;SYAR.01.06;Surat keluar (selain Bank Jateng);;5;10;2
406;13;SYAR.01.07;Dokumen pembukaan KCS baru;;5;10;2
407;13;SYAR.01.08;Persetujuan Biaya KCS/KCPS;;5;10;2
408;13;SYAR.01.09;Undangan masuk;;5;10;2
409;13;SYAR.01.10;Undangan keluar;;5;10;2
410;13;SYAR.01.11;RKBU dan RAB;;5;10;2
411;13;SYAR.01.12;Pengadaan barang ;;5;10;2
412;13;SYAR.01.13;Usulan pegadaan barang cetakan;;5;10;2
413;13;SYAR.01.14;Permohonan Cetakan;;5;10;2
414;13;SYAR.01.15;Iuran DSN MUI;;5;10;2
415;13;SYAR.01.16;Konsumsi;;5;10;2
416;13;SYAR.01.17;ATK;;5;10;2
417;13;SYAR.01.18;Dokumen kegiatan;;5;10;2
418;13;SYAR.01.19;Diklat/Seminar/Workshop/Sosialisasi;;5;10;2
419;13;SYAR.01.20;SMK;;5;10;2
420;13;SYAR.01.21;SK/SP Pegawai;;5;10;2
421;13;SYAR.01.22;Data Pegawai;;5;10;2
422;13;SYAR.01.23;SP Temporer;;5;10;2
423;13;SYAR.01.24;SP Perjalanan Dinas;;5;10;2
424;13;SYAR.01.25;Cuti/ijin pegawai;;5;10;2
425;13;SYAR.01.26;Surat masuk;;5;10;2
426;13;SYAR.01.27;Surat keluar;;5;10;2
427;13;SYAR.01.28;RTGS keluar;;5;10;2
428;13;SYAR.01.29;Ekspedisi nota CN/DN;;5;10;2
429;13;SYAR.01.30;Ekspedisi RTGS keluar;;5;10;2
430;13;SYAR.01.31;Serah terima token;;5;10;2
431;13;SYAR.01.32;Surat ke BI;;5;10;2
432;13;SYAR.01.33;LHBU;;5;10;2
433;13;SYAR.01.34;Rekonsiliasi transaksi;;5;10;2
434;13;SYAR.01.35;Laporan kontraktual;;5;10;2
435;13;SYAR.01.36;Neraca;;5;10;2
436;13;SYAR.01.37;Nota / warkat mutasi harian;;5;10;2
437;13;SYAR.01.38;Laporan operasional;;5;10;2
438;13;SYAR.01.39;LBBU mingguan;;5;10;2
439;13;SYAR.01.40;Laporan Posisi Simpanan;;5;10;2
440;13;SYAR.01.41;LBBU mingguan;;5;10;2
441;13;SYAR.01.42;Bagi hasil;;5;10;2
442;13;SYAR.01.43;Laporan DPK Cabang;;5;10;2
443;13;SYAR.01.44;Neraca / PBL bulanan;;5;10;2
444;13;SYAR.01.45;XBRL;;5;10;2
445;13;SYAR.01.46;APMK LKBU;;5;10;2
446;13;SYAR.01.47;ATMR KPMM;;5;10;2
447;13;SYAR.01.48;Laporan pubikasi;;5;10;2
448;13;SYAR.02;SUB DIVISI BISNIS SYARIAH;;0;0;1
449;13;SYAR.02.01;MOU kerjasama dengan mitra kerja;;5;10;2
450;13;SYAR.02.02;Usulan SK dan SE Direksi;;5;10;2
451;13;SYAR.02.03;Berkas pembiayaan perorangan;;5;10;2
452;13;SYAR.02.04;Berkas pembiayaan sindikasi;;5;10;2
453;13;SYAR.02.05;PKS Asuransi;;5;10;2
454;13;SYAR.02.06;Gadai;;5;10;2
455;13;SYAR.02.07;Surat menyurat;;5;10;2
456;13;SYAR.02.08;Pengendali likuiditas;;5;10;2
457;13;SYAR.02.09;GWM;;5;10;2
458;13;SYAR.02.10;Penempatan;;5;10;2
459;13;SYAR.02.11;Pinjaman;;5;10;2
460;13;SYAR.02.12;MML;;5;10;2
461;13;SYAR.02.13;Penghapusbukuan Pembiayaan;;5;10;2
462;13;SYAR.02.14;Laporan berkala;;5;10;2
463;13;SYAR.02.15;Pembiayaan bermasalah;;5;10;2
464;13;SYAR.02.16;Laporan Profil Risiko;;5;10;2
465;13;SYAR.02.17;Laporan TKB;;5;10;2
466;13;SYAR.02.18;Laporan GCG;;5;10;2
467;13;SYAR.02.19;Data temuan OJK dan BPK;;5;10;2
468;13;SYAR.03;PERENCANAAN DAN PENGEMBANGAN BISNIS SYARIAH;;0;0;1
469;13;SYAR.03.01;Jaringan kantor;;5;10;2
470;13;SYAR.03.02;Lap. Rencana bisnis bulanan, triwulanan;;5;10;2
471;13;SYAR.03.03;ATM;;5;10;2
472;13;SYAR.03.04;Rencana Bisnis Bank;;5;10;2
473;13;SYAR.03.05;Produk;;5;10;2
474;13;SYAR.03.06;Surat masuk;;5;10;2
475;13;SYAR.03.07;Surat keluar;;5;10;2
476;13;SYAR.03.08;PKS Kemenag RI;;5;10;2
477;13;SYAR.03.09;Laporan SISKOHAT;;5;10;2
478;13;SYAR.03.10;FK BPS BPIH;;5;10;2
479;13;SYAR.03.11;Asuransi Tabung Haji;;5;10;2
480;13;SYAR.03.12;Promosi media cetak;;5;10;2
481;13;SYAR.03.13;Promosi media elektronik;;5;10;2
482;13;SYAR.03.14;Promosi outdoor (aliho);;5;10;2
483;13;SYAR.03.15;Promosi kegiatan (sponsorship);;5;10;2
484;13;SYAR.03.16;Promosi undian tabungan;;5;10;2
485;13;SYAR.03.17;Pemeriksaan sampel akad ;;5;10;2
486;13;SYAR.03.18;Laporan semesteran;;5;10;2
487;13;SYAR.03.19;Rekomendasi;;5;10;2
488;13;SYAR.03.20;Notulen rapat;;5;10;2
489;13;SYAR.03.21;Balasan atas tindak lanjut rekomendasi ;;5;10;2
490;13;SYAR.03.22;Pemberhentian dan Pengangkatan DPS;;5;10;2
491;13;SYAR.03.23;Pelatihan/seminar/workshop;;5;10;2
492;13;SYAR.03.24;Data Pribadi;;5;10;2
493;13;SYAR.03.25;Remunerasi;;5;10;2
494;13;SYAR.03.26;Iuran Ketua DPS ;;5;10;2
495;13;SYAR.03.27;SK Direksi terkait DPS;;5;10;2
496;13;SYAR.03.28;Kumpulan Fatwa DSN - MUI;;5;10;2
497;13;SYAR.03.29;Surat Masuk;;5;10;2
498;13;SYAR.03.30;Surat Keluar;;5;10;2
499;13;SYAR.04;CABANG SYARIAH;;0;0;1
500;13;SYAR.04.01;Naskah-naskah yang berkaitan dengan Pelayanan;;5;10;2
501;13;SYAR.04.02;Naskah-naskah yang berkaitan dengan Pembiayaan;;5;10;2
502;13;SYAR.04.03;Naskah-naskah yang berkaitan dengan Umum dan SDM;;5;10;2
503;13;SYAR.04.04;Naskah-naskah yang berkaitan dengan Akuntansi dan TI;;5;10;2
504;13;SYAR.04.05;Naskah-naskah yang berkaitan dengan Admin dan Pengawasan Pembiayaan;;5;10;2
505;13;SYAR.04.06;Naskah-naskah yang berkaitan dengan Pemasaran;;5;10;2
506;14;UM.01;SUB DIVISI RUMAH TANGGA DAN LOGISTIK;;0;0;1
507;14;UM.01.01;Sewa Menyewa;Naskah-naskah yang berkaitan dengan sewa-menyewa gedung dan sarana serta prasarana baik milik Bank Jateng ataupun sebaliknya.;3;5;2
508;14;UM.01.02;Sponsor;Naskah-naskah yang berkaitan dengan kegiatan promosi Bank Jateng untuk melaksanakan kegiatan diluar kegiatan promosi yang ditangani oleh Divisi Pemasaran dan Sekretaris Perusahaan.;2;5;2
509;14;UM.01.03;Keamanan;Naskah-naskah yang berkaitan dengan kegiatan keamanan, misalnya : Satpam, permintaan pengamanan polisi, dll.;2;5;2
510;14;UM.01.04;Rekreasi;Naskah - naskah yang berkaitan dengan kegiatan rekreasi dari pengajuan sampai dengan pelaporan.;2;5;2
511;14;UM.01.05;Barang Habis Pakai;Naskah-naskah yang berkaitan dengan pengadaan barang-barang habis pakai (misalnya a.l. : barang cetak, alat tulis, perabot kantor) dari proses awal, pembelian sampai pertanggung-jawabannya.;3;2;2
512;14;UM.01.06;Barang Inventaris;Naskah-naskah yang berkaitan dengan pengadaan Aktiva Tetap dan barang inventaris dari awal berupa penawaran harga, pembelian dan pertanggung-jawabannya.;3;2;2
513;14;UM.02;SUB DIVISI PENGELOLAAN INVENTARIS DAN AKTIVA TETAP;;0;0;1
514;14;UM.02.01;Pengelolaan Barang Habis Pakai;Naskah-naskah yang berkaitan dengan kegiatan distribusi dan mutasi barang habis pakai kepada unit-unit kerja yang membutuhkan.;3;2;2
515;14;UM.02.02;Pengelolaan Barang Inventaris;Naskah-naskah yang berkaitan dengan kegiatan distribusi dan mutasi barang inventaris kepada unit-unit kerja yang membutuhkan.;3;5;2
516;14;UM.02.03;Pemeliharaan Gedung;Naskah-naskah yang berkaitan dengan kegiatan pemeliharaan gedung yang dimiliki oleh Bank Jateng baik Pusat maupun Cabang.;3;5;2
517;14;UM.02.04;Pemeliharaan Sarana dan Prasarana;Naskah-naskah yang berkaitan dengan kegiatan pemeliharaan sarana dan prasarana seperti perabot kantor, mesin dan kendaraan.;3;2;2
518;14;UM.02.05;Asuransi Gedung, Sarana dan Prasarana;Naskah-naskah yang berkaitan dengan penutupan pertanggungan dan klaim asuransi gedung, sarana dan prasarana.;2;3;2
519;14;UM.02.06;Penghapusan Barang Inventaris;Naskah-naskah yang berkaitan dengan proses penghapusan barang inventaris yang telah habis nilai bukunya.;1;2;2
520;14;UM.02.07;Penjualan Barang Inventaris;;3;5;2
521;14;UM.03;TIM PENGADAAN;;0;0;1
522;14;UM.03.01;Barang Inventaris Tanah bangunan;;3;8;1
523;14;UM.03.02;Barang Inventaris Selain Tanah bangunan;;3;8;2
524;14;UM.07;LAIN-LAIN;;2;5;2
525;14;UM.07.01;Naskah-naskah yang terkait kegiatan-kegiatan di Divisi Umum yang tidak tercover dalam kode klasifikasi surat di Divisi Umum;;2;5;2
526;14;UM.14;UNDANGAN;;2;3;2
527;14;UM.14.01;Undangan Intern;Naskah-naskah yang berkaitan dengan undangan dari Divisi Umum  kepada pihak Intern.;2;3;2
528;14;UM.14.02;Undangan Ekstern;;2;3;2
529;14;UM.15;LAPORAN;;3;5;2
530;14;UM.15.01;Laporan Berkala;;3;5;2
531;14;UM.15.02;Laporan Insidentil;;3;5;2
532;14;UM/ARP.04;SUB DIVISI ARSIP;;0;0;1
533;14;UM/ARP.04.01;Peminjaman Arsip;;2;2;2
534;14;UM/ARP.04.02;Laporan Pemusnahan Arsip;;4;5;2
535;14;UM/ARP.04.03;Arsip Pusat;Naskah-naskah yang berkaitan dengan pengelolaan dan pemeliharaan arsip pusat baik di Pusat Berkas maupun di Pusat Arsip (misalnya Bukti Pinjaman, Bukti Pemindahan, Berita Acara Pemusnahan).;3;3;2
536;14;UM/ARP.04.04;Surat Keluar;;2;2;2
537;14;UM/ARP.04.05;Laporan Monitoring Arsip Cabang;Naskah-naskah yang berkaitan dengan kegiatan pengelolaan dan pemeliharaan kearsipan di lingkungan Kantor Cabang.;2;3;2
538;14;UM/ARP.04.06;Perjanjian Kerjasama dengan Pihak Ketiga;;3;5;1
539;14;UM/ARP.04.07;Lain-lain;;2;3;2
540;15;SDM.01;SUB DIVISI PERENCANAAN DAN PENGEMBANGAN SDM;;0;0;1
541;15;SDM.01.01;Formasi Pegawai;;5;0;2
542;15;SDM.01.02;Pengadaan;;2;2;2
543;15;SDM.01.03;Penyaringan/Seleksi;;1;0;2
544;15;SDM.01.04;Percobaan;;1;1;2
545;15;SDM.01.05;Pengangkatan dan Penempatan Pegawai;;0;0;1
546;15;SDM.01.05;Penilaian Pegawai;;2;1;2
547;15;SDM.01.05;Mutasi, Rotasi, Promosi dan Demosi;;0;0;1
548;15;SDM.01.05;Hubungan Kerja;;3;0;1
549;15;SDM.01.05;Pengecekan Data Karyawan Beserta Keluarga untuk Rekreasi;;2;5;2
550;15;SDM.01.05;Berkas Surat Keputusan dan Surat Perintah;;5;0;2
551;15;SDM.01.05;Perubahan Keluarga;;0;12;2
552;15;SDM.01.05;Perubahan Pendidikan;;0;12;2
553;15;SDM.01.05;Berkas Pegawai yang sudah pensiun, PHK, PDS, Meninggal dunia;;3;0;2
554;15;SDM.01.06;Data Pegawai : Pengelolaan dan Pelaporan data Pegawai;;2;10;2
555;15;SDM.02;SUB DIVISI HUBUNGAN SDM;;0;0;1
556;15;SDM.02.01;Konseling;;3;10;2
557;15;SDM.02.02;Hubungan Industrial;;0;0;1
558;15;SDM.02.04;Gaji;;3;10;2
559;15;SDM.02.05;Pemeliharaan Kesehatan;;2;5;2
560;15;SDM.02.06;Penghargaan;;3;10;2
561;15;SDM.02.07;Pajak;;5;10;2
562;15;SDM.02.08;BPJS Ketenagakerjaan dan BPJS Kesehatan;;5;10;2
563;15;SDM.02.09;Uang Cuti/Cuti;;3;5;2
564;15;SDM.02.10;Lembur;;2;3;2
565;15;SDM.02.11;Uang Makan dan Catering;;2;3;2
566;15;SDM.02.12;Jasa Produksi dan Bonus/Insentif;;5;10;2
567;15;SDM.02.13;Jaminan Hari Tua dan Iuran Pensiun;;5;10;2
568;15;SDM.02.14;Perjalanan Dinas;;3;5;2
569;15;SDM.02.15;Fasilitas Lain (uang pakaian dinas, name tag);;2;1;2
570;15;SDM.02.16;Absensi/Ijin;;2;3;2
571;15;SDM.03;SUB DIVISI PENDIDIKAN DAN PELATIHAN;;0;0;1
572;15;SDM.03.01;Pelatihan In House;;3;5;2
573;15;SDM.03.02;Pelatihan Publish;;3;5;2
574;15;SDM.03.03;Rencana Anggaran Biaya dan Realisasi;;3;5;2
575;15;SDM.03.04;Surat Masuk;;2;5;2
576;15;SDM.03.05;Surat Keluar;;2;5;2
577;15;SDM.03.06;Pemberkasan Legalitas;;3;10;2
578;15;SDM.03.07;Laporan Kegiatan Pelatihan;;3;5;2
579;15;SDM.04;TIM BUDAYA DAN PENGENDALIAN KUALITAS PELAYANAN;;0;0;1
580;15;SDM.04.01;Budaya Perusahaan;;3;5;2
581;15;SDM.04.02;Pengendali Kualitas Pelayanan;;3;5;2
582;15;SDM.14;UNDANGAN;;0;0;1
583;15;SDM.14.01;Undangan Intern;;1;1;2
584;15;SDM.14.02;Undangan Ekstern;;1;1;2
585;15;SDM.15;LAPORAN;;0;0;1
586;15;SDM.15.01;Laporan Berkala;;2;5;2
587;15;SDM.15.01.A;- Harian;;2;5;2
588;15;SDM.15.01.B;- Mingguan;;2;5;2
589;15;SDM.15.01.C;- Bulanan misal LKPBU utk Pejabat Eksekutif (OJK);;2;5;2
590;15;SDM.15.01.D;- Triwulanan;;2;5;2
591;15;SDM.15.01.E;- Semesteran;;2;5;2
592;15;SDM.15.01.F;- Tahunan misal LKPBU utk Ketenagakerjaan (OJK), Disnakertrans;;2;5;2
593;15;SDM.15.02;Laporan Insidentil;;1;1;2
594;16;SKKMR.01;SUB SATUAN KERJA KEPATUHAN ;;0;0;1
595;16;SKKMR.01.01;Bank Indonesia;;5;5;1
596;16;SKKMR.01.02;BPK;;5;5;1
597;16;SKKMR.01.03;Otoritas Pengawas Lainnya;;5;5;1
598;16;SKKMR.01.04;Pembinaan;;5;5;1
599;16;SKKMR.02;TIM ANALIS RISIKO;;0;0;1
600;16;SKKMR.02.01;Pembinaan;;5;5;2
601;16;SKKMR.02.02;Surat Internal;;5;5;2
602;16;SKKMR.02.02;Surat Eksternal;;5;5;2
603;16;SKKMR.03;TIM ANALIS KEBIJAKAN DAN PELAPORAN RISIKO;;0;0;1
604;16;SKKMR.03.01;Pembinaan;;5;5;2
605;16;SKKMR.03.02;Surat Internal;;5;5;2
606;16;SKKMR.03.03;Surat Eksternal;;5;5;2
607;16;SKKMR.14;UNDANGAN;;0;0;2
608;16;SKKMR.14.01;Undangan Internal;;1;1;2
609;16;SKKMR.14.02;Undangan Eksternal;;1;1;2
610;16;SKKMR.15;LAPORAN;;0;0;1
611;16;SKKMR.15.01;Laporan Berkala;;5;5;1
612;16;SKKMR.15.02;Laporan Insidentil;;5;5;1
613;17;SKAI.01;TIM PENGENDALI MUTU AUDIT;;0;0;2
614;17;SKAI.01.01;Kajian Ekstern dan Lain-lain;;5;5;2
615;17;SKAI.01.02;Laporan GKR;;5;5;2
616;17;SKAI.01.09;Lainnya;;5;5;2
617;17;SKAI.02;TIM PEMERIKSA UMUM (TPU);;0;0;2
618;17;SKAI.02.01;Kertas Kerja Audit Umum;;5;5;2
619;17;SKAI.02.02;Kertas Kerja Audit Tujuan Tertentu;;5;5;2
620;17;SKAI.02.03;Laporan Hasil Audit Umum TPU;;5;5;2
621;17;SKAI.02.04;Laporan Hasil Audit Tujuan Tertentu;;5;5;2
622;17;SKAI.02.05;Tindak Lanjut Audit Umum;;5;5;2
623;17;SKAI.02.06;Tindak Lanjut Audit Tujuan Tertentu;;5;5;2
624;17;SKAI.02.07;Aktiftas Off Site KIC;;5;5;2
625;17;SKAI.02.08;Aktifitas Surprise Visit KIC;;5;5;2
626;17;SKAI.03;TIM PEMERIKSA TSI (TPTSI);;0;0;2
627;17;SKAI.03.01;Kertas Kerja Audit TSI;;5;5;2
628;17;SKAI.03.02;Kertas Kerja Audit Tujuan Tertentu TSI;;5;5;2
629;17;SKAI.03.03;Laporan Hasil Audit TSI;;5;5;2
630;17;SKAI.03.04;Laporan Hasil Audit Tujuan Tertentu TSI;;5;5;2
631;17;SKAI.03.05;Tindak Lanjut Audit TSI;;5;5;2
632;17;SKAI.03.06;Tindak Lanjut Audit Tujuan Tertentu TSI;;5;5;2
633;17;SKAI.04;SUB SATUAN KERJA PENGENDALIAN INTERN dan ADM.;;0;0;2
634;17;SKAI.04.01;Rencana Kerja Audit Tahunan (RKAT);;5;5;2
635;17;SKAI.04.02;Laporan Monitoring Tindak Lanjut (Laporan untuk DEKOM);;5;5;2
636;17;SKAI.04.03;Rencana dan Realisasi Program Kerja;;5;5;2
637;17;SKAI.04.04;Laporan Pokok Pokok Audit Intern;;5;5;2
638;17;SKAI.04.05;Tingkat Kesehatan Bank (TKB);;5;5;2
639;17;SKAI.04.06;Pendapat SKAI atas Profil Resiko Bank;;5;5;2
640;17;SKAI.04.07;Data Pegawai SKAI;;5;5;2
641;17;SKAI.04.08;Pendidikan dan Latihan SKAI;;5;5;2
642;17;SKAI.04.09;Kajian Terhadap Ketentuan Intern;;5;5;2
643;17;SKAI.04.10;Audit Bank Indonesia;;5;5;2
644;17;SKAI.04.11;Audit BPK;;5;5;2
645;17;SKAI.04.12;Audit OJK;;5;5;2
646;17;SKAI.04.13;Audit selain OJK, BI, BPK;;5;5;2
647;17;SKAI.04.14;Arsip lainnya terkait hal-hal yang bersifat khusus (Laporan laporan);;5;2;2
648;17;SKAI.04.15;Arsip lainnya (undangan dan lainnya);;2;1;2
649;18;TIAK.01;TIM PERENCANAAN TSI;;0;0;2
650;18;TIAK.01.01;Perencanaan Teknologi System Informasi;;5;7;1
651;18;TIAK.01.02;Undangan Intern;;5;7;2
652;18;TIAK.01.03;Undangan Ekstern;;5;7;2
653;18;TIAK.02;TIM PENGEMBANGAN TSI;;0;0;2
654;18;TIAK.02.01;Pengembangan Teknology System Informasi;;5;7;1
655;18;TIAK.02.02;Impelementasi dan Sosialisasi System Operasional;;5;10;1
656;18;TIAK.02.03;Pembuatan Aplikasi;;5;10;1
657;18;TIAK.02.04;Undangan Intern;;5;7;2
658;18;TIAK.02.05;Undangan Ekstern;;5;7;2
659;18;TIAK.03;SUB DIVISI PELAYANAN TSI;;0;0;2
660;18;TIAK.03.01;Naskah-naskah pengumpulan, perubahan pelayanan TSI;;5;7;2
661;18;TIAK.03.02;Implementasi dan Sosialisasi System Operasional;;5;7;2
662;18;TIAK.03.03;Pelayanan Teknologi System Internal;;5;7;2
663;18;TIAK.03.04;Undangan Intern;;5;7;2
664;18;TIAK.03.05;Undangan Ekstern;;5;7;2
665;18;TIAK.04;SUB DIVISI AKUNTANSI;;0;0;1
666;18;TIAK.04.01;Laporan Berkala;;5;7;1
667;18;TIAK.04.02;Naskah-naskah yang berkaitan dengan laporan dari tahap persiapan;;5;7;2
668;18;TIAK.04.03;Undangan Intern;;5;7;2
669;18;TIAK.04.04;Undangan Ekstern;;5;7;2
670;18;TIAK.04.05;Trial Balance;;5;7;1
671;18;TIAK.04.06;Surat-surat;;5;7;2
672;18;TIAK.04.07;Setoran Modal;;5;7;1
673;18;TIAK.04.08;Koreksi Audit;;5;7;1
674;18;TIAK.04.09;Undangan Intern;;5;7;2
675;18;TIAK.04.10;Surat Insidentil;;5;7;2
676;18;TIAK.04.11;Naskah-naskah yang terkait dengan perpajakan mulai proses;;5;7;2
677;18;TIAK.04.12;Undangan Intern;;5;7;2
678;18;TIAK.04.13;Undangan Ekstern;;5;7;2
679;19;AMU.01;LAPORAN BERKALA;;3;5;2
680;19;AMU.01.01;Laporan Perkembangan Kredit Macet AMU;;3;5;2
681;19;AMU.01.02;Laporan Jasa Penarikan AMU Triwulan;;3;5;2
682;19;AMU.02;LAPORAN INSIDENTIL;;3;5;2
683;19;AMU.02.01;Laporan Penyelesaian Kredit AMU;;3;5;2
684;19;AMU.02.02;Laporan Pembinaan dan Penagihan Kredit Bermasalah;;3;5;2
685;19;AMU.02.03;Laporan Pendidikan dan Pelatihn;;3;5;2
686;19;AMU.02.04;Berkas Jaminan Kredit;;3;5;2
687;19;AMU.03;LAINNYA;;3;5;2
688;19;AMU.03.01;Surat Masuk;;3;5;2
689;19;AMU.03.02;Surat Keluar;;3;5;2
690;20;TAF.01;PENCEGAHAN;;5;5;2
691;20;TAF.01.01;Naskah-naskah yang berkaitan dengan tindakan pencegahan (know your employee, customer awarness, dll);;5;5;2
692;20;TAF.01.01.A;- Know Your Employee;;5;5;2
693;20;TAF.01.01.B;- Employee Awareness / Agenda Sosialisasi;;5;5;2
694;20;TAF.01.01.C;- Customer Awareness;;5;5;2
695;20;TAF.01.01.D;- Anti Fraud Statement;;4;6;2
696;20;TAF.01.01.E;- Take Home Pay;;5;5;2
697;20;TAF.02;DETEKSI;;5;7;2
698;20;TAF.02.01;Naskah-naskah yang berkaitan dengan deteksi fraud;;5;7;2
699;20;TAF.02.01.A;- Surveillance System;;5;7;2
700;20;TAF.02.01.B;- Surprise Audit;;5;7;2
701;20;TAF.02.01.C;- Whistleblowing System;;5;7;2
702;20;TAF.03;Investigasi, Pelaporan dan Sanksi;;5;7;2
703;20;TAF.03.01;Naskah-naskah yang berkaitan dengan Investigasi, Pelaporan dan Sanksi Fraud;;5;7;2
704;20;TAF.03.01.A;- Investigasi / Agenda Tim Identifikasi;;5;7;2
705;20;TAF.03.01.B;- Pelaporan / Pelaporan ke OJK dan Review Manajemen;;5;7;2
706;20;TAF.03.01.C;- Sanksi / SK terhadap Pelaku Fraud;;5;7;2
707;20;TAF.03.01.D;- Notulen Arsip Rapat Tim Identifikasi Kepersonaliaan;;5;7;2
708;20;TAF.04;Evaluasi, Pemantauan dan Tindak Lanjut;;5;7;2
709;20;TAF.04.01;Laporan Evaluasi, Laporan pemantauan/perkembangan kejadian fraud dan tindak lanjut;;5;7;2
710;20;TAF.04.01.A;- Laporan Evaluasi;;5;7;2
711;20;TAF.04.01.B;- Laporan Pemantauan / Perkembangan Kejadian Fraud dan Tindak Lanjut;;5;7;2
712;20;TAF.05;Pemeriksaan OJK;;5;7;2
713;20;TAF.05.01;Temuan Hasil Pemeriksaan OJK;;5;7;2
714;20;TAF.06;Surat-Surat;;3;7;2
715;20;TAF.06.01;Surat Masuk;;3;7;2
716;20;TAF.06.02;Surat Keluar;;3;7;2
717;20;TAF.07;Rencana Kerja Tahunan/Bulanan/Triwulan;;3;7;2
718;20;TAF.07.01;Rencana Kerja Tahunan;;3;7;2
719;20;TAF.07.02;Profil Resiko;;3;7;2
720;20;TAF.07.03;LED/KDKE;;3;7;2
721;20;TAF.07.04;Arsip SDM/Penilaian SMK;;3;7;2
722;20;TAF.15;Arsip Lain-lain;;3;7;2
723;20;TAF.15.01;Arsip Lain-lain;;3;7;2
724;21;APT.01;SURAT;;0;0;2
725;21;APT.01.01;Surat Masuk;;2;3;2
726;21;APT.01.01;Surat Pajak;;2;3;2
727;21;APT.01.01;Surat Edaran PPATK;;2;3;2
728;21;APT.01.01;Surat Edaran BI;;2;3;2
729;21;APT.01.02;Daftar Teroris;;2;3;2
730;21;APT.02;PENGELOLAAN DOKUMEN PELAPORAN EKSTERN;;0;0;2
731;21;APT.02.01;Dokumen LTKM;;2;3;2
732;21;APT.02.02;Dokumen LTKT;;2;3;2
733;21;APT.02.03;Undangan Ekstern;;2;3;2
734;21;APT.03;PENGELOLAAN LAPORAN DOKUMEN CABANG/CAPEM;;0;0;2
735;21;APT.03.01;Laporan Pengkinian Data Nasabah;;2;3;2
736;21;APT.03.02;Laporan High Risk;;2;3;2
737;21;APT.03.03;Laporan WIC;;2;3;2
738;21;APT.03.04;Laporan Pengaduan Nsabah;;2;3;2
739;21;APT.04;PENGELOLAAN LAPORAN;;0;0;2
740;21;APT.05.01;Laporan Hasil Pembinaan Cabang;;2;3;2
741;21;APT.05.02;Laporan Komisaris;;2;3;2
742;21;APT.05.03;Laporan Direksi;;2;3;2
743;22;RPK.01;LAPORAN BERKALA (BULANAN);;0;0;2
744;22;RPK.01.01;Laporan Pelaksanaan Restrukturisasi Kredit;;3;3;2
745;22;RPK.01.02;Laporan Perkembangan dan Nominatif Restrukturisasi Kredit;;3;3;2
746;22;RPK.01.03;Laporan Penarikan Kredit Hapus Buku;;3;3;2
747;22;RPK.01.04;Laporan Kredit Bermasalah (NPL);;3;3;2
748;22;RPK.02;LAPORAN INSIDENTIL;;0;0;2
749;22;RPK.02.01;Laporan Pembinaan dan Penagihan Debitur Bermasalah;;3;3;2
750;22;RPK.02.02;Laporan Penyelesaian Kredit Bermasalah (Pelunasan Kredit);;3;3;2
751;22;RPK.02.03;Laporan Perkembangan NPL Kepada Direktur Utama;;3;3;2
752;22;RPK.14.;UNDANGAN;;0;0;2
753;22;RPK.14.01;Undangan Intern;;1;1;2
754;22;RPK.14.01;Undangan Ekstern;;1;1;2
755;23;CAB.BO;BAGIAN PELAYANAN BACK OFFICE;;0;0;2
756;23;CAB.BO.01;SEKSI KLIRING;;0;0;2
757;23;CAB.BO.01.01;- Incoming;;3;5;2
758;23;CAB.BO.01.02;- Outgoing;;3;5;2
759;23;CAB.BO.01.03;- Retur / Tolakan;;3;5;2
760;23;CAB.BO.02;SEKSI RTGS;;0;0;2
761;23;CAB.BO.02.01;- Outgoing;;3;5;2
762;23;CAB.BO.02.02;- Incoming;;3;5;2
763;23;CAB.BO.02.03;- Saldo  RTGS;;3;5;2
764;23;CAB.BO.02.04;- Buku Register;;3;5;2
765;23;CAB.BO.02.05;- Log Book;;3;5;2
766;23;CAB.BO.03;SEKSI BACK OFFICE;;0;0;2
767;23;CAB.BO.03.01;- Taspen;;3;5;2
768;23;CAB.BO.03.02;- Inkaso;;3;5;2
769;23;CAB.BO.03.03;- Surat Masuk;;3;5;2
770;23;CAB.BO.03.04;- Surat keluar;;3;5;2
771;23;CAB.BO.03.05;- Deposan inti;;3;5;2
772;23;CAB.BO.03.06;- SKB;;3;5;2
773;23;CAB.BO.03.07;- Proyeksi BPJS;;3;5;2
774;23;CAB.BO.03.08;- Rate Deposito;;3;5;2
775;23;CAB.BO.03.09;- SK Deposito;;3;5;2
776;23;CAB.BO.03.10;- Bukti Nota Untuk Teller BO;;3;5;2
777;23;CAB.BO.03.11;- Tanda terima Gaji Dinas;;3;5;2
778;23;CAB.BO.03.12;- Daftar Penerima Gaji,Kespeg Dinas;;3;5;2
779;23;CAB.BO.04;SEKSI PELAYANAN PAJAK dan SAFE DEPOSIT;;0;0;2
780;23;CAB.BO.04.01;- Mutasi Laporan Harian Pajak;;5;10;2
781;23;CAB.BO.04.02;- Print out Rekening Koran Pajak;;5;10;2
782;23;CAB.BO.04.03;- Laporan Reversal Pajak;;5;10;2
783;23;CAB.BO.04.04;- Surat Masuk Masalah Pajak;;5;10;2
784;23;CAB.BO.04.05;- Surat Keluar masalah pajak;;5;10;2
785;23;CAB.BO.04.06;- Laporan imbal jasa pajak;;5;10;2
786;23;CAB.BO.04.07;- Laporan bulanan SDB;;5;10;2
787;23;CAB.BO.05;BAGIAN AKUNTANSI dan TSI;;0;0;2
788;23;CAB.BO.05.01;SEKSI VERIFIKASI dan REKONSILIASI;;0;0;2
789;23;CAB.BO.05.02;- Rekonsiliasi Eksternal;;3;5;2
790;23;CAB.BO.05.03;- Rekonsiliasi Internal;;3;5;2
791;23;CAB.BO.05.04;- Lainnya;;3;5;2
792;23;CAB.BO.06;SEKSI LAP. KEUANGAN DAN TSI;;0;0;2
793;23;CAB.BO.06.01;- Laporan Eksternal;;3;5;2
794;23;CAB.BO.06.02;- Laporan Internal;;3;5;2
795;23;CAB.BO.06.03;LAPORAN LAINNYA;;3;5;2
796;23;CAB.BO.07;BAGIAN SDM dan UMUM;;0;0;2
797;23;CAB.BO.07;SEKSI SDM;;0;0;2
798;23;CAB.BO.07.01;- Kebutuhan pegawai;;3;5;2
799;23;CAB.BO.07.02;- Pengangkatan / penempatan;;3;5;2
800;23;CAB.BO.07.03;- Penilaian/absensi/disiplin kerja/ijin sakit;;3;5;2
801;23;CAB.BO.07.04;- Kasus/sanksi/teguran;;3;5;2
802;23;CAB.BO.07.05;- Berita acara serah terima jabatan;;3;5;2
803;23;CAB.BO.07.06;- Promosi/mutasi/naik dan turun jabatan/bst;;3;5;2
804;23;CAB.BO.07.07;- Hubungan kerja, pensiun, pengunduran diri;;3;5;2
805;23;CAB.BO.07.08;- Resign / pemberhentian;;3;5;2
806;23;CAB.BO.07.09;- Program pendidikan ujian dinas / training / pelatihan;;3;5;2
807;23;CAB.BO.07.10;- SP ( bantuan struktur intern );;3;5;2
808;23;CAB.BO.07.11;- Santapan rohani;;3;5;2
809;23;CAB.BO.08;SEKSI RUMAH TANGGA DAN LOGISTIK;;0;0;2
810;23;CAB.BO.08.01;- Pengadaan barang habis;;3;5;2
811;23;CAB.BO.08.02;- Iklan/Pameran/Penawaran;;3;5;2
812;23;CAB.BO.08.03;- Pembelian/Inventaris;;3;5;2
813;23;CAB.BO.08.04;- Rapat/Penyelenggaraan rapat;;3;5;2
814;23;CAB.BO.08.05;- Ucapan selamat / duka cita;;3;5;2
815;23;CAB.BO.08.06;- Naskah ekspedisi/pemeliharaan gedung;;3;5;2
816;23;CAB.BO.08.07;- Pemeliharaan sarana/pra/layanan berkas;;3;5;2
817;23;CAB.BO.08.08;- Asuransi barang sarana/prasarana;;3;5;2
818;23;CAB.BO.08.09;- Sewa menyewa gedung, sarana/prasarana;;3;5;2
819;23;CAB.BO.08.10;- Sponsor / promosi;;3;5;2
820;23;CAB.BO.08.11;- Bantuan kerjasama keamanan;;3;5;2
821;23;CAB.BO.08.12;- Arsip Cabang;;3;5;2
822;23;CAB.BO.08.13;- Arsip pusat;;3;5;2
823;23;CAB.BO.08.14;- Undangan internal;;3;5;2
824;23;CAB.BO.08.15;- Undangan eksternal;;3;5;2
825;23;CAB.BO.08.16;- Lainnya;;3;5;2
826;23;CAB.BO.09;SEKSI SEKRETARIS dan ARSIP;;0;0;2
827;23;CAB.BO.09.01;- Hukum;;3;5;2
828;23;CAB.BO.09.02;- Hubungan Masyarakat;;1;5;2
829;23;CAB.BO.09.03;- Sekretariat dan Protokoler;;3;5;2
830;23;CAB.BO.09.04;- Ortala dan transformasi budaya perusahaan;;3;5;2
831;23;CAB.BO.09.05;- Undangan;;1;3;2
832;23;CAB.BO.09.06;- Laporan;;3;5;2
833;23;CAB.BO.09.07;- Lainnya ;;1;5;2
834;23;CAB.FO;BAGIAN PELAYANAN FRONT OFFICE;;0;0;2
835;23;CAB.FO.01;SEKSI PELAYANAN JASA  LN;;0;0;2
836;23;CAB.FO.01.01;- Permohonan transfer valas;;3;5;2
837;23;CAB.FO.01.02;- Penerusan L/C  ( Amandement L/C );;3;5;2
838;23;CAB.FO.01.03;- Permohonan pengadaan Bank Note;;3;5;2
839;23;CAB.FO.02;SEKSI  PELAYANAN KAS dan TELLER;;0;0;2
840;23;CAB.FO.02.01;- Surat penunjukan Bank Indonesia;;3;5;2
841;23;CAB.FO.02.02;- CIT dan CIS;;3;5;2
842;23;CAB.FO.03;SEKSI  CSR;;0;0;2
843;23;CAB.FO.03.01;- Pembukaan rekening tabungan;;3;5;2
844;23;CAB.FO.03.02;- Pembukaan rekening giro;;3;5;2
845;23;CAB.FO.03.03;- Pembukaan ATM;;3;5;2
846;23;CAB.FO.03.04;- Pengkinian rekening tabungan;;3;5;2
847;23;CAB.FO.03.05;- Pengkinian rekening giro;;3;5;2
848;23;CAB.FO.03.06;- Nominatif;;3;5;2
849;23;CAB.FO.03.07;- Berkas laporan APU PPT;;3;5;2
850;23;CAB.FO.03.08;- Penutupan tabungan;;3;5;2
851;23;CAB.FO.03.09;- Penutupan giro;;3;5;2
852;23;CAB.FO.03.10;- Lainnya;;3;5;2
853;23;CAB.KRD.01;BAGIAN RESTRUKTURISASI dan PENYELESAIAN KREDIT;;0;0;2
854;23;CAB.KRD.01.01;SEKSI  RESTRUKTURISASI;;0;0;2
855;23;CAB.KRD.01.01;- Surat keluar;;3;5;2
856;23;CAB.KRD.01.01;- Surat Perintah Kerja;;3;5;2
857;23;CAB.KRD.01.01;- Restrukturisasi;;3;5;2
858;23;CAB.KRD.01.02;SEKSI  PENYELESAIAN KREDIT;;0;0;2
859;23;CAB.KRD.01.02;- Surat keluar;;3;5;2
860;23;CAB.KRD.01.02;- Surat Perintah Kerja;;3;5;2
861;23;CAB.KRD.01.02;- Pemberitahuan  lelang;;3;5;2
862;23;CAB.KRD.01.03;BAGIAN ADMIN dan LEGAL KREDIT;;0;0;2
863;23;CAB.KRD.01.03;SEKSI ADMIN dan PELAPORAN;;0;0;2
864;23;CAB.KRD.01.03;- Nominatif;;3;5;2
865;23;CAB.KRD.01.03;- Bank Garansi Efektif;;3;5;2
866;23;CAB.KRD.01.03;- Asuransi;;3;5;2
867;23;CAB.KRD.01.03;- Klaim Asuransi;;3;5;2
868;23;CAB.KRD.01.03;- RB Bendahara;;3;5;2
869;23;CAB.KRD.01.03;- Lain-lain;;3;5;2
870;23;CAB.KRD.01.04;SEKSI  LEGAL dan KREDIT;;0;0;2
871;23;CAB.KRD.01.04;- KPR;;3;5;2
872;23;CAB.KRD.01.04;- PLO;;3;5;2
873;23;CAB.KRD.01.04;- Produktif;;3;5;2
874;23;CAB.KRD.01.04;- KMG;;3;5;2
875;23;CAB.PMS.01;TIM PEMASAR;;0;0;2
876;23;CAB.PMS.01.01;- Permohonan kerjasama dengan pihak ke 3;;3;5;2
877;23;CAB.PMS.01.02;- Permohonan biaya promosi;;3;5;2
878;23;CAB.PMS.01.03;- Permohonan biaya pemasaran;;3;5;2
879;23;CAB.PMS.01.04;- Surat keluar;;3;5;2
\.

-- reset sequence
SELECT setval(pg_get_serial_sequence ('r_berkas_klas', 'id')
		        ,       coalesce (max(id), 0) + 1
		        ,       false) as "r_berkas_klas sequence"
FROM r_berkas_klas;
---}}}

---{{{ r_berkas_tipe
INSERT INTO r_berkas_tipe (nama, keterangan) VALUES ('Surat/Naskah', 'Berkas berupa surat/naskah');
INSERT INTO r_berkas_tipe (nama, keterangan) VALUES ('Nota Keuangan', 'Berkas berupa surat berharga');
INSERT INTO r_berkas_tipe (nama, keterangan) VALUES ('Gambar', 'Berkas berupa gambar diam');
INSERT INTO r_berkas_tipe (nama, keterangan) VALUES ('Video', 'Berkas berupa gambar bergerak');
INSERT INTO r_berkas_tipe (nama, keterangan) VALUES ('Suara', 'Berkas berupa suara');
---}}}

---{{{ r_arsip_status
INSERT INTO r_arsip_status (id, keterangan) VALUES (0, 'Ada');
INSERT INTO r_arsip_status (id, keterangan) VALUES (1, 'Dipinjam');
INSERT INTO r_arsip_status (id, keterangan) VALUES (2, 'Hilang');
INSERT INTO r_arsip_status (id, keterangan) VALUES (3, 'Musnah');
---}}}

---{{{ r_akses_berbagi
INSERT INTO r_akses_berbagi (id, keterangan) VALUES (0, 'Tidak berbagi');
INSERT INTO r_akses_berbagi (id, keterangan) VALUES (1, 'Lihat (user tertentu)');
INSERT INTO r_akses_berbagi (id, keterangan) VALUES (2, 'Merubah (user tertentu)');
INSERT INTO r_akses_berbagi (id, keterangan) VALUES (3, 'Lihat (global)');
INSERT INTO r_akses_berbagi (id, keterangan) VALUES (4, 'Merubah (global)');
---}}}

---{{{ r_akses_menu
INSERT INTO r_akses_menu (id, keterangan) VALUES (0, 'Tanpa Akses');
INSERT INTO r_akses_menu (id, keterangan) VALUES (1, 'View');
INSERT INTO r_akses_menu (id, keterangan) VALUES (2, 'Insert');
INSERT INTO r_akses_menu (id, keterangan) VALUES (3, 'Update');
INSERT INTO r_akses_menu (id, keterangan) VALUES (4, 'Delete');
---}}}

---{{{ menu_akses: insert
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES ( 1, 1, 4);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES ( 2, 1, 4);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES ( 3, 1, 0);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (10, 1, 4);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (11, 1, 4);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (12, 1, 4);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (13, 1, 4);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (14, 1, 4);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (15, 1, 4);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (20, 1, 4);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (21, 1, 4);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (22, 1, 4);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (23, 1, 4);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (24, 1, 4);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (30, 1, 4);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (31, 1, 4);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (32, 1, 0);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (33, 1, 0);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (34, 1, 4);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (40, 1, 4);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (41, 1, 4);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (42, 1, 0);

INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES ( 1, 2, 0);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES ( 2, 2, 0);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES ( 3, 2, 0);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (10, 2, 4);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (11, 2, 4);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (12, 2, 0);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (13, 2, 0);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (14, 2, 0);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (15, 2, 0);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (20, 2, 4);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (21, 2, 0);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (22, 2, 0);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (23, 2, 0);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (24, 2, 4);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (30, 2, 4);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (31, 2, 4);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (32, 2, 0);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (33, 2, 0);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (34, 2, 0);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (40, 2, 4);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (41, 2, 4);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (42, 2, 0);

INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES ( 1, 3, 0);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES ( 2, 3, 0);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES ( 3, 3, 0);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (10, 3, 4);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (11, 3, 0);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (12, 3, 0);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (13, 3, 0);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (14, 3, 0);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (15, 3, 4);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (20, 3, 4);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (21, 3, 0);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (22, 3, 0);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (23, 3, 0);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (24, 3, 4);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (30, 3, 4);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (31, 3, 0);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (32, 3, 4);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (33, 3, 4);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (34, 3, 0);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (40, 3, 4);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (41, 3, 4);
INSERT INTO menu_akses (menu_id, grup_id, hak_akses_id) VALUES (42, 3, 4);
---}}}

---{{{ r_pemusnahan_metoda
INSERT INTO r_pemusnahan_metoda (nama, keterangan) VALUES ('Pembakaran', 'Pemusanahan arsip dengan cara dibakar');
INSERT INTO r_pemusnahan_metoda (nama, keterangan) VALUES ('Pencacahan', 'Pemusnahan arsip dengan cara dicacah');
INSERT INTO r_pemusnahan_metoda (nama, keterangan) VALUES ('Peleburan', 'Pemusnahan arsip dengan cara dilebur');
---}}}

---{{{ m_berkas
INSERT INTO m_berkas (pid, pegawai_id, nama) values (0, 1, 'Administrator');
INSERT INTO m_berkas (pid, pegawai_id, nama) values (0, 2, 'User Pusat Berkas');
INSERT INTO m_berkas (pid, pegawai_id, nama) values (0, 3, 'User Pusat Arsip');
---}}}
