/*
	File: fn_custominteraction.sqf
*/

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8"];
createDialog "custominteraction_menu";
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {hint "Wrong target!"; closeDialog 0;}; //Bad target
if(!isPlayer _curTarget) exitWith {hint "Cannot perform this action!"; closeDialog 0;}; //Bad side check?

_display = findDisplay 66666;
_Btn1 = _display displayCtrl 66668;
_Btn2 = _display displayCtrl 66669;
_Btn3 = _display displayCtrl 66670;
_Btn4 = _display displayCtrl 66671;
_Btn5 = _display DisplayCtrl 66672;
_Btn6 = _display DisplayCtrl 66673;
_Btn7 = _display DisplayCtrl 66674;
_Btn8 = _display DisplayCtrl 66675;
life_pInact_curTarget = _curTarget;

_Btn1 ctrlSetText "Seize Radio";
_Btn1 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_seizeRadio;";