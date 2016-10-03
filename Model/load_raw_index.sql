\connect election;

set search_path to federal;

\COPY federal_index_raw FROM '../Data/index.txt' WITH DELIMITER '|';
