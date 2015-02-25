StartProgress = false;
enableSaving[false,false];
/* Initialize the Logistics system */
execVM "R3F_LOG\init.sqf";

life_versionInfo = "Altis Life RPG v4.0";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";
[] execVM "scripts\nosidechat.sqf"; //Nosidechat Script
[] execVM "scripts\D41_Wetter.sqf"; //Custom Weather Script
[] execVM "scripts\zlt_fastrope.sqf"; //FastRope Script
[] execVM "scripts\antiHack1.sqf";
[] execVM "scripts\antiHack2.sqf";
[] execVM "scripts\fn_statusBar.sqf";
[] execVM "scripts\welcome.sqf"; 


//LIONS.. hiding custom markerse... rawr..? fk em
{_x setMarkerAlphaLocal 0} forEach ["mrkcocaineRed","mrkcocaineRed_1","mrkcocaineRed_2","mrkcocaineRed_3","mrkcocaineRed_4","mrkcocaineGreen","mrkheroinRed","mrkheroinRed_1","mrkheroinRed_2","mrkheroinRed_3","mrkheroinRed_4","mrkheroinGreen","mrkweedRed","mrkweedRed_1","mrkweedRed_2","mrkweedRed_3","mrkweedRed_4","mrkweedGreen","mrklsdRed","mrklsdRed_1","mrklsdRed_2","mrklsdRed_3","mrklsdGreen"];

{_x setMarkerAlphaLocal 0} forEach ["mrkweedRed","mrkweedRed_1","mrkweedRed_2","mrkweedRed_3","mrkweedRed_4","mrkweedGreen"];
{_x setMarkerAlphaLocal 0} forEach ["mrkfrogRed","mrkfrogRed_1","mrkfrogRed_2","mrkfrogRed_3","mrkfrogRed_4","mrkfrogGreen"];
{_x setMarkerAlphaLocal 0} forEach ["mrkmushroomRed","mrkmushroomGreen"];

{_x setMarkerAlphaLocal 0} forEach ["mrkRed","mrkRed_1","mrkRed_1_1","mrkRed_1_3","mrkGreen"]


StartProgress = true;


[
    10*60, // seconds to delete dead bodies (0 means don't delete) 
    20, // seconds to delete dead vehicles (0 means don't delete)
   10*60, // seconds to delete immobile vehicles (0 means don't delete)
    40, // seconds to delete dropped weapons (0 means don't delete)
    10*60, // seconds to deleted planted explosives (0 means don't delete)
    0 // seconds to delete dropped smokes/chemlights (0 means don't delete)
] execVM 'scripts\repetitive_cleanup.sqf';
