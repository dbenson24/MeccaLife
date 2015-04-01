#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main initialization for gangs?
*/
private["_exitLoop","_group","_wait"];
if(playerSide != civilian) exitWith {}; //What in the hell?
[player] join (createGroup civilian);
if(EQUAL(count life_gangData,0)) exitWith {}; //Dafuq?

_wait = round(random(8));
sleep _wait;

//Loop through to make sure there is not a group already created with the gang.
_exitLoop = false;
{
	_groupName = _x GVAR "gang_name";
	if(!isNil "_groupName") then {
		_groupOwner = _x GVAR ["gang_owner",""];
		_groupID = _x GVAR "gang_id";
		if(EQUAL(_groupOwner,"") OR isNil "_groupID") exitWith {}; //Seriously?
		if(EQUAL(life_gangid,_groupID) && {EQUAL(life_gangowner,_groupOwner)}) exitWith {_group = _x; _exitLoop = true;};
	};
} foreach allGroups;

if(!isNil "_group") then {
	[player] join _group;
	if(EQUAL(life_gangowner,steamid)) then {
		_group selectLeader player;
		[[player,_group],"TON_fnc_clientGangLeader",(units _group),false] call life_fnc_MP;
	};
	life_in_gang = true;
	life_ganggroup = _group;
} else {
	_group = group player;
	_group SVAR ["gang_id",life_gangid,true];
	_group SVAR ["gang_owner",life_gangowner,true];
	_group SVAR ["gang_name",life_gangname,true];
	_group SVAR ["gang_maxMembers",life_gangmaxmembers,true];
	_group SVAR ["gang_bank",life_gangbank,true];
	_group SVAR ["gang_members",life_gangmembers,true];
	_group SVAR ["gang",true,true];
	life_in_gang = true;
	life_ganggroup = _group;
};

