/*
	Author GamerDF
*/
class WillkommenN
{
	idd = 6900;
	name = "Welcome";
	movingEnabled = 1;
	enableSimulation = 1;
	onLoad = "";

	class controlsBackground
	{
		class TITEL: life_RscText
		{
			idc = 6901;
			text = "Welcome to MeccaGaming.co";
			x = 0.15;
			y = 0.16;
			w = 0.7;
			h = 0.12;
			colorBackground[] = {0,0.1,0.66,0.8};
			colorText[] = {1,1,1,1};
			sizeEx = 0.07;
		};
		class BackgroundMIDDLE: life_RscText
		{
			idc = 6902;
			x = 0.15;
			y = 0.28;
			w = 0.7;
			h = 0.56;
			colorBackground[] = {0.5,0.5,0.5,0.8};
		};
		class Information: Life_rscStructuredText
		{
			idc = 6903;
			text = "Welcome to the Mecca AltisLife. Please read the rules on our forums at MeccaGaming.co . Our teamSpeak 3 address : | meccagaming.myteamspeak.net | . What is Auto-Optimize ? Auto.Optimize adjusts the game settings so that your game runs better. You can also define the settings yourself.";
			x = 0.15;
			y = 0.28;
			w = 0.7;
			h = 0.4;
			colorBackground[] = {0,0,0,0.1};
		};
	};

	class controls
	{
		/////////////////////////////////////////////////////////////
		///////////////////////////Buttons///////////////////////////
		/////////////////////////////////////////////////////////////
		class ButtonEinstellungen: Life_RscButtonMenu
		{
			idc = 6904;

			text = "Settings";
			onButtonClick = "closeDialog 0; [] call life_fnc_settingsMenu;";
			x = 0.15;
			y = 0.74;
			w = 0.7;
			h = 0.04;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.1,0.66,0.8};
			sizeEx = 0.05;
		};
		class ButtonOptimierung: Life_RscButtonMenu
		{
			idc = 6905;

			text = "Auto Optimize";
			onButtonClick = "[7] spawn life_fnc_ctrlFunction_Settings;";
			x = 0.15;
			y = 0.68;
			w = 0.7;
			h = 0.04;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.1,0.66,0.8};
			sizeEx = 0.05;
		};
		class ButtonClose: Life_RscButtonMenu
		{
			idc = 6906;

			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = 0.15;
			y = 0.8;
			w = 0.7;
			h = 0.04;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.1,0.66,0.8};
			sizeEx = 0.05;
		};
	};
};