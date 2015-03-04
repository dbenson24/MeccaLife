/*
	@file Version: 1.0.0.0
	@file Author: RYN_Ryan
	@file edit: 20.01.2015
	Copyright © 2015 Ryan Torzynski, All rights reserved
	All servers are allowed to use this code, modify and publish it. Every modified release of this script must contain "Original by RTT"!
*/

schiffsw_obj_arr = ["Land_Wreck_Traw_F","Land_Wreck_Traw2_F"];

//########################## CONFIGURATION ##########################

schiffsw_chance = 100;
schiffsw_positions = [[4462.89,6515.78,-2.19486],[5391.75,25136.2,-1.98308],[25323.2,27886.6,-2.15125]];
_schiffsw_time_interval = [1,5]; //Time given in hours, this is the interval in which the airdrop should take place
schiffsw_loot_array = [["apple",20],["peach",20]];
schiffsw_loot_amount = 1;

//######################## CONFIGURATION END ########################

// Do not modify the following code

schiffsw_time_min = _schiffsw_time_interval select 0;
schiffsw_time_max = _schiffsw_time_interval select 1;
schiffsw_time_min = schiffsw_time_min*3600;
schiffsw_time_max = schiffsw_time_max*3600;

if (schiffsw_time_min>=schiffsw_time_max OR count schiffsw_loot_array < schiffsw_loot_amount) exitWith {schiffsw_enable=false;};
schiffsw_enable=true;

sleep 1;

if (!schiffsw_enable) exitWith {};

_chance = floor(random 100);
if (_chance>schiffsw_chance) exitWith {};
_toWait = (random (schiffsw_time_max - schiffsw_time_min)) + schiffsw_time_min;
sleep _toWait;

// schiffsw STARTEN
[[5,"<br/><t align='center'><t size='6'><img image='textures\schiffswheader.paa'/></t></t><br/><br/><t size='1.4'><t color='#A5DF00'>SCHIFFSWRACK</t></t><br/><br/><t size='1'>Ein Schiff ist vor der Kueste Altis gestrandet! Die Suchradius ist auf deiner Karte eingezeichnet worden! Das Wrack wird in 60 Minuten selbststaendig geloescht! Viel Gluekc!</t>"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
_poses = count schiffsw_positions;
_inArr = floor(random _poses);
_dest = schiffsw_positions select _inArr;

sleep 5;

_marker = createMarker ["schiffswmarker", _dest];
"schiffswmarker" setMarkerColor "ColorGreen";
"schiffswmarker" setMarkerType "Empty";
"schiffswmarker" setMarkerShape "ELLIPSE";
"schiffswmarker" setMarkerSize [500,500];
_markerText = createMarker ["schiffswmarkertext", _dest];
"schiffswmarkertext" setMarkerColor "ColorBlack";
"schiffswmarkertext" setMarkerText "Schiffswrack";
"schiffswmarkertext" setMarkerType "mil_warning";

"schiffswmarker" setMarkerAlpha 0.3;

// DAS WRACK SPAWNEN

_type = "";
_chance = floor(random 2);
if (_chance==1) then {_type = "Land_Wreck_Traw_F"} else {_type = "Land_Wreck_Traw2_F"};

_xPOS = floor(random 400);
_yPOS = floor(random 400);

_dasWrack = createVehicle [_type, [(_dest select 0)+_xPOS,(_dest select 1)+_yPOS,0], [], 0, "CAN_COLLIDE"];
_dasWrack allowDamage false;
_dasWrack enableSimulation false;
_dasWrack setVariable ["trunk_in_use",false,true];

// RANDOM LOOT EINFÜHREN

_lootAmount = schiffsw_loot_amount;
_lootArray = schiffsw_loot_array;
_lootTempToAdd = [];
_lootArrayFinal = [];

while {_lootAmount>0} do {
	_lootAmount = _lootAmount - 1;
	_loot_inArr = count _lootArray;
	_inArr = floor(random _loot_inArr);
	_lootTempToAdd = _lootArray select _inArr;
	_lootArrayFinal = _lootArrayFinal + [_lootTempToAdd];
};

_dasWrack setVariable ["Trunk",[_lootArrayFinal,500],true];

sleep 3600;

[[5,"<br/><t align='center'><t size='6'><img image='textures\schiffswheader.paa'/></t></t><br/><br/><t size='1.4'><t color='#A5DF00'>SCHIFFSWRACK</t></t><br/><br/><t size='1'>Das Schiffswrack wurde geborgen und die Mission somit beendet!</t>"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;