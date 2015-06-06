_law = _this select 0;
_query = format["SELECT laws FROM goverment WHERE id='1'"];
waitUntil{sleep (random 0.3); !DB_Async_Active};
_queryResult = [_query,2] call DB_fnc_asyncCall;
_lawsArray = [_queryResult select 0] call DB_fnc_mresToArray;

_lawsArray = _lawsArray - [_law];

_query = format["UPDATE goverment SET laws='%1' WHERE id='1'",[_lawsArray] call DB_fnc_mresArray];
[_query,1] call DB_fnc_asyncCall;
