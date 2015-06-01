_player = _this select 0;
_query = format["SELECT laws FROM goverment WHERE id='1'"];
waitUntil{sleep (random 0.3); !DB_Async_Active};
_queryResult = [_query,2] call DB_fnc_asyncCall;
_lawsArray = [_queryResult select 0] call DB_fnc_mresToArray;
[[3,_lawsArray],"life_fnc_recievedCall",_player,false] spawn life_fnc_mp;