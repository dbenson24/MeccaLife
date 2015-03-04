/*
	file: fn_s_onSliderChange.sqf
*/

private["_mode","_value"];
_mode = [_this,0,-1,[0]] call BIS_fnc_param;
_value = [_this,1,-1,[0]] call BIS_fnc_param;
if(_mode == -1 OR _value == -1) exitWith {};
disableSerialization;

switch (_mode) do
{
	case 0:
	{
		mecca_foot = round(_value);
		ctrlSetText[68181,format["%1",round(_value)]];
		[] call life_fnc_updateViewDistance;
	};
	
	case 1:
	{
		mecca_car = round(_value);
		ctrlSetText[68191,format["%1",round(_value)]];
		[] call life_fnc_updateViewDistance;
	};
	
	case 2:
	{
		mecca_air = round(_value);
		ctrlSetText[68201,format["%1",round(_value)]];
		[] call life_fnc_updateViewDistance;
	};
};