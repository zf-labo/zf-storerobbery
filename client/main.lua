if Config.Framework == 'qb-core' then QBCore = exports['qb-core']:GetCoreObject() end

-- ## LOCAL FUNCTIONS
local function AddTarget(name, coords, width, depth, infos, options, distance)
    if Config.TargetScript == 'qb-target' then
        exports['qb-target']:AddBoxZone(name, coords, width, depth, infos, {
            options = options,
            distance = distance or 1.5
        })
    elseif Config.TargetScript == 'ox_target' then
        exports.ox_target:addBoxZone({
            coords = coords,
            size = vector3(width, depth, ((width+depth) / 2)),
            rotation = 0,
            drawSprite = true,
            debug = false,
            options = options
        })
    elseif Config.TargetScript == 'qtarget' then
        exports.qtarget:AddBoxZone(name, coords, width, height, {
            options = options,
            distance = distance
        })
    end
end

local function _L(str)
    if Config.Framework == 'qb-core' then
        str = str:gsub('_', '.')
        return Lang:t(str)
    elseif Config.Framework == 'esx' then
        return _U(str)
    end
end

local function TriggerCallback(name, cb, ...)
    if Config.Framework == 'qb-core' then
        QBCore.Functions.TriggerCallback(name, cb, ...)
    elseif Config.Framework == 'esx' then
        ESX.TriggerServerCallback(name, cb, ...)
    end
end

local function Notify(msg, type)
    if Config.NotificationScript == 'qb-core' then
        QBCore.Functions.Notify(msg, type)
    elseif Config.NotificationScript == 'esx' then
        ESX.ShowNotification(msg)
    elseif Config.NotificationScript == 'ox-lib' then
        lib.notify({
            title = msg,
            type = type
        })        
    elseif Config.NotificationScript == 'custom' then
        Config.CustomNotification(msg, type)
    end
end

local function Minigame(type)
    if type == 'register' then
        if Config.RegisterMinigame == 'qb-lock' then
            local success = exports['qb-lock']:StartLockPickCircle(5, 8)
            return success or false
        elseif Config.RegisterMinigame == 'ox_lib' then
            local success = lib.skillCheck({'easy', 'medium', 'medium', 'easy', 'hard'})
            return success or false
        elseif Config.RegisterMinigame == 'ps-ui' then
            local success = false
            exports['ps-ui']:Circle(function(result)
                success = result
            end, 5, 8)
            return success
        end
    elseif type == 'safe' then
        if Config.SafeMinigame == 'qb-lock' then
            local success = exports['qb-lock']:StartLockPickCircle(7, 5)
            return success or false
        elseif Config.SafeMinigame == 'ox_lib' then
            local success = lib.skillCheck({'medium', 'hard', 'medium', 'easy', 'hard', 'medium', 'hard', 'easy'})
            return success or false
        elseif Config.SafeMinigame == 'memorygame' then
            local success = false
            local holdResult = true
            
            exports['memorygame']:thermiteminigame(5, 3, 3, 15, function()
                success = true
                holdResult = false
            end, function()
                success = false
                holdResult = false
            end)
    
            while holdResult do Wait(100) end
            return success
        elseif Config.SafeMinigame == 'ps-ui' then
            local success = false
            exports['ps-ui']:Circle(function(result)
                success = result
            end, 1, 5)
            return success
        elseif Config.SafeMinigame == 'boostinghack' then
            return exports['boostinghack']:StartHack()
        end
    end
end

local function CallPolice()
    if not Config.AlertPolice then return end
    if math.random(1, 100) > Config.AlertChance then return end
    if Config.DispatchScript == 'qb-core' then
        TriggerServerEvent('police:server:policeAlert', _L('police_bliptitle'))
    elseif Config.DispatchScript == 'ps-dispatch' then
        exports["ps-dispatch"]:CustomAlert({
            coords = GetEntityCoords(PlayerPedId()),
            message = _L('police_message'),
            dispatchCode = _L('police_code'),
            description = _L('police_bliptitle'),
            radius = 0,
            sprite = 59,
            color = 1,
            scale = 0.5,
            length = 3,
        })
    elseif Config.DispatchScript == 'cd_dispatch' then
        local data = exports['cd_dispatch']:GetPlayerInfo()
        TriggerServerEvent('cd_dispatch:AddNotification', {
            job_table = Config.PoliceJobs, 
            coords = GetEntityCoords(PlayerPedId()),
            title =  _U('police_code') .. ' - ' .. _U('police_bliptitle'),
            message = _U('police_bliptitle'), 
            flash = 0,
            unique_id = tostring(math.random(0000000,9999999)),
            blip = {
                sprite = 431, 
                scale = 1.2, 
                colour = 3,
                flashes = false, 
                text = _U('police_code') .. ' - ' .. _U('police_bliptitle'),
                time = (5*60*1000),
                sound = 1,
            }
        })
    end
