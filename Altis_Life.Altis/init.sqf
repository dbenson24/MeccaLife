StartProgress = false;
enableSaving[false,false];

life_versionInfo = "Altis Life RPG v4.0";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";
[] execVM "scripts\nosidechat.sqf"; //Nosidechat Script
[] execVM "scripts\D41_Wetter.sqf"; //Custom Weather Script
[] execVM "scripts\intro.sqf"; //Intro Message Script
[] execVM "scripts\zlt_fastrope.sqf"; //FastRope Script

{_x setMarkerAlphaLocal 0} forEach ["mrkcocaineRed","mrkcocaineRed_1","mrkcocaineRed_2","mrkcocaineRed_3","mrkcocaineRed_4","mrkcocaineGreen","mrkheroinRed","mrkheroinRed_1","mrkheroinGreen","mrkweedRed","mrkweedRed_1","mrkweedRed_2","mrkweedRed_3","mrkweedRed_4","mrkweedGreen","mrklsdRed","mrklsdRed_1","mrklsdRed_2","mrklsdRed_3","mrklsdGreen"];

{_x setMarkerAlphaLocal 0} forEach ["mrkweedRed","mrkweedRed_1","mrkweedRed_2","mrkweedRed_3","mrkweedRed_4","mrkweedGreen"];

StartProgress = true;
