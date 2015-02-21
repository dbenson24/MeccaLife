#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)}) //Quick macro for creating a constant variable
#define __GETC__(var) (call var) //Quick clean macro for getting a value of a constant / compileFinal variable. i.e if(__GETC__(numberone) == 1) then {}
#define __SUB__(var1,var2) var1 = var1 - var2
#define ITEM_NAME(varName) M_CONFIG(getText,"VirtualItems",varName,"displayName")

//Control Macros
#define getControl(disp,ctrl) ((findDisplay ##disp) displayCtrl ##ctrl)
#define getSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])

//Player based quick macros
#define grpPlayer group player
#define steamid getPlayerUID player

//Config Macros
#define FETCH_CONFIG(TYPE,CFG,SECTION,CLASS,ENTRY) TYPE(configFile >> CFG >> SECTION >> CLASS >> ENTRY)
#define FETCH_CONFIG2(TYPE,CFG,CLASS,ENTRY) TYPE(configFile >> CFG >> CLASS >> ENTRY)
#define FETCH_CONFIG3(TYPE,CFG,SECTION,CLASS,ENTRY,SUB) TYPE(configFile >> CFG >> SECTION >> CLASS >> ENTRY >> SUB)
#define FETCH_CONFIG4(TYPE,CFG,SECTION,CLASS,ENTRY,SUB,SUB2) TYPE(configFile >> CFG >> SECTION >> CLASS >> ENTRY >> SUB >> SUB2)
#define M_CONFIG(TYPE,CFG,CLASS,ENTRY) TYPE(missionConfigFile >> CFG >> CLASS >> ENTRY)
#define BASE_CONFIG(CFG,CLASS) inheritsFrom(configFile >> CFG >> CLASS)
#define LIFE_SETTINGS(TYPE,SETTING) TYPE(missionConfigFile >> "Life_Settings" >> SETTING)
#define CONFIG_VEHICLES "CfgVehicles"
#define CONFIG_WEAPONS "CfgWeapons"
#define CONFIG_MAGAZINES "CfgMagazines"
#define CONFIG_GLASSES "CfgGlasses"