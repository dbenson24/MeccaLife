/*
		fn_AAN.sqf
*/
private["_display","_message","_name"];
disableSerialization;
_message = _this select 0;
_name = _this select 1;
[parseText format["<t size='2'>Channel 7 - Global Announcement!],parseText format["<t size='1.2'>%1 - %1 - %1</t>",_message]] spawn BIS_fnc_AAN;
sleep 45;
_display = uinamespace getvariable "BIS_AAN";
_display closeDisplay 0; 