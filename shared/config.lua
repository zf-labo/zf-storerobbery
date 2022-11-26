Config = {}


-- ### CORE CONFIGS
Config.Framework = 'qb-core' -- Framework used on your server. Available options: 'qb-core', 'esx'
Config.Locale = 'en' -- ESX only. Available options: 'en', 'fr'


-- ### SCRIPTS CONFIGS
Config.TargetScript = 'qb-target' -- Target script used on your server. Available options: 'qb-target', 'ox_target', 'qtarget'
Config.DispatchScript = 'qb-core' -- Dispatch script used on your server. Available options: 'qb-core', 'ps-dispatch', 'cd_dispatch'
Config.NotificationScript = 'qb-core' -- Notifications used on the server. Available options: 'qb-core', 'esx', 'ox-lib', 'custom'
Config.CustomNotification = function(msg, type) -- Only useable when Config.NotificationScript is set to 'custom'
    -- Put your code here
    print(msg, type)
end


-- ### MINIGAMES CONFIGS
Config.RegisterMinigame = 'qb-lock' -- Available options: 'qb-lock', 'ox_lib', 'ps-ui'
Config.SafeMinigame = 'qb-lock' -- Available options: 'qb-lock', 'ox_lib', 'memorygame', 'ps-ui', 'boostinghack'


-- ### POLICE CONFIGS
Config.AlertPolice = true
Config.AlertChance = 100
Config.PoliceRequired = 2
Config.PoliceJobs = {'police', 'bcso', 'sahp', 'sasp'}


-- ### REGISTER CONFIGS
Config.RegisterItem = 'lockpick'
Config.RegisterItemLost = 1 -- Available options: 0 (doesn't lose item'), 1 (loses item when failed), 2 (loses item when failed and when successful)
Config.RegisterItemLostChance = 20 -- % of chance to lose the item


-- ### REGISTER LOOT
Config.RegisterLoot = 'money' -- Available options: 'money', 'markedbills', 'item'
Config.RegisterLootMoney = {min = 1000, max = 5000}
Config.RegisterLootMarkedBills = {min = 10, max = 50}
Config.RegisterMaxItems = 2
Config.RegisterLoottable = { -- Loot table for the safe when Config.Safeloot = 'item'
    [1] = {item = 'markedbills', chances = 80, min = 10, max = 50},
    [2] = {item = 'weapon_crowbar', chances = 80, min = 1, max = 3},
    [3] = {item = 'markedbills', chances = 60, min = 10, max = 50},
    [4] = {item = 'markedbills', chances = 40, min = 10, max = 50},
    [5] = {item = 'markedbills', chances = 20, min = 10, max = 50},
}


-- ### SAFE CONFIGS
Config.SafeItem = 'safecracker'
Config.SafeItemLost = 1 -- Available options: 0 (doesn't lose item'), 1 (loses item when failed), 2 (loses item when failed and when successful)
Config.SafeItemLostChance = 50 -- % of chance to lose the item


-- ### SAFE LOOT
Config.SafeLoot = 'money' -- Available options: 'money', 'markedbills', 'item'
Config.SafeLootMoney = {min = 1000, max = 5000}
Config.SafeLootMarkedBills = {min = 15, max = 60}
Config.SafeMaxItems = 5
Config.SafeLoottable = { -- Loot table for the safe when Config.Safeloot = 'item'
    [1] = {item = 'markedbills', chances = 80, min = 20, max = 60},
    [2] = {item = 'weapon_crowbar', chances = 80, min = 1, max = 3},
    [3] = {item = 'markedbills', chances = 60, min = 20, max = 60},
    [4] = {item = 'markedbills', chances = 40, min = 20, max = 60},
    [5] = {item = 'markedbills', chances = 20, min = 20, max = 60},
}


-- ### PROGRESS BAR
Config.Progressbar = 'qb-core' -- Progressbar script used on your server. Available options: 'qb-core', 'oxlib-regular', 'oxlib-circle'
Config.Progresstimes = {
    ['register'] = 5000,
    ['safe'] = 15000
}


-- ### RESET CONFIGS
-- In Minutes or false to disable reset
Config.RegisterReset = 10
Config.SafeReset = 30


