StartProgress = false;
enableSaving[false,false];

life_versionInfo = "Altis Life RPG v4.0";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";
[] execVM "scripts\nosidechat.sqf"; //Nosidechat Script
[] execVM "scripts\D41_Wetter.sqf"; //Custom Weather Script

StartProgress = true;
