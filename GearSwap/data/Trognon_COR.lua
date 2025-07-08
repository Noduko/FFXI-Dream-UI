-----------------------MACRO BOOK------------------
send_command('input /macro book 7')
send_command('wait 4; input /macro set 10')
send_command('wait 4; input /lockstyleset 120')

function sub_job_change(new, old)
    send_command('wait 2; input /lockstyleset 120')
end

-----------------------BINDING------------------

-- GEAR--

send_command('bind ^f1 gs c equip TP.Normal set')
send_command('bind ^f2 gs c equip TP.Accuracy set')
send_command('bind ^f3 gs c equip TP.DT set')
send_command('bind ^f4 gs c equip TP.TH set')
send_command('bind ^f5 gs c toggle Idle set')
send_command('bind ^f6 gs c toggle AutoWS')

send_command('bind %~Q gs c toggle Luzaf set')
-- send_command('bind !Q gs c toggle Weapons set')
send_command('bind ^Q gs c toggle RangedWeapons set')
send_command('bind %~W gs c toggle WS set')

-- OTHER--

send_command('unbind !numpad1')
send_command('unbind !numpad2')
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

    include('organizer-lib.lua')
    include('ani-hud.lua')
    include('Modes')

    options = {
        default_element = 'fire',
        default_step = 'Box Step',
        ammo = {
            QD = "Animikii Bullet",
            TP = "Bronze Bullet",
            WS = "Eminent Bullet",
            Cheap = "Bronze Bullet"
        }
    }

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
        elseif flags['UseTH'] then
            return 'TH', {51, 204, 51}
        else
            return '', {255, 0, 0}
        end
    end)
    HUD.AddBox(-9, -24, 80, 19, 'Double-Up')
    HUD.AddText("", 23, -22, 10, {255, 255, 255}, "RollValue")
    HUD.AddText("", 0, -21, 8, {0, 255, 0}, "RollLucky")
    HUD.AddText("", 52, -21, 8, {255, 0, 0}, "RollUnlucky")
    HUD.AddBox(-9, -46, 35, 19, 'Snake Eye')
    HUD.AddText("", -2, -43, 8, nil, function()
        return buffactive['Snake Eye'] and "S.E." or ""
    end)
    HUD.AddBox(36, -46, 35, 19, function()
        return flags['Luzaf'] or flags['Double-Luzaf']
    end)
    HUD.AddText("", 43, -43, 8, nil, function()
        return (flags['Luzaf'] or flags['Double-Luzaf']) and "Luz" or ""
    end)
    HUD.Finish()

    sets = {
        -- action = function(spell) print(spell.command, spell.type, spell.english) end,
        Autoset = {
            when = 'Aftercast',
            Rolls = {
                spelltype = "CorsairRoll",
                Success = {
                    interrupted = false,
                    action = function(spell)
                        HUD.Data['RollLucky'] = Rolls[spell.name].Lucky
                        HUD.Data['RollUnlucky'] = Rolls[spell.name].Unlucky
                        HUD.Data['Double-Up'] = true
                    end,
                    Luzaf = {
                        flag = "Luzaf",
                        action = function()
                            flags['Luzaf'] = false
                            flags['Double-Luzaf'] = true
                        end
                    }
                },
                Fail = {
                    interrupted = true,
                    action = function()
                        flags['Luzaf'] = false
                        flags['Double-Luzaf'] = false
                        aftercast({})
                    end
                }
            }
        }
    }

    ----------------------- WEAPONS SETS -----------------------	

    sets.Weapons = {}
    sets.Weapons.mode = M {'Naegling', 'Tauret', 'Other'}

    sets.Weapons.Naegling = {
        main = "Naegling",
        sub = "Blurred Knife +1"
    }

    sets.Weapons.Tauret = {
        main = "Knife",
        sub = "Joyeuse"
    }

    sets.Weapons.Other = {}

    sets.RangedWeapons = {}
    sets.RangedWeapons.mode = M {'Ataktos', 'Doomsday'}

    sets.RangedWeapons.Ataktos = {
        range = "Anarchy +2",
        ammo = options.ammo.TP
    }

    sets.RangedWeapons.Doomsday = {
        range = "Doomsday",
        ammo = options.ammo.TP
    }

    ----------------------- IDLE SETS -----------------------

    sets.Idle = {}
    sets.Idle.mode = M {'Normal', 'DT'}

    sets.Idle.Normal = {
    ammo = options.ammo.TP,
    head="Meghanada Visor +2",
    body="Adhemar Jacket",
    hands="Adhemar Wristbands",
    legs="Meg. Chausses +2",
    feet={ name="Herculean Boots", augments={'Accuracy+19','"Triple Atk."+2','Attack+10',}},
    neck="Sanctity Necklace",
    waist="Windbuffet Belt",
    left_ear="Infused Earring",
    right_ear="Suppanomimi",
    left_ring="Shneddick Ring",
    right_ring="Defending Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Damage taken-5%',}},
    }

    sets.Idle.DT = {
        ammo = options.ammo.TP,
        head="Meghanada Visor +2",
        body="Meg. Cuirie +1",
        hands="Meg. Gloves +2",
        legs="Meg. Chausses +2",
        feet={ name="Herculean Boots", augments={'Accuracy+19','"Triple Atk."+2','Attack+10',}},
        neck="Sanctity Necklace",
        waist="Windbuffet Belt",
        left_ear="Infused Earring",
        right_ear="Suppanomimi",
        left_ring="Shneddick Ring",
        right_ring="Defending Ring",
        back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Damage taken-5%',}},
    }

    ----------------------- TP SETS -----------------------
    sets.TP = {}
    sets.TP.mode = M {'Normal', 'Accuracy', 'DT', 'TH'}

    sets.TP.Normal = {
        ammo = options.ammo.TP,
        -- ammo="Hasty Pinion +1",
        head="Meghanada Visor +2",
        body="Adhemar Jacket",
        hands="Adhemar Wristbands",
        legs={ name="Samnuha Tights", augments={'STR+7','DEX+6',}},
        feet={ name="Herculean Boots", augments={'Accuracy+19','"Triple Atk."+2','Attack+10',}},
        neck="Houyi's Gorget",
        waist="Windbuffet Belt",
        left_ear="Brutal Earring",
        right_ear="Suppanomimi",
        left_ring="Petrov Ring",
        right_ring="Epona's Ring",
        back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Damage taken-5%',}},
    }

    sets.TP.Accuracy = {
        ammo = options.ammo.TP,
        head="Meghanada Visor +2",
        body="Adhemar Jacket",
        hands="Adhemar Wristbands",
        legs="Meg. Chausses +2",
        feet="Meg. Jam. +2",
        neck="Houyi's Gorget",
        waist="Windbuffet Belt",
        left_ear="Brutal Earring",
        right_ear="Suppanomimi",
        left_ring="Petrov Ring",
        right_ring="Epona's Ring",
        back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Damage taken-5%',}},
    }

    sets.TP.DT = {
        head="Meghanada Visor +2",
        body="Meg. Cuirie +1",
        hands="Meg. Gloves +2",
        legs="Meg. Chausses +2",
        feet="Meg. Jam. +2",
        neck="Houyi's Gorget",
        waist="Windbuffet Belt",
        left_ear="Brutal Earring",
        right_ear="Suppanomimi",
        left_ring="Defending Ring",
        right_ring="Epona's Ring",
        back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Damage taken-5%',}},
    }

    sets.TP.TH_Gear = {
        waist = "Chaac Belt"

    }

    -- Combine DT and TH sets
    sets.TP.TH = set_combine(sets.TP.DT, sets.TP.TH_Gear)

    sets.PreRanged = {}
    sets.PreRanged = {}

    sets.Ranged = {}
    sets.Ranged = {}

    ----------------------- WS SETS -----------------------

    sets.WS = {}
    sets.WS.mode = M {'Normal', 'Accuracy'}

    sets.SavageBlade = {}
    sets.SavageBlade.mode = M {'Normal', 'Accuracy'}

    sets.SavageBlade.Normal = {
        head={ name="Lilitu Headpiece", augments={'STR+3','DEX+2',}},
        body="Meg. Cuirie +1",
        hands="Meg. Gloves +2",
        legs="Meg. Chausses +2",
        feet="Meg. Jam. +2",
        neck="Asperity Necklace",
        waist= "Sailfi Belt +1",
        left_ear="Ishvara Earring",
        left_ring="Ifrit Ring",
        right_ring="Ifrit Ring",
        back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Mag. Evasion+15',}},
    }

    sets.SavageBlade.Accuracy = {
        head={ name="Lilitu Headpiece", augments={'STR+3','DEX+2',}},
        body="Meg. Cuirie +1",
        hands="Meg. Gloves +2",
        legs="Meg. Chausses +2",
        feet="Meg. Jam. +2",
        neck="Asperity Necklace",
        waist= "Sailfi Belt +1",
        left_ear="Ishvara Earring",
        left_ring="Ifrit Ring",
        right_ring="Ifrit Ring",
        back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Mag. Evasion+15',}},
    }

  
    sets.Evisceration = {}
    sets.Evisceration = {}

    sets.AeolianEdge = {}
    sets.AeolianEdge = {}

    sets.LeadenSalute = {}
    sets.LeadenSalute = {}

    sets.Wildfire = {}
    sets.Wildfire = {}

    sets.LastStand = {}
    sets.LastStand = {}

    ----------------------- JOB ABILITY SETS -----------------------

    sets.PhantomRoll = {}
    sets.PhantomRoll.mode = M {'ON', 'OFF'}

    sets.PhantomRoll.ON = {
        range = "Compensator",
        main= "Lanun Knife",
        head= "Lanun Tricorne",
        hands="Chasseur's Gants",
        left_ring="Barataria Ring",
        right_ring="Luzaf's Ring",
        back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Damage taken-5%',}},
    }

    sets.PhantomRoll.OFF = {
        range = "Compensator",
        main= "Lanun Knife",
        head= "Lanun Tricorne",
        hands="Chasseur's Gants",
        left_ring="Barataria Ring",
        right_ring="Defending Ring",
        back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Damage taken-5%',}},
    }

    sets.TripleShot = {}
    sets.TripleShot = {
        head = "Oshosi Mask"

    }

    sets.QuickDrawDMG = {}
    sets.QuickDrawDMG = {
        ammo = options.ammo.QD,
        
    }

    sets.QuickDrawMACC = {}
    sets.QuickDrawMACC = {
        ammo = options.ammo.QD,
       
    }
    ----------------------- MAGIC SETS -----------------------

    sets.precast = {}
    sets.precast.FC = {
        head = {
            name = "Herculean Helm",
            augments = {'Weapon skill damage +3%', 'STR+14', 'Accuracy+8', 'Attack+5'}
        },
        body = {
            name = "Taeon Tabard",
            augments = {'"Fast Cast"+5'}
        },
        hands = {
            name = "Leyline Gloves",
            augments = {'Accuracy+15', 'Mag. Acc.+15', '"Mag.Atk.Bns."+15', '"Fast Cast"+3'}
        },
        neck = "Voltsurge Torque",
        left_ear = "Loquac. Earring",
        left_ring = "Prolix Ring"
    }

    sets.precast.Utsusemi = {
        head = {
            name = "Herculean Helm",
            augments = {'Weapon skill damage +3%', 'STR+14', 'Accuracy+8', 'Attack+5'}
        },
        body = {
            name = "Taeon Tabard",
            augments = {'"Fast Cast"+5'}
        },
        hands = {
            name = "Leyline Gloves",
            augments = {'Accuracy+15', 'Mag. Acc.+15', '"Mag.Atk.Bns."+15', '"Fast Cast"+3'}
        },
        neck = "Magoraga Beads",
        left_ear = "Loquac. Earring",
        left_ring = "Prolix Ring"
    }

    ----------------------- AUTO WEAPON SKILL -----------------------

    sets.AutoWS = {}
    sets.AutoWS.mode = M {'Disabled', 'Enabled (Savage Blade)'}

    -- CreateRules(sets)

