class govMenu
{
	idd = 50200;
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
			h = 0.550092 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1001: Life_RscText
		{
			idc = -1;
			text = "Create a new Law"; //--- ToDo: Localize;
			x = 0.263205 * safezoneW + safezoneX;
			y = 0.235956 * safezoneH + safezoneY;
			w = 0.236795 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		class RscEdit_1400: Life_RscEdit
		{
			idc = 50201;
			x = 0.263205 * safezoneW + safezoneX;
			y = 0.257959 * safezoneH + safezoneY;
			w = 0.47359 * safezoneW;
			h = 0.0220037 * safezoneH;
			text = "";
		};
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = -1;
			text = "Adopt law"; //--- ToDo: Localize;
			x = 0.578932 * safezoneW + safezoneX;
			y = 0.279963 * safezoneH + safezoneY;
			w = 0.157863 * safezoneW;
			h = 0.0220037 * safezoneH;
			onButtonClick = "[] spawn life_fnc_createLaw;";
		};
		class RscText_1002: Life_RscText
		{
			idc = -1;
			text = "Change Taxes"; //--- ToDo: Localize;
			x = 0.263205 * safezoneW + safezoneX;
			y = 0.301967 * safezoneH + safezoneY;
			w = 0.236795 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		class RscEdit_1401: Life_RscEdit
		{
			idc = 50202;
			x = 0.263205 * safezoneW + safezoneX;
			y = 0.32397 * safezoneH + safezoneY;
			w = 0.47359 * safezoneW;
			h = 0.0220037 * safezoneH;
			text = "";
		};
		class RscButtonMenu_2401: Life_RscButtonMenu
		{
			idc = -1;
			text = "Apply Taxes"; //--- ToDo: Localize;
			x = 0.578932 * safezoneW + safezoneX;
			y = 0.345974 * safezoneH + safezoneY;
			w = 0.157863 * safezoneW;
			h = 0.0220037 * safezoneH;
			onButtonClick = "[] spawn life_fnc_changeTaxes;";
		};
		class RscText_1003: Life_RscText
		{
			idc = -1;
			text = "Goverment Bank Account"; //--- ToDo: Localize;
			x = 0.263205 * safezoneW + safezoneX;
			y = 0.37898 * safezoneH + safezoneY;
			w = 0.236795 * safezoneW;
			text = "";
			h = 0.0220037 * safezoneH;
		};
		class RscText_1004: Life_RscText
		{
			idc = -1;
			text = "Cash"; //--- ToDo: Localize;
			x = 0.263205 * safezoneW + safezoneX;
			y = 0.411985 * safezoneH + safezoneY;
			w = 0.236795 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		class RscText_1005: Life_RscText
		{
			idc = 50203;
			text = "0 Dollar"; //--- ToDo: Localize;
			x = 0.31785 * safezoneW + safezoneX;
			y = 0.411985 * safezoneH + safezoneY;
			w = 0.236795 * safezoneW;
			h = 0.0220037 * safezoneH;
			colorText[] = {0,0.45,0.02,1};
		};
		class RscText_1006: Life_RscText
		{
			idc = -1;
			text = "Withdraw from Bank Account"; //--- ToDo: Localize;
			x = 0.263205 * safezoneW + safezoneX;
			y = 0.444991 * safezoneH + safezoneY;
			w = 0.236795 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		class RscEdit_1402: Life_RscEdit
		{
			idc = 50204;
			x = 0.263205 * safezoneW + safezoneX;
			y = 0.466994 * safezoneH + safezoneY;
			w = 0.47359 * safezoneW;
			h = 0.0220037 * safezoneH;
			text = "";
		};
		class RscButtonMenu_2402: Life_RscButtonMenu
		{
			idc = -1;
			text = "Withdraw"; //--- ToDo: Localize;
			x = 0.578932 * safezoneW + safezoneX;
			y = 0.488998 * safezoneH + safezoneY;
			w = 0.157863 * safezoneW;
			h = 0.0220037 * safezoneH;
			onButtonClick = "[] spawn life_fnc_govWithdraw;";
		};
		class RscButtonMenu_2403: Life_RscButtonMenu
		{
			idc = -1;
			text = "Close this window"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0;";
			x = 0.439283 * safezoneW + safezoneX;
			y = 0.610018 * safezoneH + safezoneY;
			w = 0.115362 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
	};
};