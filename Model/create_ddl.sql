CREATE DATABASE election;
\connect election;

CREATE SCHEMA federal;

CREATE TABLE federal.federal_raw (
  election_date varchar(128),
  state         varchar(128),
  office        varchar(128),
  district      varchar(128),
  candidate     varchar(128),
  party         varchar(128),
  votes         varchar(128)
);

CREATE TABLE federal.federal_rep (
  election_date date NOT NULL,
  state         varchar(64) NOT NULL,
  district      varchar(16) NOT NULL,
  candidate     varchar(64) NOT NULL,
  party         varchar(128) NOT NULL default 'N/A',
  votes         integer NOT NULL,
  term_type     varchar(8) NOT NULL default 'full',
  term_begin    date NOT NULL,
  term_end      date NOT NULL,
  election_type varchar(8) NOT NULL default 'general',

  PRIMARY KEY (election_date, state, district, candidate, party, term_end)
);

CREATE TABLE federal.federal_sen (
  election_date date NOT NULL,
  state         varchar(64) NOT NULL,
  candidate     varchar(64) NOT NULL,
  party         varchar(128) NOT NULL default 'N/A',
  votes         integer NOT NULL,
  term_type     varchar(8) NOT NULL default 'full',
  term_begin    date NOT NULL,
  term_end      date NOT NULL,
  election_type varchar(8) NOT NULL default 'general',

  PRIMARY KEY (election_date, state, candidate, party, term_end)
);

CREATE TABLE federal.federal_del (
  election_date date NOT NULL,
  territory     varchar(64) NOT NULL,
  candidate     varchar(64) NOT NULL,
  party         varchar(128) NOT NULL default 'N/A',
  votes         integer NOT NULL,
  election_type varchar(8) NOT NULL default 'general',

  PRIMARY KEY (election_date, territory, candidate, party)
);
