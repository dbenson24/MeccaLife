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
player addUniform "U_BG_Guerilla2_2";
player addVest "V_TacVest_blk_POLICE";
player addBackpack "B_Carryall_oucamo";
player addWeapon "hgun_P07_F";
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";

/* ITEMS */
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

{
    private["_texture"];
    while {true} do
    {
        waitUntil{uniform player == "U_BG_Guerilla2_2"};
        _texture =
        switch (FETCH_CONST(life_coplevel)) do
        {
            case 1: {"textures\cadetTroop.jpg"};
        };
		{
            case 2: {"textures\stateTroop.jpg"};
        };
		{
            case 3: {"textures\stateTroop.jpg"};
        };
		{
            case 4: {"textures\corpTroop.jpg"};
        };
		{
            case 5: {"textures\corpTroop.jpg"};
        };
		{
            case 6: {"textures\corpTroop.jpg"};
        };
        
        player setObjectTextureGlobal [0,_texture];
        waitUntil{uniform player != "U_BG_Guerilla2_2"};
    };
};
	
};
};
[] call life_fnc_saveGear;