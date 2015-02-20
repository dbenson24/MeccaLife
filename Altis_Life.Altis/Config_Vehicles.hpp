/* Price Coefficients */
#define ins 0.9
#define chop 0.8
#define sell 0.9
#define store 0.05
/* End Price Coefficients */

/* Vehicle Prices */
#define phatchback 22500
#define pquadbike 2500
#define poffroad 35000
#define psuv 30000
#define phatchbacksport 45000
#define pkart 15000
#define poffroadmed 10000
#define pzamakmed 75000
#define pmh9med 50000
#define porcamed 75000
#define pboxer 250000
#define pzamaktrans 135000
#define pzamakcov 200000
#define phemtttrans 260000
#define ptempesttrans 187000
#define ptempestcov 251500
#define phemttbox 600000
#define ptempestdev 800000
#define pifrit 950000
#define pmh9civ 325000
#define p50cal 950000
#define poffroadcop 5000
#define psuvcop 20000
#define phuntercop 30000
#define pm900 253000
#define porcaciv 750000
#define pmh9cop 75000
#define pghosthawkcop 200000
#define psdv 100000
#define prescueboat 5000
#define pspeedboat 20000
#define passaultboat 3000
/* End Vehicle Prices */

class CarShops {
	/*
		Format:
		{ Classname, rental price, license required, { varname, >= value } }

		{ varname, >= value} this is a "level" requirement mainly used by cops and rebels, do not fill this in if you are not utilizing it.
	*/
	
	
	
	/* Shop Inventory Definitions */
	class civcar {
		side = "civ";
		vehicles[] = {
			{ "B_Quadbike_01_F", 2500, "" }, 
			{ "C_Hatchback_01_F", phatchback, "driver" }, 
			{ "C_Offroad_01_F", poffroad, "driver" },
			{ "CsUV_01_F", psuv, "driver" },
			{ "C_Hatchback_01sport_F", phatchbacksport, "driver" }
		};
	};

	class kartshop {
		side = "civ";	
		vehicles[] = {
			{ "C_Kart_01_Blu_F", pkart, "driver" },
			{ "C_Kart_01_Fuel_F", pkart, "driver" },
			{ "C_Kart_01_Red_F", pkart, "driver" },
			{ "C_Kart_01_Vrana_F", pkart, "driver" }
		};
	};

	class medshop {
		side = "med";
		vehicles[] = {
			{ "C_Offroad_01_repair_F", poffroadmed, "" },
			{ "I_Truck_02_medical_F", pzamakmed, "" }
		};
	};

	class med_air_hs {
		side = "med";
		vehicles[] = {
			{ "B_Heli_Light_01_F", pmh9med, "mAir" },
			{ "O_Heli_Light_02_unarmed_F", porcamed, "mAir" }
		};
	};

	class civ_truck {
		side = "civ";
		vehicles[] = {
			{ "C_Van_01_box_F", pboxer, "trucking" },
			{ "I_Truck_02_transport_F", pzamaktrans, "trucking" },
			{ "I_Truck_02covered_F", pzamakcov, "trucking" },
			{ "B_Truck_01_transport_F", phemtttrans, "trucking" },
			{ "O_Truck_03_transport_F", ptempesttrans, "trucking" },
			{ "O_Truck_03covered_F", ptempestcov, "trucking" },
			{ "B_Truck_01_box_F", phemttbox, "trucking" },
			{ "O_Truck_03_device_F", ptempestdev, "trucking" }
		};
	};

	class rebcar {
		side = "civ";
		vehicles[] = {
			{ "B_Quadbike_01_F", pquadbike, "" },
			{ "B_G_Offroad_01_F", poffroad, "" },
			{ "O_MRAP_02_F", pifrit, "" },
			{ "B_Heli_Light_01_F", pmh9civ, "" },
			{ "B_G_Offroad_01_armed_F", p50cal, "rebel" }
		};
	};

