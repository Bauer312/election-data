\connect election;

set search_path to federal;

\COPY federal_raw FROM '../Data/2014.txt' WITH DELIMITER '|';
\COPY federal_raw FROM '../Data/2012.txt' WITH DELIMITER '|';
\COPY federal_raw FROM '../Data/2010.txt' WITH DELIMITER '|';
