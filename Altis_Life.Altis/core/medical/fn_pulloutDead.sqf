/*
    File: fn_pulloutDead.sqf
    Author: Derek

    Description:
    Pulls dead bodies out of vehicles for medics to revive them.

*/
private["_veh"];
_veh = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if (isNull(_veh)) exitWith {};

{
    if !(alive _x) then
    {
        moveOut _x;
    };
} forEach (crew _veh);