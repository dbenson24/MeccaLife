/*
	File: D41_wetter.sqf
	Author: Distrikt41.de - Dscha

	Description:
	Random Weather Script - What else can i say?
	Updated: 16.11.2014
*/
	private ["_fnc_D41_WetterWerte"];

	
	D41_Fog = [0,0,0];
	D41_waves = 1;
	D41_Preview = 0.5;
	D41_Wind = [1, 1, true];
	D41_Rain = 0;
	D41_RainCounter = 1;

	
	_fnc_D41_WetterWerte =
	{
		if (isDedicated) then
			{
				D41_ChanceN = round(random 100);
				if(D41_ChanceN <= 5) then
					{
						D41_Fog = [0,0,0]; D41_waves = 1; D41_Preview = 0.2; D41_Wind = [2, 2, true]; D41_Rain = 0; D41_RainCounter = 0;
						D41_WMod = round(random 9);
						if(D41_WMod == 0)	then {D41_Fog = [0.4, 0.1,30];		D41_Rain = 0.1;	D41_Preview = 0.4;}; //Dicht
						if(D41_WMod == 1)	then {D41_Fog = [0.4, 0.1,30];		D41_Rain = 0.2;	D41_Preview = 0.3;};
						if(D41_WMod == 2)	then {D41_Fog = [0.4, 0.1,30];		D41_Rain = 0.2;	D41_Preview = 0.2;}; //geht so, akzeptabler Fog
						if(D41_WMod == 3)	then {D41_Fog = [0.3, 0.1,30];	D41_RainCounter = 0;}; //Dicht
						if(D41_WMod == 4)	then {D41_Fog = [0.3, 0.1,30];	D41_Rain = 0.2;	D41_Preview = 0.4;};
						if(D41_WMod == 5)	then {D41_Fog = [0.3, 0.1,30];	D41_RainCounter = 0;}; //geht so, akzeptabler Fog
						if(D41_WMod == 6)	then {D41_Fog = [0.3, 0.1,30];	D41_RainCounter = 0;};
						if(D41_WMod == 7)	then {D41_Fog = [0.2, 0.1,30];	D41_Rain = 0.2;	D41_Preview = 0.5;};
						if(D41_WMod == 8)	then {D41_Fog = [0.1, 0.1,30];	D41_RainCounter = 0;}; //geht so, akzeptabler Fog
						if(D41_WMod == 9)	then {D41_Fog = [0.1, 0.1,30];	D41_Rain = 0.4;	D41_waves = 1;	D41_Preview = 0.5;}; //Hoch halt
					};

				if(D41_ChanceN >=6 && D41_ChanceN <= 35 && D41_RainCounter == 0) then
					{
						D41_Fog = [0,0,0]; D41_waves = 1; D41_Preview = 1; D41_Rain = 0; D41_RainCounter = 0;
						D41_WMod = round(random 9);
						if(D41_WMod == 0)	then {D41_Fog = 0.1;	D41_waves = 1;		D41_Preview = 1; 	D41_Wind = [4, 4, true];	D41_Rain = 0.6;};
						if(D41_WMod == 1)	then {D41_Fog = 0.3;	D41_waves = 1;		D41_Preview = 1; 	D41_Wind = [4, 4, true];	D41_Rain = 0.6;};
						if(D41_WMod == 2)	then {D41_Fog = 0.1;	D41_waves = 1;		D41_Preview = 0.9; D41_Wind = [4, 4, true];	D41_Rain = 0.5;};
						if(D41_WMod == 3)	then {D41_Fog = 0.2;	D41_waves = 1;		D41_Preview = 0.8; D41_Wind = [0, 5, true];	D41_Rain = 0.5;};
						if(D41_WMod == 4)	then {D41_Fog = 0.1;	D41_waves = 1;		D41_Preview = 0.7; D41_Wind = [6, 0, true];	D41_Rain = 0.3;};
						if(D41_WMod == 5)	then {D41_Fog = 0.1;	D41_waves = 1;		D41_Preview = 0.7; D41_Wind = [0, 6, true];	D41_Rain = 0.3;};
						if(D41_WMod == 6)	then {D41_Fog = 0.1;	D41_waves = 1;		D41_Preview = 0.6; D41_Wind = [5, 0, true];	D41_Rain = 0.2;};
						if(D41_WMod == 7)	then {D41_Fog = 0.1;	D41_waves = 1;		D41_Preview = 0.5; D41_Wind = [2, 4, true];	D41_Rain = 0.2;};
						if(D41_WMod == 8)	then {D41_Fog = 0.1;	D41_waves = 1;		D41_Preview = 0.4; D41_Wind = [3, 2, true];	D41_Rain = 0.2;};
						if(D41_WMod == 9)	then {D41_Fog = 0.1;	D41_waves = 1;		D41_Preview = 0.4; D41_Wind = [2, 1, true];	D41_Rain = 0.1;};
					};

				if(D41_ChanceN >=6 && D41_ChanceN <= 35 && D41_RainCounter == 1) then {D41_ChanceN = 36};

				if(D41_ChanceN >=36 && D41_ChanceN <= 90) then
				{
					D41_Fog = [0,0,0]; D41_waves = 1; D41_Preview = 0.2; D41_Wind = [5, 5, true]; D41_Rain = 0; D41_RainCounter = 0;
					D41_WMod = round(random 9);
					if(D41_WMod == 0)	then {D41_Preview = 0.9;	D41_Wind = [3, 0, true];};
					if(D41_WMod == 1)	then {D41_Preview = 0.9;	D41_Wind = [0, 3, true];};
					if(D41_WMod == 2)	then {D41_Preview = 0.7;	D41_Wind = [2, 3, true];};
					if(D41_WMod == 3)	then {D41_Preview = 0.7;	D41_Wind = [3, 2, true];};
					if(D41_WMod == 4)	then {D41_Preview = 0.6;	D41_Wind = [0, 3, true];};
					if(D41_WMod == 5)	then {D41_Preview = 0.6;	D41_Wind = [2, 0, true];};
					if(D41_WMod == 6)	then {D41_Preview = 0.5;	D41_Wind = [2, 2, true];};
					if(D41_WMod == 7)	then {D41_Preview = 0.5;	D41_Wind = [2, 0, true];};
					if(D41_WMod == 8)	then {D41_Preview = 0.4;	D41_Wind = [0, 2, true];};
					if(D41_WMod == 9)	then {D41_Preview = 0.4;	D41_Wind = [1, 1, true];};
					
				};

				if(D41_ChanceN >=91 && D41_ChanceN <= 100) then
				{
					D41_Fog = [0,0,0]; D41_waves = 1; D41_Preview = 0.2; D41_Wind = [1, 1, true]; D41_Rain = 0; D41_RainCounter = 1;
					D41_WMod = round(random 2);
					if(D41_WMod == 0)	then {D41_Preview = 0.2;	D41_Wind = [3, 0, true];};
					if(D41_WMod == 1)	then {D41_Preview = 0.2;	D41_Wind = [0, 3, true];};
					if(D41_WMod == 2)	then {D41_Preview = 0.1;	D41_Wind = [0, 0, true];};				
				};
				Diag_log format ["::::::::: WETTER SYSTEM ::::::::: D41_ChanceN = %1 ::: D41_WMod = %2",D41_ChanceN, D41_WMod];
				publicVariable "D41_Fog";
				publicVariable "D41_waves";
				publicVariable "D41_Preview";
				publicVariable "D41_Wind";
				publicVariable "D41_Rain";
			};
	};

	if(isDedicated)then
	{
		while{true}do
		{
			[] call _fnc_D41_WetterWerte;
			sleep 1;
			30 setFog (D41_Fog);
			60 setRain (D41_Rain);
			0 setOvercast (D41_Preview);
			setWind (D41_Wind);
			60 setWaves (D41_waves);
			sleep 1200;
		};
	};

	//JIP und sync Ged�hns
	if (!isDedicated) then
	{
		while{true}do
		{
			30 setFog (D41_Fog);
			60 setRain (D41_Rain);
			1 setOvercast (D41_Preview);
			5 setWind (D41_Wind);
			60 setWaves (D41_waves);
			//hint format ["::::::::: WETTER SYSTEM ::::::::: D41_ChanceN = %1 ::: D41_WMod = %2",D41_ChanceN, D41_WMod];
			uiSleep 120;
		};
	};