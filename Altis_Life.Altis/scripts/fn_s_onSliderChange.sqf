/*/////////////////////////////////////////|//////////
//_______________________////////////////__|__////////
/|Made for ZoXXen.com    |/////////////____|____//////
/|Author:GamerDF         |///////////______|______////
/|Description: too lazy  |/////////////____|____//////
/|_______________________|///////////////  |  ////////
*////////////////////////////////////////~~|~~////////

private["_mode","_value"];
_mode = [_this,0,-1,[0]] call BIS_fnc_param;
_value = [_this,1,-1,[0]] call BIS_fnc_param;
if(_mode == -1 OR _value == -1) exitWith {};
disableSerialization;

switch (_mode) do
{
	case 0:
	{
		zoXXen_foot = round(_value);
		ctrlSetText[68181,format["%1",round(_value)]];
		[] call life_fnc_updateViewDistance;
	};
	
	case 1:
	{
		zoXXen_car = round(_value);
		ctrlSetText[68191,format["%1",round(_value)]];
		[] call life_fnc_updateViewDistance;
	};
	
	case 2:
	{
		zoXXen_air = round(_value);
		ctrlSetText[68201,format["%1",round(_value)]];
		[] call life_fnc_updateViewDistance;
	};
};