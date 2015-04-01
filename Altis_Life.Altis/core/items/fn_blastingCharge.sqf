/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Blasting charge is used for the federal reserve vault and nothing  more.. Yet.
*/
private["_vault","_handle","_units","_lastrobbery"];
_vault = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vault) exitWith {}; //Bad object
if(typeOf _vault != "Land_CargoBox_V1_F") exitWith {hint localize "STR_ISTR_Blast_VaultOnly"};
_lastrobbery = _vault getVariable ["lastrobbery",-1];
if (_lastrobbery != -1 && (_lastrobbery + 90*60) > time) exitWith {hint "The reserves need at least 90 minutes to recover between robberies!"};
if(_vault getVariable["chargeplaced",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyPlaced"};
if(_vault getVariable["safe_open",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyOpen"};
if(!([false,"blastingcharge",1] call life_fnc_handleInv)) exitWith {}; //Error?

_vault setVariable["chargeplaced",true,true];
[[0,localize "STR_ISTR_Blast_Placed"],"life_fnc_broadcast",west,false] call life_fnc_MP;
[[_vault],"life_fnc_bankalarmsound",true,true] call life_fnc_MP;
hint localize "STR_ISTR_Blast_KeepOff";

[[1],"life_fnc_demoChargeTimer",west,false] call life_fnc_MP;
[[1],"life_fnc_demoChargeTimer",group player,false] call life_fnc_MP;

[["fed",1],"TON_fnc_blowSafe",false,false] spawn life_fnc_MP;

sleep (1*60+1);

if(!(fed_bank getVariable["chargeplaced",false])) exitWith {hint localize "STR_ISTR_Blast_Disarmed"};

hint localize "STR_ISTR_Blast_Opened";