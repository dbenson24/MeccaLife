/*
	File: fn_p_prisionbreak.sqf
*/
private["_shop","_display","_list","_array","_units","_Btn1","_unit"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
disableSerialization;
if(player distance _shop > 2) exitWith {hint format ["You need to stay closer!"];};

createDialog "life_prision_list";
_display = findDisplay 8100;
_list = _display displayCtrl 8101;
lbClear _list;
ctrlSetText[8104,"Hacking system..."];
[[_shop],"life_fnc_bankalarmsound",true,true] call life_fnc_MP;
[[4, format["%1 is hacking into Mecca Central Criminal Database [M.C.C.D] to break prisoners out of the jail!", name player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
_list = _display displayctrl 8101;
_units = [];
{
	if(side _x == civilian) then {_units pushBack _x;};
} forEach nearestObjects [getMarkerPos "jail_marker",["Man"],15]; 
// 15 = distance from jail_marker
// this adds all the prisioners around the jail_marker within 15 meters

{
	_temp = format["%1", _x];
	if(["civ", _temp, false] call BIS_fnc_inString) then {
	_list lbAdd format["%1", (_x getVariable["realname",name _x])];
	_list lbSetData [(lbSize _list)-1,str(_x)];
	};
} forEach _units;
ctrlSetText[8104,"Connected to system..."];
[[4, format["%1 has successfully hacked into the Mecca Central Criminal Database!", name player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

if(((lbSize _list)-1) == -1) then
{
	_list lbAdd "No prisoners...";
};