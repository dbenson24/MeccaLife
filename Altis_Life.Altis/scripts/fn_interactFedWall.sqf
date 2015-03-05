/*
    File: fn_interactFedWall.sqf
*/

switch (playerSide) do
{
    case west:
    {
        hint "You have repaired the fence"; //prints message
        _nObject = nearestObject [player, "Land_CncBarrier_F"];
        _nObject setDamage 0; // repairs the fence
    };
    case civilian:
    {
        if(life_inv_boltcutter < 1) exitWith { hint "You have got no shit."; };
        if(life_inv_boltcutter > 1) then 
        {
            life_inv_boltcutter = life_inv_boltcutter - 1;
            hint "The charge will go off in 15 seconds."; //prints message
			sleep 15;
            _nObject = nearestObject [player, "Land_CncBarrier_F"];
			_nObject = "Bo_Mk82" createVehicle [0,0,9999];
			_nObject setVelocity [100,0,0];
            _nObject setDamage 1;; // destroys the fence
        };
    };
    
    case independent:
    {
        hint "You're not a civilian"; //prints message
    };
};