	class copcar {
		side = "cop";
		vehicles[] = {
			{ "C_Offroad_01_F", poffroadcop, ""},
			{ "CsUV_01_F", psuvcop, "" },
			{ "B_MRAP_01_F", phuntercop, "", { "lifecoplevel", 4 } },
			{ "C_Hatchback_01sport_F", phatchbacksport, "", { "lifecoplevel", 2 } }
		};
	};

	class civ_air {
		side = "civ";
		vehicles[] = {
			{ "B_Heli_Light_01_F", pmh9civ, "pilot" },
			{ "O_Heli_Light_02_unarmed_F", porcaciv, "pilot" }
		};
	};

	class cop_air {
		side = "cop";
		vehicles[] = {
			{ "B_Heli_Light_01_F", pmh9cop, "", { "lifecoplevel", 2 } },
			{ "B_Heli_Transport_01_F", pghosthawkcop, "", { "lifecoplevel", 4 } }
		};
	};

	class cop_airhq {
		side = "civ";
		vehicles[] = {
			{ "B_Heli_Light_01_F", pmh9cop, "" },
			{ "B_Heli_Transport_01_F", pghosthawkcop, "", { "lifecoplevel", 3 } },
		};
	};

	class copship {
		side = "cop";
		vehicles[] = {
			{ "B_Boat_Transport_01_F", passaultboat, "" },
			{ "C_Boatcivil_01police_F", pspeedboat, "" },
			{ "BsDV_01_F", psdv, "" }
		};
	};

	class civship {
		side = "civ";
		vehicles[] = {
			{ "C_Rubberboat", prescueboat, "boat" },
			{ "C_Boatcivil_01_F", pspeedboat, "boat" },
			{ "BsDV_01_F", psdv, "boat" }
		};
	};
};

/*
	Vehicle Configs (Contains textures and other stuff)

	storageFee (Getting vehicles out of garage) format:
		INDEX 0: Civilian Price
		INDEX 1: Cop Price
		INDEX 3: EMS Price
		INDEX 4: OPFOR Price (Not implemented in vanilla but still leaving support

	Textures config follows { Texture Name, side, {texture(s)path}}
	Texture(s)path follows this format:
		INDEX 0: Texture Layer 0
		INDEX 1: Texture Layer 1
		INDEX 2: Texture Layer 2
		etc etc etc
*/
class CfgVehicles {
	class Default {
		vItemSpace = -1;
		storageFee[] = { 1000, 1000, 1000, 1000 };
		garageSell[] = { 0, 0, 0, 0 };
		insurance = 2500;
		chopShop = 1200;
		textures[] = {};
	};

	class I_Truck_02_medical_F : Default {
		vItemSpace = 150;
		storageFee[] = { 0, 0, store*pzamakmed, 0 };
		garageSell[] = { 0, 0, sell*pzamakmed, 0 };
		insurance = ins*pzamakmed;
		chopShop = 0;
		
	};

	class O_Truck_03_medical_F : Default {
		vItemSpace = 200;
		storageFee[] = { 0, 0, 3000, 0 };
		garageSell[] = { 0, 0, 10000, 0 };
		chopShop = 0;
	};

	class B_Truck_01_medical_F : Default {
		vItemSpace = 250;
		storageFee[] = { 0, 0, 6500, 0 };
		garageSell[] = { 0, 0, 25000, 0 };
		chopShop = 0;
	};

	class C_Rubberboat {
        vItemSpace = 45;
        storageFee[] = { store*prescueboat, store*prescueboat, 0, 0 };
		garageSell[] = { sell*prescueboat, sell*prescueboat, 0, 0 };
        insurance = ins*prescueboat;
        chopShop = chop*prescueboat;
        textures[] = { };
    };

