if Config.Framework == 'qb-core' then QBCore = exports['qb-core']:GetCoreObject() end


-- ## LOCAL FUNCTIONS
local function CreateCallback(name, cb, ...)
    if Config.Framework == 'qb-core' then
        QBCore.Functions.CreateCallback(name, cb, ...)
    elseif Config.Framework == 'esx' then
        ESX.RegisterServerCallback(name, cb)
    end
end

local function GetPlayer(pid)
    if Config.Framework == 'qb-core' then
        return QBCore.Functions.GetPlayer(pid)
    elseif Config.Framework == 'esx' then
        return ESX.GetPlayerFromId(pid)
    end
end

local function GetPlayers()
    if Config.Framework == 'qb-core' then
        return QBCore.Functions.GetPlayers()
    elseif Config.Framework == 'esx' then
        return ESX.GetPlayers()
    end
end

local function GetPlayerJob(pid)
    local Player = GetPlayer(pid)
    if Config.Framework == 'qb-core' then
        return Player.PlayerData.job.name
    elseif Config.Framework == 'esx' then
        return Player.getJob().name
    end
end

local function AddItem(pid, item, amount)
    if GetResourceState('ox_inventory') == 'started' then
        exports.ox_inventory:AddItem(pid, item, amount)
    elseif Config.Framework == 'qb-core' then
        local Player = QBCore.Functions.GetPlayer(pid)
        Player.Functions.AddItem(item, amount)
    elseif Config.Framework == 'esx' then
        local Player = ESX.GetPlayerFromId(pid)
        Player.addInventoryItem(item, amount)
    end
end

local function HasItem(pid, item)
    if GetResourceState('ox_inventory') == 'started' then
        return exports.ox_inventory:Search(pid, 'count', item)
    elseif Config.Framework == 'qb-core' then
        return QBCore.Functions.HasItem(pid, item, 1)
    elseif Config.Framework == 'esx' then
        local Player = ESX.GetPlayerFromId(pid)
        return Player.hasItem(item)
    end
end

local function RemoveItem(pid, item, amount)
    local Player = GetPlayer(pid)
    if GetResourceState('ox_inventory') == 'started' then
        exports.ox_inventory:RemoveItem(pid, item, amount)
    elseif Config.Framework == 'qb-core' then
        Player.Functions.RemoveItem(item, amount)
    elseif Config.Framework == 'esx' then
        Player.removeInventoryItem(item, amount)
    end
end

local function AddMoney(pid, amount, type)
    if Config.Framework == 'qb-core' then
        local Player = QBCore.Functions.GetPlayer(pid)
        Player.Functions.AddMoney(type, amount)
    elseif Config.Framework == 'esx' then
        local Player = ESX.GetPlayerFromId(pid)
        Player.addMoney(amount, 'heist')
    end
end

local function GetCops()
    local currentCops = 0
    local Players = GetPlayers()
    for _,pid in next, Players do
        for _,jobName in pairs(Config.PoliceJobs) do
            if GetPlayerJob(pid) == jobName then
                currentCops = currentCops + 1
            end
        end
    end
    return currentCops
end


-- ## LOCALS
local States = {
    ['register'] = {},
    ['safe'] = {},
}


-- ## CALLBACKS
CreateCallback('zf-storerobbery:verifyState', function(source, cb, rid, type)
    cb(States[type][rid], GetCops())
end)

CreateCallback('zf-storerobbery:changeState', function(source, cb, rid, type)
    States[type][rid] = 0
    local src = source
    
    local Player = GetPlayer(src)
    if Player then
        if type == 'register' then
            if Config.RegisterLoot == 'money' then
                local rdmAmount = math.random(Config.RegisterLootMoney.min, Config.RegisterLootMoney.max)
                AddMoney(src, rdmAmount, 'cash')
            elseif Config.RegisterLoot == 'markedbills' then
                local rdmAmount = math.random(Config.RegisterLootMarkedBills.min, Config.RegisterLootMarkedBills.max)
                if Config.Framework == 'qb-core' then
                    AddItem(src, 'markedbills', rdmAmount)
                elseif Config.Framework == 'esx' then
                    AddMoney(src, 'black_money', rdmAmount)
                end
            elseif Config.RegisterLoot == 'item' then
                local itemTable = {}
                local itemAmount = math.random(1, Config.RegisterMaxItems)
    
                for i=1, itemAmount do
                    local lootChance = math.random(1,100)
                    local item = Config.RegisterLoottable[math.random(1, #Config.RegisterLoottable)]
                    if lootChance >= item.chances then
                        AddItem(src, item.item, math.random(item.min, item.max))
                    end
                end
            end
            return cb(true)
        else
            if Config.SafeLoot == 'money' then
                local rdmAmount = math.random(Config.SafeLootMoney.min, Config.SafeLootMoney.max)
                AddMoney(src, rdmAmount, 'money')
            elseif Config.SafeLoot == 'markedbills' then
                local rdmAmount = math.random(Config.SafeLootMarkedBills.min, Config.SafeLootMarkedBills.max)
                AddItem(src, 'markedbills', rdmAmount)
            elseif Config.SafeLoot == 'item' then
                local itemTable = {}
                local itemAmount = math.random(1, Config.SafeMaxItems)
    
                for i=1, itemAmount do
                    local lootChance = math.random(1,100)
                    local item = Config.SafeLoottable[math.random(1, #Config.SafeLoottable)]
                    if lootChance >= item.chances then
                        AddItem(src, item.item, math.random(item.min, item.max))
                    end
                end
            end
            return cb(true)
        end
    end
    cb(false)
end)

CreateCallback('zf-storerobbery:checkItem', function(source, cb, type)
    local item = ''
    if type == 'register' then item = Config.RegisterItem else item = Config.SafeItem end
    cb(HasItem(source, item))
end)


-- ## FUNCTIONS
function ResetSafes()
    if States['safe'] ~= nil or States['safe'] ~= {} then
        for _,t in pairs(States['safe']) do
            States['safe'][_] = t + 1
            if t >= 0 and t >= Config.SafeReset then
                States['safe'][_] = -1
            end
        end
    end
    SetTimeout(60000, ResetSafes)
end if Config.SafeReset then ResetSafes() end

function ResetRegisters()
    if States['register'] ~= nil or States['register'] ~= {} then
        for _,t in pairs(States['register']) do
            States['register'][_] = t + 1
            if t >= 0 and t >= Config.RegisterReset then
                States['register'][_] = -1
            end
        end
    end
    SetTimeout(60000, ResetRegisters)
end if Config.RegisterReset then ResetRegisters() end


-- ## EVENTS
RegisterNetEvent('zf-storerobbery:loseItem', function(type, success)
    local src = source
    local item, itemLose, loseChance = Config.RegisterItem, Config.RegisterItemLost, Config.RegisterItemLostChance
    if type == 'safe' then item, itemLose, loseChance = Config.SafeItem, Config.SafeItemLose, Config.SafeItemLostChance end
    if itemLose == 0 then return end
    if itemLose == 1 and success then return end
    if math.random(1,100) >= loseChance then return end
    RemoveItem(src, item, 1)
end)
