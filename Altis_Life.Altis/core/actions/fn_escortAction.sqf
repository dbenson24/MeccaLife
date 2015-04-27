#include <macro.h>
/*
	File: fn_escortAction.sqf
	Description: Handles picking up a player and putting him on shouler
	Author: Poseidon
	Edited by: Derek
*/
private["_target", "_currwep"];
_target = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
if ((player distance _target > 3)) exitWith {};
if (!isNull(player getVariable["TransportingPlayer", objNull])) exitWith {
    hint "You can only escort one person at a time.";
};
if (isNil "_target"
    OR isNull _target OR!isPlayer _target) exitWith {};
if (_target getVariable["Escorting", false]) exitWith {
    hint "That player is already being escorted by someone.";
};
if (!isNull(_target getVariable["TransportingPlayer", objNull])) exitWith {
    hint "That player is already escorting another player.";
};
if (life_action_inUse) exitWith {
    hint "You're already performing another action.";
};
life_action_inUse = true;
_target setPos((getPos player) vectorAdd(vectorDir player));
_target attachTo[player, [0.3, -0.175, -1.2], "LeftShoulder"];
waitUntil {
    _target in (attachedObjects player)
};
player reveal _target;
/*
[
    [_target, "ainjpfalmstpsnonwrfldf_carried_dead"], "life_fnc_animSync", true, false
] spawn life_fnc_MP;
*/
player setVariable["TransportingPlayer", _target, true];
_target setVariable["Escorting", true, true];
/*
if ((primaryWeapon player) == "") then {
    player addWeapon "Rifle";
    player selectWeapon(primaryWeapon player);
}
else {
    if (currentWeapon player != primaryWeapon player) then {
        player selectWeapon(primaryWeapon player);
    };
};


[
    [player, "acinpercmstpsraswrfldnon"], "life_fnc_animSync", true, false
] spawn life_fnc_MP;
player switchMove "acinpercmstpsraswrfldnon";
player playMoveNow "acinpercmstpsraswrfldnon";
buggy animation */
life_stopEscortAction = player addAction[format["<t color='#DEFF24'>%1</t>", "Stop Escorting"], "player removeAction life_stopEscortAction; life_stopEscortAction = nil;", nil, 20, false, true, "", ""];
waitUntil {
    sleep 0.3;
    _target = (player getVariable["TransportingPlayer", objNull]);
    player setFatigue 0.5;
    ((vehicle player != player) || (player getVariable["surrender", false]) || !(_target getVariable["restrained", false]) || (player getVariable["restrained", false]) || (_target != vehicle _target) || (isNull _target) || !(alive player) || !(alive _target) || (isNil "life_stopEscortAction"))
};
_target = (player getVariable["TransportingPlayer", objNull]);

if (!isNull _target) then {
    detach _target;
    /*
    if (alive _target) then {
        _target setpos(player ModelToWorld[0, 1.9, 0]);
        [
            [_target, ""], "life_fnc_animSync", true, false
        ] spawn life_fnc_MP;
    }; */
    _target setVariable["Escorting", false, true];
};
player setVariable['TransportingPlayer', objNull, true];
if (!isNil "life_stopEscortAction") then {
    player removeAction life_stopEscortAction;
    life_stopEscortAction = nil;
};
/*
if (vehicle player == player) then {
    [
        [player, ""], "life_fnc_animSync", true, false
    ] spawn life_fnc_MP;
    player switchMove "";
};
if ((primaryWeapon player) == "Rifle") then {
    player removeWeapon(primaryWeapon player);
    player selectWeapon(handgunWeapon player);
}
else {
    if ((primaryWeapon player) != "") then {
        player action["SwitchWeapon", player, player, 100];
        _currwep = [primaryWeapon player, primaryWeaponItems player];
        player addMagazine({
                if (_x select 4 == (primaryWeapon player)) exitWith {
                    [_x select 0, _x select 1]
                }
            }
            foreach(magazinesAmmoFull player));
        player removeWeapon(primaryWeapon player);
        player addWeapon(_currwep select 0); {
            if (_x != "") then {
                player addPrimaryWeaponItem _x;
            };
        }
        foreach(_currwep select 1);
        player selectWeapon(primaryWeapon player);
    };
};
*/
life_action_inUse = false;