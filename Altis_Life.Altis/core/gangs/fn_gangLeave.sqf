#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	32 hours later...
*/
private["_unitID","_members"];
if(EQUAL(steamid,(life_ganggroup GVAR "gang_owner"))) exitWith {hint localize "STR_GNOTF_LeaderLeave"};
_unitID = getPlayerUID player;
_members = life_ganggroup GVAR "gang_members";
if(isNil "_members") exitWith {};
if(!(EQUAL(typeName _members,"ARRAY"))) exitWith {};

{
	_uid = _x select 0;
	if (_uid == _unitID) then {
		_members set [_forEachIndex, -1];
	};
} forEach _members;

SUB(_members,[-1]);

life_ganggroup SVAR ["gang_members",_members,true];

[player] joinSilent (createGroup civilian);

[[4,life_ganggroup],"TON_fnc_updateGang",false,false] call life_fnc_MP;
life_in_gang = false;
life_ganggroup = ObjNull;
closeDialog 0;