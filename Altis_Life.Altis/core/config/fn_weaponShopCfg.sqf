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
						["hgun_P07_snds_F","P07 9mm Silencer",25000 * life_donDis],
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
						["hgun_P07_snds_F","P07 9mm Silencer",25000 * life_donDis],
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
			case (FETCH_CONST(life_coplevel) == 5):
			{
				["Captain Equipment Shop",
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
						["muzzle_snds_H","6.5mm Suppressor",40000 * life_donDis],
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
						["ItemGPS",nil,100],
						["Binocular",nil,150],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,500],
						["NVGoggles",nil,1200],
						["B_FieldPack_ocamo",nil,3000]
					]
				];
			};
		};
	};

	case "cop_patrol":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (FETCH_CONST(life_coplevel) < 2): {"You are not at a patrol officer rank!"};
			default
			{
				["Altis Officer Heavy Shop",
					[
						["arifle_MX_F",nil,65000],
						["arifle_MXC_F",nil,35000],
						["arifle_MXM_F",nil,65000],
						["30Rnd_65x39_caseless_mag_tracer",nil,130],
						["SMG_02_ACO_F",nil,30000],
						["30Rnd_9x21_Mag",nil,250],
						["MineDetector",nil,1000],
						["acc_flashlight",nil,750],
						["optic_Holosight",nil,1200],
						["optic_Arco",nil,2500],
						["HandGrenade_Stone","Flashbang",1700],
						["muzzle_snds_H",nil,8750]
					]
				];
			};
		};
	};

	case "cop_sergeant":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (FETCH_CONST(life_coplevel) < 4): {"You are not at a sergeant rank!"};
			default
			{
				["Altis Leathal Force Shop",
					[
						["arifle_MX_SW_Black_F",nil,107500],
						["100Rnd_65x39_caseless_mag",nil,107500],
						["SMG_01_F",nil,100500],
						["30Rnd_45ACP_Mag_SMG_01",nil,100500],						
						["hgun_ACPC2_F",nil,17500],
						["9Rnd_45ACP_Mag",nil,200],
						["arifle_MXC_F",nil,30000],
						["optic_Arco",nil,2500],
						["muzzle_snds_H",nil,8750],
						["30Rnd_65x39_caseless_mag",nil,100],
						["srifle_GM6_LRPS_F",nil,600000],
						["5Rnd_127x108_Mag",nil,60000],					
						["HandGrenade_Stone","Flashbang",1700]
						
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
						["arifle_TRG20_F",nil,25000],
						["30Rnd_556x45_Stanag",nil,300],
						["arifle_Katiba_F",nil,30000],
						["30Rnd_65x39_caseless_green",nil,275],
						["srifle_DMR_01_F",nil,50000],
						["10Rnd_762x51_Mag",nil,500],
						["arifle_SDAR_F",nil,20000],
						["20Rnd_556x45_UW_mag",nil,125],
						["optic_ACO_grn",nil,3500],
						["optic_Holosight",nil,3600],
						["acc_flashlight",nil,1000],
						["optic_Hamr",nil,7500],
						["30Rnd_9x21_Mag",nil,200],
						["srifle_EBR_DMS_F",nil,12000],
						["20Rnd_762x51_Mag",nil,500],
						["srifle_GM6_F",nil,999999],
						["5Rnd_127x108_Mag",nil,600000],
						["srifle_LRR_F",nil,999999],
						["7Rnd_408_Mag",nil,750000],
						["HandGrenade",nil,500000]
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
						["hgun_Rook40_F",nil,6500],
						["hgun_Pistol_heavy_02_F",nil,9850],
						["hgun_ACPC2_F",nil,11500],
						["hgun_PDW2000_F",nil,20000],
						["optic_ACO_grn_smg",nil,2500],
						["V_Rangemaster_belt",nil,4900],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["6Rnd_45ACP_Cylinder",nil,50],
						["30Rnd_9x21_Mag",nil,75]
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
						["hgun_Rook40_F",nil,1500],
						["hgun_Pistol_heavy_02_F",nil,2500],
						["hgun_ACPC2_F",nil,4500],
						["hgun_PDW2000_F",nil,9500],
						["optic_ACO_grn_smg",nil,950],
						["V_Rangemaster_belt",nil,1900],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["6Rnd_45ACP_Cylinder",nil,50],
						["30Rnd_9x21_Mag",nil,75],
						["arifle_TRG20_F",nil,25000],
						["arifle_Katiba_F",nil,50000],
						["srifle_DMR_01_F",nil,70000],
						["arifle_SDAR_F",nil,30000],
						["30Rnd_9x21_Mag",nil,200],
						["20Rnd_556x45_UW_mag",nil,125],
						["30Rnd_556x45_Stanag",nil,300],
						["10Rnd_762x51_Mag",nil,500],
						["10Rnd_762x51_Mag",nil,500],
						["HandGrenade",nil,750000]
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
						["SMG_02_F","Sting 9mm",45000],
						["30Rnd_9x21_Mag","9mm 30Rnd Mag",1000],	
						["acc_flashlight","Flashlight",500],							
						["optic_ACO_grn","ACO (Green)",5000],
						["optic_Aco","ACO (Red)",5000]					
					]
				];
			};
		};
	};
	
	case "genstore":
	{
		["Altis General Store",
			[
				["Binocular",nil,150],
				["ItemGPS",nil,500],
				["ToolKit",nil,350],
				["FirstAidKit",nil,250],
				["NVGoggles",nil,900],
				["Chemlight_red",nil,300],
				["Chemlight_yellow",nil,3000],
				["Chemlight_green",nil,3000],
				["Chemlight_blue",nil,3000]
			]
		];
	};
};
