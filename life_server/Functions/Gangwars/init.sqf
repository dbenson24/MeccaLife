/* INIT GANG WAR SYSTEM BY ARMA-SERVICES.DE */
// CONFIGURATION

_zones =
[ /* POSITION OF THE GANG ZONE, DISPLAYNAME, X, Y, CAPTURE REWARD, CAPTURE PROC. SPEED, CAPTURE TIME IN MIN*/
	[[11537.46,7052.0,7053],"Weapon Cache",450,450,300000,0.05,15,-1,grpNull,false],
	[[89240.83,7493.5,7053],"Tactics Division",450,450,200000,0.05,15,-1,grpNull,false],
	[[12297.96,8883.0,7481],"Logistics",450,450,170000,0.05,15,-1,grpNull,false],
	[[10419.99,8741.0,7053],"High Command",450,450,250000,0.05,15,-1,grpNull,false]
];

// DO NOT TOUCH THE CODE BELOW
{
	createMarker [_x select 1, _x select 0];
	(_x select 1) setMarkerColor "ColorRed";
	(_x select 1) setMarkerType "Empty";
	(_x select 1) setMarkerShape "ELLIPSE";
	(_x select 1) setMarkerSize [_x select 2,_x select 3];
	(_x select 1) setMarkerAlpha 0.5;
} forEach _zones;

AS_GANG_zones = _zones;
AS_GANG_fight = false;
publicVariable "AS_GANG_fight";