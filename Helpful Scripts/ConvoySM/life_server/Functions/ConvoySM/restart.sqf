/*
#####################   CONVOY SIDEMISSION  #####################
### AUTHOR: RYAN TT.                                          ###
### STEAM: www.steamcommunity.com/id/ryanthett                ###
###                                                           ###
### DISCLAIMER: THIS SCRIPT CAN BE USED ON EVERY SERVER ONLY  ###
###             WITH THIS HEADER / NOTIFICATION               ###
#################################################################
*/
private ["_markerArray","_convoyArray","_groups","_restartConvoy","_onboardUnits","_group","_units","_Vehicles","_unit","_VehiclesPosMrkr","_VehiclesPosMrkrPos","_wp","_wp1","_wp2","_loop","_x"];
_markerArray = _this select 0;
_convoyArray = _this select 1;
_groups	= _this select 2;
_restartConvoy = ConvoySM_restartAllow;
_onboardUnits = [];
{_x setBehaviour "SAFE"} forEach _groups;
for [{_loop = 0},{_loop < (count _groups)},{_loop = _loop + 1}] do {
	_group = _groups select _loop;
	if (count units _group > 0) then {
		_units = units _group;
		{unAssignVehicle _x; [_x] allowGetIn false; doStop _x} forEach _units;
		sleep 1;
		_unit = (units _group) select 0;
		_Vehicles = _unit getVariable "ConvoySM_convoyVclPos";
		if (canMove _Vehicles) then {
			_Vehicles lockDriver false;
			_VehiclesPosMrkr = createMarkerLocal [format ["mrkr_%1",_Vehicles],getPos _Vehicles];
			_VehiclesPosMrkr setMarkerTypeLocal "Empty";
			_VehiclesPosMrkrPos = getMarkerPos _VehiclesPosMrkr;
			_wp = _group addWayPoint [_VehiclesPosMrkrPos,20];
			_wp setWaypointType "MOVE";
			_wp setWaypointSpeed "FULL";
			_wp1 = _group addWayPoint [_VehiclesPosMrkrPos,20];
			_wp1 setWaypointType "GETIN NEAREST";
			_wp1 setWaypointSpeed "FULL";
			_wp2 = _group addWayPoint [_VehiclesPosMrkrPos,20];
			_wp2 setWaypointType "HOLD";
			_wp2 setWaypointSpeed "LIMITED";
			{if (alive _x and canMove _x) then {_onboardUnits = _onboardUnits + [_x]}} forEach _units;
			_units allowGetIn true;
		};
	};
	sleep 0.1;
};
_c = count _onboardUnits;
if (_c > 0) then {
	while {_c > 0} do {
		_c = 0;
		{if (vehicle _x == _x) then {_c = _c + 1}} forEach _onboardUnits;
		{doStop _x; _x setSpeedMode "LIMITED"} forEach _convoyArray;
		sleep 3;
	};
};
if (count _convoyArray > 0) then {
	[_markerArray,_convoyArray,_restartConvoy] spawn ConvoySM_move;
};
sleep 5;