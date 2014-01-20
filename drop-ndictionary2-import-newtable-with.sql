drop table ndictionary2;
CREATE TABLE ndictionary2(tradspell VARCHAR PRIMARY KEY, augmented VARCHAR , tidied VARCHAR, wuninternalvowel VARCHAR, novowels VARCHAR, noyorw VARCHAR,abbrieviation VARCHAR,abjadish VARCHAR,rank integer, freq real);
.separator "\,"
.import newtable-with-abbrieviations.csv ndictionary2
