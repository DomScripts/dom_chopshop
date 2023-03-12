local Inventory = exports.ox_inventory
local Target = exports.ox_target

local function CarPartCheck(input)
    local sum = input[2]
    local carParts = Inventory:GetItem(source, 'carparts', nil, true)
    if carParts >= sum then 
        return true 
    else 
        return false 
    end 
end 

local function EnoughSpace(reward)
    if Inventory:CanCarryItem(source, 'carparts', reward) then 
        return true
    else 
        return false 
    end
end

RegisterNetEvent('dom_chopshop:chopDoorReward', function(car, doorIndex, option)
    local cfg = Config.Chop[1]
    local reward = math.random(cfg.RewardMin, cfg.RewardMax)
    if EnoughSpace(reward) == true then 
        Inventory:AddItem(source, 'carparts', reward)
        TriggerClientEvent('dom_chopshop:doorFinalRemove', source, car, doorIndex, option)
    else
        lib.notify(source, Config.Notifications[1].NotEnoughSpace)
        TriggerClientEvent('dom_chopshop:InvFullTargetReset', source)
    end 
end)

RegisterNetEvent('dom_chopshop:chopWheelReward', function(car, wheelIndex, option)
    local cfg = Config.Chop[1]
    local reward = math.random(cfg.RewardMin, cfg.RewardMax)
    if EnoughSpace(reward) == true then 
        Inventory:AddItem(source, 'carparts', reward)
        TriggerClientEvent('dom_chopshop:wheelFinalRemove', source, car, wheelIndex, option)
    else
        lib.notify(source, Config.Notifications[1].NotEnoughSpace)
        TriggerClientEvent('dom_chopshop:InvFullTargetReset', source)
    end 
end)

RegisterNetEvent('dom_chopshop:chopChassisReward', function(car)
    local cfg = Config.Chop[1]
    local reward = math.random(cfg.RewardMin, cfg.RewardMax)
    if EnoughSpace(reward) == true then 
        Inventory:AddItem(source, 'carparts', reward)
        TriggerClientEvent('dom_chopshop:chassisFinalRemove', source, car)
    else
        lib.notify(source, Config.Notifications[1].NotEnoughSpace)
        TriggerClientEvent('dom_chopshop:InvFullTargetReset', source)
    end 
end)

RegisterNetEvent("dom_chopshop:Exchange", function(input)
    if CarPartCheck(input) == true then 
        TriggerClientEvent("dom_chopshop:ExchangeCircle", source, input)
    else 
        lib.notify(source, Config.Notification[1].ExchangeNoCarParts)
    end 
end)

RegisterNetEvent("dom_chopshop:ExchangeReward", function(input)
    if Inventory:CanCarryItem(source, input[1], input[2]) then
        Inventory:RemoveItem(source, 'carparts', input[2])
        Inventory:AddItem(source, input[1], input[2])
    else
        lib.notify(source, Config.Notifications[1].NotEnoughSpace)
    end
end)
