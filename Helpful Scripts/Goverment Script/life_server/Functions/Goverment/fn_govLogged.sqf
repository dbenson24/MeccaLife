_caller = _this select 0;

_query = format["SELECT laws FROM goverment WHERE id='2'"];
waitUntil{sleep (random 0.3); !DB_Async_Active};
_queryResult = [_query,2] call DB_fnc_asyncCall;
diag_log format ["I AM A PLACEHOLDER: %1",_queryResult];
_pid = _queryResult select 0;
if (typeName _pid == typeName "") then {hint "GOVERMENT:_DATABASEENTRY WAS TYPE OF STRING: CORRECT";};
if (typeName _pid == typeName 0) then {_pid = [_pid] call DB_fnc_numberSafe;};
diag_log format ["User %1 joined, President PID %2",getplayerUID _caller,_pid];
if (getplayerUID _caller == _pid) then {
	[[1],"life_fnc_recievedCall",_caller,false] spawn life_fnc_mp;
};