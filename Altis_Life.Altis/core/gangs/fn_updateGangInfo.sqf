/*
	Author: Bryan "Tonic" Boardwine
	
	File: fn_updateGangInfo.sqf
	
	Description:
	Updates the gang for all players in the gang
	Execute on all players on civilian. Caller should also update database.
*/
private["_gang_id","_gang_owner","_gang_bank","_gang_members","_force"];
_gang_id = [_this,0,-1,[-1]] call BIS_fnc_param;
_gang_owner = [_this,1,-1,[-1]] call BIS_fnc_param;
_gang_bank = [_this,2,-1,[-1]] call BIS_fnc_param;
_gang_members = [_this,3,[],[[]]] call BIS_fnc_param;
_force = [_this,4,false,[false]] call BIS_fnc_param;
if(_gang_id == -1) exitWith {};
if(_gang_owner == -1) exitWith {};
if(_gang_bank == -1) exitWith {};
if(_gang_members == []) exitWith {};
if(!_force && (life_gangid != _gang_id)) exitWith {};

life_gangowner = _gang_owner;
life_gangbank = _gang_bank;
life_gangmembers = _gang_members;