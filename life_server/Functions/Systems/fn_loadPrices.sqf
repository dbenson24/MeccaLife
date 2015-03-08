#include "\life_server\script_macros.hpp"
/*
File: fn_loadPrices.sqf
Author: Derek Benson

Description:
Loads the SQL database into the economy variable: marketPrices and dynamically
created variables for each good.
*/
//private["_marketPrices"];
_query = format["loadPrices"];

waitUntil{sleep (random 0.3); !DB_Async_Active};
_tickTime = diag_tickTime;
_queryResult = [_query,2,true] call DB_fnc_asyncCall;

if((EQUAL(EXTDB_SETTINGS("MySQL_Query"),1))) then {
	["diag_log",[
		"------------- Load Prices Request -------------",
		format["QUERY: %1",_query],
		format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)],
		format["Result: %1",_queryResult],
		"-------------------------------------------------"
	]] call TON_fnc_logIt;
};
_marketPrices = [];

{
    _marketPrices pushBack [SEL(_x,0),SEL(_x,6),SEL(_x,7)];
    _name = format["%1price",SEL(_x,0)];
    missionNamespace setVariable [_name, _x];
} forEach _queryResult;

missionNamespace setVariable ["marketPrices", _marketPrices];