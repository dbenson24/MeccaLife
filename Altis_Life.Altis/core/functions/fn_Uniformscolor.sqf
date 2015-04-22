#include <macro.h>
/*
		fn_Uniformscolor.sqf
*/
#define FETCH_CONST(var) (call var)

if(side player == independent) then {
	if ((uniform player) == "U_B_CTRG_3") then {
		player setObjectTextureGlobal [0, "textures\medic_uniform.paa"];
	};
};


if(side player == WEST) then {
	// Cop Level 1 & 2
	if (uniform player == "U_BG_Guerilla2_2") then {
		player setObjectTextureGlobal [0, "textures\cadettroop.paa"]; 
	};
	// Cop Level 3 & 4
	if (uniform player == "U_BG_Guerilla3_2") then {
		player setObjectTextureGlobal [0, "textures\corptroop.paa"]; 
	};
	// Cop Level 5 & 6 & 7
	if (uniform player == "U_O_OfficerUniform_ocamo") then {
		player setObjectTextureGlobal [0, "textures\capttroop.paa"]; 
	};
	
	if (uniform player == "U_O_SpecopsUniform_ocamo") then {
		player setObjectTextureGlobal [0, "textures\swat.paa"]; 
	};
};

if(side player == civilian) then {
	if((uniform player == "U_I_CombatUniform") && ( (FETCH_CONST(life_donator)) == 5)) then {
	player setObjectTextureGlobal [0, "textures\mafia.paa"];
	};
	if(uniform player == "U_C_Poloshirt_blue") then {
	player setObjectTextureGlobal [0, "textures\meccashirt.paa"];
	};
	
	if (uniform player == "U_BG_Guerilla2_2") then {
		player setObjectTextureGlobal [0, "textures\cadettroop.paa"]; 
	};
	// Cop Level 3 & 4
	if (uniform player == "U_BG_Guerilla3_2") then {
		player setObjectTextureGlobal [0, "textures\corptroop.paa"]; 
	};
	// Cop Level 5 & 6 & 7
	if (uniform player == "U_O_OfficerUniform_ocamo") then {
		player setObjectTextureGlobal [0, "textures\capttroop.paa"]; 
	};
	
	if (uniform player == "U_O_SpecopsUniform_ocamo") then {
		player setObjectTextureGlobal [0, "textures\swat.paa"]; 
	};
	
};