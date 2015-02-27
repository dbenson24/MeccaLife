#include <macro.h>

/*
	File: fn_copLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Itsyuka
	
	Description:
	Loads the cops out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

//Load player with default cop gear.

player addBackpack "B_Carryall_oucamo";

/* ITEMS */


If(BANK > 0) then {BANK = BANK - 5000;};

if (playerSide == west) then {

switch (FETCH_CONST(life_coplevel)) do {

	case 1:
	{
		[[player,0,"textures\cadetTroop.jpg"], "life_fnc_setTexture", true, false] call life_fnc_MP;
		player addUniform "U_BG_Guerilla2_2";
		player addVest "V_TacVest_blk_POLICE";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player addItem "ItemWatch";
		player assignItem "ItemWatch";
		player addItem "ItemGPS";
		player assignItem "ItemGPS";
		player addItem "FirstAidKit";
		player addItem "FirstAidKit";
		player addItem "FirstAidKit";
		player addItem "ToolKit";
		player addItem "ToolKit";
		player addItem "NVGoggles";
		player assignItem "NVGoggles";
		player addItem "Rangefinder";
		player assignItem "Rangefinder";
		player addItem "SmokeShell";
		player addItem "SmokeShell";

	};
	
	case 2:
	{
		[[player,0,"textures\stateTroop.jpg"], "life_fnc_setTexture", true, false] call life_fnc_MP;
		player addUniform "U_BG_Guerilla2_2";
		player addWeapon "arifle_MXC_Black_F";
		player addPrimaryWeaponItem "optic_Arco";
		player addVest "V_TacVest_blk_POLICE";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addItem "HandGrenade_Stone";
		player addItem "HandGrenade_Stone";
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player addItem "ItemWatch";
		player assignItem "ItemWatch";
		player addItem "ItemGPS";
		player assignItem "ItemGPS";
		player addItem "FirstAidKit";
		player addItem "FirstAidKit";
		player addItem "FirstAidKit";
		player addItem "ToolKit";
		player addItem "ToolKit";
		player addItem "NVGoggles";
		player assignItem "NVGoggles";
		player addItem "Rangefinder";
		player assignItem "Rangefinder";
		player addItem "SmokeShell";
		player addItem "SmokeShell";
		
	};
	
	case 3:
	{
	    [[player,0,"textures\stateTroop.jpg"], "life_fnc_setTexture", true, false] call life_fnc_MP;
		player addUniform "U_I_CombatUniform";
		player addWeapon "arifle_MX_Black_F";
		player addPrimaryWeaponItem "optic_MRCO";
		player addVest "V_TacVest_blk_POLICE";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addItem "HandGrenade_Stone";
		player addItem "HandGrenade_Stone";
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player addItem "ItemWatch";
		player assignItem "ItemWatch";
		player addItem "ItemGPS";
		player assignItem "ItemGPS";
		player addItem "FirstAidKit";
		player addItem "FirstAidKit";
		player addItem "FirstAidKit";
		player addItem "ToolKit";
		player addItem "ToolKit";
		player addItem "NVGoggles";
		player assignItem "NVGoggles";
		player addItem "Rangefinder";
		player assignItem "Rangefinder";
		player addItem "SmokeShell";
		player addItem "SmokeShell";
	};
	
	case 4:
	{
	    [[player,0,"textures\corpTroop.jpg"], "life_fnc_setTexture", true, false] call life_fnc_MP;
		player addUniform "U_I_CombatUniform";
		player addWeapon "arifle_MXM_Black_F";
		player addPrimaryWeaponItem "optic_MRCO";
		player addVest "V_PlateCarrier1_blk";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addItem "HandGrenade_Stone";
		player addItem "HandGrenade_Stone";
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player addItem "ItemWatch";
		player assignItem "ItemWatch";
		player addItem "ItemGPS";
		player assignItem "ItemGPS";
		player addItem "FirstAidKit";
		player addItem "FirstAidKit";
		player addItem "FirstAidKit";
		player addItem "ToolKit";
		player addItem "ToolKit";
		player addItem "NVGoggles";
		player assignItem "NVGoggles";
		player addItem "Rangefinder";
		player assignItem "Rangefinder";
		player addItem "SmokeShell";
		player addItem "SmokeShell";
	};
	
	case 5:
	{
	    [[player,0,"textures\corpTroop.jpg"], "life_fnc_setTexture", true, false] call life_fnc_MP;
		player addUniform "U_I_CombatUniform";
		player addVest "V_PlateCarrier1_blk";
		player addWeapon "arifle_MXM_Black_F";
		player addPrimaryWeaponItem "optic_MRCO";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addItem "HandGrenade_Stone";
		player addItem "HandGrenade_Stone";
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player addItem "ItemWatch";
		player assignItem "ItemWatch";
		player addItem "ItemGPS";
		player assignItem "ItemGPS";
		player addItem "FirstAidKit";
		player addItem "FirstAidKit";
		player addItem "FirstAidKit";
		player addItem "ToolKit";
		player addItem "ToolKit";
		player addItem "NVGoggles";
		player assignItem "NVGoggles";
		player addItem "Rangefinder";
		player assignItem "Rangefinder";
		player addItem "SmokeShell";
		player addItem "SmokeShell";
	};
	case 6:
	{
	    [[player,0,"textures\corpTroop.jpg"], "life_fnc_setTexture", true, false] call life_fnc_MP;
		player addUniform "U_I_CombatUniform";
		player addWeapon "arifle_MXM_F";
		player addVest "V_PlateCarrier1_blk";
		player addMagazine "100Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "100Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "100Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "100Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "100Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "100Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addItem "HandGrenade_Stone";
		player addItem "HandGrenade_Stone";
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player addItem "ItemWatch";
		player assignItem "ItemWatch";
		player addItem "ItemGPS";
		player assignItem "ItemGPS";
		player addItem "FirstAidKit";
		player addItem "FirstAidKit";
		player addItem "FirstAidKit";
		player addItem "ToolKit";
		player addItem "ToolKit";
		player addItem "NVGoggles";
		player assignItem "NVGoggles";
		player addItem "Rangefinder";
		player assignItem "Rangefinder";
		player addItem "SmokeShell";
		player addItem "SmokeShell";
	};
	case 7:
	{
	    [[player,0,"textures\corpTroop.jpg"], "life_fnc_setTexture", true, false] call life_fnc_MP;
		player addUniform "U_I_CombatUniform";
		player addVest "V_PlateCarrier1_blk";
		player addWeapon "arifle_MXM_F";
		player addPrimaryWeaponItem "optic_Arco";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag_Tracer";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addItem "HandGrenade_Stone";
		player addItem "HandGrenade_Stone";
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player addItem "ItemWatch";
		player assignItem "ItemWatch";
		player addItem "ItemGPS";
		player assignItem "ItemGPS";
		player addItem "FirstAidKit";
		player addItem "FirstAidKit";
		player addItem "FirstAidKit";
		player addItem "ToolKit";
		player addItem "ToolKit";
		player addItem "NVGoggles";
		player assignItem "NVGoggles";
		player addItem "Rangefinder";
		player assignItem "Rangefinder";
		player addItem "SmokeShell";
		player addItem "SmokeShell";
	};
	
};
};
[] call life_fnc_saveGear;