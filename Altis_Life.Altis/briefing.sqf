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
				Y: Open Player Menu<br/>
				U: Lock and unlock cars<br/>
				F: Cop Siren (if cop)<br/>
				T: Vehicle Trunk<br/>
				Left Windows: Main Interaction key which is used for picking up items/money, gathering, interacting with cars (repair,etc) and for cops to interact with civilians. Can be rebound to a single key like H by pressing ESC->Configure->Controls->Custom->Use Action 10<br/>
				H: Holster/Unholster your weapon<br/>
				Left Shift + P: Ear Plugs (Reduce Sound by 80%)<br/>
				Q/E: Vehicle Signals<br/>
				"
		]
	];
	
	player createDiaryRecord ["controls",
		[
			"Cop Controls",
				"
				O: Opens gates without having to get out of vehicle<br/>
				Shift + R: Restrains mouse cursor target<br/>
				Shift + L: Turns on Cop Lights<br/>
				F: Cop Siren toggle<br/>
				Shift + F: Cop Yelp<br/>
				"
		]
	];