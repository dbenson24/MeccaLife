/*
	Author: Bryan "Tonic" Boardwine

	Description:
	WHAT THE HELL DO YOU THINK IT DOES?!?!!??!?!!?!??!
*/
private["_queryResult","_query","_count"];
waitUntil{!DB_Async_Active};
_count = (["housingCount",2] call DB_fnc_asyncCall) select 0;

for [{_x=0},{_x<=_count},{_x=_x+10}] do {
	waitUntil{!DB_Async_Active};
	_query = format["housingInit:%1",_x];
	_queryResult = [_query,2,true] call DB_fnc_asyncCall;
	
	/*if((EQUAL(EXTDB_SETTINGS("MySQL_Query"),1))) then {
		["diag_log",[
			"------------- initHouses Request -------------",
			format["QUERY: %1",_query],
			format["Result: %1",_queryResult],
			"-------------------------------------------------"
		]] call TON_fnc_logIt;
	};*/
	
	if(count _queryResult == 0) exitWith {};
	{
		_pos = call compile format["%1",_x select 2];
		_house = nearestBuilding _pos;
		_house setVariable["house_owner",[_x select 1,_x select 3],true];
		_house setVariable["house_id",_x select 0,true];
		_house setVariable["locked",true,true]; //Lock up all the stuff.
		_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
		for "_i" from 1 to _numOfDoors do {
			_house setVariable[format["bis_disabled_Door_%1",_i],1,true];
		};
	} foreach _queryResult;
};