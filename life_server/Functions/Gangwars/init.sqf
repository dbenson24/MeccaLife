/* INIT GANG WAR SYSTEM BY ARMA-SERVICES.DE */
// CONFIGURATION

_zones =
[ /* POSITION OF THE GANG ZONE, DISPLAYNAME, X, Y, CAPTURE REWARD, CAPTURE PROC. SPEED, CAPTURE TIME IN MIN*/
	[[8638.83,18260.5,0.00134277],"gangzone1",150,150,50000,0.05,10,-1,grpNull,false]
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