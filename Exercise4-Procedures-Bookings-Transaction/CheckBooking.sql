DROP PROCEDURE IF EXISTS CheckBooking;

DELIMITER //

CREATE PROCEDURE CheckBooking (IN booking_date DATETIME, IN table_number INT)
BEGIN
IF EXISTS (SELECT BookingID FROM Bookings WHERE Bookings.BookingDate = booking_date AND Bookings.TableNumber = table_number)
THEN
SELECT CONCAT("Table " , table_number, " is booked") AS `Booking Status`; 
ELSE
SELECT CONCAT("Table " , table_number, " is available") AS `Booking Status`; 
END IF;
END //

DELIMITER 

CALL CheckBooking("2023-07-09 10:00:00", 1);