	class B_Heli_Transport_01_F {
		vItemSpace = 200;
		storageFee[] = { 0, store*pghosthawkcop, 0, 0 };
		garageSell[] = { 0, sell*pghosthawkcop, 0, 0 };
		insurance = ins*pghosthawkcop;
		chopShop = chop*pghosthawkcop;
		textures[] = {};
	};

	class B_MRAP_01_hmg_F : Default {
		vItemSpace = 100;
	};

	class O_Boat_Armed_01_hmg_F {
        vItemSpace = 175;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 21000, 21000, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class B_Boat_Armed_01_minigun_F {
        vItemSpace = 175;
        storageFee[] = { 0, 16500, 0, 0 };
		garageSell[] = { 0, 21000, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class I_Boat_Armed_01_minigun_F {
        vItemSpace = 175;
        storageFee[] = { 1000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class B_G_Boat_Transport_01_F {
        vItemSpace = 45;
        storageFee[] = { 100, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class B_Boat_Transport_01_F {
        vItemSpace = 45;
        storageFee[] = { 0, store*passaultboat, 0, 0 };
		garageSell[] = { 0, sell*passaultboat, 0, 0 };
        insurance = ins*passaultboat;
        chopShop = chop*passaultboat;
        textures[] = { };
    };

	class O_Truck_03_transport_F {
        vItemSpace = 175;
        storageFee[] = { store*ptempesttrans, 0, 0, 0 };
        garageSell[] = { sell*ptempesttrans, 0, 0, 0 };
        insurance = ins*ptempesttrans;
        chopShop = chop*ptempesttrans;
        textures[] = { };
    };

	class O_Truck_03_device_F {
        vItemSpace = 500;
        storageFee[] = { store*ptempestdev, 0, 0, 0 };
		garageSell[] = { sell*ptempestdev, 0, 0, 0 };
        insurance = ins*ptempestdev;
        chopShop = chop*ptempestdev;
        textures[] = { };
    };

	class LandcargoBox_V1_F : Default {
        vItemSpace = 5000;
    };

	class BoxiND_Grenades_F : Default {
        vItemSpace = 350;
    };

	class BsupplyCrate_F {
        vItemSpace = 700;
    };

	class B_G_Offroad_01_F {
        vItemSpace = 115;
        storageFee[] = { store*poffroad, store*poffroadcop, store*poffroadmed, 0 };
		garageSell[] = { sell*poffroad, sell*poffroadcop, sell*poffroadmed, 0 };
        insurance = ins*poffroad;
        chopShop = chop*poffroad;
        textures[] = { };
    };

	class B_G_Offroad_01_armed_F {
		vItemSpace = 65;
        storageFee[] = { store*p50cal, 0, 0, 0 };
		garageSell[] = { sell*p50cal, 0, 0, 0 };
        insurance = ins*p50cal;
        chopShop = chop*p50cal;
	};

	class I_G_Van_01_transport_F {
        vItemSpace = 100;
        storageFee[] = { 1000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class C_Boatcivil_01_F {
        vItemSpace = 85;
        storageFee[] = { store*pspeedboat, store*pspeedboat, 0, 0 };
		garageSell[] = { sell*pspeedboat, sell*pspeedboat, 0, 0 };
        insurance = ins*pspeedboat;
        chopShop = chop*pspeedboat;
        textures[] = { };
    };

	class C_Boatcivil_01police_F {
        vItemSpace = 85;
        storageFee[] = { 0, store*pspeedboat, 0, 0 };
		garageSell[] = { 0, sell*pspeedboat, 0, 0 };
        insurance = ins*pspeedboat;
        chopShop = chop*pspeedboat;
        textures[] = { };
    };

	class C_Boatcivil_01_rescue_F {
        vItemSpace = 85;
        storageFee[] = { 1000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class B_Truck_01_box_F {
        vItemSpace = 1000;
        storageFee[] = { store*phemttbox, 0, 0, 0 };
		garageSell[] = { sell*phemttbox, 0, 0, 0 };
        insurance = ins*phemttbox;
        chopShop = chop*phemttbox;
        textures[] = { };
    };

	class B_Truck_01_transport_F {
        vItemSpace = 600;
        storageFee[] = { store*phemtttrans, 0, 0, 0 };
		garageSell[] = { sell*phemtttrans, 0, 0, 0 };
        insurance = ins*phemtttrans;
        chopShop = chop*phemtttrans;
        textures[] = { };
    };

	class O_MRAP_02_F {
        vItemSpace = 80;
        storageFee[] = { store*pifrit, 0, 0, 0 };
		garageSell[] = { sell*pifrit, 0, 0, 0 };
        insurance = ins*pifrit;
        chopShop = chop*pifrit;
        textures[] = { };
    };

	class I_MRAP_03_F {
        vItemSpace = 58;
        storageFee[] = { 1000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class C_Offroad_01_F {
        vItemSpace = 115;
        storageFee[] = { store*poffroad, store*poffroadcop, store*poffroadmed, 0 };
		garageSell[] = { sell*poffroad, sell*poffroadcop, sell*poffroadmed, 0 };
        insurance = ins*poffroad;
        chopShop = chop*poffroad;
        textures[] = {
        	{ "Red", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_extco.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_extco.paa"
            } },
			{ "Yellow", "civ", {
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01cO.paa",
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01cO.paa"
            } },
			{ "White", "civ", {
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02cO.paa",
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02cO.paa"
            } },
			{ "Blue", "civ", {
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03cO.paa",
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03cO.paa"
            } },
			{ "Dark Red", "civ", {
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04cO.paa",
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04cO.paa"
            } },
			{ "Blue / White", "civ", {
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05cO.paa",
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05cO.paa"
            } },
            { "Fed", "fed", {
	                "#(ai,64,64,1)Fresnel(0.3,3)"
            } },
			{ "Police", "cop", {
	                "textures\policeoffroad.jpg"
            } },
            { "Taxi", "civ", {
	                "#(argb,8,8,3)color(0.6,0.3,0.01,1)"
            } }
	    };
    };

	class C_Kart_01_Blu_F {
		vItemSpace = 20;
		storageFee[] = { store*pkart+250, store*pkart+250, store*pkart+250, store*pkart+250 };
		garageSell[] = { sell*pkart, sell*pkart, sell*pkart, sell*pkart };
        insurance = ins*pkart;
        chopShop = chop*pkart;
		textures[] = {};
	};

	class C_Kart_01_Fuel_F : C_Kart_01_Blu_F {}; //Inherits everything from the above class
	class C_Kart_01_Red_F : C_Kart_01_Blu_F {}; //Inherits everything from the above class
	class C_Kart_01_Vrana_F : C_Kart_01_Blu_F {}; //Inherits everything from the above class

	class C_Hatchback_01sport_F {
        vItemSpace = 65;
        storageFee[] = { store*phatchbacksport, store*phatchbacksport, store*phatchbacksport, 0 };
		garageSell[] = { sell*phatchbacksport, sell*phatchbacksport, sell*phatchbacksport, 0 };
        insurance = ins*phatchbacksport;
        chopShop = chop*phatchbacksport;
        textures[] = {
        	{ "Red", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_extsport01co.paa"
            } },
			{ "Dark Blue", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_extsport02co.paa"
            } },
			{ "Orange", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_extsport03co.paa"
            } },
			{ "Black / White", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_extsport04co.paa"
            } },
			{ "Beige", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_extsport05co.paa"
            } },
			{ "Green", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_extsport06co.paa"
            } },
            { "Police", "cop", {
                "#(ai,64,64,1)Fresnel(1.3,7)"
            } }
        };
    };

	class B_Quadbike_01_F {
        vItemSpace = 45;
        storageFee[] = { store*pquadbike+250, 0, 0, 0 };
		garageSell[] = { sell*pquadbike, 0, 0, 0 };
        insurance = ins*pquadbike;
        chopShop = chop*pquadbike;
        textures[] = {
        	{ "Brown", "cop", {
                "\A3\Soft_F\Quadbike_01\Data\Quadbike_01co.paa"
            } },
			{ "Digi Desert", "reb", {
	                "\A3\Soft_F\Quadbike_01\Data\quadbike_01_opforco.paa"
	        } },
			{ "Black", "civ", {
	                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01civ_blackco.paa"
	        } },
			{ "Blue", "civ", {
	                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01civ_blueco.paa"
	        } },
			{ "Red", "civ", {
	                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01civ_redco.paa"
	        } },
			{ "White", "civ", {
	                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01civ_whiteco.paa"
	        } },
			{ "Digi Green", "civ", {
	                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01indpco.paa"
	        } },
			{ "Hunter Camo", "civ", {
	                "\a3\soft_f_gamma\Quadbike_01\data\quadbike_01indp_hunterco.paa"
	        } },
	        { "Rebel Camo", "reb", {
                "\a3\soft_f_gamma\Quadbike_01\data\quadbike_01indp_hunterco.paa"
            } }
        };
    };

	class I_Truck_02covered_F {
        vItemSpace = 250;
        storageFee[] = { store*pzamakcov, 0, 0, 0 };
		garageSell[] = { sell*pzamakcov, 0, 0, 0 };
        insurance = ins*pzamakcov;
        chopShop = chop*pzamakcov;
        textures[] = {
        	{ "Orange", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kabco.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuzco.paa"
            } },
            { "Black", "fed", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } }
        };
    };

	class I_Truck_02_transport_F : I_Truck_02covered_F {
        vItemSpace = 120;
        storageFee[] = { store*pzamaktrans, 0, 0, 0 };
		garageSell[] = { sell*pzamaktrans, 0, 0, 0 };
		insurance = ins*pzamaktrans;
        chopShop = chop*pzamaktrans;
    };

	class O_Truck_03covered_F {
		vItemSpace = 305;
		storageFee[] = { store*ptempestcov, 0, 0, 0 };
		garageSell[] = { sell*ptempestcov, 0, 0, 0 };
		insurance = ins*ptempestcov;
		chopShop = chop*ptempestcov;
		textures[] = {};
	};

	class C_Hatchback_01_F {
        vItemSpace = 65;
        storageFee[] = { store*phatchback, 0, 0, 0 };
		garageSell[] = { sell*phatchback, 0, 0, 0 };
        insurance = ins*phatchback;
        chopShop = chop*phatchback;
        textures[] = {
        	{ "Beige", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01co.paa"
            } },
			{ "Green", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02co.paa"
            } },
			{ "Blue", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03co.paa"
            } },
			{ "Dark Blue", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04co.paa"
            } },
			{ "Yellow", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06co.paa"
            } },
			{ "White", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07co.paa"
            } },
			{ "Grey", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08co.paa"
            } },
            { "Black", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09co.paa"
            } }
        };
    };

	class CsUV_01_F {
        vItemSpace = 115;
        storageFee[] = { store*psuv, store*psuvcop, 0, 0 };
		garageSell[] = { sell*psuv, sell*psuvcop, 0, 0 };
        insurance = ins*psuv;
        chopShop = chop*psuv;
        textures[] = {
        	{ "Dark Red", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_extco.paa"
            } },
			{ "Black", "cop", {
	                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02co.paa"
            } },
			{ "Silver", "civ", {
	                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03co.paa"
            } },
			{ "Orange", "civ", {
	                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04co.paa"
            } },
            { "Cop", "cop", {
                "textures\meccapolicesuv.jpg"
            } }
	        };
    };

	class C_Van_01_transport_F {
        vItemSpace = 100;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 25000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {
        	{ "White", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_extco.paa"
            } },
            { "Red", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_redco.paa"
            } }
        };
    };

	class C_Van_01_box_F {
        vItemSpace = 325;
        storageFee[] = { store*pboxer , 0, 0, 0 };
		garageSell[] = { sell*pboxer, 0, 0, 0 };
        insurance = ins*pboxer;
        chopShop = chop*pboxer;
        textures[] = {
        	{ "White", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_extco.paa"
            } },
            { "Red", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_redco.paa"
            } }
        };
    };
	class B_MRAP_01_F {
        vItemSpace = 65;
        storageFee[] = { 0, store*phuntercop , 0, 0 };
		garageSell[] = { 0, sell*phuntercop, 0, 0 };
        insurance = ins*phuntercop;
        chopShop = chop*phuntercop;
        textures[] = {
        	{ "Regular", "cop", {
                "texture\hunter1.jpg",
				"texture\hunter2.jpg"
            } },
            { "Black", "fed", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } }
        };
    };

	class B_Heli_Light_01_F {
        vItemSpace = 90;
		storageFee[] = { store*pmh9civ , store*pmh9cop , store*pmh9med , store*pmh9med  };
		garageSell[] = { sell*pmh9civ, sell*pmh9cop, sell*pmh9med, sell*pmh9med };
        insurance = ins*pmh9civ;
        chopShop = chop*pmh9civ;
        textures[] = {
        	{ "Sheriff", "cop", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_extsheriffco.paa"
            } },
			{ "Black", "fed", {
	                "\a3\air_f\Heli_Light_01\Data\heli_light_01_extionco.paa"
            } },
			{ "Civ Blue", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blueco.paa"
            } },
			{ "Civ Red", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\heli_light_01_extco.paa"
            } },
			{ "Digi Green", "donate", {
	                "\a3\air_f\Heli_Light_01\Data\heli_light_01_extindpco.paa"
            } },
			{ "Blueline", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_bluelineco.paa"
            } },
			{ "Elliptical", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_ellipticalco.paa"
            } },
			{ "Furious", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furiousco.paa"
            } },
			{ "Jeans Blue", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeansco.paa"
            } },
			{ "Speedy Redline", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_extspeedyco.paa"
            } },
			{ "Sunset", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_extsunsetco.paa"
            } },
			{ "Vrana", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vranaco.paa"
            } },
			{ "Waves Blue", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_waveco.paa"
            } },
			{ "Rebel Digital", "reb", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digitalco.paa"
            } },
            { "EMS White", "med", {
                "#(argb,8,8,3)color(1,1,1,0.8)"
            } }
        };
    };

	class O_Heli_Light_02_unarmed_F {
        vItemSpace = 210;
        storageFee[] = { store*porcaciv , 0, store*porcamed , 0 };
		garageSell[] = { sell*porcaciv, 0, sell*porcamed, 0 };
        insurance = ins*porcaciv;
        chopShop = chop*porcamed;
        textures[] = {
        	{ "Black", "fed", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_extco.paa"
            } },
			{ "White / Blue", "civ", {
	                "\a3\air_f\Heli_Light_02\Data\heli_light_02_extcivilianco.paa"   
            } },
			{ "Digi Green", "donate", {
	                "\a3\air_f\Heli_Light_02\Data\heli_light_02_extindpco.paa"
            } },
			{ "Desert Digi", "reb", {
	                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opforco.paa" 
            } },
            { "EMS White", "med", {
                "#(argb,8,8,3)color(1,1,1,0.8)"
            } }
        };
    };

	class I_Heli_Transport_02_F {
        vItemSpace = 375;
        storageFee[] = { 75000, 0, 0, 0 };
		garageSell[] = { 125000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {
        	{ "Ion", "civ", {
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1ionco.paa",
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2ionco.paa",
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3ionco.paa"
            } },
            { "Dahoman", "civ", {
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_dahomanco.paa",
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_dahomanco.paa",
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_dahomanco.paa"
            } }
        };
    };
};