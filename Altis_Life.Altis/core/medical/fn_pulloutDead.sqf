/*
    File: fn_pulloutDead.sqf
    Author: Derek

    Description:
    Pulls dead bodies out of vehicles for medics to revive them.

*/
private["_veh","_vehPos","_posDriver","_posCommander","_posCargo","_posDriverExit","_posCommanderExit","_posCargoExit","_deadPos","_deadExitPos","_driverExitOffset"];
_veh = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if (isNull(_veh)) exitWith {};

_vehPos = getPos _veh;

_posDriverExit = _veh selectionPosition ("pos driver");
_posCommanderExit = _veh selectionPosition ("pos codriver");
_posCargoExit = _veh selectionPosition ("pos driver");

_posDriver = (driver _veh) worldToModel _vehPos;
_posCommander = (commander _veh) worldToModel _vehPos;
_posCargo = ((crew _veh ) select 0) worldToModel _vehPos;

_driverExitOffset = (_posDriverExit select 0) - (_posDriver select 0);

{
    if !(alive _x) then
    {
        _deadPos = _x worldToModel _vehPos;
        if ((_deadPos select 0) > 0) then
        {
            _deadPos set [0, (_deadPos select 0) + (abs _driverExitOffset)];
        }else
        {
            _deadPos set [0, (_deadPos select 0) + (_driverExitOffset)];
        };
        _deadExitPos = _x modelToWorld _deadPos;
        _deadExitPos set [1, (getPos _x) select 1];
        _x setPos _deadExitPos;
    };
} forEach (crew _veh);