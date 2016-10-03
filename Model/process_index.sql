\connect election;

set search_path to federal;

insert into federal_index
select to_date(election_date, 'YYYY-MM-DD'), election_type, state, office, district,
to_number(index, '999')
from federal_index_raw
where election_type = 'general';
