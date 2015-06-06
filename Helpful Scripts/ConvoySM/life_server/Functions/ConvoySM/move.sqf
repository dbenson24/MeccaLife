/*
#####################   CONVOY SIDEMISSION  #####################
### AUTHOR: RYAN TT.                                          ###
### STEAM: www.steamcommunity.com/id/ryanthett                ###
###                                                           ###
### DISCLAIMER: THIS SCRIPT CAN BE USED ON EVERY SERVER ONLY  ###
###             WITH THIS HEADER / NOTIFICATION               ###
#################################################################
*/
private ["_Vehicles","_markerArray","_convoyArray","_restartConvoy","_marker","_leadVcl","_groups","_markersRemaining","_aliveConvoy","_b","_c","_x","_convoyVclDestroyed","_loop","_loop1","_unit","_crew"];
_markersRemaining 		 	= _this select 0;
_convoyArray 		 	= _this select 1;
_restartConvoy			= ConvoySM_restartAllow;
_convoyVclDestroyed  	= false;
_marker 			 	= _markersRemaining select 0;
_leadVcl 			 	= _convoyArray select 0;
_groups 			 	= [];
_aliveConvoy 		 	= [];
_b 					 	= 0;
_c 					 	= 0;
{_x setVariable ["ConvoySM_convoyDestination",false,false];
 _x setSpeedMode "LIMITED";
 _x setBehaviour "CARELESS";
 _x doMove (getMarkerPos _marker);
 [_x, _markersRemaining, _convoyArray, _c] spawn ConvoySM_maxSpeed;
 _c = _c + 1;
 _x setVariable ["ConvoySM_convoyMarkers",_markersRemaining, false];
} forEach _convoyArray;
_convoyVclDestroyed = false;
_c = 0;
while {!_convoyVclDestroyed} do {
  {if (!alive _x || !canMove _x || !isNull (_x findNearestEnemy (getPos _x)) || isNull driver _x || (_x getVariable "ConvoySM_convoyDestination")) then {_convoyVclDestroyed = true}} forEach _convoyArray;
	if (_convoyVclDestroyed) exitWith {};
	if (_leadVcl distance getMarkerPos _marker < 50) then {
		sleep 1;
		{_x doMove (getPos _x)} forEach _convoyArray;
		if (_b < (count _markersRemaining - 1)) then {
			_markersRemaining deleteAt 0;;
			_marker = _markersRemaining select 0;
			{_x doMove getMarkerPos _marker} forEach _convoyArray;
			_c = 0;
		};
	} else {
		if (_c == 0) then {
			{_marker = _markersRemaining select 0;_x doMove getMarkerPos _marker} forEach _convoyArray;
		};
	};
	if (_c == 10) then {_c = 0} else {_c = _c + 1};
	sleep 0.5;
};
{if (canMove _x) then {_x setVariable ["ConvoySM_convoyDestination",true,false];_x doMove (getPos _x)}} forEach _convoyArray;
{if (alive _x && canMove _x) then {_aliveConvoy = _aliveConvoy + [_x]}} forEach _convoyArray;
sleep 2;
for [{ _loop = 0 },{ _loop < count  _convoyArray},{ _loop = _loop + 1}] do {
	_Vehicles = _convoyArray select _loop;
	_groups = _groups + [(group _Vehicles)];
	_crew = crew _Vehicles;
	if (alive _Vehicles && !(_Vehicles isKindOf "Tank") && !(_Vehicles isKindOf "Helicopter")) then {
		while {speed _Vehicles > 2} do {sleep 0.5};
		for [{ _loop1 = 0 },{ _loop1 < count _crew},{ _loop1 = _loop1 + 1}] do {
			_unit = _crew select _loop1;
			_unit setVariable ["ConvoySM_convoyVclPos", (assignedVehicle _unit), false];
			if !((group _unit) in _groups) then {_groups = _groups + [(group _unit)]};
			if (_unit != gunner _Vehicles) then {
				_unit action ["GetOut", _Vehicles];
				[_unit] allowGetIn false;
			} else {
				_unit assignAsGunner _Vehicles;
			};
			sleep 0.1;
		};
		_Vehicles lockDriver true;
	};
	sleep 0.1;
};
sleep 1;
{_x setBehaviour "Combat"} forEach _groups;
[_markersRemaining,_aliveConvoy,_groups,_restartConvoy] spawn ConvoySM_attack;