#include <macro.h>
/*
	File: fn_initSkin.sqf
	
	Description:
	Skin changer
*/
while {true} do
	{
	if(playerSide == civilian) then 
	{
		if (uniform player == "U_C_HunterBody_grn") then {
		switch (FETCH_CONST(life_donator)) do 
		{

			case 1:
			{
			};
	
			case 2:
			{
			};
	
			case 3:
			{
			};
	
			case 4:
			{
			};
	
			case 5:
			{
			[[player,0,"textures\Cloth_Hunter_Monogatari.paa"], "life_fnc_setTexture", true, false] call life_fnc_MP;
			};
		};
	};
	if(playerSide == west) then 
	{
		if (uniform player == "U_BG_Guerilla2_2") then {
		switch (FETCH_CONST(life_coplevel)) do 
		{

			case 1:
			{
			[[player,0,"textures\cadetTroop.jpg"], "life_fnc_setTexture", true, false] call life_fnc_MP;
			};
	
			case 2:
			{
			[[player,0,"textures\stateTroop.jpg"], "life_fnc_setTexture", true, false] call life_fnc_MP;
			};
	
			case 3:
			{
			[[player,0,"textures\stateTroop.jpg"], "life_fnc_setTexture", true, false] call life_fnc_MP;
			};
	
			case 4:
			{
			[[player,0,"textures\corpTroop.jpg"], "life_fnc_setTexture", true, false] call life_fnc_MP;
			};
	
			case 5:
			{
			[[player,0,"textures\corpTroop.jpg"], "life_fnc_setTexture", true, false] call life_fnc_MP;
			};
			case 6:
			{
			[[player,0,"textures\corpTroop.jpg"], "life_fnc_setTexture", true, false] call life_fnc_MP;
			};
		};
	};
	if(playerSide == independent) then
	{
		if (uniform player == "U_Rangemaster") then {
			player setObjectTextureGlobal[0,"texture\medic_uniform"];
			};
		};
	};
	sleep 15;//safe some cpu
};