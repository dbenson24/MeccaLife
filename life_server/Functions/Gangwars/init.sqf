/* INIT GANG WAR SYSTEM BY ARMA-SERVICES.DE */
// CONFIGURATION

_zones =
[ /* POSITION OF THE GANG ZONE, DISPLAYNAME, X, Y, CAPTURE REWARD, CAPTURE PROC. SPEED, CAPTURE TIME IN MIN*/
	[[0898.83,07460.5,0.00134277],"Weapon Cache",450,450,300000,0.05,15,-1,grpNull,false]
	[[1150.83,07060.5,0.00134277],"Tactics Division",450,450,200000,0.05,15,-1,grpNull,false]
	[[1213.83,08900.5,0.00134277],"Logistics",450,450,170000,0.05,15,-1,grpNull,false]
	[[1048.83,08660.5,0.00134277],"High Command",450,450,250000,0.05,15,-1,grpNull,false]
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