#include "\life_server\script_macros.hpp"
/*
	BLAH BLAH
	I LOVE NOTEPAD++ GET OVER IT
	BLAH!*
*/
private["_house","_houseID","_containers","_query","_housePos"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house) exitWith {};
_houseID = _house getVariable["house_id",-1];

_containers = _house getVariable ["containers",[]];

//systemChat format["Number of containers found: %1",count _containers];
_arr = [];
{
	_className = typeOf _x;
	_weapons = getWeaponCargo _x;
	_magazines = getMagazineCargo _x;
	_items = getItemCargo _x;
	_backpacks = getBackpackCargo _x;
	
	_arr pushBack [_className,[_weapons,_magazines,_items,_backpacks]];
} foreach _containers;


if(EQUAL(_houseID,-1)) then {
	_housePos = getPosATL _house;
	_query = format["houseUpdateContainer2:%1:%2",_arr,_housePos];
	
} else {
	_query = format["houseUpdateContainer:%1:%2",_arr,_houseID];
};
waitUntil{!DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;
//systemChat "Query ran?";