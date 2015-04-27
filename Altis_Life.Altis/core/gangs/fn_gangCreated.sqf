#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Tells the player that the gang is created and throws him into it.
*/
private "_group";
life_action_gangInUse = nil;

[player] joinSilent (createGroup civilian);

if(BANK < (LIFE_SETTINGS(getNumber,"gang_price"))) exitWith {
	hint format[localize "STR_GNOTF_NotEnoughMoney",[((LIFE_SETTINGS(getNumber,"gang_price"))-BANK)] call life_fnc_numberText];
	{grpPlayer SVAR [_x,nil,true];} foreach ["gang_id","gang_owner","gang_name","gang_members","gang_maxmembers","gang_bank"];
};

SUB(BANK,(LIFE_SETTINGS(getNumber,"gang_price")));
life_in_gang = true;
life_ganggroup = grpPlayer;

hint format[localize "STR_GNOTF_CreateSuccess",(group player) getVariable "gang_name",[(LIFE_SETTINGS(getNumber,"gang_price"))] call life_fnc_numberText];