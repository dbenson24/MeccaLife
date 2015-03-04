/*/////////////////////////////////////////|//////////
//_______________________////////////////__|__////////
/|Made for ZoXXen.com    |/////////////____|____//////
/|Author:GamerDF         |///////////______|______////
/|Description: too lazy  |/////////////____|____//////
/|_______________________|///////////////  |  ////////
*////////////////////////////////////////~~|~~////////

switch (true) do
{
	case ((vehicle player) isKindOf "Man"): {setViewDistance zoXXen_foot};
	case ((vehicle player) isKindOf "LandVehicle"): {setViewDistance zoXXen_car};
	case ((vehicle player) isKindOf "Air"): {setViewDistance zoXXen_air};
};