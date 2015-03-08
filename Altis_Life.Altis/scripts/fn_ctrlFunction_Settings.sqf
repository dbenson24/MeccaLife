/*
	file: fn_ctrlFunction_Settings.sqf
*/

private["_display","_type"];
_type = [_this,0,0] call BIS_fnc_param;

disableSerialization;
//waitUntil {!isNull findDisplay 6800};
_display = findDisplay 6800;
_info = _display displayCtrl 6805;
switch(_type) do
{
	case 0: //PlayerTags
	{
		//PlayerTags
		ctrlShow[6812,true]; 
		//Auto Optimize
		ctrlShow[6813,false]; 
		//Grass
		ctrlShow[6814,false]; 
		ctrlShow[6815,false]; 
		ctrlShow[6816,false]; 
		ctrlShow[6817,false];
		//Visibility
		ctrlShow[6818,false]; 
		ctrlShow[68181,false]; 
		ctrlShow[6819,false]; 
		ctrlShow[68191,false]; 
		ctrlShow[6820,false];  
		ctrlShow[68201,false]; 
		ctrlShow[6821,false];
		//Object Visibility
		ctrlShow[6822,false]; 
		ctrlShow[6823,false]; 
		ctrlShow[6824,false]; 
		ctrlShow[6825,false]; 
		//Close Objects
		ctrlShow[6826,false]; 
		ctrlShow[6827,false]; 
		//Information
		_info ctrlSetText "Here you can view the player names.";
	};
	
	case 1: //Grass
	{
		//PlayerTags
		ctrlShow[6812,false]; 
		//Auto Optimize
		ctrlShow[6813,false]; 
		//Grass
		ctrlShow[6814,true]; 
		ctrlShow[6815,true]; 
		ctrlShow[6816,true]; 
		ctrlShow[6817,true];
		//Visibility
		ctrlShow[6818,false]; 
		ctrlShow[68181,false]; 
		ctrlShow[6819,false]; 
		ctrlShow[68191,false]; 
		ctrlShow[6820,false];  
		ctrlShow[68201,false]; 
		ctrlShow[6821,false];
		//Object Visibility
		ctrlShow[6822,false]; 
		ctrlShow[6823,false]; 
		ctrlShow[6824,false]; 
		ctrlShow[6825,false]; 
		//Close Objects
		ctrlShow[6826,false]; 
		ctrlShow[6827,false]; 
		//Information
		_info ctrlSetText "Here you can adjust the Grass filtering. Recommendation: off";
	};
	
	case 2: //Visibility
	{
		//PlayerTags
		ctrlShow[6812,false]; 
		//Auto Optimize
		ctrlShow[6813,false]; 
		//Grass
		ctrlShow[6814,false]; 
		ctrlShow[6815,false]; 
		ctrlShow[6816,false]; 
		ctrlShow[6817,false];
		//Visibility
		ctrlShow[6818,true]; 
		ctrlShow[68181,true]; 
		ctrlShow[6819,true]; 
		ctrlShow[68191,true]; 
		ctrlShow[6820,true]; 
		ctrlShow[68201,true]; 
		ctrlShow[6821,true];
		//Object Visibility
		ctrlShow[6822,false]; 
		ctrlShow[6823,false]; 
		ctrlShow[6824,false]; 
		ctrlShow[6825,false]; 
		//Close Objects
		ctrlShow[6826,false]; 
		ctrlShow[6827,false]; 
		//Information
		_info ctrlSetText "Here you can customize your sight. This custom performance much ! Recommendation: 100";
	};
	
	case 3: //Object Visibility
	{
		//PlayerTags
		ctrlShow[6812,false]; 
		//Auto Optimize
		ctrlShow[6813,false]; 
		//Grass
		ctrlShow[6814,false]; 
		ctrlShow[6815,false]; 
		ctrlShow[6816,false]; 
		ctrlShow[6817,false];
		//Visibility
		ctrlShow[6818,false]; 
		ctrlShow[68181,false]; 
		ctrlShow[6819,false]; 
		ctrlShow[68191,false]; 
		ctrlShow[6820,false];  
		ctrlShow[68201,false]; 
		ctrlShow[6821,false];
		//Object Visibility
		ctrlShow[6822,true]; 
		ctrlShow[6823,true]; 
		ctrlShow[6824,true]; 
		ctrlShow[6825,true]; 
		//Close Objects
		ctrlShow[6826,false]; 
		ctrlShow[6827,false]; 
		//Information
		_info ctrlSetText "You can adjust the visibility of objects. Recommendation : 500";
	};
	
	case 4: //Near Object
	{
		//PlayerTags
		ctrlShow[6812,false]; 
		//Auto Optimize
		ctrlShow[6813,false]; 
		//Grass
		ctrlShow[6814,false]; 
		ctrlShow[6815,false]; 
		ctrlShow[6816,false]; 
		ctrlShow[6817,false];
		//Visibility
		ctrlShow[6818,false]; 
		ctrlShow[68181,false]; 
		ctrlShow[6819,false]; 
		ctrlShow[68191,false]; 
		ctrlShow[6820,false];  
		ctrlShow[68201,false]; 
		ctrlShow[6821,false];
		//Object Visibility
		ctrlShow[6822,false]; 
		ctrlShow[6823,false]; 
		ctrlShow[6824,false]; 
		ctrlShow[6825,false]; 
		//Near Objects
		ctrlShow[6826,true]; 
		ctrlShow[6827,true]; 
		//Information
		_info ctrlSetText "You can adjust the visibility for Dropped items such as money / Boxes / Cases . Recommendation : Switch";
	};
	
	case 5: //StartMenu
	{
		//PlayerTags
		ctrlShow[6812,false]; 
		//Auto Optimize
		ctrlShow[6813,true]; 
		//Grass
		ctrlShow[6814,false]; 
		ctrlShow[6815,false]; 
		ctrlShow[6816,false]; 
		ctrlShow[6817,false];
		//Visibility
		ctrlShow[6818,false]; 
		ctrlShow[68181,false]; 
		ctrlShow[6819,false]; 
		ctrlShow[68191,false]; 
		ctrlShow[6820,false];  
		ctrlShow[68201,false]; 
		ctrlShow[6821,false];
		//Object Visibility
		ctrlShow[6822,false]; 
		ctrlShow[6823,false]; 
		ctrlShow[6824,false]; 
		ctrlShow[6825,false]; 
		//Close Objects
		ctrlShow[6826,false]; 
		ctrlShow[6827,false]; 
		//Information
		_info ctrlSetText "You can adjust the game settings as desired ";
	};
	
	case 6: //Grass Optimal
	{
		[0,100] call life_fnc_s_onSliderChange;
		[1,100] call life_fnc_s_onSliderChange;
		[2,100] call life_fnc_s_onSliderChange;
	};
	
	case 7: //Grass Optimal
	{
		if(life_action_inUse) exitWith {};
		closedialog 0;
		life_action_inUse = true;
		hint "Optimize..";
		sleep 0.5;
		hint "Optimize...";
		sleep 0.5;
		hint "Optimize....";
		sleep 0.5;
		[0,100] call life_fnc_s_onSliderChange;
		[1,100] call life_fnc_s_onSliderChange;
		[2,100] call life_fnc_s_onSliderChange;
		hint "Optimize.. \n\n Visibility: DONE:";
		sleep 0.5;
		['nichts'] call life_fnc_onTerrainChange;
		hint "Optimize... \n\n Visibility: DONE: \n\n Terrain :DONE:";
		sleep 0.5;
		setObjectViewDistance [500,100];
		hint "Optimize.... \n\n Visibility: DONE: \n\n Terrain :DONE: \n\n Object Visibility: DONE:";
		sleep 0.5;
		hint "Optimize..... \n\n Visibility: DONE: \n\n Terrain :DONE: \n\n Object Visibility: DONE: \n\n :ALL DONE:";
		life_action_inUse = false;
	};
};
