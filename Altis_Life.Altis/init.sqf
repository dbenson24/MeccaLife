StartProgress = false;
enableSaving[false,false];

life_versionInfo = "Altis Life RPG v4.0";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";
[] execVM "scripts\intro.sqf"; //IntroScreen
[] execVM "scripts\zlt_fastrope.sqf"; //FastRope Script
[] execVM "scripts\nosidechat.sqf"; //NoSideChat Script
[] execVM "scripts\D41_Wetter.sqf"; //Modified Weather Script

StartProgress = true;
