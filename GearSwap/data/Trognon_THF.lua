-----------------------MACRO BOOK------------------
send_command('input /macro book 4')
send_command('wait 4; input /macro set 10')
send_command('wait 4; input /lockstyleset 100')

function sub_job_change(new, old)
    send_command('wait 2; input /lockstyleset 100')
end

-----------------------BINDING------------------

-- JA--
send_command('bind !numpad1 input /ja "Flee" <me>')

-- GEAR--

send_command('bind ^f1 gs c equip TP.Normal set')
send_command('bind ^f2 gs c equip TP.Accuracy set')
send_command('bind ^f3 gs c equip TP.DT set')
send_command('bind ^f4 gs c equip TP.TH set')
send_command('bind ^f5 gs c toggle Idle set')
send_command('bind ^f6 gs c toggle AutoWS')

-- OTHER--

send_command(
    'bind ^numpad. input /jobemote RUN; wait 1.3; input /jobemote MNK; wait 1.3; input /jobemote BLM; wait 1.3; input /jobemote DRG')
send_command(
    'bind ^F9 input /equip L.ring "Echad Ring"; input /echo EXP Ring equiped.; wait 7; input /item "Echad Ring" <me>')
send_command(
    'bind ^F10 input /equip L.ring "Trizek Ring"; input /echo CP Ring equiped.; wait 7; input /item "Trizek Ring" <me>')
send_command(
    'bind ^F11 input /equip L.ring "Dim. Ring (Holla)"; input /echo TELEPORT TO HOLLA IN 10 SECONDS.;wait 12; input /item "Dim. Ring (Holla)" <me>')
send_command('bind ^F12 input //mh')

send_command('bind !numpad/ input /item "Grape Daifuku" <me>')

send_command('bind !numpad- input /sack')
send_command('bind !numpad+ input /attack <bt>')
send_command('bind !numpad. input /mount chocobo')


---------------------
------- SETS --------
---------------------

