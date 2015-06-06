disableSerialization;
_display = findDisplay 50300;
_displayCtrl1 = _display displayCtrl 50301;
_displayCtrl2 = _display displayCtrl 50302;

if (!life_isGov) then {_displayCtrl1 ctrlEnable false;_displayCtrl2 ctrlEnable false;};