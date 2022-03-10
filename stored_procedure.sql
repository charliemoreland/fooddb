-- Author Charlie Moreland
drop procedure if exists findFoodwithMeat;
delimiter //
create procedure findFoodwithMeat(in numMeatIngredients Integer, in totalgrams Float)
begin
	select r.fid, f.fname, sum(r.amount) as totalMeatAmt
	 from fooddb.food f, fooddb.recipe r, fooddb.ingredient i
	where f.fid=r.fid and r.iid=i.iid and i.category="Meat" 
    group by fid
    having totalMeatAmt >totalgrams and count(i.iid)>=numMeatIngredients
    order by f.fid desc;
end;//
delimiter ;

call findFoodwithMeat(2,5);
