#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for the weapon shops.
	
	Return:
	String: Close the menu
	Array: 
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do {
	case "cop_basic": {
		switch(true) do {
			case (playerSide != west): {"You not a cop!"};
			case (FETCH_CONST(life_coplevel) == 1):
			{
				["Recruit Equipment Shop",
					[
						["FirstAidKit","First Aid Kit",500 * life_donDis],
						["ToolKit","Tool Kit",500 * life_donDis],
						["ItemGPS","GPS",50 * life_donDis],
						["ItemMap","Map",50 * life_donDis], 	
						["ItemCompass","Compass",50 * life_donDis],						
						["MineDetector","Mine Detector",10000 * life_donDis],
						["Binocular","Binocular",1000 * life_donDis],
						["NVGoggles_OPFOR","Police Night Vision Goggles",1000 * life_donDis],
						["hgun_P07_F","P07 9mm",20000 * life_donDis],
						["30Rnd_9x21_Mag","9mm 30Rnd Mag",500 * life_donDis],
						["SmokeShell",nil,1000 * life_donDis]
					]
				];
			};

			case (FETCH_CONST(life_coplevel) == 2):
			{
				["Patrol Officer Equipment Shop",
					[
						["FirstAidKit","First Aid Kit",500 * life_donDis],
						["ToolKit","Tool Kit",500 * life_donDis],
						["ItemGPS","GPS",50 * life_donDis],
						["ItemMap","Map",50 * life_donDis], 	
						["ItemCompass","Compass",50 * life_donDis],						
						["MineDetector","Mine Detector",10000 * life_donDis],
						["Binocular","Binocular",1000 * life_donDis],
						["NVGoggles_OPFOR","Police Night Vision Goggles",1000 * life_donDis],
						["hgun_P07_F","P07 9mm",20000 * life_donDis],
						["30Rnd_9x21_Mag","9mm 30Rnd Mag",500 * life_donDis],
						["arifle_sdar_F","SDAR 5.56 mm",25000 * life_donDis],
						["20Rnd_556x45_UW_mag","5.56mm 20Rnd Dual Purpose Mag",500 * life_donDis],
						["arifle_MXC_Black_F","MXC 6.5mm",170000 * life_donDis],
						["30Rnd_65x39_caseless_mag_Tracer","6.5mm 30Rnd Tracer Mag",500 * life_donDis],
						["optic_Hamr","RCO Scope",40000 * life_donDis],
						["optic_Arco","ARCO Scope",20000 * life_donDis],
						["optic_MRCO","MRCO Scope",20000 * life_donDis],
						["acc_flashlight","Flashlight",500 * life_donDis],
						["acc_pointer_IR","IR Laser Pointer",500 * life_donDis],
						["HandGrenade_Stone","Flashbang",1700 * life_donDis],
						["SmokeShell",nil,1000 * life_donDis]
					]
				];
			};

			case (FETCH_CONST(life_coplevel) == 3):
			{
				["Sergeant Equipment Shop",
					[
						["FirstAidKit","First Aid Kit",500 * life_donDis],
						["ToolKit","Tool Kit",500 * life_donDis],
						["ItemGPS","GPS",50 * life_donDis],
						["ItemMap","Map",50 * life_donDis], 	
						["ItemCompass","Compass",50 * life_donDis],						
						["MineDetector","Mine Detector",10000 * life_donDis],
						["Binocular","Binocular",1000 * life_donDis],
						["NVGoggles_OPFOR","Police Night Vision Goggles",1000 * life_donDis],
						["hgun_P07_F","P07 9mm",20000 * life_donDis],
						["hgun_P07_snds_F","P07 9mm Silencer",25000 * life_donDis],
						["30Rnd_9x21_Mag","9mm 30Rnd Mag",500 * life_donDis],
						["arifle_sdar_F","SDAR 5.56 mm",25000 * life_donDis],
						["20Rnd_556x45_UW_mag","5.56mm 20Rnd Dual Purpose Mag",500 * life_donDis],
						["arifle_MXC_Black_F","MXC 6.5mm",170000 * life_donDis],
						["arifle_MX_Black_F","MX 6.5 mm",200000 * life_donDis],
						["30Rnd_65x39_caseless_mag_Tracer","6.5mm 30Rnd Tracer Mag",500 * life_donDis],
						["30Rnd_65x39_caseless_mag","6.5mm 30Rnd STANAG Mag",500 * life_donDis],
						["arifle_MX_SW_F","Heavy Suppression",200000 * life_donDis],
						["100Rnd_65x39_caseless_mag_Tracer",nil,200 * life_donDis],
						["optic_Hamr","RCO Scope",40000 * life_donDis],
						["optic_Arco","ARCO Scope",20000 * life_donDis],
						["optic_MRCO","MRCO Scope",20000 * life_donDis],
						["acc_flashlight","Flashlight",500 * life_donDis],
						["acc_pointer_IR","IR Laser Pointer",500 * life_donDis],
						["HandGrenade_Stone","Flashbang",1700 * life_donDis],
						["SmokeShell",nil,1000 * life_donDis]						
					]
				];
			};
			case (FETCH_CONST(life_coplevel) == 4):
			{
				["Lieutenant Equipment Shop",
					[
						["FirstAidKit","First Aid Kit",500 * life_donDis],
						["ToolKit","Tool Kit",500 * life_donDis],
						["ItemGPS","GPS",50 * life_donDis],
						["ItemMap","Map",50 * life_donDis], 	
						["ItemCompass","Compass",50 * life_donDis],						
						["MineDetector","Mine Detector",10000 * life_donDis],
						["Binocular","Binocular",1000 * life_donDis],
						["NVGoggles_OPFOR","Police Night Vision Goggles",1000 * life_donDis],
						["hgun_P07_F","P07 9mm",20000 * life_donDis],
						["hgun_P07_snds_F","P07 9mm Silencer",25000 * life_donDis],
						["30Rnd_9x21_Mag","9mm 30Rnd Mag",500 * life_donDis],
						["arifle_sdar_F","SDAR 5.56 mm",25000 * life_donDis],
						["20Rnd_556x45_UW_mag","5.56mm 20Rnd Dual Purpose Mag",500 * life_donDis],
						["arifle_MXC_Black_F","MXC 6.5mm",170000 * life_donDis],
						["arifle_MX_Black_F","MX 6.5 mm",200000 * life_donDis],
						["arifle_MXM_Black_F","MXM 6.5mm",300000 * life_donDis],
						["30Rnd_65x39_caseless_mag_Tracer","6.5mm 30Rnd Tracer Mag",500 * life_donDis],	
						["optic_Hamr","RCO Scope",40000 * life_donDis],
						["optic_Arco","ARCO Scope",20000 * life_donDis],
						["optic_MRCO","MRCO Scope",20000 * life_donDis],
						["acc_flashlight","Flashlight",500 * life_donDis],
						["acc_pointer_IR","IR Laser Pointer",500 * life_donDis],
						["HandGrenade_Stone","Flashbang",1700 * life_donDis],
						["SmokeShell",nil,1000 * life_donDis]
					]
				];
			};
			case (FETCH_CONST(life_coplevel) == 5):
			{
				["Captain Equipment Shop",
					[
						["FirstAidKit","First Aid Kit",500 * life_donDis],
						["ToolKit","Tool Kit",500 * life_donDis],
						["ItemGPS","GPS",50 * life_donDis],
						["ItemMap","Map",50 * life_donDis], 	
						["ItemCompass","Compass",50 * life_donDis],						
						["MineDetector","Mine Detector",1000 * life_donDis],
						["Binocular","Binocular",100 * life_donDis],
						["NVGoggles_OPFOR","Police Night Vision Goggles",100 * life_donDis],
						["hgun_P07_F","P07 9mm",20000 * life_donDis],
						["hgun_P07_snds_F","P07 9mm Silencer",2500 * life_donDis],
						["30Rnd_9x21_Mag","9mm 30Rnd Mag",500 * life_donDis],
						["arifle_sdar_F","SDAR 5.56 mm",2500 * life_donDis],
						["20Rnd_556x45_UW_mag","5.56mm 20Rnd Dual Purpose Mag",500 * life_donDis],
						["arifle_MXC_Black_F","MXC 6.5mm",17000 * life_donDis],
						["arifle_MX_Black_F","MX 6.5 mm",20000 * life_donDis],
						["arifle_MXM_Black_F","MXM 6.5mm",30000 * life_donDis],
						["30Rnd_65x39_caseless_mag_Tracer","6.5mm 30Rnd Tracer Mag",500 * life_donDis],	
						["srifle_EBR_DMS_F",nil,120000* life_donDis],
						["20Rnd_762x51_Mag",nil,500* life_donDis],
						["srifle_GM6_F",nil,999999* life_donDis],
						["5Rnd_127x108_Mag",nil,600000* life_donDis],
						["srifle_LRR_F",nil,9999* life_donDis],
						["7Rnd_408_Mag",nil,700* life_donDis],
						["optic_Hamr","RCO Scope",4000 * life_donDis],
						["optic_Arco","ARCO Scope",2000 * life_donDis],
						["optic_MRCO","MRCO Scope",2000 * life_donDis],
						["acc_flashlight","Flashlight",500 * life_donDis],
						["acc_pointer_IR","IR Laser Pointer",500 * life_donDis],						
						["HandGrenade_Stone","Flashbang",1700 * life_donDis],
						["SmokeShell",nil,1000 * life_donDis]
					]
				];
			};
			case (FETCH_CONST(life_coplevel) == 6):
			{
				["Swat Equipment Shop",
					[
						["FirstAidKit","First Aid Kit",500 * life_donDis],
						["ToolKit","Tool Kit",500 * life_donDis],
						["ItemGPS","GPS",50 * life_donDis],
						["ItemMap","Map",50 * life_donDis], 	
						["ItemCompass","Compass",50 * life_donDis],						
						["MineDetector","Mine Detector",10000 * life_donDis],
						["Binocular","Binocular",1000 * life_donDis],
						["NVGoggles_OPFOR","Police Night Vision Goggles",1000 * life_donDis],
						["hgun_P07_F","P07 9mm",20000 * life_donDis],
						["hgun_P07_snds_F","P07 9mm Silencer",25000 * life_donDis],
						["30Rnd_9x21_Mag","9mm 30Rnd Mag",500 * life_donDis],
						["arifle_sdar_F","SDAR 5.56 mm",25000 * life_donDis],
						["20Rnd_556x45_UW_mag","5.56mm 20Rnd Dual Purpose Mag",500 * life_donDis],
						["arifle_MXC_Black_F","MXC 6.5mm",170000 * life_donDis],
						["arifle_MX_Black_F","MX 6.5 mm",200000 * life_donDis],
						["arifle_MXM_Black_F","MXM 6.5mm",300000 * life_donDis],
						["30Rnd_65x39_caseless_mag_Tracer","6.5mm 30Rnd Tracer Mag",500 * life_donDis],
						["30Rnd_65x39_caseless_mag","6.5mm 30Rnd STANAG Mag",500 * life_donDis],	
						["optic_Hamr","RCO Scope",40000 * life_donDis],
						["optic_Arco","ARCO Scope",20000 * life_donDis],
						["optic_MRCO","MRCO Scope",20000 * life_donDis],	
						["acc_flashlight","Flashlight",500 * life_donDis],
						["acc_pointer_IR","IR Laser Pointer",500 * life_donDis],
						["HandGrenade_Stone","Flashbang",1700 * life_donDis],
						["SmokeShell",nil,1000 * life_donDis]						
					]
				];
			};
		};
	};
	
	case "med_basic": {
		switch (true) do {
			case (playerSide != independent): {"You are not an EMS Medic"};
			default {
				["Hospital EMS Shop",
					[
						["ItemGPS",nil,100* life_donDis],
						["Binocular",nil,150* life_donDis],
						["ToolKit",nil,250* life_donDis],
						["FirstAidKit",nil,150* life_donDis],
						["Medikit",nil,500* life_donDis],
						["NVGoggles",nil,1200* life_donDis],
						["B_FieldPack_ocamo",nil,3000* life_donDis]
					]
				];
			};
		};
	};

	
	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_rebel): {"You don't have a Rebel training license!"};
			default
			{
				["Mohammed's Jihadi Shop",
					[
						["arifle_TRG20_F",nil,25000* life_donDis],
						["30Rnd_556x45_Stanag",nil,300* life_donDis],
						["arifle_Katiba_F",nil,30000* life_donDis],
						["30Rnd_65x39_caseless_green",nil,275* life_donDis],
						["srifle_DMR_01_F",nil,50000* life_donDis],
						["10Rnd_762x51_Mag",nil,500* life_donDis],
						["arifle_SDAR_F",nil,20000* life_donDis],
						["20Rnd_556x45_UW_mag",nil,125* life_donDis],
						["optic_ACO_grn",nil,3500* life_donDis],
						["optic_Holosight",nil,3600* life_donDis],
						["acc_flashlight",nil,1000* life_donDis],
						["optic_Hamr",nil,7500* life_donDis],
						["30Rnd_9x21_Mag",nil,200* life_donDis],
						["srifle_EBR_DMS_F",nil,120000* life_donDis],
						["20Rnd_762x51_Mag",nil,500* life_donDis],
						["srifle_GM6_F",nil,999999* life_donDis],
						["5Rnd_127x108_Mag",nil,600000* life_donDis],
						["srifle_LRR_F",nil,999999* life_donDis],
						["7Rnd_408_Mag",nil,750000* life_donDis],
						["HandGrenade",nil,500000* life_donDis]
					]
				];
			};
		};
	};
	
	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_gun): {"You don't have a Firearms license!"};
			default
			{
				["Billy Joe's Firearms",
					[
						["hgun_Rook40_F",nil,6500* life_donDis],
						["hgun_Pistol_heavy_02_F",nil,9850* life_donDis],
						["hgun_ACPC2_F",nil,11500* life_donDis],
						["hgun_PDW2000_F",nil,20000* life_donDis],
						["optic_ACO_grn_smg",nil,2500* life_donDis],
						["V_Rangemaster_belt",nil,4900* life_donDis],
						["16Rnd_9x21_Mag",nil,25* life_donDis],
						["9Rnd_45ACP_Mag",nil,45* life_donDis],
						["6Rnd_45ACP_Cylinder",nil,50* life_donDis],
						["30Rnd_9x21_Mag",nil,75* life_donDis]
					]
				];
			};
		};
	};
	
	case "gang":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			default
			{
				["Hideout Armament",
					[
						["hgun_Rook40_F",nil,1500* life_donDis],
						["hgun_Pistol_heavy_02_F",nil,2500* life_donDis],
						["hgun_ACPC2_F",nil,4500* life_donDis],
						["hgun_PDW2000_F",nil,9500* life_donDis],
						["optic_ACO_grn_smg",nil,950* life_donDis],
						["V_Rangemaster_belt",nil,1900* life_donDis],
						["16Rnd_9x21_Mag",nil,25* life_donDis],
						["9Rnd_45ACP_Mag",nil,45* life_donDis],
						["6Rnd_45ACP_Cylinder",nil,50* life_donDis],
						["30Rnd_9x21_Mag",nil,75* life_donDis],
						["arifle_TRG20_F",nil,25000* life_donDis],
						["arifle_Katiba_F",nil,50000* life_donDis],
						["srifle_DMR_01_F",nil,70000* life_donDis],
						["arifle_SDAR_F",nil,30000* life_donDis],
						["30Rnd_9x21_Mag",nil,200* life_donDis],
						["20Rnd_556x45_UW_mag",nil,125* life_donDis],
						["30Rnd_556x45_Stanag",nil,300* life_donDis],
						["10Rnd_762x51_Mag",nil,500* life_donDis],
						["10Rnd_762x51_Mag",nil,500* life_donDis],
						["HandGrenade",nil,750000* life_donDis]
					]
				];
			};
		};
	};
	
	case "vigilante":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_vigilante): {"You don't have a Vigilante license!"};
			case (!license_civ_gun): {"You don't have a Firearms license!"};
			default
			{
				["Vigilante Shop",
					[
						["SMG_02_F","Sting 9mm",45000* life_donDis],
						["30Rnd_9x21_Mag","9mm 30Rnd Mag",1000* life_donDis],	
						["acc_flashlight","Flashlight",500* life_donDis],							
						["optic_ACO_grn","ACO (Green)",5000* life_donDis],
						["optic_Aco","ACO (Red)",5000* life_donDis]					
					]
				];
			};
		};
	};
	
	case "genstore":
	{
		["Altis General Store",
			[
				["Binocular",nil,150* life_donDis],
				["ItemGPS",nil,500* life_donDis],
				["ToolKit",nil,350* life_donDis],
				["FirstAidKit",nil,250* life_donDis],
				["NVGoggles",nil,900* life_donDis],
				["Chemlight_red",nil,300* life_donDis],
				["Chemlight_yellow",nil,3000* life_donDis],
				["Chemlight_green",nil,3000* life_donDis],
				["Chemlight_blue",nil,3000* life_donDis]
			]
		];
	};
};
