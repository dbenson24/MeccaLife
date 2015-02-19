/*
spawnIllegalArea.sqf
*/
 
private["_heli"];

//Create Frog area
_heli = "Land_ClutterCutter_small_F" createVehicle (["mrkfrogGreen",0,["mrkfrogRed","mrkfrogRed_1","mrkfrogRed_2","mrkfrogRed_3","mrkfrogRed_4"]] call SHK_pos);
_heli setPosASLW [(position _heli) select 0, (position _heli) select 1, -5.5];
_heli enableSimulation false;
 
_Pos = position _heli;
 _marker = createMarker ["frog_1", _Pos];
"cocaine_1" setMarkerColor "ColorRed";
"cocaine_1" setMarkerText "Frog Swamp";
"cocaine_1" setMarkerType "mil_dot";

//Create cocaine area
_heli = "Land_ClutterCutter_small_F" createVehicle (["mrkcocaineGreen",0,["mrkcocaineRed","mrkcocaineRed_1","mrkcocaineRed_2","mrkcocaineRed_3","mrkcocaineRed_4"]] call SHK_pos);
_heli setPosASLW [(position _heli) select 0, (position _heli) select 1, -5.5];
_heli enableSimulation false;
 
_Pos = position _heli;
 _marker = createMarker ["cocaine_1", _Pos];
"cocaine_1" setMarkerColor "ColorRed";
"cocaine_1" setMarkerText "Cocaine Field";
"cocaine_1" setMarkerType "mil_dot";
 
//Create heroine area
_heli = "Land_ClutterCutter_small_F" createVehicle (["mrkheroinGreen",0,["mrkheroinRed","mrkheroinRed_1","mrkcocaineRed_2","mrkcocaineRed_3","mrkcocaineRed_4"]] call SHK_pos);
_heli setPosASLW [(position _heli) select 0, (position _heli) select 1, -5.5];
_heli enableSimulation false;
 
_Pos = position _heli;
 _marker = createMarker ["heroin_1", _Pos];
"heroin_1" setMarkerColor "ColorRed";
"heroin_1" setMarkerText "Heroin Field";
"heroin_1" setMarkerType "mil_dot";

 
//Create cannabis area
_heli = "Land_ClutterCutter_small_F" createVehicle (["mrkweedGreen",0,["mrkweedRed","mrkweedRed_1","mrkweedRed_2","mrkweedRed_3","mrkweedRed_4"]] call SHK_pos);
_heli setPosASLW [(position _heli) select 0, (position _heli) select 1, -5.5];
_heli enableSimulation false;
 
_Pos = position _heli;
 _marker = createMarker ["weed_1", _Pos];
"weed_1" setMarkerColor "ColorRed";
"weed_1" setMarkerText "Weed Field";
"weed_1" setMarkerType "mil_dot";
 