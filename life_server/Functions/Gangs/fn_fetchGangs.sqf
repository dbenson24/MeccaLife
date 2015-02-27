#include "\life_server\script_macros.hpp"
/*
	Author: Derek Benson
	
	Description:
	Queries the database and creates the gang_list array
*/
private["_query","_queryResult"];

_query = format["SELECT id, owner, name, maxmembers, bank, members FROM gangs WHERE active=1"];
waitUntil{!DB_Async_Active};
_queryResult = [_query,2] call DB_fnc_asyncCall;

["diag_log",[
		"------------- Client Query Request -------------",
		format["QUERY: %1",_query],
		format["Result: %1",_queryResult],
		"------------------------------------------------"
	]] call TON_fnc_logIt;

missionNamespace setVariable ["gang_list",[]];

{
	gang_list pushBack _x;
}forEach _queryResult;

publicVariable "gang_list";