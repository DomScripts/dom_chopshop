local Target = exports.ox_target
local Input = lib.inputDialog
local Zone = lib.zones

local function FetchModel(model)
    RequestModel(GetHashKey(model))
    while not HasModelLoaded(model) do 
        Wait(100)
    end
  end

local LocalNPCs = {}

local function GetLocalNPC(index)
    return LocalNPCs[index]
end

local function CreateLocalNPC(index)
    if (LocalNPCs[index]) then 
        DestroyLocalNPC(index)
    end
      
    LocalNPCs[index] = {}
    local cfg = Config.Boss[index]
  
    FetchModel(cfg.NPCModel)
  
    local npc = CreatePed(1, cfg.NPCModel, cfg.NPCLocation, false, true)
        FreezeEntityPosition(npc, true)
        SetEntityInvincible(npc, true)
        SetBlockingOfNonTemporaryEvents(npc, true)
        SetPedComponentVariation(npc,3,1,4,1) -- Shirt
        SetPedComponentVariation(npc,4,0,0,1) -- Pants
        SetPedComponentVariation(npc,0,0,1,0) -- Head
    LocalNPCs[index].npc = npc 
end 

local function DestroyLocalNPC(index)
    if (LocalNPCs[index]) then 
        DeleteEntity(LocalNPCs[index].npc)
        LocalNPCs[index] = nill
    end 
end

--! Creates Car Blip On Job Start
local function CreateCarBlip(car)
    carBlip = AddBlipForEntity(car)
        SetBlipColour(carBlip, 3)
        SetBlipHiddenOnLegend(carBlip, true)
        SetBlipRoute(carBlip, true)
        SetBlipDisplay(carBlip, 8)
        SetBlipRouteColour(carBlip, 3)
end 

