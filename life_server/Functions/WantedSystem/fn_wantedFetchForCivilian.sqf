/*
       fn_wantedFetchForCivilian.sqf
*/
private["_updateBounty","_pid","_result","_queryResult"];
_pid = getPlayerUID player;
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_result = format["SELECT wantedID, wantedName, wantedCrimes, wantedBounty FROM wanted WHERE active='1' AND wantedID='%1'",_pid];
waitUntil{!DB_Async_Active};
_queryResult = [_result,2] call DB_fnc_asyncCall;
_updateBounty = _queryResult select 3;
if(_updateBounty <= 0) exitWith {_updateBounty = 0};
[[_updateBounty],"life_fnc_updateBounty",owner _player,false] spawn life_fnc_MP;