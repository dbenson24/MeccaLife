#include "\life_server\script_macros.hpp"
/*
	Name: Dillon (Itsyuka) Modine-Thuen
	File: fn_logIt.sqf
	Description: Log handler
*/
private["_mode","_message"];
_mode = [_this,0,""] call BIS_fnc_param;
_message = [_this,1,"",[""]] call BIS_fnc_param;

if(_mode == "" OR _message == "") exitWith {};

{
	_output = switch(_mode) do {
		case "diag_log": {[0,diag_log _x];};
		case "spy_log": {[1,format["1:SPY_LOG:SpyGlass: %1",_x]];};
		default {[1,format["1:%1:extDB: %2",_mode,_x]];};
	};
	if(EQUAL(SEL(_output,0),1)) then {
		EXTDB SEL(_output,1);
	};
} forEach _message;