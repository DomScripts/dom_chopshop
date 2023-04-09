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
            'Zion',
            -- Compacts
            'asbo',
            'blista',
            'brioso',
            'dilettante',
            'issi2',
            'panto',
            'prairie',
            'rhapsody',
            -- Muscle
            'blade',
            'buccaneer',
            'chino',
            'coquette3',
            'deviant',
            'dominator',
            'dukes',
            'faction2',
            'ellie',
            'gauntlet',
            'hotknife',
            'hustler',
            'impaler',
            -- SUV
            'baller',
            'bjxl',
            'cavalcade',
            'dubsta',
            'fq2',
            'granger',
            'gresley',
            'habanero',
            'huntley',
            'patriot',
            'rocoto',
            -- Sedans
            'asea',
            'asterope',
            'cog55',
            'emperor',
            'fugitive',
            'glendale',
            'ingot',
            'intruder',
            'premier',
            'primo',
            'regina',
            'stanier',
            'stratum'
        },
        Location = {
            vec4(353.814, -1697.645, 37.375, 139.865),
            vec4(9.312, -1066.728, 37.74, 249.083),
            vec4(-467.61, -613.472, 30.762, 180.876),
            vec4(-1324.804, -236.358, 42.276, 123.864),
            vec4(-1534.122, -408.859, 41.578, 48.407)
        }
    }
}

Config.ChopLocations = {
    {
        Location = {
            vec3(1565.197, -2158.905, 77.524),
            vec3(-84.579, -2224.341, 7.811),
            vec3(-468.702, -1674.937, 19.063),
            vec3(1135.053, -793.85, 57.592)
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

Config.Chop = {
    {
        Duration = 5000,
        Label = 'Chopping Part',
        Position = 'bottom',
        canCancel = true,
        Disable = {
            car = true,
            move = true,
            combat = true,
            mouse = false
        },
        RewardMin = 10,
        RewardMax = 20,
        SkillCheckDifficulty = {'easy', 'easy', 'easy', 'easy'},
        SkillCheckKeys = {'1', '2', '3', '4'}
    }
}

Config.Notifications = {
    {
        ExchangeNoCarParts = {
            title = 'Chopshop',
            description = 'You don\'t have enough car parts.',
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
        NotEnoughSpace = {
            title = 'Chopshop',
            description = 'You don\'t have enough space.',
            type = 'errpr',
            position = 'top-right'
        },
        CompletedJob = {
            title = 'Chopshop',
            description = 'You completed the job.',
            type = 'success',
            position = 'top-right'
        }
    }
}
