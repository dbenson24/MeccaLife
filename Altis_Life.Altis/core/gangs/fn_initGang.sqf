#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main initialization for gangs?
*/
private["_exitLoop","_group","_wait","_gangname","_members","_uid","_index","_ganginfo"];
if(playerSide != civilian) exitWith {}; //What in the hell?
[player] join (createGroup civilian);
if(EQUAL(count life_gangData,0)) exitWith {}; //Dafuq?

_uid = getPlayerUID player;

if (isNil("gang_list")) then {
	[] spawn TON_fnc_fetchGangs;
};


_wait = round(random(8));
sleep _wait;

if (count gang_list != 0) then {
	{
 		_members = _x select 5;
 		_index = _x find format["%1",_uid];
 		if (_index > -1) then {
 			exitWith{_ganginfo = _x;};
 		};
	} forEach gang_list;	
};

if (isNil("_ganginfo")) then {
	exitWith{false;};
} else {
	_gangname = _ganginfo select 2;
};

//Loop through to make sure there is not a group already created with the gang.
_exitLoop = false;
{
	_groupName = _x GVAR "gang_name";
	if(!isNil "_groupName") then {
	/*
		_groupOwner = _x GVAR ["gang_owner",""];
		_groupID = _x GVAR "gang_id";
		if(EQUAL(_groupOwner,"") OR isNil "_groupID") exitWith {}; //Seriously?*/
		if(EQUAL(_gangname, _groupName)) then {
			exitWith {_group = _x; _exitLoop = true;};
		}
		//if(EQUAL(SEL(life_gangData,0),_groupID) && {EQUAL(SEL(life_gangData,1),_groupOwner)}) exitWith {_group = _x; _exitLoop = true;};
	};
} foreach allGroups;

if(!isNil "_group") then {
	[player] join _group;
	if(EQUAL(SEL(life_gangData,1),steamid)) then {
		_group selectLeader player;
		[[player,_group],"TON_fnc_clientGangLeader",(units _group),false] call life_fnc_MP;
	};
} else {
	_group = group player;
	_group SVAR ["gang_id",SEL(_ganginfo,0),true];
	_group SVAR ["gang_owner",SEL(_ganginfo,1),true];
	_group SVAR ["gang_name",SEL(_ganginfo,2),true];
	_group SVAR ["gang_maxMembers",SEL(_ganginfo,3),true];
	_group SVAR ["gang_bank",SEL(_ganginfo,4),true];
	_group SVAR ["gang_members",SEL(_ganginfo,5),true];
};