end

-----------------------
------- SCRIPT --------
-----------------------

function precast(spell)

    if midaction() then
        -- canceled = true
        cancel_spell()
        return
    end

    if canceled then

        return
    end

    if spell.type == 'WeaponSkill' and player.tp >= 1000 then

        if spell.english == 'Savage Blade' then
            equip(sets.SavageBlade[sets.WS.mode.value])

        elseif spell.english == 'Requiescat' then
            equip(sets.Requiescat)

        elseif spell.english == 'Evisceration' then
            equip(sets.Evisceration)

        elseif spell.english == 'Aeolian Edge' then
            equip(sets.AeolianEdge)

        elseif spell.english == 'Leaden Salute' then
            equip(sets.LeadenSalute)

        elseif spell.english == 'Wildfire' then
            equip(sets.Wildfire)

        elseif spell.english == 'Last Stand' then
            equip(sets.LastStand)

        elseif spell.english == 'Detonator' then
            equip(sets.LastStand)

        else
            equip(sets.SavageBlade[sets.WS.mode.value])

        end

    elseif spell.type == 'WeaponSkill' and player.tp >= 1000 and player.target.distance >= 6 then
        cancel_spell()
        send_command('@input /echo Weapon Skill Canceled  Target Out of Range')

    end

    if spell.action_type == 'Ranged Attack' then
        equip(sets.PreRanged)

    elseif spell.type == 'CorsairRoll' then
        equip(sets.PhantomRoll[sets.PhantomRoll.mode.value])

    elseif spell.english == 'Triple Shot' then
        equip(sets.TripleShot)

    elseif spell.type == 'CorsairShot' then
        if (spell.english ~= 'Light Shot' or spell.english ~= 'Dark Shot') then
            equip(sets.QuickDrawMACC)
        else
            equip(sets.QuickDrawDMG)
        end

    elseif spell.action_type == 'Magic' then
        if (spell.english ~= 'Utsusemi: Ichi' or spell.english ~= 'Utsusemi: Ni') then
            equip(sets.precast.Utsusemi)

        else
            equip(sets.precast.FC)
        end
    end

