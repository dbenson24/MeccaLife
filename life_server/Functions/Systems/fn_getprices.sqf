#include "\life_server\script_macros.hpp"
/*
File: fn_getPrices.sqf
Author: Worldtrade1101

Description:
Send a query to retrieve the price of stuff on the server
*/
private["_type","_side","_data","_unit","_ret","_tickTime","_queryResult","_market","_shoptype","_priceArray"];
_type = [_this,0,0,[0]] call BIS_fnc_param;
_unit = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_data= [_this,2,"",[""]] call BIS_fnc_param;


//Error checks

diag_log format ["%1   %2    %3",_unit,_type,_data];
if( (_data == "") OR (isNull _unit)) exitWith
{

diag_log "data ou type ou unit null";

};

_unit = owner _unit;

_market = missionNamespace getVariable "marketPrices";

_itemArray = [];
_factor = [];
_shoptype = [];
_shoptype pushBack _data;

_query = switch (_data) do {



//case "market" :{ format["SELECT ressource, buyprice, sellprice FROM economy WHERE shoptype='%1' ",_data];};
//case "drugdealer" :{ format["SELECT ressource, buyprice, sellprice FROM economy WHERE shoptype='%1' ",_data];};
case "rebel" :{ 
    _shoptype pushBack "market";
    _shoptype pushBack "vigilante";};
//    format["SELECT ressource, buyprice, sellprice FROM economy WHERE shoptype='%1' OR shoptype='market' OR shoptype='vigilante'",_data];};
//case "fishmarket" :{ format["SELECT ressource, buyprice, sellprice FROM economy WHERE shoptype='%1' ",_data];};
//case "wongs" :{ format["SELECT ressource, buyprice, sellprice FROM economy WHERE shoptype='%1' ",_data];};
//case "oil" :{ format["SELECT ressource, buyprice, sellprice FROM economy WHERE shoptype='%1' ",_data];};
case "cop" :{ 
    _shoptype pushBack "market";
    _shoptype pushBack "coffee";
};

//    format["SELECT ressource, buyprice, sellprice FROM economy WHERE shoptype='%1' OR shoptype='market'",_data];};
//case "diamond" :{ format["SELECT ressource, buyprice, sellprice FROM economy WHERE shoptype='%1' ",_data];};
//case "iron" :{ format["SELECT ressource, buyprice, sellprice FROM economy WHERE shoptype='%1' ",_data];};
//case "glass" :{ format["SELECT ressource, buyprice, sellprice FROM economy WHERE shoptype='%1' ",_data];};
//case "salt" :{ format["SELECT ressource, buyprice, sellprice FROM economy WHERE shoptype='%1' ",_data];};
//case "cement" :{ format["SELECT ressource, buyprice, sellprice FROM economy WHERE shoptype='%1' ",_data];};
//case "gold" :{ format["SELECT ressource, buyprice, sellprice FROM economy WHERE shoptype='%1' ",_data];};
case "gang" :{ 
    _shoptype pushBack "rebel";
    _shoptype pushBack "market";};    
//    format["SELECT ressource, buyprice, sellprice FROM economy WHERE shoptype='rebel' OR shoptype='market' ",_data];};
case "economy" :{ 
    _factor = [2,3,4];};
//    format["SELECT ressource, buyprice, sellprice FROM economy WHERE factor=2 OR factor = 3 OR factor = 4",_data];};
case "vigilante" :{ 
    _shoptype pushBack "market";};
//    format["SELECT ressource, buyprice, sellprice FROM economy WHERE shoptype='%1' OR shoptype='market' ",_data];};
default {""};
};

{
    _name = SEL(_x,0);
    _fact = SEL(_x,1);
    _shop = SEL(_x,2);
    if ((_fact in _factor) or (_shop in _shoptype)) then {
        _name = format["%1price",SEL(_x,0)];
        _priceArray = missionNamespace getVariable (_name);
        _itemArray pushBack [SEL(_priceArray,0),SEL(_priceArray,1),SEL(_priceArray,2)];
    };
} forEach _market;



if (_data == "economy") exitwith {[[_type,_itemArray],"life_fnc_virt_updateEconomy",_unit,false] spawn life_fnc_MP;};

[[_type,_itemArray],"life_fnc_virt_updateprice",_unit,false] spawn life_fnc_MP;