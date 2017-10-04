delimiter //
CREATE TRIGGER insert_play AFTER INSERT ON suchwow.PlaysAt
FOR EACH ROW
BEGIN
    DECLARE CourtKey DEFAULT 0
    IF NOT EXISTS (SELECT CourtKey INTO Courtkey FROM suchwow_analytical.Court CF WEHRE CF.CourtID=NEW.CourtID) THEN
    BEGIN
        INSERT INTO suchwow_analytical.Court (CourtID,FloorType,HourlyRate,ClubID,Street,City,State,Zipcode) 
        SELECT CourtID,FloorType,HourlyRate,ClubID,Street,City,State,Zipcode
        FROM suchwow.Court NATURAL JOIN suchwow.ClubID
        WHERE CourtID=NEW.CourtID;
        SET CourtKey = SCOPE_IDENTITY();
    END
    END IF

    IF NOT EXISTS (SELECT * FROM suchwow_analytical.Player PF WHERE PF.PlayerID=NEW.PlayerID) THEN

    IF NOT EXISTS (SELECT * FROM suchwow_analytical.Club CF WHERE CF.ClubID=NEW.ClubID) THEN

    IF NOT EXISTS (SELECT * FROM suchwow_analytical.Club CF WHERE CF.ClubID=NEW.ClubID) THEN
END;//
delimiter ;