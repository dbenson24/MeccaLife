/*
#####################   CONVOY SIDEMISSION  #####################
### AUTHOR: RYAN TT.                                          ###
### STEAM: www.steamcommunity.com/id/ryanthett                ###
###                                                           ###
### DISCLAIMER: THIS SCRIPT CAN BE USED ON EVERY SERVER ONLY  ###
###             WITH THIS HEADER / NOTIFICATION               ###
#################################################################
*/
private ["_Vehicles","_markerArray","_convoyArray","_c","_count","_Vehicles2","_Vehicles3","_dir"]; 
_Vehicles 			= _this select 0;
_markerArray 	= _this select 1;
_convoyArray	= _this select 2;
_c 				= _this select 3;
_count 			= count _convoyArray;
_Vehicles2 			= objNull;
_Vehicles3 			= objNull; 
if (!local _Vehicles) exitWith {};
_destinationEnd = _markerArray select ((count _markerArray) -1);
if (_c < (_count -2)) then {_Vehicles2 = _convoyArray select (_c + 1)};
if (_c > 0) then {_Vehicles3 = _convoyArray select (_c - 1)};    		
while {alive _Vehicles && !(_Vehicles getVariable "ConvoySM_convoyDestination")} do { 	
	if (_Vehicles distance getMarkerPos _destinationEnd < 10) then {_Vehicles setVariable ["ConvoySM_convoyDestination",true, false]};
	_aliveConvoy	= [];
	{if (canMove _x && isNull (_x findNearestEnemy (getPos _x))) then {_aliveConvoy = _aliveConvoy + [_x]}} forEach _convoyArray;
	if ((count _aliveConvoy) < _count) exitWith {_Vehicles setVariable ["ConvoySM_convoyDestination",true, false]};
	if (!isNull _Vehicles2) then {	
		if (speed _Vehicles > 50) then {	
			_Vehicles setVelocity [(11 * (sin getDir _Vehicles)), (11 * (cos getDir _Vehicles)), velocity _Vehicles select 2];
		};
		while {_Vehicles distance _Vehicles2 > 60} do {	
			_dir = getDir _Vehicles;
			if (_Vehicles distance _Vehicles2 <= 100) then {
				if (((sin _dir) * (velocity _Vehicles select 0)) > 3) then {_Vehicles setVelocity [(velocity _Vehicles select 0) - (1 * (sin _dir)), (velocity _Vehicles select 1), velocity _Vehicles select 2]};
				if (((cos _dir) * (velocity _Vehicles select 1)) > 3) then {_Vehicles setVelocity [(velocity _Vehicles select 0), (velocity _Vehicles select 1) - (1 * (cos _dir)), velocity _Vehicles select 2]};
			} else {
				if (((sin _dir) * (velocity _Vehicles select 0)) > 1) then {_Vehicles setVelocity [(velocity _Vehicles select 0) - (2 * (sin _dir)), (velocity _Vehicles select 1), velocity _Vehicles select 2]};
				if (((cos _dir) * (velocity _Vehicles select 1)) > 1) then {_Vehicles setVelocity [(velocity _Vehicles select 0), (velocity _Vehicles select 1) - (2 * (cos _dir)), velocity _Vehicles select 2]};
			};
			sleep 0.1;
		};
	};
	if (!isNull _Vehicles3) then	{
		while {_Vehicles distance _Vehicles3 < 40} do {	
			_dir = getDir _Vehicles;
			if (((sin _dir) * (velocity _Vehicles select 0)) > 1) then {_Vehicles setVelocity [(velocity _Vehicles select 0) - (2 * (sin _dir)), (velocity _Vehicles select 1), velocity _Vehicles select 2]};
			if (((cos _dir) * (velocity _Vehicles select 1)) > 1) then {_Vehicles setVelocity [(velocity _Vehicles select 0), (velocity _Vehicles select 1) - (2 * (cos _dir)), velocity _Vehicles select 2]};
			sleep 0.1;
		};
	};
	sleep 0.1;
};
_Vehicles doMove getPos _Vehicles; 
sleep 4;
_dir = getDir _Vehicles;
_Vehicles setVariable ["ConvoySM_convoy_restartPos", [(getPos _Vehicles), (getDir _Vehicles)], false];