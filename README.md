# ZF LABO - Store Robberies
ZF-StoreRobberies is a new advanced QBCore & ESX Store Robbery Resource.

## Issues
For issues and bugs, please use the Issues Reporter directly on Github.

## Suggestions
For suggestions of scripts idea or features idea, please use the #📫・suggestions channel on our Discord: **https://discord.gg/wp3SqwRUmH**

## Installation
1. Download ZIP (via release or download)
2. Drag and Drop the resource in your server
3. Add `ensure zf-storerobbery` in server.cfg (Caution, it needs to be started after qb-target or ox_target)
4. Go into `fxmanifest.lua` and uncomment ESX if you are using ESX or uncomment QBCore if you are using QBCore.
5. Make the configs in `zf-storerobbery/shared/config.lua`
6. Restart the server and Enjoy

For ESX, the shared_scripts should be this:
```lua
shared_scripts {
    'shared/*.lua',
    
    -- ### ESX ###
    '@ox_lib/init.lua',
    '@es_extended/imports.lua',
    '@es_extended/locale.lua',
    'esx_locales/*.lua',
    
    
    -- ### QB ###
    --'@qb-core/shared/locale.lua',
    --'qb_locales/*.lua',
}

```

For QBCore, the shared_scripts should be this:
```lua
shared_scripts {
    'shared/*.lua',
    
    -- ### ESX ###
    --'@ox_lib/init.lua',
    --'@es_extended/imports.lua',
    --'@es_extended/locale.lua',
    --'esx_locales/*.lua',
    
    
    -- ### QB ###
    '@qb-core/shared/locale.lua',
    'qb_locales/*.lua',
}

```

-----------------------

`**ESX REQUIRED DEPENDENCIES**`
- es_extended [https://github.com/esx-framework/esx-legacy]
- ox_target [https://github.com/overextended/ox_target]
- ox_lib >= v2.14.0 [https://github.com/overextended/ox_lib]

`**ESX OPTIONAL DEPENDENCIES**`
- memorygame [https://github.com/pushkart2/memorygame]
- boostinghack [https://github.com/Lionh34rt/boostinghack]
- cd_dispatch

-----------------------

`**QBCORE REQUIRED DEPENDENCIES**`
- qb-core [https://github.com/qbcore-framework/qb-core]
- qb-target [https://github.com/qbcore-framework/qb-target]

`**QBCORE OPTIONAL DEPENDENCIES**`
- ps-ui [https://github.com/project-sloth/ps-ui]
- ps-dispatch [https://github.com/Project-Sloth/ps-dispatch]
- memorygame [https://github.com/pushkart2/memorygame]
- qb-lock [https://github.com/YishengCheww/qb-lock]
- boostinghack [https://github.com/Lionh34rt/boostinghack]
