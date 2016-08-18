\connect election;

set search_path to federal;
/*
US HOUSE OF REPRESENTATIVES
*/
insert into federal_rep
select to_date(election_date, 'MM/DD/YYYY'), state, district, candidate, party,
to_number(votes, '999999999'), 'full', to_date('1/3/2015','MM/DD/YYYY'),
to_date('1/2/2017','MM/DD/YYYY'), 'general'
from federal_raw
where office = 'FOR UNITED STATES REPRESENTATIVE' and election_date = '11/4/2014';

insert into federal_rep
select to_date(election_date, 'MM/DD/YYYY'), state, district, candidate, party,
to_number(votes, '999999999'), 'full', to_date('1/3/2015','MM/DD/YYYY'),
to_date('1/2/2017','MM/DD/YYYY'), 'run-off'
from federal_raw
where office = 'FOR UNITED STATES REPRESENTATIVE' and election_date = '12/6/2014';

/*
US SENATE
*/
insert into federal_sen
select to_date(election_date, 'MM/DD/YYYY'), state, candidate, party,
to_number(votes, '999999999'), 'full', to_date('1/3/2015','MM/DD/YYYY'),
to_date('1/2/2021','MM/DD/YYYY'), 'general'
from federal_raw
where office = 'FOR UNITED STATES SENATOR'
and election_date = '11/4/2014'
and district = '';

insert into federal_sen
select to_date(election_date, 'MM/DD/YYYY'), state, candidate, party,
to_number(votes, '999999999'), 'full', to_date('1/3/2015','MM/DD/YYYY'),
to_date('1/2/2021','MM/DD/YYYY'), 'run-off'
from federal_raw
where office = 'FOR UNITED STATES SENATOR'
and election_date = '12/6/2014'
and district = '';

insert into federal_sen
select to_date(election_date, 'MM/DD/YYYY'), state, candidate, party,
to_number(votes, '999999999'), 'partial', to_date('1/3/2015','MM/DD/YYYY'),
to_date('1/2/2017','MM/DD/YYYY'), 'general'
from federal_raw
where office = 'FOR UNITED STATES SENATOR'
and election_date = '11/4/2014'
and district = '(For unexpired term ending January 3, 2017)';

insert into federal_sen
select to_date(election_date, 'MM/DD/YYYY'), state, candidate, party,
to_number(votes, '999999999'), 'full', to_date('1/3/2015','MM/DD/YYYY'),
to_date('1/2/2021','MM/DD/YYYY'), 'general'
from federal_raw
where office = 'FOR UNITED STATES SENATOR'
and election_date = '11/4/2014'
and district = '(For full term beginning January 3, 2015)';

/*
TABLE BALANCING
*/

/*
US SENATE
*/
select count(election_date) from federal_raw
where office = 'FOR UNITED STATES SENATOR'
and election_date = '11/4/2014';

select count(election_date) from federal_sen
where election_date = '2014-11-04';

select count(election_date) from federal_raw
where office = 'FOR UNITED STATES SENATOR'
and election_date = '12/6/2014';

select count(election_date) from federal_sen
where election_date = '2014-12-06';

/*
US HOUSE OF REPRESENTATIVES
*/
select count(election_date) from federal_raw
where office = 'FOR UNITED STATES REPRESENTATIVE'
and election_date = '11/4/2014';

select count(election_date) from federal_rep
where election_date = '2014-11-04';

select count(election_date) from federal_raw
where office = 'FOR UNITED STATES REPRESENTATIVE'
and election_date = '12/6/2014';

select count(election_date) from federal_rep
where election_date = '2014-12-06';
