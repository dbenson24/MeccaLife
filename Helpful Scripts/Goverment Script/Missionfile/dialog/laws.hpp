class lawMenu
{
	idd = 50100;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground {};
	
	class controls
	{

		class RscText_1000: Life_RscText
		{
			idc = -1;
			x = 0.257133 * safezoneW + safezoneX;
			y = 0.224954 * safezoneH + safezoneY;
			w = 0.485734 * safezoneW;
			h = 0.53469 * safezoneH;
			colorText[] = {0,0,0,0.7};
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1001: Life_RscText
		{
			idc = -1;
			text = "Current Laws (Doubleclick a law to see the entire text)"; //--- ToDo: Localize;
			x = 0.263205 * safezoneW + safezoneX;
			y = 0.235956 * safezoneH + safezoneY;
			w = 0.47359 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		class RscListbox_1500: Life_RscListbox
		{
			idc = 50101;
			onLBSelChanged = "[] spawn life_fnc_showLaw;";
			x = 0.263205 * safezoneW + safezoneX;
			y = 0.268961 * safezoneH + safezoneY;
			w = 0.47359 * safezoneW;
			h = 0.462077 * safezoneH;
		};
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = 50102;
			text = "Close this window"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0;if (life_isGov) then {[] spawn life_fnc_deleteLaw;};";
			x = 0.372495 * safezoneW + safezoneX;
			y = 0.73544 * safezoneH + safezoneY;
			w = 0.273225 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
	};
};