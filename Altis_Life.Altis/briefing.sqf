waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};


player createDiarySubject ["CivRules","Civilian Rules"];
player createDiarySubject ["CopRules","Cop Rules"];
player createDiarySubject ["MedicRules","Medic Rules"];
player createDiarySubject ["controls","Controls"];

/*  Example
	player createDiaryRecord ["", //Container
		[
			"", //Subsection
				"
				TEXT HERE<br/><br/>
				"
		]
	];
*/
		player createDiaryRecord ["CivRules",
		[
			"Civ Rules", 
				"
				Civilian rules may located on our website here. http://meccagaming.ipbhost.com/topic/26-mecca-civilian-rules/<br/>
				"
		]
	];
	
	player createDiaryRecord["CopRules",
		[
			"Cop Rules",
				"
					Cop rules may be located on our website here. http://meccagaming.ipbhost.com/topic/14-mecca-state-troopers-handbook/<br/>
				"
		]
	];
					
	
	player createDiaryRecord ["MedicRules",
		[
			"Medic Rules", 
				"
				Medic rules may be located on our website here. http://meccagaming.ipbhost.com/topic/17-mecca-emergency-services-handbook/<br/>
				"
		]
	];

	
// Controls Section

	player createDiaryRecord ["controls",
		[
			"General Controls",
				"
				1: Wanted List
				2: Smartphone
				3: Market
				Y: Open Player Menu<br/>
				U: Lock and unlock cars<br/>
				F: Cop Siren (if cop)<br/>
				T: Vehicle Trunk<br/>
				Left Windows: Interaction Menu
				H: Holster/Unholster your weapon<br/>
				Left Shift + P: Ear Plugs (Reduce Sound by 80%)<br/>
				Q/E: Vehicle Signals<br/>
				B: Pickaxe<br/>
				SHIFT+R: Knock players out
				User11: Redgull<br/>
				LeftCtrl+R: Ammo Repack Module
				"
		]
	];
	
	player createDiaryRecord ["controls",
		[
			"Cop Controls",
				"
				1: Wanted List
				2: Smartphone
				3: Market
				U: Lock and unlock cars<br/>
				Left Windows: Interaction Menu
				O: Gate Opener/Spikestrip for Cops<br/>
				Shift + R: Restrains mouse cursor target<br/>
				Shift + L: Turns on Cop Lights<br/>
				F: Cop Siren toggle<br/>
				Shift + F: Cop Yelp<br/>
				User11: Redgull<br/>
				User11: Redgull<br/>
				LeftCtrl+R: Ammo Repack Module
				"
		]
	];