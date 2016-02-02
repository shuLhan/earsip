#!/bin/sh

psql -q -U earsip -d postgres -f 05_drop_database.sql
psql -q -U earsip -d postgres -f 00_create_database.sql
psql -q -U earsip -d earsip -f 01_DDL.sql
psql -q -U earsip -d earsip -f 02_store_procedures.sql
psql -q -U earsip -d earsip -f 03_data.sql
