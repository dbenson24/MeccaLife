/*
	radar.sqf
*/ 
private ["_speed","_vehicle", "_targets", "_validtargets", "_data", "_owner", "_ownerschecked", "_targetveh", "_vehicleName"];
if((playerSide != west) OR  !(vehicle player != player)) exitWith {}; //if player not cop or not in vehicle, leave.
_vehicle = vehicle player;
if(isNull _vehicle) exitWith {};
if(!((typeOf _vehicle) in ["C_Offroad_01_F","C_SUV_01_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","B_MRAP_01_F"])) exitWith {}; 
if(count (crew (_vehicle)) == 0) exitWith {};
if(!alive _vehicle) exitWith {};

[[player, "RadarBleeps",10],"life_fnc_playSound",true,false] spawn life_fnc_MP;

_targets = nearestObjects [_vehicle, ["Car"], 50];
_validtargets = [];
{if (alive _x) then {_validtargets set [(count _validtargets),_x];};} foreach _targets;
//all alive (valid) targets are now in _validtargets array, with luck!

if(count _validtargets < 2) exitWith {hint parseText "<t color='#5882FA'><t size='2'>ANPR Target</t></t><br/><t color='#ff00ff'><t size='1'>Nothing in Range</t></t>"};

_targetveh = (_validtargets select 1);

_speed = round speed (_targetveh);

_owner =[];

if(isNil {_owner}) then {_info = _info + format ["<br/><t color='#FFD700'><t size='1.5'><t align='center'>Owner:<br/><t color='#33CC33'><t align='center'><t size='1.8'> NOT FOUND!"];
}else{_info = _info + format ["<br/><t color='#5A80EB'><t size='1.5'><t align='center'>Owner:<br/><t color='#33CC33'><t align='center'><t size='1'> %1", _owner];};

_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _targetveh) >> "displayName");

_data = format["<t color='#5882FA'><t size='2'>ANPR Target</t></t><br/><t color='#ff00ff'><t size='1'>Type: %1</t></t><br/><t color='#ffffff'><t size='1.5'>Owner(s):</t></t><br/>%2<br/>", _vehicleName, _data];

//systemchat "ANPR owner lookup completed ok";

switch (true) do 
{
	case ((_speed > 50 && _speed <= 110)): 
	{	
		_data = _data + format["<t color='#5882FA'><t size='2'><t align='center'>Radar<br/><t color='#FFFF00'><t align='center'><t size='1'>Vehicle Speed %1 km/h",round _speed]; //amber
	};
	
	case ((_speed > 110)): 
	{	
		_data = _data + format["<t color='#5882FA'><t size='2'><t align='center'>Radar<br/><t color='#FF0000'><t align='center'><t size='1'>Vehicle Speed %1 km/h",round _speed]; //red
	};
	
	default
	{
		_data = _data + format["<t color='#5882FA'><t size='2'><t align='center'>Radar<br/><t color='#00FF00'><t align='center'><t size='1'>Vehicle Speed %1 km/h",round _speed]; //green
	};
};


hint parseText _data;