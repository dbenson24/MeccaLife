private["_heli","_wreck"];

//Create gold vehicle wreck 
//_heli = "Land_Cargo20_grey_F" createVehicle (["hmrkGreen",2,["hmrkRed","hmrkRed_1","hmrkRed_1_1","hmrkRed_1_3"]] call SHK_pos);
_heli = "Land_Cargo20_grey_F" createVehicle (["hmrkGreen",2,["hmrkRed","hmrkRed_1"]] call SHK_pos);
_heli setPosASLW [(position _heli) select 0, (position _heli) select 1, -5.5];
_heli enableSimulation false;

_wreck = "Land_Wreck_Plane_Transport_01_F" createVehicle (getPos _heli);
_wreck SetPosATL [(getPos _heli select 0)-300*sin(round(random 359)),(getPos _heli select 1)-300*cos(round(random 359)), 0];
_wreck enableSimulation false;

heli_safe attachTo [_wreck,[0,10,0]];
heli_safe setVectorDirAndUp [[90,0,80],[-90,0,0]];
heli_safe enableSimulation false;
heli_safe allowDamage false;

_minTime = (10*60);
_maxTime = (20*80);
_finalTime = (random (_maxTime - _minTime)) + _minTime;
sleep _finalTime;
_Pos = position _heli;
 _marker = createMarker ["Marker200", _Pos];
"Marker200" setMarkerColor "ColorOrange";
"Marker200" setMarkerType "Empty";
"Marker200" setMarkerShape "ELLIPSE";
"Marker200" setMarkerSize [2500,2500];
 _markerText = createMarker ["MarkerText200", _Pos];
"MarkerText200" setMarkerColor "ColorBlack";
"MarkerText200" setMarkerText "HELIWRECK";
"MarkerText200" setMarkerType "mil_warning";
[[3,"<t size='3'><t color='#00FF00'>HELIWRECK</t></t> <br/><t size='1.5'>A helicopter wreck site has been spotted, check the area for <t color='#FFFF00'> crates of lost cargo</t>. Check your map</t>"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;