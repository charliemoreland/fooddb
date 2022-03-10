-- Author Charlie Moreland
use fooddb;
-- list the number of foods
-- 1.a
select count(fid) as "numFoods"
from food;

-- list all of the attributes in descending fid joinging all three tables
-- 1.b
select f.fid, f.fname, i.iid, i.iname, i.caloriepergram, i.category, r.amount
from food f, ingredient i, recipe r
where f.fid=r.fid and r.iid=i.iid
ORDER BY fid;

-- list fid and fname that include both green onions and chicken
-- 1.c
select f.fid, f.fname
from food f, ingredient i1, recipe r1, ingredient i2, recipe r2
where i1.iname="Chicken"
and i2.iname="Green Onion"
and f.fid=r1.fid
and r1.iid=i1.iid
and r2.iid=i2.iid
and r1.fid=r2.fid;

-- list iid and iname of any ingredients that are not used in any recipes
-- 1.d
insert into ingredient  
select max(iid)+1, 'Cheese', 2.0, 'Protein'  
from ingredient; 

select i.iid, i.iname
from ingredient i
where i.iid not in
(select r.iid
from recipe r);

-- 1.e
select f.fid, f.fname, count(i.iid) as numIngredients, sum(r.amount) as totalAmt
from food f, ingredient i, recipe r
where f.fid=r.fid and i.iid=r.iid
group by fid
order by numIngredients DESC;