end

function midcast(spell, act)

    if canceled then
        return
    end

    if spell.action_type == 'Ranged Attack' then
        equip(sets.Ranged)
    end


end

function aftercast(spell)
    if player.status == 'Engaged' then
        equip(sets.TP[sets.TP.mode.value])
        equip(sets.Weapons[sets.Weapons.mode.value])
        equip(sets.RangedWeapons[sets.RangedWeapons.mode.value])

    else
        equip(sets.Idle[sets.Idle.mode.value])
        equip(sets.Weapons[sets.Weapons.mode.value])
        equip(sets.RangedWeapons[sets.RangedWeapons.mode.value])
    end
    
    if spell.name == 'Wild Card' then
        windower.chat.input('/p ' .. string.char(0xFD, 0x02, 0x02, 0x1F, 0x45, 0xFD) .. ' ' .. string.char(0xFD, 0x02, 0x02, 0x15, 0x0E, 0xFD))

    elseif spell.name == 'Cutting Cards' then
        windower.chat.input('/p ' .. string.char(0xFD, 0x02, 0x02, 0x2A, 0x32, 0xFD) .. ' ' .. string.char(0xFD, 0x02, 0x02, 0x15, 0x0E, 0xFD))

    elseif spell.name == 'Random Deal' then
        windower.chat.input('/p ' .. string.char(0xFD, 0x02, 0x02, 0x1F, 0x49, 0xFD) .. ' ' .. string.char(0xFD, 0x02, 0x02, 0x15, 0x0E, 0xFD))
        
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

    if command == 'equip weapon naegling' then
        sets.Weapons.mode.value = "Naegling"
        equip(sets.Weapons[sets.Weapons.mode.value])
        send_command('input /echo -- Weapons Set changed to Naegling.')

    elseif command == 'equip weapon tauret' then
        sets.Weapons.mode.value = "Tauret"
        equip(sets.Weapons[sets.Weapons.mode.value])
        send_command('input /echo -- Weapons Set changed to Tauret.')

    elseif command == 'equip weapon other' then
        sets.Weapons.mode.value = "Other"
        equip(sets.Weapons.Other)
        send_command('input /echo -- Weapons Set changed to Other.')
    end

    -- if command == 'toggle Weapons set' then
    --     sets.Weapons.mode:cycle()
    --     send_command('@input /equipset 102')
    --     equip(sets.Weapons[sets.Weapons.mode.value])
    --     windower.chat.input(('/echo -- Weapons Set changed to %s --'):format(sets.Weapons.mode.value))

    if command == 'toggle RangedWeapons set' then
        sets.RangedWeapons.mode:cycle()
        equip(sets.RangedWeapons[sets.RangedWeapons.mode.value])
        windower.chat.input(('/echo -- Ranged Weapons Set changed to %s --'):format(sets.RangedWeapons.mode.value))

        -- elseif command == 'toggle TP set' then
        -- 	sets.TP.mode:cycle()
        -- 	equip(sets.TP[sets.TP.mode.value])
        -- 	windower.chat.input(('/echo -- TP Set changed to %s --'):format(sets.TP.mode.value))

    elseif command == 'toggle Idle set' then
        sets.Idle.mode:cycle()
        equip(sets.Idle[sets.Idle.mode.value])
        windower.chat.input(('/echo -- Idle Set changed to %s --'):format(sets.Idle.mode.value))
        send_command('@input /lockstyleset 120')

    elseif command == 'toggle Luzaf set' then
        sets.PhantomRoll.mode:cycle()
        equip(sets.PhantomRoll[sets.PhantomRoll.mode.value])
        windower.chat.input(('/echo -- Luzaf Ring %s --'):format(sets.PhantomRoll.mode.value))
        send_command('@input /ja "Corsair\'s Roll" <st>')

    elseif command == 'toggle WS set' then
        sets.WS.mode:cycle()
        equip(sets.WS[sets.WS.mode.value])
        windower.chat.input(('/echo -- Weapon Skill Set changed to %s --'):format(sets.WS.mode.value))

        -- elseif command == 'equip TP set' then
        -- 	equip(sets.TP[sets.TP.mode.value])

    elseif command == 'equip TP.Normal set' then
        sets.TP.mode:set('Normal')
        send_command('input /echo -- TP Set changed to Normal.')
        if player.status == 'Engaged' then
            equip(sets.TP.Normal)
        end

    elseif command == 'equip TP.Accuracy set' then
        sets.TP.mode:set('Accuracy')
        send_command('input /echo -- TP Set changed to Accuracy.')
        if player.status == 'Engaged' then
            equip(sets.TP.Accuracy)
        end

    elseif command == 'equip TP.DT set' then
        sets.TP.mode:set('DT')
        send_command('input /echo -- TP Set changed to DT.')
        if player.status == 'Engaged' then
            equip(sets.TP.DT)
        end

    elseif command == 'equip TP.TH set' then
        sets.TP.mode:set('TH')
        send_command('input /echo -- TP Set changed to Treasure Hunter.')
        if player.status == 'Engaged' then
            equip(sets.TP.TH)
        end

    elseif command == 'equip Idle set' then
        equip(sets.Idle[sets.Idle.mode.value])

    elseif command == 'toggle AutoWS' then
        sets.AutoWS.mode:cycle()
        windower.chat.input(('/echo -- Auto Weapon Skill %s --'):format(sets.AutoWS.mode.value))

    elseif command == 'Test' then
       
        windower.send_command(
            'setkey enter down; wait 0.2; setkey enter up; wait 3',
            'setkey enter down; wait 0.2; setkey enter up'
        
        
        
        
        )
        

    end
    

