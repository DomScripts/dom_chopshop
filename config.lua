Config = {}

Config.Boss = {
    {
    NPCModel = 'a_m_m_og_boss_01',
    NPCLocation = vec4(-210.81, -1363.409, 30.258, 32.287),
    RenderDistance = 35,
    }
}

Config.Cars = {
    {
        List = {
            -- Coupes
            'CogCabrio',
            'Exemplar',
            'F620',
            'Felon',
            'Jackal',
            'Oracle',
            'Sentinel',
            'Windsor2',
            'Zion'
        },
        Location = {
            vec4(-213.228, -1357.831, 31.26, 128.18),
            --[[vec4(353.814, -1697.645, 37.375, 139.865),
            vec4(9.312, -1066.728, 37.74, 249.083),
            vec4(-467.61, -613.472, 30.762, 180.876),
            vec4(-1324.804, -236.358, 42.276, 123.864),
            vec4(-1534.122, -408.859, 41.578, 48.407)]]--
        }
    }
}

Config.ChopLocations = {
    {
        Location = {
            vec3(-222.862, -1363.286, 31.258)
            -- vec3(1565.197, -2158.905, 77.524),
            -- vec3(-84.579, -2224.341, 7.811),
            -- vec3(-468.702, -1674.937, 19.063),
            -- vec3(1135.053, -793.85, 57.592)
        }
    }
}

Config.Exchange = {
    {
        Name = "Trade In Car Parts",
        Input = {
            {
                type = "select", 
                label = "Select A Material", 
                options = {
                -- Value = item to give / Label = display name
                {value = 'copper', label = 'Copper'},
                {value = 'iron', label = 'Iron'},
                {value = 'gold', label = 'Gold'},
                }
            },
            {
                type = "number", 
                label = "Amount", 
                placeholder = "123"
            }
        },
        Duration = 10000,
    }
}

Config.Notifications = {
    {
        ExchangeNoCarParts = {
            title = 'Chopshop',
            description = 'You don\'t have enought car parts.',
            type = 'error',
            position = 'top-right'
        },
        StartJob = {
            title = 'Chopshop',
            description = 'Go get the car.',
            type = 'inform',
            duration = 5000,
            position = 'top-right'
        },
        InJob = {
            title = 'Chopshop',
            description = 'You already have a car to get.',
            type = 'error',
            position = 'top-right'
        },
    }
}

--! State bag change handlers run when the state bag changes
--! Global state bag kind of just "exist"

--? Spawn the vehicle
--? veh = NettoVeh(netId)
--? Entity(veh).xxxxxx