-- ### ZONES CONFIGS
Config.RegisterZones = {
    [1] = {
        coords = vector3(-47.24,-1757.65, 29.53),
        robbed = false,
        time = 0
    },
    [2] = {
        coords = vector3(-48.58,-1759.21, 29.59),
        robbed = false,
        time = 0
    },
    [3] = {
        coords = vector3(-1486.26,-378.0,  40.16),
        robbed = false,
        time = 0
    },
    [4] = {
        coords = vector3(-1222.03,-908.32, 12.32),
        robbed = false,
        time = 0
    },
    [5] = {
        coords = vector3(-706.08, -915.42, 19.21),
        robbed = false,
        time = 0
    },
    [6] = {
        coords = vector3(-706.16, -913.5, 19.21),
        robbed = false,
        time = 0
    },
    [7] = {
        coords = vector3( 24.47, -1344.99, 29.49),
        robbed = false,
        time = 0
    },
    [8] = {
        coords = vector3(24.45, -1347.37, 29.49),
        robbed = false,
        time = 0
    },
    [9] = {
        coords = vector3(1134.15, -982.53, 46.41),
        robbed = false,
        time = 0
    },
    [10] = {
        coords = vector3(1165.05, -324.49, 69.2),
        robbed = false,
        time = 0
    },
    [11] = {
        coords = vector3(1164.7, -322.58, 69.2),
        robbed = false,
        time = 0
    },
    [12] = {
        coords = vector3(373.14, 328.62, 103.56),
        robbed = false,
        time = 0
    },
    [13] = {
        coords = vector3(372.57, 326.42, 103.56),
        robbed = false,
        time = 0
    },
    [14] = {
        coords = vector3(-1818.9, 792.9, 138.08),
        robbed = false,
        time = 0
    },
    [15] = {
        coords = vector3(-1820.17, 794.28, 138.08),
        robbed = false,
        time = 0
    },
    [16] = {
        coords = vector3(-2966.46, 390.89, 15.04),
        robbed = false,
        time = 0
    },
    [17] = {
        coords = vector3(-3041.14, 583.87, 7.9),
        robbed = false,
        time = 0
    },
    [18] = {
        coords = vector3(-3038.92, 584.5, 7.9),
        robbed = false,
        time = 0
    },
    [19] = {
        coords = vector3(-3244.56, 1000.14, 12.83),
        robbed = false,
        time = 0
    },
    [20] = {
        coords = vector3(-3242.24, 999.98, 12.83),
        robbed = false,
        time = 0
    },
    [21] = {
        coords = vector3(549.42, 2669.06, 42.15),
        robbed = false,
        time = 0
    },
    [22] = {
        coords = vector3(549.05, 2671.39, 42.15),
        robbed = false,
        time = 0
    },
    [23] = {
        coords = vector3(1165.9, 2710.81, 38.15),
        robbed = false,
        time = 0
    },
    [24] = {
        coords = vector3(2676.02, 3280.52, 55.24),
        robbed = false,
        time = 0
    },
    [25] = {
        coords = vector3(2678.07, 3279.39, 55.24),
        robbed = false,
        time = 0
    },
    [26] = {
        coords = vector3(1958.96, 3741.98, 32.34),
        robbed = false,
        time = 0
    },
    [27] = {
        coords = vector3(1960.13, 3740.0, 32.34),
        robbed = false,
        time = 0
    },
    [28] = {
        coords = vector3(1728.86, 6417.26, 35.03),
        robbed = false,
        time = 0
    },
    [29] = {
        coords = vector3(1727.85, 6415.14, 35.03),
        robbed = false,
        time = 0
    },
    [31] = {
        coords = vector3(160.52, 6641.74, 31.6),
        robbed = false,
        time = 0
    },
    [32] = {
        coords = vector3(162.16, 6643.22, 31.6),
        robbed = false,
        time = 0
    },
}

Config.SafeZones = {
    [1] = {
        coords = vector3(-43.43, -1748.3, 29.42),
        robbed = false,
        time = 0
    }, 
    [2] = {
        coords = vector3(-1478.94, -375.5, 39.16),
        robbed = false,
        time = 0
    },
    [3] = {
        coords = vector3(-1220.85, -916.05, 11.32),
        robbed = false,
        time = 0
    },
    [4] = {
        coords = vector3(-709.74, -904.15, 19.21),
        robbed = false,
        time = 0
    },
    [5] = {
        coords = vector3(31.19, -1339.28, 29.5),
        robbed = false,
        time = 0
    },
    [6] = {
        coords = vector3(1126.77, -980.1, 45.41),
        robbed = false,
        time = 0
    },
    [7] = {
        coords = vector3(1159.46, -314.05, 69.2),
        robbed = false,
        time = 0
    },
    [8] = {
        coords = vector3(381.04, 332.58, 103.57),
        robbed = false,
        time = 0
    },
    [9] = {
        coords = vector3(-1829.27, 798.76, 138.19),
        robbed = false,
        time = 0
    },
    [10] = {
        coords = vector3(-2959.64, 387.08, 14.04),
        robbed = false,
        time = 0
    },
    [11] = {
        coords = vector3(-3048.66, 588.39, 7.91),
        robbed = false,
        time = 0
    },
    [12] = {
        coords = vector3(-3249.74, 1007.37, 12.83),
        robbed = false,
        time = 0
    },
    [13] = {
        coords = vector3(543.78, 2662.49, 42.16),
        robbed = false,
        time = 0
    },
    [14] = {
        coords = vector3(1169.31, 2717.79, 37.15),
        robbed = false,
        time = 0
    },
    [15] = {
        coords = vector3(2674.28, 3289.19, 55.24),
        robbed = false,
        time = 0
    },
    [16] = {
        coords = vector3(1961.75, 3750.3, 32.34),
        robbed = false,
        time = 0
    },
    [17] = {
        coords = vector3(1737.48, 6419.49, 35.04),
        robbed = false,
        time = 0
    },
    [18] = {
        coords = vector3(170.99, 6642.58, 31.7),
        robbed = false,
        time = 0
    },
}