function get_sets()

    ----------------------- ACC HUD -----------------------
    include('ani-hud.lua')
    include('Modes')

    HUD.Create({
        x = 1465,
        y = 870,
        borderSettings = {
            color = {
                red = 30,
                green = 30,
                blue = 30
            }
        },
        bgSettings = {
            color = {
                red = 80,
                green = 20,
                blue = 20
            }
        },
        textSettings = {
            text = {
                red = 230,
                green = 230,
                blue = 230
            }
        }
    })

    HUD.AddBox(-9, -2, 80, 34, true)
    HUD.AddText("--", 0, 0, 20, nil, "Accuracy")
    HUD.AddText("--", 40, 2, 8, nil, "AccTrend")
    HUD.AddText("", 40, 14, 8, {255, 0, 0}, function()
        if flags['UseAccuracy'] then
            return 'ACC', {255, 255, 0}
        elseif flags['UseDT'] then
            return 'DT', {255, 0, 255}
        elseif flags['UseMEVA'] then
            return 'MEVA', {51, 204, 51}
        else
            return '', {255, 0, 0}
        end
    end)

    HUD.Finish()

    ----------------------- IDLE SETS -----------------------
    sets.Idle = {}
    sets.Idle.mode = M {'Normal', 'DT'}

    sets.Idle.Normal = {
        head = "Meghanada Visor +2",
        body = "Meg. Cuirie +1",
        hands = "Meg. Gloves +2",
        legs = "Meg. Chausses +2",
        feet = "Jute Boots +1",
        neck = "Sanctity Necklace",
        left_ear = "Brutal Earring",
        right_ear = "Suppanomimi",
        left_ring = "Shneddick Ring",
        right_ring = "Defending Ring",
        back = "Nexus Cape"
    }

    sets.Idle.DT = {
        ammo = "Staunch Tathlum +1",
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Elite Royal Collar",
        waist = "Flume Belt",
        left_ear = "Hearty Earring",
        right_ear = "Etiolation Earring",
        left_ring = {name = "Chirich Ring +1", bag="Wardrobe 1"},
        right_ring = "Defending Ring",
        back = {
            name = "Toutatis's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', '"Store TP"+10', 'Phys. dmg. taken-10%'}
        }
    }

    ----------------------- TP SETS -----------------------
    sets.TP = {}
    sets.TP.mode = M {'Normal', 'Accuracy', 'DT', 'TH'}

    sets.TP.Normal = {
        head = "Meghanada Visor +2",
        body = "Meg. Cuirie +1",
        hands = "Meg. Gloves +2",
        legs = "Meg. Chausses +2",
        feet = "Meg. Jam. +1",
        neck = "Sanctity Necklace",
        left_ear = "Brutal Earring",
        right_ear = "Suppanomimi",
        left_ring = "Shneddick Ring",
        right_ring = "Defending Ring",
        waist = "Chaac Belt",
        back = "Canny Cape"
    }

    sets.TP.Accuracy = {
        ammo = "Ginsen",
        head = "Malignance Chapeau",
        body = "Adhemar Jacket",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Elite Royal Collar",
        left_ear = "Eabani Earring",
        right_ear = "Suppanomimi",
        left_ring = {name = "Chirich Ring +1", bag="Wardrobe 1"},
        right_ring = {name = "Chirich Ring +1", bag="Wardrobe 2"},
        waist = "Chaac Belt",
        back = "Canny Cape"
    }

    sets.TP.DT = {
        ammo = "Staunch Tathlum +1",
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Elite Royal Collar",
        waist = "Sailfi Belt +1",
        left_ear = "Eabani Earring",
        right_ear = "Suppanomimi",
        left_ring = {name = "Chirich Ring +1", bag="Wardrobe 1"},
        right_ring = "Defending Ring",
        back = {
            name = "Toutatis's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', '"Store TP"+10', 'Phys. dmg. taken-10%'}
        }
    }

    sets.TP.TH = {
        ammo = "Hasty Pinion +1",
        head = "Meghanada Visor +2",
        body = "Meg. Cuirie +1",
        hands = "Plun. Armlets",
        legs = "Meg. Chausses +2",
        feet = "Skulk. Poulaines",
        neck = "Sanctity Necklace",
        waist = "Chaac Belt",
        left_ear = "Brutal Earring",
        right_ear = "Suppanomimi",
        left_ring = "Shneddick Ring",
        right_ring = "Defending Ring",
        back = "Canny Cape"
    }

    sets.FastCast = {}
    sets.FastCast = {
        ammo = "Sapience Orb",
        head = {
            name = "Herculean Helm",
            augments = {'Weapon skill damage +3%', 'STR+14', 'Accuracy+8', 'Attack+5'}
        },
        neck = "Voltsurge Torque",
        body = {
            name = "Taeon Tabard",
            augments = {'"Fast Cast"+5'}
        },
        hands = {
            name = "Leyline Gloves",
            augments = {'Accuracy+15', 'Mag. Acc.+15', '"Mag.Atk.Bns."+15', '"Fast Cast"+3'}
        },
        legs = {
            name = "Psycloth Lappas",
            augments = {'MP+80', 'Mag. Acc.+15', '"Fast Cast"+7'}
        },
        left_ear = "Loquac. earring",
        right_ring = "Prolix Ring",
        back = {
            name = "Rosmerta's Cape",
            augments = {'"Fast Cast"+10'}
        }
    }
    sets.Ranged = {}

    sets.Ranged = {
        range = "Phulax Bow",
        ammo = "Stone Arrow"
    }

    ----------------------- WS SETS -----------------------

    sets.WS = {}

    sets.SavageBlade = {}
    sets.SavageBlade = {}

    sets.Exenterator = {

        ammo = "Oshasha's Treatise",
        head = {
            name = "Herculean Helm",
            augments = {'Weapon skill damage +3%', 'STR+14', 'Accuracy+8', 'Attack+5'}
        },
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = {
            name = "Herculean Boots",
            augments = {'Weapon skill damage +4%', 'STR+9', 'Attack+5'}
        },
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Attack+4', 'TP Bonus +250'}
        },
        right_ear = "Sherida Earring",
        left_ring = "Karieyh Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Toutatis's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', '"Store TP"+10', 'Phys. dmg. taken-10%'}
        }
    }
    sets.Exenterator = {}

    sets.Rudra = {}
    sets.Rudra = {

        ammo = "Oshasha's Treatise",
        head = {
            name = "Herculean Helm",
            augments = {'Weapon skill damage +3%', 'STR+14', 'Accuracy+8', 'Attack+5'}
        },
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = {
            name = "Herculean Boots",
            augments = {'Weapon skill damage +4%', 'STR+9', 'Attack+5'}
        },
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Attack+4', 'TP Bonus +250'}
        },
        right_ear = "Sherida Earring",
        left_ring = "Ilabrat Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Toutatis's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', '"Store TP"+10', 'Phys. dmg. taken-10%'}
        }
    }

    sets.Evisceration = {}
    sets.Evisceration = {
        ammo = "Oshasha's Treatise",
        head = {
            name = "Herculean Helm",
            augments = {'Weapon skill damage +3%', 'STR+14', 'Accuracy+8', 'Attack+5'}
        },
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = {
            name = "Herculean Boots",
            augments = {'Weapon skill damage +4%', 'STR+9', 'Attack+5'}
        },
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Attack+4', 'TP Bonus +250'}
        },
        right_ear = "Sherida Earring",
        left_ring = "Begrudging Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Toutatis's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', '"Store TP"+10', 'Phys. dmg. taken-10%'}
        }
    }

    ----------------------- WEAPONS SETS -----------------------	
    sets.Weapons = {}
    sets.Weapons.Tauret = {
        main = "Tauret",
        sub = "Taming Sari"
    }

    sets.Weapons.Naegling = {
        main = "Naegling",
        sub = "Tauret"
    }

    ----------------------- JOB ABILITY SETS -----------------------

    sets.JA = {}

    sets.JA.Meikyo = {
        feet = "Sakonji Sune-Ate"
    }
    sets.JA.Meditate = {
        head = "Wakido Kabuto +2",
        hands = "Sakonji Kote +2"
    }
    sets.JA.Hasso = {
        hands = "Wakido Kote +3",
        legs = "Kasuga Haidate +2",
        feet = "Wakido Sune-Ate +3"
    }

    ----------------------- AUTO WEAPON SKILL -----------------------

    sets.AutoWS = {}
    sets.AutoWS.mode = M {'Disabled', 'Enabled (Exenterator)', 'Enabled (Savage Blade)'}

