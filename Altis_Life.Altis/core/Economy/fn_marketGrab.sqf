#include <macro.h>

/*
	File: fn_marketGrab.sqf
	Author: Derek Benson
	
	Description:
	Gets the data for the market item you are looking at
*/
private["_display","_tab","_good","_currgood","_currprice","_recprice","_recchange","_startprice","_startchange","_cp","_rp","_sp","_name"];
disableSerialization;
_display = findDisplay 39000;
_currgood = _display displayCtrl 39002;
_currprice = _display displayCtrl 39003;
_recprice = _display displayCtrl 39004;
_recchange = _display displayCtrl 39005;
_startprice = _display displayCtrl 39006;
_startchange = _display displayCtrl 39007;
_good = lbData[39001,(lbCurSel 39001)];

{
	if (EQUAL(SEL(_x,0),_good)) exitWith {_good = _x;};
}forEach life_market;

_name = ITEM_NAME(SEL(_good,0));

_currgood ctrlSetText format["Current Good: %1",(localize _name)];
_currprice ctrlSetText format["Current Price: $%1", SEL(_good,2)];
_recprice ctrlSetText format["Recent Price: $%1", SEL(_good,8)];
_recchange = ctrlSetText format["Recent Change: $%1", (SEL(_good,2) - SEL(_good,8))];
_startprice = ctrlSetText format["Price at Server Start: $%1", SEL(_good,9)];
_startchange = ctrlSetText format["Price Change Since Server Start: $%1", (SEL(_good,2) - SEL(_good,9))];
