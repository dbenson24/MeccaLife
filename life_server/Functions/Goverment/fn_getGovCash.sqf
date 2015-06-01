_caller = _this select 0;
_query = format["SELECT laws FROM goverment WHERE id='3'"];
waitUntil{sleep (random 0.3); !DB_Async_Active};
_queryResult = [_query,2] call DB_fnc_asyncCall;
_cash = call compileFinal (_queryResult select 0);
[[4,_cash],"life_fnc_recievedCall",_caller,false] spawn life_fnc_mp;