end

-- windower.register_event('tp change', function(tp)

-- 	if player.status == 'Engaged' then
-- 		if sets.AutoWS.mode.value == 'Enabled (Savage Blade)' and tp >= 1000 then
-- 			send_command('input /echo -- Savage')

-- 		elseif sets.AutoWS.mode.value =='Enabled (Aeolian Edge)' and tp >= 1000 then
-- 			send_command('input /echo -- AE')

-- 		end
-- 	end
-- end)

windower.register_event('tp change', function(tp)

    if player.status == 'Engaged' then
        if sets.AutoWS.mode.value == 'Enabled (Savage Blade)' and tp >= 1000 then
            windower.send_command('input /ws "Savage Blade" <t>')
        end
    end
end)

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

--             -- 	elseif player.hpp > 35 then
--             -- 		equip(sets.Idle.Normal)
--         end
--     end
-- end)

-------------------------------------------------------------------------------------------------------------------
-- show_ammo
-------------------------------------------------------------------------------------------------------------------	
function show_ammo()
    add_to_chat(122, 'Quick Draw Ammo = ' .. options.ammo.QD)
    add_to_chat(122, 'Weapon Skill Ammo = ' .. options.ammo.WS)
    add_to_chat(122, 'Ranged Attack Ammo = ' .. options.ammo.TP)
    add_to_chat(122, 'Magic WS Ammo = ' .. options.ammo.Cheap)
