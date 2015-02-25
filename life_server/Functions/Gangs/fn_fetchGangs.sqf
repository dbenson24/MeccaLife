#include "\life_server\script_macros.hpp"
/*
	Author: Derek Benson
	
	Description:
	Queries the database and creates the gang_list array
*/
private["_query","_queryResult"];

_query = format["SELECT id, owner, name, maxmembers, bank, members FROM gangs WHERE active='1'"];
waitUntil{!DB_Async_Active};
_queryResult = [_query,2] call DB_fnc_asyncCall;