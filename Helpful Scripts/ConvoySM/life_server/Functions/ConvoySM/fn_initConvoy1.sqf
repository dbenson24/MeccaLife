c1 = ([getMarkerPos "sv_spawn1", 0, "B_MRAP_01_hmg_F", WEST] call bis_fnc_spawnvehicle) select 0;
c2 = ([getMarkerPos "sv_spawn2", 0, "I_Truck_02_covered_F", WEST] call bis_fnc_spawnvehicle) select 0;
c3 = ([getMarkerPos "sv_spawn3", 0, "B_APC_Wheeled_01_cannon_F", WEST] call bis_fnc_spawnvehicle) select 0;
c4 = ([getMarkerPos "sv_spawn4", 0, "B_MRAP_01_hmg_F", WEST] call bis_fnc_spawnvehicle) select 0;

[[5,"<t size='1.2'><t color='#FF0000'>Military-Convoy-Mission</t></t><br/><br/><t size='1'>There is currently a Convoy on the way to the Federal Reserve! Kill the guards and stop the convoy to find the goldbars</t>"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

_vehicleArray = [c1,c2,c3,c4];
mainMissionVehicles = _vehicleArray;
mainMissionVehicle = c2;
_markerArray  = ["sv_pos1","sv_pos2","sv_pos3","sv_pos4","sv_pos5","sv_pos6","sv_pos7","sv_pos8","sv_pos9","sv_pos10"];


// DO NOT MODIFY

_dhjjiews = _markerArray select ((count _markerArray) - 1);
ConvoySM_destination = getMarkerPos _dhjjiews;
ConvoySM_Units = [];
ConvoySM_hitArray = [];
{
	_x addEventHandler ["FiredNear",{
		_shooter = _this select 1;
		[_shooter] spawn {
				sleep 60;
				_gunner = _this select 0;
				ConvoySM_hitArray = ConvoySM_hitArray - [_gunner];
		};
		if (!(_shooter in ConvoySM_hitArray)) then {
			ConvoySM_hitArray = ConvoySM_hitArray + [_shooter];
			[[],"life_fnc_setRating",_shooter,false] spawn life_fnc_MP;
		};
	}];

	{
		_x addEventHandler ["Hit",{
			_shooter = _this select 1;
			[_shooter] spawn {
				sleep 60;
				_gunner = _this select 0;
				ConvoySM_hitArray = ConvoySM_hitArray - [_gunner];
			};
			if (!(_shooter in ConvoySM_hitArray)) then {
				ConvoySM_hitArray = ConvoySM_hitArray + [_shooter];
				[[],"life_fnc_setRating",_shooter,false] spawn life_fnc_MP;
			};
		}];
		ConvoySM_Units = ConvoySM_Units + [_x];
	} forEach crew _x;
	_x setVehicleLock "LOCKEDPLAYER";
} forEach _vehicleArray;

ConvoySM_restartAllow = true;
ConvoySM_finished = false;

[] spawn {
	waitUntil { (mainMissionVehicle distance ConvoySM_destination < 50) || getDammage mainMissionVehicle >= 0.9 };
	if ((mainMissionVehicle distance ConvoySM_destination < 100)) then
	{
		mainMissionVehicle setDamage 0;
		{ deleteVehicle _x } forEach ConvoySM_Units;
		{ deleteVehicle _x } forEach mainMissionVehicles;
		[[5,"<t size='1.2'><t color='#FF0000'>Military-Convoy-Mission</t></t><br/><br/><t size='1'>Der Konvoy hat das Ziel erreicht! Die Mission wurde hiermit beendet!</t>"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	};

	if (getDammage mainMissionVehicle >= 0.9 AND mainMissionVehicle distance ConvoySM_destination > 100) then {
		ConvoySM_restartAllow = false;
		ConvoySM_finished = true;
		_x = floor(random 10)+3;
		_y = floor(random 10)+3;
		ConvoySM_groundWeaponHolder1 = "GroundWeaponHolder" createVehicle [((getPos mainMissionVehicle select 0)-5)+_x,((getPos mainMissionVehicle select 1)-5)+_y,0];
		_x = floor(random 10)+3;
		_y = floor(random 10)+3;
		ConvoySM_groundWeaponHolder2 = "GroundWeaponHolder" createVehicle [((getPos mainMissionVehicle select 0)-5)+_x,((getPos mainMissionVehicle select 1)-5)+_y,0];
		_x = floor(random 10)+3;
		_y = floor(random 10)+3;
		ConvoySM_groundWeaponHolder3 = "GroundWeaponHolder" createVehicle [((getPos mainMissionVehicle select 0)-5)+_x,((getPos mainMissionVehicle select 1)-5)+_y,0];
		_x = floor(random 10)+3;
		_y = floor(random 10)+3;
		ConvoySM_groundWeaponHolder4 = "CargoNet_01_box_F" createVehicle [((getPos mainMissionVehicle select 0)-5)+_x,((getPos mainMissionVehicle select 1)-5)+_y,0];

		// Add items to the weaponholder
		_amountWeaponholder        = 3;
		_amountToBeSpawned         = 50;
		_possibleLootArrayWeapons  = [["srifle_EBR_F",1],["srifle_LRR_F",1],["arifle_MX_F",1],["arifle_MXM_F",1],["!arifle_Katiba_F",1],["hgun_PDW2000_F",1],["SMG_02_F",1],["hgun_ACPC2_F",1],["hgun_P07_F",1]];
		_possibleLootArrayMags     = [];
		_possibleLootArrayItems    = [["Rangefinder",1],["NVGoggles",1],["Medikit",1],["ToolKit",1],["optic_Aco",1],["optic_Arco",1],["optic_Hamr",1],["optic_Holosight",1],["optic_SOS",1],["optic_MRCO",1],["optic_NVS",1],["optic_Nightstalker",1],["optic_DMS",1],["acc_flashlight",1],["acc_pointer_IR",1]];

		[[5,"<t size='1.2'><t color='#FF0000'>Military-Convoy-Mission</t></t><br/><br/><t size='1'>Das Hauptfahrzeug des Konvoys wurde ausreichend beschaedigt, der Inhalt liegt nun auf dem Boden!</t>"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

		// Do not modify
		for "_x" from 1 to _amountToBeSpawned step 1 do {
			_random = floor(random _amountWeaponholder)+1;
			_weaponholder = call compileFinal format ["ConvoySM_groundWeaponHolder%1",_random];
			_whichArray = floor(random 3);
			switch (_whichArray) do {
				case 0:
				{
					_random2 = floor(random (count _possibleLootArrayWeapons));
					_itemToAdd = ["srifle_EBR_F",0];
					if (count _possibleLootArrayWeapons > 0) then {_itemToAdd = _possibleLootArrayWeapons select _random2;};
					_weaponholder addWeaponCargoGlobal _itemToAdd;
				};
				case 1:
				{
					_random2 = floor(random (count _possibleLootArrayMags));
					_itemToAdd = ["srifle_EBR_F",0];
					if (count _possibleLootArrayMags > 0) then {_itemToAdd = _possibleLootArrayMags select _random2;};
					_weaponholder addMagazineCargoGlobal _itemToAdd;
				};
				case 2:
				{
					_random2 = floor(random (count _possibleLootArrayItems));
					_itemToAdd = ["srifle_EBR_F",0];
					if (count _possibleLootArrayItems > 0) then {_itemToAdd = _possibleLootArrayItems select _random2;};
					_weaponholder addItemCargoGlobal _itemToAdd;
				};
			};
		};
		[] spawn {
			sleep 600;
			{ deleteVehicle _x } forEach ConvoySM_Units;
			{ deleteVehicle _x } forEach mainMissionVehicles;
		};
	};
};

[_markerArray,_vehicleArray,true] execVM "\life_server\Functions\ConvoySM\init.sqf";