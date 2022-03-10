-- Author Charlie Moreland
use fooddb;
drop trigger if exists check_amount;
delimiter //  
CREATE TRIGGER check_amount AFTER INSERT ON recipe
FOR EACH ROW 
BEGIN
IF NEW.amount<=0 THEN 
-- SIGNAL works for MySQL server 5.5
 SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'amount cannot be negative or 0'; 
END IF; 
END;//
delimiter ;
insert into recipe (amount, fid, iid) values (-1, 26, 32); 