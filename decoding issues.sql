--- decoding issues with the letter o
--- o -> ő (u)

select * from dictionary d
where 
d.tradspell like '%o%'
and
d.augmented like '%ő%'
and
d.rank < 1000 
order by d.freq asc;

--- o -> i (i)

select * from dictionary d
where 
d.tradspell like '%women%'
--and
--d.augmented like '%i%'
and
d.rank < 1000 
order by d.freq asc;

-- o -> ö(oo)

select * from dictionary d
where 
d.tradspell like '%o%'
and
d.augmented like '%ö%'
and
d.rank < 1000 
order by d.freq asc;

---- o --> ô boat
select * from dictionary d
where 
d.tradspell like '%o%'
and
d.augmented like '%ô%'
and
d.rank < 1000 
order by d.freq asc;

---- o --> õ out
select * from dictionary d
where 
d.tradspell like '%o%'
and
d.augmented like '%õ%'
and
d.rank < 1000 
order by d.freq asc;

----


