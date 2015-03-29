#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	31 hours of no sleep screw your description.
*/
private["_ownerID","_gangBank","_gangMax","_gangName","_members","_allUnits","_ctrl","_members","_gangMembers","_unit","_good"];
disableSerialization;
if(isNull (findDisplay 2620)) then {
	if(!(createDialog "Life_My_Gang_Diag")) exitWith {}; //NOOOOOOOOOOOOOOOOOOOOOOOoooooooooooooOOOOOOOOOOOOOOOOOOOOOOOOOOO00000000000000oooooo
};


if(!life_in_gang) exitWith {closeDialog 0;}; //Bad juju
_ownerID = SEL(life_gangData,1);
_gangName = SEL(life_gangData,2);
_gangBank = GANG_FUNDS;
_gangMax = SEL(life_gangData,3);
_gangMembers = SEL(life_gangData,5);

if(_ownerID != steamid) then {
	(CONTROL(2620,2622)) ctrlEnable false; //Upgrade
	(CONTROL(2620,2624)) ctrlEnable false; // Kick
	(CONTROL(2620,2625)) ctrlEnable false; //Set New Leader
	(CONTROL(2620,2630)) ctrlEnable false; //Invite Player
	(CONTROL(2620,2631)) ctrlEnable false; //Disband Gang
};

(CONTROL(2620,1003)) ctrlSetText format["Your Gang: %1",_gangName];
(CONTROL(2620,601)) ctrlSetText format[(localize "STR_GNOTF_Funds")+ " $%1",[_gangBank] call life_fnc_numberText];

//Loop through the players.
_members = CONTROL(2620,2621);
lbClear _members;
if (typeName (_gangMembers select 0) == "ARRAY") then {
	{
		if((_x select 0) == _ownerID) then {
			_members lbAdd format["%1 " +(localize "STR_GNOTF_GangLeader"),_x select 1];
			_members lbSetData [(lbSize _members)-1,str(_x)];
		} else {
			_members lbAdd format["%1",(_x select 1)];
			_members lbSetData [(lbSize _members)-1,str(_x)];
		};
	} foreach _gangMembers;
} else {
	if((_gangMembers select 0) == _ownerID) then {
		_members lbAdd format["%1 " +(localize "STR_GNOTF_GangLeader"),_gangMembers select 1];
		_members lbSetData [(lbSize _members)-1,str(_gangMembers)];
	} else {
		_members lbAdd format["%1",(_gangMembers select 1)];
		_members lbSetData [(lbSize _members)-1,str(_gangMembers)];
	};
};

_allUnits = playableUnits;
//Clear out the list..
{
	_unit = _x;
	if (typeName (_gangMembers select 0) == "ARRAY") then {
		{
			if (getPlayerUID _unit == _x select 0) then {
				_good = true;
			};
		}foreach _gangMembers;
	} else {
		if (getPlayerUID _unit == _gangMembers select 0) then {
			_good = true;
		};
	};
	
	if(_good || (side _x != civilian && isNil {(group _x) getVariable "gang_id"})) then {
		_allUnits set[_forEachIndex,-1];
	};
} foreach _allUnits;
SUB(_allUnits,[-1]);

_ctrl = CONTROL(2620,2632);
lbClear _ctrl; //Purge the list
{
	_ctrl lbAdd format["%1",_x GVAR ["realname",name _x]];
	_ctrl lbSetData [(lbSize _ctrl)-1,str(_x)];
} foreach _allUnits;