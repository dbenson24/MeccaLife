_cash = _this select 0;
_query = format["SELECT laws FROM goverment WHERE id='3'"];
waitUntil{sleep (random 0.3); !DB_Async_Active};
_queryResult = [_query,2] call DB_fnc_asyncCall;
diag_log format ["%1",_queryResult];
_cashCur = call compileFinal (_queryResult select 0);

_cashCur = _cashCur + _cash;
diag_log ["%1",_cashCur];
_query = format["UPDATE goverment SET laws='%1' WHERE id='3'",[_cashCur] call DB_fnc_numberSafe];
[_query,1] call DB_fnc_asyncCall;