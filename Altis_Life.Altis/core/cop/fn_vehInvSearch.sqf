#include <macro.h>
/*
	File: fn_vehInvSearch.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Searches the vehicle for illegal items.
*/
private["_vehicle","_vehicleInfo","_value","_list"];
_vehicle = cursorTarget;
_list = ["Air","Ship","LandVehicle"];
if(isNull _vehicle OR {!(KINDOF_ARRAY(_vehicle,_list))}) exitWith {};

_vehicleInfo = _vehicle GVAR ["Trunk",[]];
if(EQUAL(count _vehicleInfo,0)) exitWith {hint localize "STR_Cop_VehEmpty"};

_value = 0;
{
	_var = configName(_x);
	_val = ITEM_VALUE(_var);
	
	if(_val > 0) then {
		_inv pushBack [_var,_val];
		[false,_var,_val] call life_fnc_handleInv;
	};
} foreach ("getNumber(_x >> 'illegal') isEqualTo 1" configClasses (missionConfigFile >> "VirtualItems"));

if(_value > 0) then {
	[[0,"STR_NOTF_VehContraband",true,[[_value] call life_fnc_numberText]],"life_fnc_broadcast",true,false] call life_fnc_MP;
	ADD(BANK,_value);
	_vehicle SVAR ["Trunk",[],true];
} else {
	hint localize "STR_Cop_NoIllegalVeh";
};