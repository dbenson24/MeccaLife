/*
    File fn_lowerCenter.sqf
    
    Author: Derek
    
    Description: Lowers the center of mass on the SUV to account for shitty Arma
    
*/
private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

_mass = getCenterOfMass  _vehicle;
_z = _mass select 2;
_z = _z - 0.1;
_mass set [2,_z];
_vehicle setCenterOfMass _mass;