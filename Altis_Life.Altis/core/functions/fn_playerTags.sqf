#include <macro.h>
/*
	File: fn_playerTags.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Adds the tags above other players heads when close and have visible range.
*/
private["_ui","_units","_goggles"];
#define iconID 78000
#define scale 0.8

_headgear = ["H_Shemag_olive","H_Shemag_khk","H_Shemag_tan","H_ShemagOpen_khk","H_ShemagOpen_tan","H_Shemag_olive_hs"];

if(visibleMap OR {!alive player} OR {dialog}) exitWith {
	500 cutText["","PLAIN"];
};

_ui = GVAR_UINS ["Life_HUD_nameTags",displayNull];
if(isNull _ui) then {
	500 cutRsc["Life_HUD_nameTags","PLAIN"];
	_ui = GVAR_UINS ["Life_HUD_nameTags",displayNull];
};

_units = nearestObjects[(visiblePosition player),["Man","Land_Pallet_MilBoxes_F","Land_Sink_F"],50];

SUB(_units,[player]);

{
	private "_text";
	_idc = _ui displayCtrl (iconID + _forEachIndex);
	if(!(lineIntersects [eyePos player, eyePos _x, player, _x]) && {!isNil {_x GVAR "realname"}}) then {
		_pos = switch(typeOf _x) do {
			case "Land_Pallet_MilBoxes_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 1.5]};
			case "Land_Sink_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2]};
			default {[visiblePosition _x select 0, visiblePosition _x select 1, ((_x modelToWorld (_x selectionPosition "head")) select 2)+.5]};
		};
		_sPos = worldToScreen _pos;
		_distance = _pos distance player;
		if(count _sPos > 1 && {_distance < 15}) then {
			_text = switch (true) do {
				case ((headgear _x) in _headgear): {format["<t color='#000000'>Masked Player</t>"];};
				case (isPlayer _x && {(uniform _x in life_noname_clothing)}): {"";};
				case (isPlayer _x && {(headgear _x in life_hidden_clothing) || (goggles _x in life_hidden_clothing)}): {"<t size='1.2'>[Masked Person]</t>";};
				case (_x in (units grpPlayer) && playerSide == civilian): {format["<t color='#00FF00'>%1</t>",(_x GVAR ["realname",name _x])];};
				case (!isNil {(_x GVAR "rank")}): {format["<img image='%1' size='1.5'></img> <t size='1.2'>%2</t><br/><t size='1.1'>[%3]</t>",switch ((_x GVAR "rank")) do {
					case 1: {"icons\cop\1.paa"};
					case 2: {"icons\cop\2.paa"};
					case 3: {"icons\cop\3.paa"};
					case 4: {"icons\cop\4.paa"};
					case 5: {"icons\cop\5.paa"};
					case 6: {"icons\cop\6.paa"};
					case 7: {"icons\cop\7.paa"};
					case 8: {"icons\cop\8.paa"};
					case 9: {"icons\cop\12.paa"};
					case 10: {"icons\cop\12.paa"};
					case 11: {"icons\cop\12.paa"};
					case 12: {"icons\cop\12.paa"};
					case 13: {"icons\cop\sco19.paa"};

					default {"icons\cop\1.paa"};
					},

					_x GVAR ["realname",name _x],
					
					switch ((_x GVAR "rank")) do {
						case 1: {"Police Community Support Officer"};
						case 2: {"Police Constable"};
						case 3: {"Senior Police Constable"};
						case 4: {"Sergeant"};
						case 5: {"Inspector"};
						case 6: {"Chief Inspector"};
						case 7: {"Superintendent"};
						case 8: {"Chief Superintendent"};
						case 9: {"Deputy Assistant Commissioner"};
						case 10: {"Assistant Commissioner"};
						case 11: {"Deputy Commissioner"};
						case 12: {"Commissioner"};
						case 13: {"SCO19"};

						default {"Police Community Support Officer"};
					}]};
				//NHS
				case (!isNil {(_x GVAR "nhsrank")}): {format["<img image='a3\ui_f\data\map\MapControl\hospital_ca.paa' size='1.5'></img> <t size='1.35'>%2</t><br/><t size='1.2'>[%1]</t>",switch ((_x GVAR "nhsrank")) do {
					case 2: {"First Aider"}; 
					case 3: {"Medic"};
					case 4: {"Surgeon"};
					case 5: {"Doctor"};
					case 6: {"General Practitioner"};
					case 7: {"NHS Administration"};
					case 8: {"Chief Medical Officer"};
					default {"Dr. In Training"};
					},_x GVAR ["realname",name _x]]};
				case ((!isNil {_x GVAR "name"} && playerSide == independent)): {format["<t color='#FF0000'><img image='a3\ui_f\data\map\MapControl\hospital_ca.paa' size='1.5'></img></t> %1",_x GVAR ["name","Unknown Player"]]};
				default {
					if(!isNil {(group _x) GVAR "gang_name"}) then {
						format["%1<br/><t size='0.8' color='#B6B6B6'>%2</t>",_x GVAR ["realname",name _x],(group _x) GVAR ["gang_name",""]];
					} else {
						_x GVAR ["realname",name _x];
					};
				};
			};
			if(_x GVAR ["speaking",false]) then {_text = "[SPEAKING] " + _text};
			_idc ctrlSetStructuredText parseText _text;
			_idc ctrlSetPosition [_sPos select 0, _sPos select 1, 0.4, 0.65];
			_idc ctrlSetScale scale;
			_idc ctrlSetFade 0;
			_idc ctrlCommit 0;
			_idc ctrlShow true;
		} else {
			_idc ctrlShow false;
		};
	} else {
		_idc ctrlShow false;
	};
} foreach _units;