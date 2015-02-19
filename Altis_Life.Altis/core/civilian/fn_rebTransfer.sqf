/*
File: fn_rebTransfer.sqf
*/
private["_val"];
_val = [_this,0,"",["",0]] call BIS_fnc_param;


titleText[format["You have received $%1 for taking a cop down!",[_val] call life_fnc_numberText],"PLAIN"];


life_atmcash = life_atmcash + _val;