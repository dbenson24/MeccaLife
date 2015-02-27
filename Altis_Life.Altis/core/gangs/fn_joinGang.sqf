#include <macro.h>

_uid = getPlayerUID player;


[[],"TON_fnc_fetchGangs",false,false] call life_fnc_MP;


gang_list = missionNamespace getVariable "gang_list";

_wait = round(random(8));
sleep _wait;
_ganginfo = [];
if (count gang_list != 0) then {
	{
		if(EQUAL(SEL(_x,5),_uid)) exitWith{_ganginfo = _x;};
 		_members = format["%1",(SEL(_x,5))];
 		_index = _members find _uid;
 		if (_index >= 0) exitWith{_ganginfo = _x;};
	} forEach gang_list;	
};

if (isNil("_ganginfo"))	exitWith{};
	
	_gangname = format["%1",(_ganginfo select 2)];

//Loop through to make sure there is not a group already created with the gang.
gang_groups = missionNamespace getVariable "gang_groups";

if(count gang_groups > 0) then {

	{
		_groupName = _x GVAR "gang_name";
		if(!isNil "_groupName") then {
			if(EQUAL(_gangname, _groupName)) exitWith {_group = _x;};
		};
	} forEach gang_groups;
};


if(!isNil "_group") then {
	[player] join _group;
	if(EQUAL(SEL(life_gangData,1),steamid)) then {
		_group selectLeader player;
		[[player,_group],"TON_fnc_clientGangLeader",(units _group),false] call life_fnc_MP;
	};
} else {
	_members = [];
	_members = [[SEL(_ganginfo,2)],"TON_fnc_fetchMembers",false,false] call life_fnc_MP;
	_group = group player;
	_group SVAR ["gang_id",SEL(_ganginfo,0),true];
	_group SVAR ["gang_owner",SEL(_ganginfo,1),true];
	_group SVAR ["gang_name",SEL(_ganginfo,2),true];
	_group SVAR ["gang_maxMembers",SEL(_ganginfo,3),true];
	_group SVAR ["gang_bank",SEL(_ganginfo,4),true];
	_group SVAR ["gang_members",_members,true];
	gang_groups pushBack _group;
};

publicVariable "gang_groups";