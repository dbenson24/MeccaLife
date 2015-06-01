class voteMenu
{
	idd = 50000;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground {};
	
	class controls
	{

		class RscText_1000: Life_RscText
		{
			idc = -1;
			x = 0.357926 * safezoneW + safezoneX;
			y = 0.280086 * safezoneH + safezoneY;
			w = 0.285363 * safezoneW;
			h = 0.417837 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscListbox_1500: Life_RscListbox
		{
			idc = 50001;
			x = 0.363997 * safezoneW + safezoneX;
			y = 0.313073 * safezoneH + safezoneY;
			w = 0.27322 * safezoneW;
			h = 0.351863 * safezoneH;
		};
		class RscText_1001: Life_RscText
		{
			idc = -1;
			text = "Canidates:"; //--- ToDo: Localize;
			x = 0.365212 * safezoneW + safezoneX;
			y = 0.280086 * safezoneH + safezoneY;
			w = 0.188218 * safezoneW;
			h = 0.0329871 * safezoneH;
		};
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = -1;
			text = "Vote for selected Canidate"; //--- ToDo: Localize;
			x = 0.363997 * safezoneW + safezoneX;
			y = 0.669334 * safezoneH + safezoneY;
			w = 0.170003 * safezoneW;
			h = 0.0219914 * safezoneH;
			onButtonClick = "[] spawn life_fnc_voteForPlayer;hint ""wow"";";
		};
		class RscButtonMenu_2401: Life_RscButtonMenu
		{
			idc = -1;
			text = "Cancel Vote"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0;";
			x = 0.536429 * safezoneW + safezoneX;
			y = 0.669334 * safezoneH + safezoneY;
			w = 0.102002 * safezoneW;
			h = 0.0219914 * safezoneH;
		};
	};
};