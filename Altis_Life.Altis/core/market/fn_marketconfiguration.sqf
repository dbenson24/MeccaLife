/*

	Main configuration for non-persistent market system
	Will need triggers to hook into vanilla pricing methods

*/

////////////MAIN CONFIG

life_market_resources = [

	//Schema: SHORTNAME, Default, Min, Max, changes in action, [Sales multiplied by 1, Purchase multiplied by -1]
	//["gold", 1500, 450, 2300, 8, 5],
	

	["oilp", 2450, 0, 2955, 3, 1,
		[ 
			["diamondc",1], 
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["cement",1],
			["glass",1]
		] 
	],
	
	["iron_r", 2000, 0, 3060, 3, 1,  
		[ 
			["diamondc",1], 
			["oilp",1],
			["copper_r",1],
			["salt_r",1],
			["cement",1],
			["glass",1]
		] 
	],
	
	["diamondc", 1150, 0, 1615, 3, 1, 
		[ 
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["cement",1],
			["glass",1]
		] 
	],
	
	["copper_r", 1400, 0, 2040, 3, 1,
		[ 
			["diamondc",1], 
			["oilp",1],
			["iron_r",1],
			["salt_r",1],
			["cement",1],
			["glass",1]
		] 
	],
	
	["salt_r", 2250, 0, 1345, 3, 1, 
		[ 
			["diamondc",1], 
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["cement",1],
			["glass",1]
		] 
	],
	
	["glass", 1700, 0, 2550, 3, 1, 
		[ 
			["diamondc",1], 
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["cement",1]
		] 
	],
	
	["cement", 1450, 0, 2125, 3, 1, 
		[ 
			["diamondc",1], 
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["glass",1]
		] 
	],

		
	///////////////////////////////////
	
	["turtle", 6500, 0, 11050, 3, 1,  
		[ 
			["marijuana",1], 
			["cocainep",1],
			["heroinp",1],
			["moonshine",1],
			["mashu",1],
			["frogp",1]
		] 
	],
	
	["marijuana", 2500, 0, 3995, 3, 1,   
		[ 
			["cocainep",1],
			["heroinp",1],
			["turtle",1],
			["frogp",1]
		] 
	],
	
	["cocainep", 4000, 0, 5270, 3, 1,   
		[ 
			["marijuana",1], 
			["heroinp",1],
			["turtle",1],
			["frogp",1]
		] 
	],
	
	["frogp", 2750, 0, 4335, 3, 1,   
		[ 
			["marijuana",1],
			["turtle",1],
			["cocainep",1],
			["heroinp",1]
		] 
	],

	["heroinp", 3500, 0, 4080, 4, 1,   
		[ 
			["marijuana",1], 
			["cocainep",1],
			["turtle",1],
			["frogp",1]
		] 
	]
];
publicVariable "life_market_resources";

////////////GENERATED CONFIG
//life_market_changes = []; //[SHORTNAME,SELL,BUY]
life_market_shortnames = []; //shortnames if in market
//life_market_clampprices = []; //[SHORTNAME,MIN,MAX]

{
	life_market_shortnames set [count life_market_shortnames, _x select 0];
	//life_market_clampprices set [count life_market_clampprices, [_x select 0, _x select 2, _x select 3] ];
	//life_market_changes set [count life_market_changes, [_x select 0, _x select 4, _x select 5] ];
}
foreach life_market_resources;

publicVariable "life_market_shortnames";
//publicVariable "life_market_clampprices";

////////////SYNC PRICES WITH SERVER IF EMPTY
//if(isNil("life_market_prices")) then
//{
	life_market_prices = []; //[SHORTNAME,CURRENTPRICE,DIRECTIONGLOBAL,DIRECTIONLOCAL]
	{
	
		life_market_prices set [count life_market_prices, [_x select 0, _x select 1, 0, 0] ];
	}
	foreach life_market_resources;
	
	publicVariable "life_market_prices";
	
	systemChat "Market Prices Generated!";
//};