--! Creates Chop Location Blip When Entered Chop Car
local function CreateChopLocation(car)
    local cfg = Config.ChopLocations[1]
    local locationRandom =  math.random(1, #(cfg.Location))
    local chopBlip = AddBlipForCoord(cfg.Location[locationRandom])
        SetBlipColour(chopBlip, 3)
        SetBlipHiddenOnLegend(chopBlip, true)
        SetBlipRoute(chopBlip, true)
        SetBlipDisplay(chopBlip, 8)
        SetBlipRouteColour(chopBlip, 3)

    local function targetingReset()
        Target:disableTargeting(true)
        Target:disableTargeting(false)
    end 

    function onEnter()
        print('entered zone')
        RemoveBlip(chopBlip)

        local options = {
            {
                -- Hood
                name = 'ox:option1',
                icon = 'fa-solid fa-car',
                label = 'Chop Hood',
                bones = {'bonnet'},
                onSelect = function()
                    local boneId = GetEntityBoneIndexByName(car, 'bonnet')
                    local doorIndex = 4
                    TriggerEvent('dom_chopshop:removeDoor', car, doorIndex)
                    targetingReset()
                    Target:removeLocalEntity(car, 'ox:option1')
                end 
            },{
                -- Front Driver Door
                name = 'ox:option2',
                icon = 'fa-solid fa-car',
                label = 'Chop Front Driver Door',
                bones = {'door_dside_f'},
                onSelect = function()
                    local boneId = GetEntityBoneIndexByName(car, 'door_dside_f')
                    local doorIndex = 0
                    TriggerEvent('dom_chopshop:removeDoor', car, doorIndex)
                    targetingReset()
                    Target:removeLocalEntity(car, 'ox:option2')
                end 
            },{
                -- Front Passenger Door
                name = 'ox:option3',
                icon = 'fa-solid fa-car',
                label = 'Chop Front Passenger Door',
                bones = {'door_pside_f'},
                onSelect = function()
                    local boneId = GetEntityBoneIndexByName(car, 'door_pside_f')
                    local doorIndex = 1
                    TriggerEvent('dom_chopshop:removeDoor', car, doorIndex)
                    targetingReset()
                    Target:removeLocalEntity(car, 'ox:option3')
                end 
            },{
                -- Rear Driver Door
                name = 'ox:option4',
                icon = 'fa-solid fa-car',
                label = 'Chop Rear Driver Door',
                bones = {'door_dside_r'},
                onSelect = function()
                    local boneId = GetEntityBoneIndexByName(car, 'door_dside_r')
                    local doorIndex = 2
                    TriggerEvent('dom_chopshop:removeDoor', car, doorIndex)
                    targetingReset()
                    Target:removeLocalEntity(car, 'ox:option4')
                end 
            },{
                -- Rear Passenger Door
                name = 'ox:option5',
                icon = 'fa-solid fa-car',
                label = 'Chop Rear Passenger Door',
                bones = {'door_pside_r'},
                onSelect = function()
                    local boneId = GetEntityBoneIndexByName(car, 'door_pside_r')
                    local doorIndex = 3
                    TriggerEvent('dom_chopshop:removeDoor', car, doorIndex)
                    targetingReset()
                    Target:removeLocalEntity(car, 'ox:option5')
                end 
            },{
                -- Trunk
                name = 'ox:option6',
                icon = 'fa-solid fa-car',
                label = 'Chop Trunk',
                bones = {'boot'},
                onSelect = function()
                    local boneId = GetEntityBoneIndexByName(car, 'boot')
                    local doorIndex = 5
                    TriggerEvent('dom_chopshop:removeDoor', car, doorIndex)
                    targetingReset()
                    Target:removeLocalEntity(car, 'ox:option6')
                end 
            },{
                -- Front Left Tire
                name = 'ox:option7',
                icon = 'fa-solid fa-car',
                label = 'Chop Front Left Tire',
                bones = {'wheel_lf'},
                onSelect = function()
                    local boneId = GetEntityBoneIndexByName(car, 'wheel_lf')
                    local wheelIndex = 0
                    TriggerEvent('dom_chopshop:removeWheel', car, wheelIndex)
                    targetingReset()
                    Target:removeLocalEntity(car, 'ox:option7')
                end 
            },{
                -- Front Right Tire
                name = 'ox:option8',
                icon = 'fa-solid fa-car',
                label = 'Chop Front Right Tire',
                bones = {'wheel_rf'},
                onSelect = function()
                    local boneId = GetEntityBoneIndexByName(car, 'wheel_rf')
                    local wheelIndex = 1
                    TriggerEvent('dom_chopshop:removeWheel', car, wheelIndex)
                    targetingReset()
                    Target:removeLocalEntity(car, 'ox:option8')
                end 
            },{
                -- Back Left Tire
                name = 'ox:option9',
                icon = 'fa-solid fa-car',
                label = 'Chop Back Left Tire',
                bones = {'wheel_lr'},
                onSelect = function()
                    local boneId = GetEntityBoneIndexByName(car, 'wheel_lr')
                    local wheelIndex = 4
                    TriggerEvent('dom_chopshop:removeWheel', car, wheelIndex)
                    targetingReset()
                    Target:removeLocalEntity(car, 'ox:option9')
                end 
            },{
                -- Back Right Tire
                name = 'ox:option10',
                icon = 'fa-solid fa-car',
                label = 'Chop Back Right Tire',
                bones = {'wheel_rr'},
                onSelect = function()
                    local boneId = GetEntityBoneIndexByName(car, 'wheel_rr')
                    local wheelIndex = 5
                    TriggerEvent('dom_chopshop:removeWheel', car, wheelIndex)
                    targetingReset()
                    Target:removeLocalEntity(car, 'ox:option10')
                end 
            }
        }

        Target:addLocalEntity(car, options)
        TriggerEvent('dom_chopshop:removeZone')
        
    end

    function onExit()
        print('exited zone')
    end

    local chopBox = lib.zones.box({
        coords = cfg.Location[locationRandom],
        size = vec3(4, 4, 4),
        debug = false,
        onEnter = onEnter,
        onExit = onExit
    }) 

    RegisterNetEvent('dom_chopshop:removeZone', function(boneId)
        print('removed zone')
        chopBox:remove()
    end)
end 

--! Remove car parts + animations
RegisterNetEvent('dom_chopshop:removeDoor', function(car, doorIndex)
    SetVehicleDoorCanBreak(car, doorIndex, true)
    SetVehicleDoorBroken(car, doorIndex, true)
end)

RegisterNetEvent('dom_chopshop:removeWheel', function(car, wheelIndex)
    SetVehicleWheelsCanBreak(car, true)
    SetVehicleTyreBurst(car, wheelIndex, true, 1000.0)
end)

--! Boss Target Options And Job Start
local inJob = false
local gotZone = false
local options = {
    {
        name = 'ox:option1',
        icon = 'fa-solid fa-car',
        label = 'Get Job',
        onSelect = function()
            local cfg = Config.Cars[1]
            local carRandom = math.random(1, #(cfg.List))
            local locationRandom = math.random(1, #(cfg.Location))

            if not inJob then 
                RequestModel(cfg.List[carRandom])
                while not HasModelLoaded(cfg.List[carRandom]) do 
                    Wait(500)
                end 
                
                local car = CreateVehicle(GetHashKey(cfg.List[carRandom]), cfg.Location[locationRandom], true, true)
                CreateCarBlip(car)
                lib.notify(Config.Notifications[1].StartJob)
                inJob = true

                lib.onCache('vehicle', function(value)
                    if not value then return end 
                    
                    if not gotZone then 
                        if value == car then
                            print('In Veh')
                            RemoveBlip(carBlip)
                            CreateChopLocation(car)
                            gotZone = true
                        end 
                    end 
                end)
            else 
                lib.notify(Config.Notifications[1].InJob)
            end 
        end 
    },
    {
        name = 'ox:option2',
        event = 'ox_target:debug',
        icon = 'fa-solid fa-recycle',
        label = 'Trade In Parts',
        onSelect = function()
            local input = Input(Config.Exchange[1].Name, Config.Exchange[1].Input)

            if not input then 
                return 
            else 
                TriggerServerEvent("dom_chopshop:Exchange", input)
            end
        end 
    }
}
Target:addModel(Config.Boss[1].NPCModel, options)



--! Exchange Progress Circle
RegisterNetEvent("dom_chopshop:ExchangeCircle", function(input)
    if lib.progressCircle({
        duration = Config.Exchange[1].Duration,
        label = 'Trading In Car Parts',
        position = 'bottom',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
        }}) 
    then 
        TriggerServerEvent("dom_chopshop:ExchangeReward", input)
    else 
        print('Canceled Exchange Progress Circle') 
    end
end)


Citizen.CreateThread(function()
    while true do
        local wait = 1000
        local ped = PlayerPedId() 
        local pcoords = GetEntityCoords(ped)
        for i=1, 1 do 
            local cfg = Config.Boss[i]
            local coords = vector3(cfg.NPCLocation)
            local dist = #(pcoords - coords)
            local npc = GetLocalNPC(i)
            if dist < cfg.RenderDistance then 
                if (GetLocalNPC(i) == nill) then 
                  CreateLocalNPC(i)
                end 
            else 
                DestroyLocalNPC(i)
            end 
        end
      Wait(wait)
    end
end)