end

local function Loading(type)
    local result = nil
    if Config.Progressbar == 'qb-core' then
        QBCore.Functions.Progressbar("zfsearch_register", _L('progress_opening'), Config.Progresstimes[type], false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = 'oddjobs@shop_robbery@rob_till',
            anim = 'loop',
            flags = 1,
        }, {}, {}, function()
            ClearPedTasks(PlayerPedId())
            result = true
        end, function()
            ClearPedTasks(PlayerPedId())
            result = false
        end)
    elseif Config.Progressbar == 'oxlib-regular' then
        if lib.progressBar({
            duration = Config.Progresstimes[type],
            position = 'bottom',
            label = _L('progress_opening'),
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = true,
            },
            anim = {
                dict = 'oddjobs@shop_robbery@rob_till',
                clip = 'loop', 
                lockX = true,
                lockY = true,
                lockZ = true,
            },
        }) then
            result = true
        else
            result = false
        end
    elseif Config.Progressbar == 'oxlib-circle' then
        if lib.progressCircle({
            duration = Config.Progresstimes[type],
            position = 'bottom',
            label = _L('progress_opening'),
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = true,
            },
            anim = {
                dict = 'oddjobs@shop_robbery@rob_till',
                clip = 'loop', 
                lockX = true,
                lockY = true,
                lockZ = true,
            },
        }) then
            result = true
        else
            result = false
        end
    end
    while result == nil do Wait(100) end
    return result
end


-- ## THREADS
CreateThread(function()
    for _,register in pairs(Config.RegisterZones) do
        AddTarget('ZFRegister_'.._, register.coords, 0.75, 0.75, {
            name = 'ZFRegister_'.._,
            heading = 0,
            debugPoly = false,
            minZ = register.coords[3] - 1.0,
            maxZ = register.coords[3] + 1.0,
        }, {
            {
                event = 'zf-storerobbery:openRegister',
                icon = 'fas fa-shopping-cart',
                label = _L('target_unlockregister'),
                rtype = 'register',
                rid = _
            }
        }, 1.5)
    end

    for _,safe in pairs(Config.SafeZones) do
        AddTarget('ZFSafe_'.._, safe.coords, 0.75, 0.75, {
            name = 'ZFSafe_'.._,
            heading = 0,
            debugPoly = false,
            minZ = safe.coords[3] - 1.0,
            maxZ = safe.coords[3] + 1.0,
        }, {
            {
                event = 'zf-storerobbery:openRegister',
                icon = 'fas fa-vault',
                label = _L('target_cracksafe'),
                rtype = 'safe',
                rid = _
            }
        }, 1.5)
    end
end)

-- ## EVENTS
RegisterNetEvent('zf-storerobbery:openRegister', function(data)
    local type = data.rtype
    local id = data.rid

    TriggerCallback('zf-storerobbery:verifyState', function(isOpen, Cops)
        if Cops < Config.PoliceRequired then Notify(_L('notify_alreadyopen'), 'error') return end
        if not isOpen or isOpen == -1 then
            TriggerCallback('zf-storerobbery:checkItem', function(haveItem)
                if haveItem then
                    local wonMinigame = Minigame(type)
                    if wonMinigame then
                        if Loading(type) then
                            TriggerCallback('zf-storerobbery:changeState', function(state)
                                if state then Notify(_L('notify_opening'), 'success') end
                                TriggerServerEvent('zf-storerobbery:loseItem', type, true)
                            end, id, type)
                        end
                    else
                        Notify(_L('notify_failedminigame'), 'error')
                        TriggerServerEvent('zf-storerobbery:loseItem', type, false)
                    end
                    CallPolice()
                else
                    Notify(_L('notify_nopick'), 'error')
                end
            end, type)
        else
            Notify(_L('notify_alreadyopen'), 'error')
        end
    end, id, type)
end)