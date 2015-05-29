#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Something about being a quitter.
*/
private["_unit","_unitID","_members","_action","_index"];
disableSerialization;

if(EQUAL((lbCurSel 2621),-1)) exitWith {hint localize "STR_GNOTF_TransferSelect"};
_unit = call compile format["%1",CONTROL_DATA(2621)];
_unitID = _unit select 0;


//if(isNull _unit) exitWith {}; //Bad unit?
if(_unitID == getPlayerUID player) exitWith {hint localize "STR_GNOTF_TransferSelf"};

_action = [
	format[localize "STR_GNOTF_TransferMSG",_unit select 1],
	localize "STR_Gang_Transfer",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(_action) then {
	if(EQUAL(_unitID,"")) exitWith {hint "Bad UID?"}; //Unlikely?
	life_gangowner = _unitID;
	[[life_gangid,life_gangowner,-1,[]],"life_fnc_updateGangInfo",true,true] spawn life_fnc_MP;
} else {
	hint localize "STR_GNOTF_TransferCancel";
};
[] call life_fnc_gangMenu;