DELIMITER //
DROP TRIGGER if exists insert_prod //
CREATE TRIGGER insert_prod AFTER INSERT ON suchwow_op.merchandise
FOR EACH ROW
BEGIN
    DECLARE ckey2 INT;
    DECLARE ckey1 INT;
    SELECT MAX(ProductKey) INTO @ckey2 from suchwow_analytical.product;
    SELECT MAX(ProductID) INTO @ckey1 from suchwow_op.merchandise;
    INSERT INTO suchwow_analytical.product(ProductKey,ProductID,Brand,Type,Price,Name) 
    SELECT @ckey2+1,ProductID,Brand,Type,Price,Name from suchwow_op.merchandise where ProductID=(SELECT MAX(ProductID) from suchwow_op.merchandise);
END //
DELIMITER ;