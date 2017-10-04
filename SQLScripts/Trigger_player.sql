DELIMITER //
DROP TRIGGER if exists insert_prod //
CREATE TRIGGER insert_play AFTER INSERT ON suchwow_op.player
FOR EACH ROW
BEGIN
    DECLARE ckey2 INT;
    DECLARE ckey1 INT;
    SELECT MAX(PlayerKey) INTO @ckey2 from suchwow_analytical.player;
    SELECT MAX(PlayerID) INTO @ckey1 from suchwow_op.player;
    INSERT INTO suchwow_analytical.player(PlayerKey,ProductID,PlayerName,State,City,Zipcode,Street,PlayerMembership) 
    SELECT @ckey2+1,Name,Street,City,ZipCode,Membership Type,Username, Password from suchwow_op.player where PlayerID=(SELECT MAX(PlayerID) from suchwow_op.merchandise);
END //
DELIMITER ;