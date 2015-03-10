#include "\life_server\script_macros.hpp"
/*
File: fn_Ajustprices.sqf
Author: worldtrade1101

Description:
Sends a request to update and adjust the price of stuff in the DB.
*/


//[[0,player,life_shop_type,_amount,_price,_var],"TON_fnc_Adjustprices",false,false] spawn life_fnc_MP;
private["_type","_side","_data","_unit","_ret","_tickTime","_queryResult","_var","_price","_amount","_market","_factor","_good","_itemArray","_priceChanges","_delay"];
_type = [_this,0,0,[0]] call BIS_fnc_param;
_unit = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_data = [_this,2,"",[""]] call BIS_fnc_param;
_amount = [_this,3,0,[0]] call BIS_fnc_param;
_price = [_this,4,0,[0]] call BIS_fnc_param;
_var = [_this,5,"",[""]] call BIS_fnc_param;

_delay = 2*60 + random(12);
sleep _delay;
//Error checks

diag_log format ["%1   %2    %3    %4      %5      %6",_unit,_type,_data,_amount,_price,_var];
if( (_data == "") OR (isNull _unit)) exitWith
{
diag_log "data ou type ou unit null";
};

_unit = owner _unit; //for hack purpose!

_market = missionNamespace getVariable "marketPrices";

_good = missionNamespace getVariable format["%1price",_var];
_itemArray = [];
//we check the factor of the object

_factor = SEL(_good, 6);

if (_factor == 0) exitwith {};//the factor 0 is not a real group

/* Randomizes when changes hit the market */

{
    if(SEL(_x,1) == _factor) then {
        _name = format["%1price",SEL(_x,0)];
        _itemArray pushBack (missionNamespace getVariable _name);
    };
} forEach _market;

_sellingfactor =((count _itemArray)-1);


{
    _ressource = _x select 0;
    _buyprice =  (_x select 1);
    _sellprice =  (_x select 2);
    _varprice =  (_x select 3);
    _minprice = (_x select 4);
    _maxprice = (_x select 5);
    
    if (_ressource == _var) then { 
        if (_type == 0) then { 
            if ((_sellprice - (_varprice * _amount * _sellingfactor)) > _minprice) then {
                _sellprice = _sellprice - (_varprice * _amount * _sellingfactor);
            } else {
                _sellprice = _minprice;
            };
            if (_buyprice != 0) then {
                if ((_sellprice >= _buyprice)) then {
                    _buyprice=_sellprice + 15;
                };
            };
        };
    } else {
        if (_type == 0) then {
            if ((_sellprice + (_varprice * _amount)) < _maxprice) then {
                _sellprice = _sellprice + (_varprice * _amount);
            } else {
                _sellprice = _maxprice;
            };
        
        };
    };
    _x set [2, _sellprice];
    _name = format["%1price",SEL(_x,0)];
    missionNamespace setVariable [_name,_x];
} forEach _itemArray;

