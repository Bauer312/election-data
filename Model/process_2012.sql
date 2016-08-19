\connect election;

set search_path to federal;

/*
US HOUSE OF REPRESENTATIVES
*/
insert into federal_rep
select to_date(election_date, 'MM/DD/YYYY'), state, district, candidate, party,
to_number(votes, '999999999'), 'full', to_date('1/3/2013','MM/DD/YYYY'),
to_date('1/2/2015','MM/DD/YYYY'), 'general'
from federal_raw
where office = 'FOR UNITED STATES REPRESENTATIVE' and election_date = '11/6/2012';

insert into federal_rep
select to_date(election_date, 'MM/DD/YYYY'), state, district, candidate, party,
to_number(votes, '999999999'), 'full', to_date('1/3/2013','MM/DD/YYYY'),
to_date('1/2/2015','MM/DD/YYYY'), 'run-off'
from federal_raw
where office = 'FOR UNITED STATES REPRESENTATIVE' and election_date = '12/8/2012';

/*
US SENATE
*/
insert into federal_sen
select to_date(election_date, 'MM/DD/YYYY'), state, candidate, party,
to_number(votes, '999999999'), 'full', to_date('1/3/2013','MM/DD/YYYY'),
to_date('1/2/2019','MM/DD/YYYY'), 'general'
from federal_raw
where office = 'FOR UNITED STATES SENATOR'
and election_date = '11/6/2012'
and district = '';

insert into federal_sen
select to_date(election_date, 'MM/DD/YYYY'), state, candidate, party,
to_number(votes, '999999999'), 'full', to_date('1/3/2013','MM/DD/YYYY'),
to_date('1/2/2019','MM/DD/YYYY'), 'run-off'
from federal_raw
where office = 'FOR UNITED STATES SENATOR'
and election_date = '12/8/2012'
and district = '';

/*
Delegates
*/
insert into federal_del
select to_date(election_date, 'MM/DD/YYYY'), state, candidate, party,
to_number(votes, '999999999'), 'general'
from federal_raw
where office = 'FOR DELEGATE'
and election_date = '11/6/2012'
and district = '';

/*
President
*/
insert into federal_pres
select to_date(election_date, 'MM/DD/YYYY'), state, party,
to_number(votes, '999999999'), 'general'
from federal_raw
where office = 'FOR PRESIDENTIAL ELECTORS'
and election_date = '11/6/2012'
and district = '';

/*
Resident Commissioner
*/
insert into federal_com
select to_date(election_date, 'MM/DD/YYYY'), state, candidate, party,
to_number(votes, '999999999'), 'general'
from federal_raw
where office = 'FOR RESIDENT COMMISSIONER'
and election_date = '11/6/2012'
and district = '';

/*
TABLE BALANCING
*/

/*
US SENATE
*/
select count(election_date) from federal_raw
where office = 'FOR UNITED STATES SENATOR'
and election_date = '11/6/2012';

select count(election_date) from federal_sen
where election_date = '2012-11-06';

/*
US HOUSE OF REPRESENTATIVES
*/
select count(election_date) from federal_raw
where office = 'FOR UNITED STATES REPRESENTATIVE'
and election_date = '11/6/2012';

select count(election_date) from federal_rep
where election_date = '2012-11-06';
