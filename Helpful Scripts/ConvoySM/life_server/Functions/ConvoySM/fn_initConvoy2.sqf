c1 = ([getMarkerPos "sv_spawn1", 0, "B_MRAP_01_hmg_F", WEST] call bis_fnc_spawnvehicle) select 0;
c2 = ([getMarkerPos "sv_spawn2", 0, "I_Truck_02_covered_F", WEST] call bis_fnc_spawnvehicle) select 0;
c3 = ([getMarkerPos "sv_spawn3", 0, "B_APC_Wheeled_01_cannon_F", WEST] call bis_fnc_spawnvehicle) select 0;
c4 = ([getMarkerPos "sv_spawn4", 0, "B_MRAP_01_hmg_F", WEST] call bis_fnc_spawnvehicle) select 0;

_vehicleArray = [c1,c2,c3,c4];
mainMissionVehicles = _vehicleArray;
mainMissionVehicle = c2;
_markerArray  = ["sv_pos1","sv_pos2","sv_pos3","sv_pos4","sv_pos5","sv_pos6","sv_pos7","sv_pos8","sv_pos9","sv_pos10"];

_possibleLootArrayVItems   = [["goldbar",100]];
_lootAmount = 1;
_lootArray = _possibleLootArrayVItems;
_lootTempToAdd = [];
_lootArrayFinal = [];

[[5,"<t size='1.2'><t color='#FF0000'>Convoy-Mission</t></t><br/><br/><t size='1'>Enter your text here!</t>"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

while {_lootAmount>0} do {
	_lootAmount = _lootAmount - 1;
	_loot_inArr = count _lootArray;
	_inArr = floor(random _loot_inArr);
	_lootTempToAdd = _lootArray select _inArr;
	_lootArrayFinal = _lootArrayFinal + [_lootTempToAdd];
};


		// Add items to the weaponholder
		_amountToBeSpawned         = 30;
		_possibleLootArrayWeapons  = [];
		_possibleLootArrayMags     = [];
		_possibleLootArrayItems    = [];

		// Do not modify
		for "_x" from 1 to _amountToBeSpawned step 1 do {
			_whichArray = floor(random 3);
			switch (_whichArray) do {
				case 0:
				{
					_random2 = floor(random (count _possibleLootArrayWeapons));
					_itemToAdd = ["",0];
					if (count _possibleLootArrayWeapons > 0) then {_itemToAdd = _possibleLootArrayWeapons select _random2;};
					mainMissionVehicle addWeaponCargoGlobal _itemToAdd;
				};
				case 1:
				{
					_random2 = floor(random (count _possibleLootArrayMags));
					_itemToAdd = ["",0];
					if (count _possibleLootArrayMags > 0) then {_itemToAdd = _possibleLootArrayMags select _random2;};
					mainMissionVehicle addMagazineCargoGlobal _itemToAdd;
				};
				case 2:
				{
					_random2 = floor(random (count _possibleLootArrayItems));
					_itemToAdd = ["",0];
					if (count _possibleLootArrayItems > 0) then {_itemToAdd = _possibleLootArrayItems select _random2;};
					mainMissionVehicle addItemCargoGlobal _itemToAdd;
				};
			};
		};

mainMissionVehicle setVariable ["Trunk",[_lootArrayFinal,500],true];
mainMissionVehicle setVariable ["locked",false,true];

// DO NOT MODIFY

_dhjjiews = _markerArray select ((count _markerArray) - 1);
ConvoySM_destination = getMarkerPos _dhjjiews;
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
	} forEach crew _x;
	_x setVehicleLock "LOCKEDPLAYER";
} forEach _vehicleArray;

ConvoySM_restartAllow = true;
ConvoySM_finished = false;

[] spawn {
	waitUntil { (mainMissionVehicle distance ConvoySM_destination < 50) || getDammage mainMissionVehicle >= 0.4 };
	if ((mainMissionVehicle distance ConvoySM_destination < 100)) then
	{
		mainMissionVehicle setDamage 0;
		{
			{
				deleteVehicle _x;
			} forEach (crew _x);
			deleteVehicle _x;
		} forEach mainMissionVehicles;
		[[5,"<t size='1.2'><t color='#FF0000'>Convoy-Mission</t></t><br/><br/><t size='1'>Enter your text here that should be displayed when the convoy reaches its destination!</t>"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	};

	if (getDammage mainMissionVehicle >= 0.9 AND mainMissionVehicle distance ConvoySM_destination > 100) then {
		ConvoySM_restartAllow = false;
		ConvoySM_finished = true;
	};
};

[_markerArray,_vehicleArray,true] execVM "\life_server\Functions\ConvoySM\init.sqf";