/*
	file: fn_onTerrainChange.sqf
*/

private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {};
	
switch (_type) do
{
	case "nothing": {setTerrainGrid 50;};
	case "low": {setTerrainGrid 30;};
	case "normal": {setTerrainGrid 12.5;};
	case "high": {setTerrainGrid 3.125;};
};