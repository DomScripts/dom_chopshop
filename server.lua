local Inventory = exports.ox_inventory

local function CarPartCheck(input)
    local sum = input[2]
    local carParts = Inventory:GetItem(source, 'carparts', nil, true)
    if carParts >= sum then 
        return true 
    else 
        return false 
    end 
end 

RegisterNetEvent("dom_chopshop:Exchange", function(input)
    if CarPartCheck(input) == true then 
        TriggerClientEvent("dom_chopshop:ExchangeCircle", source, input)
    else 
        lib.notify(source, Config.Notification[1].ExchangeNoCarParts)
    end 
end)

RegisterNetEvent("dom_chopshop:ExchangeReward", function(input)
    Inventory:RemoveItem(source, 'carparts', input[2])
    Inventory:AddItem(source, input[1], input[2])
end)
