

select n1.tradspell n1.tidied n1.novowels  n2.tradspell n2.tidied n2.novowels  from ndictionary as n1 join ndictionary as n2 on novowels where not (n1.tradspell = n2.tradspell); 

select n1.tradspell, n2.tradspell, n1.tidied, n2.tidied,n1.novowels,n2.novowels, n1.rank,n2.rank
from (select * from ndictionary where ndictionary.rank <2000)   n1 
join (select * from ndictionary where ndictionary.rank <2000) n2 
on n1.novowels=n2.novowels 
where (not n1.tradspell=n2.tradspell) 
group by n1.rank
order by n1.rank asc;

--- abbrieviations and yw removals included in dictionary2

select n1.tradspell, n2.tradspell, n1.tidied, n2.tidied,n1.novowels,n2.novowels, n1.noyorw,n2.noyorw, n1.abbrieviation, n2.abbrieviation,n1.rank,n2.rank
from (select * from ndictionary2 where ndictionary2.rank <80000)   n1 
join (select * from ndictionary2 where ndictionary2.rank <80000) n2 
on n1.novowels=n2.novowels 
where (not n1.tradspell=n2.tradspell) and (n1.rank<n2.rank)
group by n1.rank
order by n1.rank asc;

--- abbrieviations, single internal vowel and yw removals included in dictionary2

select n1.tradspell,  n1.abbrieviation, n1.rank
from (select * from ndictionary2 where ndictionary2.rank <80000)   n1 
join (select * from ndictionary2 where ndictionary2.rank <80000) n2 
on n1.novowels=n2.novowels 
where (not n1.tradspell=n2.tradspell) and (n1.rank<n2.rank)
group by n1.rank
order by n1.rank asc;

select * from ndictionary2 d where d.rank < 200;

select * from ndictionary n where n.rank  <  28000  and  n.rank  >27950 ; 
-----
select * from ndictionary2 d where d.rank =2968;

delete from ndictionary;

describe ndictionary;

CREATE TABLE ndictionary(tradspell VARCHAR PRIMARY KEY, augmented VARCHAR , tidied VARCHAR, novowels VARCHAR, rank integer, freq real);
CREATE TABLE ndictionary2(tradspell VARCHAR PRIMARY KEY, augmented VARCHAR , tidied VARCHAR, wuninternalvowel VARCHAR, novowels VARCHAR, noyorw VARCHAR,abbrieviation VARCHAR,abjadish VARCHAR,rank integer, freq real)