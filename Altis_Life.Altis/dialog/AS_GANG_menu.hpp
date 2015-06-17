class AS_GANG_menu
{
	idd = 50400;
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";
	
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
			text = "Open Rebel Market"; //--- ToDo: Localize;
			x = 0.42714 * safezoneW + safezoneX;
			y = 0.32397 * safezoneH + safezoneY;
			w = 0.133577 * safezoneW;
			h = 0.0220037 * safezoneH;
			onButtonClick = "[0,0,0,'rebel'] spawn life_fnc_virt_menu;";// life_fnc_virt_menu,""rebel""
		};
		class RscButtonMenu_2401: Life_RscButtonMenu
		{
			idc = -1;
			text = "Rebel Weapon Shop"; //--- ToDo: Localize;
			x = 0.42714 * safezoneW + safezoneX;
			y = 0.356976 * safezoneH + safezoneY;
			w = 0.133577 * safezoneW;
			h = 0.0220037 * safezoneH;
			onButtonClick = "[0,0,0,'rebel'] spawn life_fnc_weaponShopMenu;"; // life_fnc_weaponShopMenu,""rebel""
		};
		class RscButtonMenu_2402: Life_RscButtonMenu
		{
			idc = -1;
			text = "Rebel Clothing"; //--- ToDo: Localize;
			x = 0.42714 * safezoneW + safezoneX;
			y = 0.389982 * safezoneH + safezoneY;
			w = 0.133577 * safezoneW;
			h = 0.0220037 * safezoneH;
			onButtonClick = "[0,0,0,'reb'] spawn life_fnc_clothingMenu;";                  //life_fnc_clothingMenu,""reb""";
		};
		class RscButtonMenu_2403: Life_RscButtonMenu
		{
			idc = -1;
			text = ""; //--- ToDo: Localize;
			onButtonClick = "";
			x = 0.42714 * safezoneW + safezoneX;
			y = 0.422987 * safezoneH + safezoneY;
			w = 0.133577 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
	};
};