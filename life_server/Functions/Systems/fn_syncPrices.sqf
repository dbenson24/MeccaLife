#include "\life_server\script_macros.hpp"
private["_market"];
/*
File: fn_syncPrices.sqf
Author: Derek Benson

Description:
refreshes the SQL database with the new sell prices
*/

while {true} do {

    _market = missionNamespace getVariable "marketPrices";
    
    if (isNil "_market") then {
        [] call TON_fnc_loadPrices;
        _market = missionNamespace getVariable "marketPrices";
    };
    
    _goods = [];
    
    {
        if (SEL(_x,6) != 0) then {
            _name = format["%1price",SEL(_x,0)];
            _price = missionNamespace getVariable _name;
            _goods pushBack [SEL(_price,0),SEL(_price,2)];
        };
    } forEach _market;
    
    {
        _name = SEL(_x,0);
        _price = SEL(_x,1);
        _query = format["syncPrices:%1:%2",_price,_name];
        
        waitUntil{sleep (random 0.3); !DB_Async_Active};
        _tickTime = diag_tickTime;
        [_query,1] call DB_fnc_asyncCall;
        
    } forEach _goods;
    
    [] spawn TON_fnc_loadPrices;
    sleep (60*5);
};