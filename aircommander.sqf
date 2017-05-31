if (roleDescription player == "Zeus 1") then
{
  findDisplay 12 displayCtrl 51 ctrlAddEventHandler
  [
    "Draw",
    {
      {
        if (_x iskindof "Air") then
        {
          if ((getPosATL _x select 2) >= 100 && (getPosASL _x select 2 >= 50)) then
          {
            if (canmove _x) then
             {
               if (!isNull driver (_x)) then
               {
                 if (side _x == side player) then
                 {
                   _this select 0 drawIcon
                   [
                     getText (configFile/"CfgVehicles"/typeOf _x/"Icon"),
                     [ side _x, false ] call BIS_fnc_sideColor,
                     getpos _x,
                     24,
                     24,
                     getDir _x,
                     format ["%1", roleDescription (driver _x)],
                     1,
                     0.04,
                     'TahomaB',
                     'right'
                     ];
                 } else
                {
                  _this select 0 drawIcon
                  [
                    getText (configFile/"CfgVehicles"/typeOf _x/"Icon"),
                    [ side _x, false ] call BIS_fnc_sideColor,
                    getpos _x,
                    24,
                    24,
                    getDir _x,
                    format ["%1", gettext (configfile >> "CfgVehicles" >> typeof _x >> "displayName")],
                    1,
                    0.04,
                    'TahomaB',
                    'right'
                    ];
                };
                _this select 0 drawIcon
                [
                  "#(argb,8,8,3)color(0,0,0,0)",
                  [ side _x, false ] call BIS_fnc_sideColor,
                  getpos _x,
                  24,
                  24,
                  getDir _x,
                  format ["H:%1 S:%2", (ceil (getPosASLvisual _x select 2)), (ceil (speed _x))],
                  1,
                  0.04,
                  'TahomaB',
                  'left'
                  ];
                };
            };
          };
        };
      }forEach vehicles;
    }
  ];
};
