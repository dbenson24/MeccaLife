class govActionMenu
{
	idd = 50300;
	movingEnabled = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_hideGovAcMenu;";
	
	class controlsBackground {};
	
	class controls
	{
		class RscText_1000: Life_RscText
		{
			idc = -1;
			x = 0.421068 * safezoneW + safezoneX;
			y = 0.312969 * safezoneH + safezoneY;
			w = 0.14572 * safezoneW;
			h = 0.396066 * safezoneH;
			colorText[] = {0,0,0,0.7};
			colorBackground[] = {0,0,0,0.7};
		};
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = -1;
			text = "Open Vote Menu"; //--- ToDo: Localize;
			x = 0.42714 * safezoneW + safezoneX;
			y = 0.32397 * safezoneH + safezoneY;
			w = 0.133577 * safezoneW;
			h = 0.0220037 * safezoneH;
			onButtonClick = "closeDialog 0;[] spawn life_fnc_openVoteDialog;";
		};
		class RscButtonMenu_2401: Life_RscButtonMenu
		{
			idc = 50301;
			text = "Open Gov Menu"; //--- ToDo: Localize;
			x = 0.42714 * safezoneW + safezoneX;
			y = 0.356976 * safezoneH + safezoneY;
			w = 0.133577 * safezoneW;
			h = 0.0220037 * safezoneH;
			onButtonClick = "closeDialog 0;[] spawn life_fnc_openGovDialog;";
		};
		class RscButtonMenu_2402: Life_RscButtonMenu
		{
			idc = -1;
			text = "List Laws"; //--- ToDo: Localize;
			x = 0.42714 * safezoneW + safezoneX;
			y = 0.389982 * safezoneH + safezoneY;
			w = 0.133577 * safezoneW;
			h = 0.0220037 * safezoneH;
			onButtonClick = "closeDialog 0;[] spawn life_fnc_openLawDialog;";
		};
		class RscButtonMenu_2403: Life_RscButtonMenu
		{
			idc = 50302;
			text = "Remove Laws"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0;[] spawn life_fnc_openLawDialog;";
			x = 0.42714 * safezoneW + safezoneX;
			y = 0.422987 * safezoneH + safezoneY;
			w = 0.133577 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
	};
};