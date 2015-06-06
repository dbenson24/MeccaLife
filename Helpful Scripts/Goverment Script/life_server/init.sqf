// ADD AT THE VERY BOTTOM

_query = format["SELECT laws FROM goverment WHERE id='4'"];
waitUntil{sleep (random 0.3); !DB_Async_Active};
_queryResult = [_query,2] call DB_fnc_asyncCall;
life_taxes = call compileFinal (_queryResult select 0);
publicVariable "life_taxes";