end

windower.register_event('action', function(act)
    if act.actor_id == windower.ffxi.get_player().id and act.category == 6 and
        ((act.param > 96 and act.param < 124) or (act.param > 301 and act.param < 306) or
            (act.param > 389 and act.param < 392)) then
        local action = act.targets[#act.targets]
        action = action.actions[#action.actions]
        HUD.Data['RollValue'] = string.format('%2d', action.param)
        if RollValue == 11 then
            last11 = lastRollName
        end
    end
end)

buff_change = function(name, gain, buff_table)
    if name == "Double-Up Chance" then
        HUD.Data['Double-Up'] = gain
        if not gain then
            flags['Double-Luzaf'] = false
            HUD.Data['RollLucky'] = nil
            HUD.Data['RollValue'] = nil
            HUD.Data['RollUnlucky'] = nil
        end
    elseif name == "Snake Eye" then
        HUD.Data['Snake Eye'] = gain
    end

    if name == last11 and not gain then
        last11 = "No Such Roll"
    end
end

Rolls = {
    ["Magus's Roll"] = {
        Lucky = 2,
        Unlucky = 6
    },
    ["Choral Roll"] = {
        Lucky = 2,
        Unlucky = 6
    },
    ["Samurai Roll"] = {
        Lucky = 2,
        Unlucky = 6
    },
    ["Scholar's Roll"] = {
        Lucky = 2,
        Unlucky = 6
    },
    ["Caster's Roll"] = {
        Lucky = 2,
        Unlucky = 7
    },
    ["Companion's Roll"] = {
        Lucky = 2,
        Unlucky = 10
    },
    ["Naturalist's Roll"] = {
        Lucky = 3,
        Unlucky = 7
    },
    ["Healer's Roll"] = {
        Lucky = 3,
        Unlucky = 7
    },
    ["Monk's Roll"] = {
        Lucky = 3,
        Unlucky = 7
    },
    ["Puppet Roll"] = {
        Lucky = 3,
        Unlucky = 7
    },
    ["Gallant's Roll"] = {
        Lucky = 3,
        Unlucky = 7
    },
    ["Dancer's Roll"] = {
        Lucky = 3,
        Unlucky = 7
    },
    ["Bolter's Roll"] = {
        Lucky = 3,
        Unlucky = 9
    },
    ["Courser's Roll"] = {
        Lucky = 3,
        Unlucky = 9
    },
    ["Allies' Roll"] = {
        Lucky = 3,
        Unlucky = 10
    },
    ["Runeist's Roll"] = {
        Lucky = 4,
        Unlucky = 8
    },
    ["Ninja's Roll"] = {
        Lucky = 4,
        Unlucky = 8
    },
    ["Hunter's Roll"] = {
        Lucky = 4,
        Unlucky = 8
    },
    ["Chaos Roll"] = {
        Lucky = 4,
        Unlucky = 8
    },
    ["Drachen Roll"] = {
        Lucky = 4,
        Unlucky = 8
    },
    ["Beast Roll"] = {
        Lucky = 4,
        Unlucky = 8
    },
    ["Warlock's Roll"] = {
        Lucky = 4,
        Unlucky = 8
    },
    ["Avenger's Roll"] = {
        Lucky = 4,
        Unlucky = 8
    },
    ["Blitzer's Roll"] = {
        Lucky = 4,
        Unlucky = 9
    },
    ["Miser's Roll"] = {
        Lucky = 5,
        Unlucky = 7
    },
    ["Tactician's Roll"] = {
        Lucky = 5,
        Unlucky = 8
    },
    ["Corsair's Roll"] = {
        Lucky = 5,
        Unlucky = 9
    },
    ["Evoker's Roll"] = {
        Lucky = 5,
        Unlucky = 9
    },
    ["Rogue's Roll"] = {
        Lucky = 5,
        Unlucky = 9
    },
    ["Fighter's Roll"] = {
        Lucky = 5,
        Unlucky = 9
    },
    ["Wizard's Roll"] = {
        Lucky = 5,
        Unlucky = 9
    }
}
