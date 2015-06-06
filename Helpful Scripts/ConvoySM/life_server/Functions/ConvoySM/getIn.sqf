/*
#####################   CONVOY SIDEMISSION  #####################
### AUTHOR: RYAN TT.                                          ###
### STEAM: www.steamcommunity.com/id/ryanthett                ###
###                                                           ###
### DISCLAIMER: THIS SCRIPT CAN BE USED ON EVERY SERVER ONLY  ###
###             WITH THIS HEADER / NOTIFICATION               ###
#################################################################
*/

private ["_Vehicles","_unit","_VehiclesPos","_aliveAllVehicles","_c","_eDriver","_eGunner","_eCargo"];

_Vehicles = _this select 0;
_unit = _this select 1;
_VehiclesPos = _this select 2;
_aliveAllVehicles = _this select 3;
_c = -1;

_unit doMove getPos _Vehicles; 

while {(_unit distance _Vehicles) > 10 && !(_unit getVariable "ConvoySM_convoy_restart")} do
{	
	_c = _c + 1;
	if (_c == 5) then {_c = 0; _unit doMove getPos _Vehicles}; 
	sleep 2;
};

if (_unit getVariable "ConvoySM_convoy_restart") exitWith {_unit doFollow (_aliveAllVehicles select 0)};

[_unit] allowGetIn true;
if ("driver" in _VehiclesPos && _unit == (_Vehicles getVariable "ConvoySM_Convoy_Driver")) then {_unit assignAsDriver _Vehicles; [_unit] orderGetIn true};
if ("cargo" in _VehiclesPos)  then {_unit assignAsCargo _Vehicles; [_unit] orderGetIn true};
if ("gunner" in _VehiclesPos && _unit == (_Vehicles getVariable "ConvoySM_Convoy_Gunner"))  then {_unit assignAsGunner _Vehicles; [_unit] orderGetIn true};

sleep 30;

if (vehicle _unit != _unit) exitWith {};
for [{ _loop = 0 },{ _loop < count  _aliveAllVehicles},{ _loop = _loop + 1}] do
{	
	_Vehicles = _aliveAllVehicles select _loop;
	while {!(_Vehicles getVariable "ConvoySM_convoy_allIn")} do {sleep 1};
	sleep (random 5);
	_eDriver  = _Vehicles emptyPositions "Driver";
	_eGunner  = _Vehicles emptyPositions "Gunner";
	_eCargo	  = _Vehicles emptyPositions "Cargo";
	if (_eDriver > 0 || _eGunner > 0 || _eCargo > 0) then 
	{
		if (_eDriver == 1) then {[_Vehicles, _unit, ["driver"],_aliveAllVehicles] spawn ConvoySM_getIn};
		if (_eDriver == 0 && _eGunner == 1) then {[_Vehicles, _unit, ["gunner"],_aliveAllVehicles] spawn ConvoySM_getIn};
		if (_eDriver == 0 && _eGunner == 0 && _eCargo > 0) then {[_Vehicles, _unit, ["cargo"],_aliveAllVehicles] spawn ConvoySM_getIn};
	};
	sleep 0.1;
};
if(true) exitWith {};