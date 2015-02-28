/*
	File: fn_vUseItem.sqf
*/
private["_display","_curTarget","_Btn1","_Btn2"];
if(!dialog) then {
	createDialog "vUseItem_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target

_display = findDisplay 555555;
_Btn1 = _display displayCtrl 55557;
_Btn2 = _display displayCtrl 55558;
life_pInact_curTarget = _curTarget;




//Lockpick Action
_Btn1 ctrlSetText localize "STR_vInAct_Lockpick";
_Btn1 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_lockpick; closeDialog 0;";


if(life_inv_lockpick > 0) then
{
    _Btn1 ctrlEnable true;
} else {
    _Btn1 ctrlEnable false;
};





//Refuel Action
_Btn2 ctrlSetText localize "STR_vInAct_JerryRefuel";
_Btn2 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_jerryRefuel; closeDialog 0;";


if(life_inv_fuelFull > 0) then
{
    _Btn2 ctrlEnable true;
} else {
    _Btn2 ctrlEnable false;
};
