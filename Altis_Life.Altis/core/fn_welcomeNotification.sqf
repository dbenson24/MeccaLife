/*
	File: fn_welcomeNotification.sqf
	
	Description:
	Called upon first spawn selection and welcomes our player.
*/
format["Welcome %1, Please read the following as it is important!",profileName] hintC
[
	"In addition to some minor bug fixes we have implemented the following:"

	"Lawyers, Vigilantes, News Reporters (Server functionality as well as rule updates)"
	"Masked Players (Who was that? Not sure, I can't see his name...)"
	"Custom Cop Skins (By Rank)"
	"Custom Offroad Skin (Cop)"
	"Loadouts by Rank (Medic and Cop)"
	"Donator Loadout Structure (Still finalizing granted items)"
	"Random Drug Fields (Move location on server restart)"
	"News Banner Feature (News Reporters can send out reports to the server)"
];
	