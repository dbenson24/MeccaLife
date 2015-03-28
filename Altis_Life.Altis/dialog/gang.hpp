class Life_My_Gang_Diag {
	idd = 2620;
	name= "life_my_gang_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";
	
	class controlsBackground {
	
	    class TitleBackground: RscText
		{
			idc = 1000;
			x = 0.340155 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.324844 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0.5,0,1,0.8};
		};
		class Background: RscText
		{
			idc = 1001;
			x = 0.340155 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.324844 * safezoneW;
			h = 0.506 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
	};
	
	class controls {

		
		class Title: RscText
		{
			idc = 2629;
			text = "Gang/Group Management"; //--- ToDo: Localize;
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.324844 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class PlayerList: RscListbox
		{
			idc = 2621;
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.418 * safezoneH;
		};
		class DisplayGroupButton: RscButtonMenu
		{
			idc = 2401;
			text = "Group"; //--- ToDo: Localize;
			x = 0.577344 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.5,0,1,0.8};
		};
		class InviteGangButton: DisplayGroupButton
		{
			idc = 2630;
			text = "$STR_Gang_Invite_Player";
			onButtonClick = "[] spawn life_fnc_gangInvitePlayer";
			y = 0.401 * safezoneH + safezoneY;
		};
		class LeaveGangButton: DisplayGroupButton
		{
			idc = 2403;
			text = "$STR_Gang_Leave";
			onButtonClick = "[] call life_fnc_gangLeave";
			y = 0.456 * safezoneH + safezoneY;
		};
		class PromoteGangButton: DisplayGroupButton
		{
			idc = 2625;
			text = "$STR_Gang_SetLeader";
			onButtonClick = "[] spawn life_fnc_gangNewLeader";
			y = 0.511 * safezoneH + safezoneY;
		};
		class DisbandGangButton: DisplayGroupButton
		{
			idc = 2405;
			text = "$STR_Gang_Disband_Gang";
			onButtonClick = "[] spawn life_fnc_gangDisband";
			y = 0.621 * safezoneH + safezoneY;
		};
		class KickGangButton: DisplayGroupButton
		{
			idc = 2624;
			text = "$STR_Gang_Kick";
			onButtonClick = "[] call life_fnc_gangKick";
			y = 0.566 * safezoneH + safezoneY;
		};
		class CloseButton: DisplayGroupButton
		{
			idc = -1;
			text = "Close"; //--- ToDo: Localize;
			y = 0.291 * safezoneH + safezoneY;
		};
		class GangNameLabel: RscText
		{
			idc = 1003;
			text = "Your Gang:"; //--- ToDo: Localize;
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};

class Life_Create_Gang_Diag {
	idd = 2520;
	name= "life_my_gang_menu_create";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn {waitUntil {!isNull (findDisplay 2520)}; ((findDisplay 2520) displayCtrl 2523) ctrlSetText format[localize ""STR_Gang_PriceTxt"",[(call life_gangPrice)] call life_fnc_numberText]};";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.5;
			h = 0.3 - (22 / 250);
		};
	};
	
	class controls {
	
		class InfoMsg : Life_RscStructuredText
		{
			idc = 2523;
			sizeEx = 0.020;
			text = "";
			x = 0.1;
			y = 0.25;
			w = 0.5; h = .11;
		};
		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_Gang_Title";
			x = 0.1;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};

		class CloseLoadMenu : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;[] call life_fnc_p_updateMenu;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.5 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class GangCreateField : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Gang_Create";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_createGang";
			x = 0.27;
			y = 0.40;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class CreateGangText : Life_RscEdit
		{
			idc = 2522;
			text = "$STR_Gang_YGN";
			
			x = 0.04 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.35;
			w = (13 / 40);
			h = (1 / 25);
		};
	};
};