end

-----------------------
------- SCRIPT --------
-----------------------

function precast(spell)

    if spell.type == 'WeaponSkill' and player.tp >= 1000 and player.target.distance <= 6 then

        if spell.english == 'Rudra\'s Storm' then
            equip(sets.Rudra)

        elseif spell.english == 'Exenterator' then
            equip(sets.Exenterator)

        elseif spell.english == 'Evisceration' then
            equip(sets.Evisceration)

        elseif spell.english == 'Savage Blade' then
            equip(sets.SavageBlade)

        else
            equip(sets.Rudra)
        end

    elseif spell.type == 'WeaponSkill' and player.tp >= 1000 and player.target.distance >= 6 then
        cancel_spell()
        send_command('@input /echo Weapon Skill Canceled  Target Out of Range')
    end

    if spell.action_type == 'Ranged Attack' then
        equip(sets.Ranged)

    elseif spell.name == 'Meikyo Shisui' then
        equip(sets.JA.Meikyo)

    elseif spell.name == 'Meditate' then
        equip(sets.JA.Meditate)

    elseif spell.name == 'Hasso' then
        equip(sets.JA.Hasso)

    elseif spell.action_type == 'Magic' then
        equip(sets.FastCast)
    end

end

function aftercast(spell)
    if player.status == 'Engaged' then
        equip(sets.TP[sets.TP.mode.value])
        -- equip(sets.Weapons[sets.Weapons.index[Weapons_ind]])

    else
        equip(sets.Idle[sets.Idle.mode.value])
        -- equip(sets.Weapons[sets.Weapons.index[Weapons_ind]])
    end

    if spell.action_type == 'Weaponskill' then
        add_to_chat(158, 'TP Return: [' .. tostring(player.tp) .. ']')
    end

