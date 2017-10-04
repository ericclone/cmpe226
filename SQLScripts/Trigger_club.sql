DELIMITER //
DROP TRIGGER if exists insert_club //
CREATE TRIGGER insert_club AFTER INSERT ON suchwow.Club
FOR EACH ROW
BEGIN
    DECLARE ckey2 INT;
    DECLARE ckey1 INT;
    SELECT MAX(ClubKey) INTO @ckey2 from suchwow_analytical.Club;
    SELECT MAX(ClubID) INTO @ckey1 from suchwow.Club;
    INSERT INTO suchwow_analytical.Club(ClubKey,ClubID,Street,City,State,Zipcode) 
    SELECT ClubID,ClubID,Street,City,State,Zipcode from suchwow.Club where ClubID=(SELECT MAX(ClubID) from suchwow.Club);
END //
DELIMITER ;