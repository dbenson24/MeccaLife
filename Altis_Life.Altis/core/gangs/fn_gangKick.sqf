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
_members = life_gangmembers;
if(isNil "_members") exitWith {};
if(!(EQUAL(typeName _members,"ARRAY"))) exitWith {};

{
	_uid = _x select 0;
	if (_uid == _unitID) then {
		_members set [_forEachIndex, -1];
	};
} forEach _members;

SUB(_members,[-1]);

life_gangmembers = _members;

{
	if (_unitID == getPlayerUID _x) then {
		[[_x,life_ganggroup],"TON_fnc_clientGangKick",_x,false] call life_fnc_MP; //Boot that bitch!	
	};
} forEach playableUnits;

[[life_gangid,-1,-1,life_gangmembers],"life_fnc_updateGangInfo",true,true] spawn life_fnc_MP;
[] call life_fnc_gangMenu;