end

function status_change(new, old)
    if new == 'Engaged' then
        equip(sets.TP[sets.TP.mode.value])

    else
        equip(sets.Idle[sets.Idle.mode.value])
    end
end

function self_command(command)

    if command == 'weapon set tauret' then
        equip(sets.Weapons.Tauret)
        send_command('input /echo -- Weapons Set changed to Tauret.')

    elseif command == 'weapon set naegling' then
        equip(sets.Weapons.Naegling)
        send_command('input /echo -- Weapons Set changed to Naegling.')

    elseif command == 'toggle Idle set' then
        sets.Idle.mode:cycle()
        equip(sets.Idle[sets.Idle.mode.value])
        windower.chat.input(('/echo -- Idle Set changed to %s --'):format(sets.Idle.mode.value))
        send_command('@input /lockstyleset 100')

    elseif command == 'toggle WS set' then
        sets.WS.mode:cycle()
        equip(sets.WS[sets.WS.mode.value])
        windower.chat.input(('/echo -- Weapon Skill Set changed to %s --'):format(sets.WS.mode.value))

        -- elseif command == 'equip TP set' then
        -- 	equip(sets.TP[sets.TP.mode.value])

    elseif command == 'equip TP.Normal set' then
        sets.TP.mode:set('Normal')
        send_command('input /echo -- TP Set changed to Normal')
        if player.status == 'Engaged' then
            equip(sets.TP.Normal)
        end

    elseif command == 'equip TP.Accuracy set' then
        sets.TP.mode:set('Accuracy')
        send_command('input /echo -- TP Set changed to Accuracy')
        if player.status == 'Engaged' then
            equip(sets.TP.Accuracy)
        end

    elseif command == 'equip TP.DT set' then
        sets.TP.mode:set('DT')
        send_command('input /echo -- TP Set changed to DT')
        if player.status == 'Engaged' then
            equip(sets.TP.DT)
        end

    elseif command == 'equip TP.TH set' then
        sets.TP.mode:set('TH')
        send_command('input /echo -- TP Set changed to Treasure Hunter')
        if player.status == 'Engaged' then
            equip(sets.TP.TH)
        end

    elseif command == 'equip Idle set' then
        equip(sets.Idle[sets.Idle.mode.value])
        equip(sets.Weapons[sets.Weapons.mode.value])

    elseif command == 'toggle AutoWS' then
        sets.AutoWS.mode:cycle()
        equip(sets.AutoWS[sets.AutoWS.mode.value])
        windower.chat.input(('/echo -- Auto Weapon Skill %s --'):format(sets.AutoWS.mode.value))

    end
end

-- windower.register_event('tp change', function(tp)

--     if player.status == 'Engaged' then
--         if sets.AutoWS.mode.value == 'Enabled (Exenterator)' and tp >= 1000 then
--             windower.send_command('input /ws "Exenterator" <t>')

--         elseif sets.AutoWS.mode.value == 'Enabled (Savage Blade)' and tp >= 1000 then
--             windower.send_command('input /ws "Savage Blade" <t>')
--         end
--     end
-- end)

-- windower.register_event('hp change', function(hp)

--     if player.status == 'Engaged' and sets.TP.mode.value ~= "DT" then
--         if player.hpp < 25 then
--             equip(sets.TP.DT)
--         else
--             equip(sets.TP[sets.TP.mode.value])
--         end

--     elseif player.status == 'Idle' and sets.Idle.mode.value ~= "DT" then
--         if player.hpp < 35 then
--             equip(sets.Idle.DT)

--             -- elseif player.hpp > 35 then
--             -- equip(sets.Idle.Normal)
--         end
--     end
-- end)
