#!/bin/bash
psql -f load_raw_index.sql

psql -f process_index.sql
