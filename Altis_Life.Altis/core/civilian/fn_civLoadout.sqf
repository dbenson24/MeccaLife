#include <macro.h>
/*
	File: fn_civLoadout.sqf
	Author: UnNamed
	
	Description:
	Loads the civ out with the default gear and proper donor perks with randomized clothing.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

_clothings = ["U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poloshirt_salmon","U_C_Poloshirt_redwhite","U_C_Commoner1_1"];
/* ITEMS */

if (playerSide == civilian) then {

switch (FETCH_CONST(life_donator)) do {

	case 0:
	{
		player addUniform (_clothings select (floor(random (count _clothings))));
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player addItem "ItemWatch";
		player assignItem "ItemWatch";
	};
	
	case 2:
	{
	    
		player addUniform (_clothings select (floor(random (count _clothings))));
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player addItem "ItemWatch";
		player assignItem "ItemWatch";
	};
	
	case 3:
	{
		player addUniform (_clothings select (floor(random (count _clothings))));
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player addItem "ItemWatch";
		player assignItem "ItemWatch";
	    
	};
	
	case 4:
	{
		player addUniform (_clothings select (floor(random (count _clothings))));
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player addItem "ItemWatch";
		player assignItem "ItemWatch";
	 
	};
	
	case 5:
	{
		player addUniform (_clothings select (floor(random (count _clothings))));
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player addItem "ItemWatch";
		player assignItem "ItemWatch";
	};
	
};
};
[] call life_fnc_saveGear;