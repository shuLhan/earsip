alter table m_pegawai add log_fail_count int default 0;
alter table m_sysconfig add max_log_fail int default 5;
alter table t_pemindahan alter status set default 0;
