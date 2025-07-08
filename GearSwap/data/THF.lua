-----------------------MACRO BOOK------------------
send_command('input /macro book 6')
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

    include('Modes')

    state = {}
    state.IdleMode = M{'Normal', 'DT'}
    state.EngageMode = M{'Normal', 'Accuracy', 'DT', 'TH'}
    state.AutoWS = M{'Off', 'Evisceration'}

    update_jobset_display()

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

     sets.Weapons.ThiefKnife = {
        main = "Thief's Knife",
        sub = "Taming Sari"
    }
 

    ----------------------- IDLE SETS -----------------------
    sets.Idle = {}
    sets.Idle.Normal = {
        ammo = "Staunch Tathlum +1",
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Pillager's Poulaines +1",
        neck = "Bathy Choker +1",
        waist = "Null Belt",
        left_ear = "Hearty Earring",
        right_ear = "Etiolation Earring",
        left_ring = {name = "Chirich Ring +1", bag="Wardrobe 1"},
        right_ring = {name = "Chirich Ring +1", bag="Wardrobe 2"},
        back = {
            name = "Toutatis's Cape",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', '"Store TP"+10', 'Phys. dmg. taken-10%'}
        }
    }

    sets.Idle.DT = {
        ammo = "Staunch Tathlum +1",
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Pillager's Poulaines +1",
        neck = "Elite Royal Collar",
        waist = "Platinum Moogle Belt",
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
    sets.TP.Normal = {
        ammo = "Coiste Bodhar",
        head = "Adhemar Bonnet +1",
        body = "Adhemar Jacket",
        hands = "Adhemar Wrist. +1",
        legs = "Samnuha Tights",
        feet = {
            name = "Herculean Boots",
            augments = {'"Dbl.Atk."+2', '"Subtle Blow"+9', 'Quadruple Attack +2', 'Accuracy+12 Attack+12',
                        'Mag. Acc.+18 "Mag.Atk.Bns."+18'}
        },
        neck = "Null Loop",
        waist = "Sailfi Belt +1",
        left_ear = "Eabani Earring",
        right_ear = "Suppanomimi",
        left_ring = "Petrov Ring",
        right_ring = "Epona's Ring",
        back = "Null Shawl",
    }

    sets.TP.Accuracy = {
        ammo = "Coiste Bodhar",
        head = "Malignance Chapeau",
        body = "Adhemar Jacket",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Null Loop",
        waist = "Sailfi Belt +1",
        left_ear = "Eabani Earring",
        right_ear = "Suppanomimi",
        left_ring = {name = "Chirich Ring +1", bag="Wardrobe 1"},
        right_ring = {name = "Chirich Ring +1", bag="Wardrobe 2"},
        back = "Null Shawl",
    }

    sets.TP.DT = {
        ammo = "Staunch Tathlum +1",
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Null Loop",
        waist = "Sailfi Belt +1",
        left_ear = "Eabani Earring",
        right_ear = "Suppanomimi",
        left_ring = {name = "Chirich Ring +1", bag="Wardrobe 1"},
        right_ring = "Defending Ring",
        back = "Null Shawl",
    }
    
    sets.TP.TH_Gear = {
        ammo = "Per. Lucky Egg",
        head = {name = "Herculean Helm",augments = {'Pet: STR+15', 'Accuracy+20', '"Treasure Hunter"+1'}},
        hands = "Plun. Armlets +1",
        feet = "Skulker's poulaines +1",
        waist = "Chaac Belt"
    }

    -- Combine DT and TH sets
    sets.TP.TH = set_combine(sets.TP.DT, sets.TP.TH_Gear)

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
    
    ----------------------- WS SETS -----------------------

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

    sets.AeolianEdge = {
        head = {name = "Herculean Helm",augments = {'Weapon skill damage +3%', 'STR+14', 'Accuracy+8', 'Attack+5'}},
        hands = {name = "Leyline Gloves",augments = {'Accuracy+15', 'Mag. Acc.+15', '"Mag.Atk.Bns."+15', '"Fast Cast"+3'}},
        legs = {name = "Herculean Trousers",augments = {'Rng.Acc.+19', 'STR+10', 'Attack+7'}},
        waist = "Eschan Stone",
        left_ear = "Friomisi Earring",
        right_ear = {name = "Moonshade Earring",augments = {'Attack+4', 'TP Bonus +250'}},
        left_ring = "Shiva Ring",
        right_ring = "Shiva Ring",

    }

    ----------------------- JOB ABILITY SETS -----------------------

    sets.JA = {}

    sets.JA.Flee = {
        feet = "Pillager's Poulaines +1"
    }
    sets.JA.Steal = {
        feet = "Pillager's Poulaines +1"
    }

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

            elseif spell.english == 'Aeolian Edge' then
                equip(sets.AeolianEdge)

            else
                equip(sets.Rudra)
        end

        elseif spell.type == 'WeaponSkill' and player.tp >= 1000 and player.target.distance >= 6 then
            cancel_spell()
            send_command('@input /echo Weapon Skill Canceled  Target Out of Range')
        
        elseif spell.name == 'Flee' then
            equip(sets.JA.Flee)

        elseif spell.name == 'Steal' then
            equip(sets.JA.Steal)

        elseif spell.action_type == 'Magic' then
            equip(sets.FastCast)
    end

end

function aftercast(spell)

   if player.status == 'Engaged' then
        equip(sets.TP[state.EngageMode.value])
        
        else
        equip(sets.Idle[state.IdleMode.value])
    end

end

function status_change(new, old)

    if new == 'Engaged' then
        equip(sets.TP[state.EngageMode.value])

        else
        equip(sets.Idle[state.IdleMode.value])
    end
end

function self_command(command)

    if command == 'weapon set tauret' then
        equip(sets.Weapons.Tauret)
        send_command('input /echo -- Weapons Set changed to Tauret.')

    elseif command == 'weapon set naegling' then
        equip(sets.Weapons.Naegling)
        send_command('input /echo -- Weapons Set changed to Naegling.')

    elseif command == 'weapon set thief knife' then
        equip(sets.Weapons.ThiefKnife)
        send_command('input /echo -- Weapons Set changed to Thief\'s Knife.')

    elseif command == 'toggle Idle set' then
        state.IdleMode:cycle()
        update_jobset_display()
        windower.chat.input(('/echo -- Idle Set changed to %s --'):format(state.IdleMode.value))
        if player.status ~= 'Engaged' then
            equip(sets.Idle[state.IdleMode.value])
            send_command('@input /lockstyleset 100')
        end

    elseif command == 'equip TP.Normal set' then
        state.EngageMode:set('Normal')
        update_jobset_display()
        send_command('input /echo -- TP Set changed to Normal.')
        if player.status == 'Engaged' then
            equip(sets.TP.Normal)
        end

    elseif command == 'equip TP.Accuracy set' then
        state.EngageMode:set('Accuracy')
        update_jobset_display()
        send_command('input /echo -- TP Set changed to Accuracy.')
        if player.status == 'Engaged' then
            equip(sets.TP.Accuracy)
        end

    elseif command == 'equip TP.DT set' then
        state.EngageMode:set('DT')
        update_jobset_display()
        send_command('input /echo -- TP Set changed to DT.')
        if player.status == 'Engaged' then
            equip(sets.TP.DT)
        end

    elseif command == 'equip TP.TH set' then
        state.EngageMode:set('TH')
        update_jobset_display()
        send_command('input /echo -- TP Set changed to Treasure Hunter.')
        if player.status == 'Engaged' then
            equip(sets.TP.TH)
        end

    elseif command == 'toggle AutoWS' then
        state.AutoWS:cycle()
        update_jobset_display()
        windower.chat.input(('/echo -- Auto Weapon Skill (%s) --'):format(state.AutoWS.value))
    end
end

windower.register_event('tp change', function(tp)

    if player.status == 'Engaged' and state.AutoWS.value ~= 'Off' and tp >= 1000 then
        windower.send_command('input /ws "' .. state.AutoWS.value .. '" <t>')
    end

end)

















-----------------------
------- HUD --------
-----------------------

----------------------- ACCURACY & SET DISPLAY HUD -----------------------

texts = require('texts')

-- Display setup
jobset_display = texts.new({
    pos = {x = 1420, y = 835},
    text = {font = 'Segoe UI Emoji', size = 9.5, stroke = {width = 2, alpha = 200}},
    flags = {draggable = true},
    bg = {alpha = 100, red = 30, green = 85, blue = 45},
    padding = 2,

})

-- Accuracy tracking variables
total_swings = 0
total_hits = 0
total_crits = 0


-- HUD display settings
function update_jobset_display()
    if not player or not player.main_job then return end

    local idle_mode = state.IdleMode and state.IdleMode.value or "N/A"
    local engage_mode   = state.EngageMode and state.EngageMode.value or "N/A"
    local autows_mode = state.AutoWS and state.AutoWS.value or "N/A"
    
     local crit_percent = (total_hits > 0) and math.floor((total_crits / total_hits) * 100) or 0
    local accuracy_percent = (total_swings > 0) and math.floor((total_hits / total_swings) * 100) or 100
    local accuracy_info = (total_swings > 0) 
        and string.format("🏹 %d%% ( %d | %d%% )", accuracy_percent, total_misses, crit_percent)
        or "🏹 --                     "

    local gearset_info = string.format("⚔️ %s\n 🧍  %s", engage_mode, idle_mode)
    local autows_info = string.format("⚙: \\cs(205,205,125)%s\\cr", autows_mode)

    local text_to_display = accuracy_info .. '\n' .. gearset_info
    if autows_mode ~= "Off" then
        text_to_display = text_to_display .. '\n' .. autows_info
    end

    jobset_display:text(text_to_display)
    jobset_display:show()

end

-- Watch for State changes (IdleMode, EngageMode, AutoWS, etc.)
function job_state_change(stateField, newValue, oldValue)
    update_jobset_display()
end

-- Track melee accuracy
function track_melee_accuracy(action)
    if action.actor_id ~= player.id then return end

    -- Category 1 is melee, Category 2 is ranged
    if action.category == 1 then
        for _, target in pairs(action.targets) do
            for _, subaction in pairs(target.actions) do
                total_swings = total_swings + 1
                 if subaction.message == 1 or subaction.message == 67 or subaction.message == 352 then
                    -- 1 = Hit, 67 = Critical hit, 352 = Extra hit
                    total_hits = total_hits + 1
                
                    if subaction.message == 67 then -- 67 = Critical hit
                        total_crits = total_crits + 1
                    end
                end
            end
        end

        total_misses = total_swings - total_hits
        update_jobset_display()
    end
end

-- Register the action event to track melee accuracy
windower.register_event('action', track_melee_accuracy)


-- Update HUD when you log in
windower.register_event('login', function()
    coroutine.schedule(update_jobset_display, 3)
end)


-- Update and reset HUD when zoning (after delay)
windower.register_event('zone change', function()
    total_swings = 0
    total_hits = 0
    coroutine.schedule(update_jobset_display, 3)
end)

--Hide HUD when interacting with NPC or loading
local jobset_display_hidden = false

-- Safely set HUD visibility
local function set_hud_visibility(visible)
    if not jobset_display then return end
    if visible and jobset_display_hidden then
        jobset_display:show()
        jobset_display_hidden = false
    elseif not visible and not jobset_display_hidden then
        jobset_display:hide()
        jobset_display_hidden = true
    end
end

-- Shows or hides the HUD based on player status
local function update_hud_visibility()
    local player = windower.ffxi.get_player()
    local is_cutscene = player and player.status == 4
    set_hud_visibility(not is_cutscene)
end

-- Event: Cutscene/menu/combat status changed
windower.register_event('status change', update_hud_visibility)

-- Event: Zoning - hide HUD for safety
windower.register_event('zone change', function()
    set_hud_visibility(false)
end)

-- Event: Login - safe to show HUD
windower.register_event('login', function()
    set_hud_visibility(true)
end)

