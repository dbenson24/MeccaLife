#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	32 hours...
*/
private["_unit","_unitID","_members"];
disableSerialization;

if((lbCurSel 2621) == -1) exitWith {hint localize "STR_GNOTF_SelectKick"};
_unit = call compile format["%1",CONTROL_DATA(2621)];
//if(isNull _unit) exitWith {}; //Bad unit?

_unitID = _unit select 0;

if(_unitID == getPlayerUID player) exitWith {hint localize "STR_GNOTF_KickSelf"};
_members = grpPlayer GVAR "gang_members";
if(isNil "_members") exitWith {};
if(!(EQUAL(typeName _members,"ARRAY"))) exitWith {};

{
	_uid = _x select 0;
	if (_uid == _unitID) then {
		_members set [_forEachIndex, -1];
	};
} forEach _members;

SUB(_members,[-1]);

grpPlayer SVAR ["gang_members",_members,true];

{
	if (_unitID == getPlayerUID _x) then {
		[[_x,grpPlayer],"TON_fnc_clientGangKick",_unit,false] call life_fnc_MP; //Boot that bitch!	
	};
} forEach playableUnits;

[[4,grpPlayer],"TON_fnc_updateGang",false,false] call life_fnc_MP; //Update the database.
[] call life_fnc_gangMenu;