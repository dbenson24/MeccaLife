#include "\life_server\script_macros.hpp"
/*
    Author: Derek
    
    File: fn_blowSafe.sqf

    Description: Handles the explosion of a blasting charge
    
*/
private["_safe","_delay","_numbars","_bomb","_units"];
_safe=[_this,0,"",[""]] call BIS_fnc_param;
_delay=[_this,1,0,[0]] call BIS_fnc_param;

switch (_safe) do {
    case "fed" : 
    {
        sleep(_delay*60+1);
        if(!(fed_bank getVariable["chargeplaced",false])) exitWith {};
        _bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL fed_bank select 0, getPosATL fed_bank select 1, (getPosATL fed_bank select 2)+0.5];
        fed_bank setVariable["chargeplaced",false,true];
        fed_bank setVariable["safe_open",true,true];
        _units = count playableUnits;
        _numbars = round(_units + random(3*_units));
        if (_numbars < 20) then {
        	_numbars = 20;
        };
        fed_bank setVariable["safe",_numbars,true];
        fed_bank setVariable["lastrobbery",time,true];
    };
};