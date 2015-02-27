#include "\life_server\script_macros.hpp"
/*
	Author: Derek Benson
	
	Description:
	Queries the database to get the list of members
*/
private["_query","_queryResult"];
_name = [_this,0,"",[[]]] call BIS_fnc_param;
_query = format["SELECT members FROM gangs WHERE name = %1",%1];
waitUntil{!DB_Async_Active};
_queryResult = [_query,2,true] call DB_fnc_asyncCall;

["diag_log",[
		"------------- Client Query Request -------------",
		format["QUERY: %1",_query],
		format["Result: %1",_queryResult],
		"------------------------------------------------"
	]] call TON_fnc_logIt;
	
_queryResult;