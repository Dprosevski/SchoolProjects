SELECT Ride.rideNumber, Driver.hackLicense, 
	Driver.firstName, Driver.lastName, 
	Ride.pickUpLoc, Location.latitude, Location.longitude
FROM Ride, Driver, Location
WHERE Driver.hackLicense = Ride.hackLicense
and Ride.pickUpLoc = Location.locationID;

