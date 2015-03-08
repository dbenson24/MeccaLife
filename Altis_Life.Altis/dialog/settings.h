class SettingsMenu
{
	idd = 6800;
	name = "SettingsMenu";
	movingEnabled = 1;
	enableSimulation = 1;
	onLoad = "[5] spawn life_fnc_ctrlFunction_Settings;";
	
	class controlsBackground {
	
	    class fondtablet: Life_RscPicture
		{
			idc = 9090909;
			text = "textures\menu.paa";
			x = 0;
			y = -0.12;
			w = 1;
			h = 1.28;
		};
		
		class RscMainBackground : life_RscText
		{
			colorBackground[] = {0,0,0,0.2};
			idc = -1;
			x = 0.26;
			y = 0.2 + (11 / 250);
			w = 0.5;
			h = 0.43 - (22 / 250);
		};
		
		class PlayerTagsHeader: Life_RscButtonMenu
		{
			idc = 6806;

			text = "$STR_SM_PlayerTags";
			onButtonClick = "[0] spawn life_fnc_ctrlFunction_Settings;";
			x = 0.1625;
			y = 0.3;
			w = 0.2375;
			h = 0.04;
			colorBackground[] = {0,0,0,0.3};
		};		
		
		class TerrainHeader: Life_RscButtonMenu
		{
			idc = 6807;

			text = "Grass";
			onButtonClick = "[1] spawn life_fnc_ctrlFunction_Settings;";
			x = 0.1625;
			y = 0.36;
			w = 0.2375;
			h = 0.04;
			colorBackground[] = {0,0,0,0.3};
		};
		class ViewHeader: Life_RscButtonMenu
		{
			idc = 6808;

			text = "Visibility";
			onButtonClick = "[2] spawn life_fnc_ctrlFunction_Settings;";
			x = 0.1625;
			y = 0.42;
			w = 0.2375;
			h = 0.04;
			colorBackground[] = {0,0,0,0.3};
		};
		class ObjViewHeader: Life_RscButtonMenu
		{
			idc = 6809;

			text = "Object Visibility";
			onButtonClick = "[3] spawn life_fnc_ctrlFunction_Settings;";
			x = 0.1625;
			y = 0.48;
			w = 0.2375;
			h = 0.04;
			colorBackground[] = {0,0,0,0.3};
		};
		class ObjNahHeader: Life_RscButtonMenu
		{
			idc = 6810;

			text = "Close Objects";
			onButtonClick = "[4] spawn life_fnc_ctrlFunction_Settings;";
			x = 0.1625;
			y = 0.54;
			w = 0.2375;
			h = 0.04;
			colorBackground[] = {0,0,0,0.3};
		};
		class ButtonClose: Life_RscButtonMenu
		{
			idc = 6811;
			
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = 0.15;
			y = 0.8;
			w = 0.7;
			h = 0.04;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.3};
		};
		
		//Player Tag Display
		
		class Button1_0: Life_RscButtonMenu
		{
			idc = 6812;

			text = "Player Tag On/Off";
			x = 0.575;
			y = 0.3;
			w = 0.25;
			h = 0.04;
		};
		
		//Auto Optimize
		
		class Button2_0: Life_RscButtonMenu
		{
			idc = 6813;

			text = "Auto Optimize";
			onButtonClick = "[7] spawn life_fnc_ctrlFunction_Settings;";
			x = 0.575;
			y = 0.3;
			w = 0.25;
			h = 0.04;
		};
		
		//Grass Filters
		
		class Button1_1: Life_RscButtonMenu
		{
			idc = 6814;

			text = "None";
			action = "['nichts'] call life_fnc_onTerrainChange;";
			x = 0.575;
			y = 0.3;
			w = 0.25;
			h = 0.04;
		};
		class Button2_1: Life_RscButtonMenu
		{
			idc = 6815;

			text = "Low";
			action = "['wenig'] call life_fnc_onTerrainChange;";
			x = 0.575;
			y = 0.36;
			w = 0.25;
			h = 0.04;
		};
		class Button3_1: Life_RscButtonMenu
		{
			idc = 6816;

			text = "Normal";
			action = "['normal'] call life_fnc_onTerrainChange;";
			x = 0.575;
			y = 0.42;
			w = 0.25;
			h = 0.04;
		};
		class Button4_1: Life_RscButtonMenu
		{
			idc = 6817;

			text = "High";
			action = "['viel'] call life_fnc_onTerrainChange;";
			x = 0.575;
			y = 0.48;
			w = 0.25;
			h = 0.04;
		};
		
		//Visibility Filters
		class Button1_2: life_RscXSliderH
		{
			idc = 6818;
			onSliderPosChanged = "[0,_this select 1] call life_fnc_s_onSliderChange;";

			x = 0.4375;
			y = 0.3;
			w = 0.27;
			h = 0.04;
			tooltip = "Visibility on Land";
		};
		class Button1_2_1: Life_RscText
		{
			idc = 68181;

			x = 0.725;
			y = 0.3;
			w = 0.275;
			h = 0.04;
		};
		/////////////////////////////////////////////////////////////
		/////////////////////////////////////////////////////////////
		class Button2_2: life_RscXSliderH
		{
			idc = 6819;
			onSliderPosChanged = "[1,_this select 1] call life_fnc_s_onSliderChange;";

			x = 0.4375;
			y = 0.36;
			w = 0.27;
			h = 0.04;
			tooltip = "Visibility When Driving";
		};
		class Button2_2_1: Life_RscText
		{
			idc = 68191;

			x = 0.725;
			y = 0.36;
			w = 0.275;
			h = 0.04;
		};
		/////////////////////////////////////////////////////////////
		/////////////////////////////////////////////////////////////
		class Button3_2: life_RscXSliderH
		{
			idc = 6820;
			onSliderPosChanged = "[2,_this select 1] call life_fnc_s_onSliderChange;";

			x = 0.4375;
			y = 0.42;
			w = 0.27;
			h = 0.04;
			tooltip = "Visibility When Flying";
		};
		class Button3_2_1: Life_RscText
		{
			idc = 68201;

			x = 0.725;
			y = 0.42;
			w = 0.275;
			h = 0.04;
		};
		/////////////////////////////////////////////////////////////
		/////////////////////////////////////////////////////////////
		class Button4_2: Life_RscButtonMenu
		{
			idc = 6821;

			text = "Optimize";
			onButtonClick = "[6] spawn life_fnc_ctrlFunction_Settings;";
			x = 0.575;
			y = 0.48;
			w = 0.25;
			h = 0.04;
		};
		
		//Object Visibility Filter
		class Button1_3: Life_RscButtonMenu
		{
			idc = 6822;

			text = "500";
			action = "setObjectViewDistance [500,100];";
			x = 0.575;
			y = 0.3;
			w = 0.25;
			h = 0.04;
		};
		class Button2_3: Life_RscButtonMenu
		{
			idc = 6823;

			text = "1000";
			action = "setObjectViewDistance [1000,500];";
			x = 0.575;
			y = 0.36;
			w = 0.25;
			h = 0.04;
		};
		class Button3_3: Life_RscButtonMenu
		{
			idc = 6824;

			text = "1200";
			action = "setObjectViewDistance [1200,800];";
			x = 0.575;
			y = 0.42;
			w = 0.25;
			h = 0.04;
		};
		class Button4_3: Life_RscButtonMenu
		{
			idc = 6825;

			text = "1600";
			action = "setObjectViewDistance [1600,1200];";
			x = 0.575;
			y = 0.48;
			w = 0.25;
			h = 0.04;
		};
		
		//Near Objects
		class Button1_4: Life_RscButtonMenu
		{
			idc = 6826;

			text = "NearObjects";
			x = 0.575;
			y = 0.3;
			w = 0.25;
			h = 0.04;
		};
	};
};