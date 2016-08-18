#!/bin/bash
psql -f create_ddl.sql

psql -f load_raw.sql

psql -f process_2014.sql
psql -f process_2012.sql
psql -f process_2010.sql
