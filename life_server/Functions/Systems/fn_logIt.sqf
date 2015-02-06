#include "\life_server\script_macros.hpp"
/*
	Name: Dillon (Itsyuka) Modine-Thuen
	File: fn_logIt.sqf
	Description: Log handler
*/
private["_mode","_message"];
_mode = _this select 0;
_message = _this select 1;

{
	_output = switch(_mode) do {
		case "diag_log": {[0,diag_log _x];};
		case "life_log": {[1,format["1:LIFE_LOG:extDB: %1",_x]];};
		case "query_log": {[1,format["1:QUERY_LOG:extDB: %1",_x]];};
		case "debug_log": {
			if((EQUAL(EXTDB_SETTINGS("LOG"),1))) then {[1,format["1:LOG2:extDB: %1",_x]];} else {[0,diag_log "Debug Mode not enabled in the server side config.cpp"];};
		};
		case "hacker_log": {
			if((EQUAL(EXTDB_SETTINGS("LOG"),1))) then {[1,format["1:HACKER:extDB: %1",_x]];} else {[0,diag_log "Hacker Mode not enabled in the server side config.cpp"];};
		};
		default {[1,format["1:%1:extDB: %2",_mode,_x]];};
	};
	if(EQUAL(SEL(_output,0),1)) then {
		EXTDB SEL(_output,1);
	};
} forEach _message;