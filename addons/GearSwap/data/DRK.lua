-----------------------MACRO BOOK------------------
send_command('input /macro book 4')
send_command('wait 4; input /macro set 10')
send_command('wait 4; input /lockstyleset 160')

function sub_job_change(new, old)
    send_command('wait 4; input /lockstyleset 160')
end

-----------------------BINDING------------------

-- JA & MAGIC--

send_command('bind !numpad1 input /ma "Stun" <t>')
send_command('bind !numpad2 input /ja "Weapon Bash" <t>')
send_command('bind !numpad3 input /ma "Sleep II" <t>')

send_command('bind !numpad4 input /ma "Dread Spikes" <me>')
send_command('bind !numpad5 input /ma "Endark II" <me>')
send_command('bind !numpad6 input /ja "Nether Void" <me>; wait 1.5;  input /ma "Drain III" <t>')

-- GEAR--

send_command('bind ^f1 gs c equip TP.Normal')
send_command('bind ^f2 gs c equip TP.Accuracy')
send_command('bind ^f3 gs c equip TP.DT')
send_command('bind ^f4 gs c toggle TP.Others')
send_command('bind ^f5 gs c toggle Idle')
send_command('bind ^f6 gs c toggle AutoWS')

send_command('bind ^Q gs c toggle WS set')

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
    state.EngageMode = M{'Normal', 'Accuracy', 'DT', 'TH', 'SB'}
    state.AutoWS = M{'Off', 'Torcleaver'}
    
    update_jobset_display()

    ----------------------- WEAPONS SETS -----------------------	

    sets.Weapons = {}
    sets.Weapons.Caladbolg = {
        main = "Caladbolg",
        sub = "Utu Grip"
    }

    sets.Weapons.Apocalypse = {
        main = "Apocalypse",
        sub = "Utu Grip"
    }

    ----------------------- IDLE SETS -----------------------
    sets.Idle = {}
    sets.Idle.Normal = {
        ammo = "Staunch Tathlum +1",
        head = {
            name = "Valorous Mask",
            augments = {'Accuracy+17', 'Weapon skill damage +4%', 'STR+9', 'Attack+1'}
        },
        body = "Sakpata's Plate",
        hands = "Sakpata's Gauntlets",
        legs = "Carmine Cuisses +1",
        feet = "Sakpata's Leggings",
        neck = "Elite Royal Collar",
        waist = "Null Belt",
        left_ear = "Hearty Earring",
        right_ear = "Etiolation Earring",
        left_ring = "Karieyh Ring",
        right_ring = "Defending Ring",
        back = {
            name = "Ankou's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}
        }
    }

    sets.Idle.DT = {
        ammo = "Staunch Tathlum +1",
        head = {
            name = "Valorous Mask",
            augments = {'Accuracy+17', 'Weapon skill damage +4%', 'STR+9', 'Attack+1'}
        },
        body = "Sakpata's Plate",
        hands = "Sakpata's Gauntlets",
        legs = "Carmine Cuisses +1",
        feet = "Sakpata's Leggings",
        neck = "Elite Royal Collar",
        waist = "Platinum Moogle Belt",
        left_ear = "Hearty Earring",
        right_ear = "Etiolation Earring",
        left_ring = "Karieyh Ring",
        right_ring = "Defending Ring",
        back = {
            name = "Ankou's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}
        }
    }

    ----------------------- TP SETS -----------------------

    sets.TP = {}
    sets.TP.Normal = {
        ammo = "Coiste Bodhar",
        head = "Flam. Zucchetto +2",
        body = "Sakpata's Plate",
        hands = "Sakpata's Gauntlets",
        legs = "Ignominy Flanchard +3",
        feet = "Flam. Gambieras +2",
        neck = "Abyssal Beads +1",
        waist = "Ioskeha Belt +1",
        left_ear = "Cessance Earring",
        right_ear = "Telos Earring",
        left_ring = "Niqmaddu Ring",
        right_ring = "Petrov Ring",
        back = {name = "Ankou's Mantle",augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}}
    }

    sets.TP.Accuracy = {
        ammo = "Coiste Bodhar",
        head = "Flam. Zucchetto +2",
        body = "Sakpata's Plate",
        hands = "Sakpata's Gauntlets",
        legs = "Ignominy Flanchard +3",
        feet = "Flam. Gambieras +2",
        neck = "Null Loop",
        waist = "Ioskeha Belt +1",
        left_ear = "Telos Earring",
        right_ear = "Heathen's Earring +1",
        left_ring = {name = "Chirich Ring +1", bag="Wardrobe 1"},
        right_ring = {name = "Chirich Ring +1", bag="Wardrobe 2"},
        back = "Null Shawl",
    }

    sets.TP.DT = {
        ammo = "Staunch Tathlum +1",
        head = "Sakpata's Helm",
        body = "Sakpata's Plate",
        hands = "Sakpata's Gauntlets",
        legs = "Sakpata's Cuisses",
        feet = "Flam. Gambieras +2",
        -- neck = "Elite Royal Collar",
        neck = "Abyssal Beads +1",
        waist = "Sailfi Belt +1",
        left_ear = "Cessance Earring",
        right_ear = "Heathen's Earring +1",
        left_ring = "Niqmaddu Ring",
        right_ring = "Defending Ring",
        back = "Null Shawl",
    }
    
    sets.TP.SB = {
        ammo="Staunch Tathlum +1",
        head="Sakpata's Helm",
        body="Dagon Breast.",
        hands="Sakpata's Gauntlets",
        legs="Sakpata's Cuisses",
        feet="Sakpata's Leggings",
        neck="Bathy Choker +1",
        waist="Ioskeha Belt +1",
        left_ear="Dignitary's Earring",
        right_ear="Telos Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Chirich Ring +1",
        back = {name = "Ankou's Mantle",augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}}
    }

    sets.TP.TH_Gear = {
        ammo = "Per. Lucky Egg",
        head = "White Rarab Cap +1",
        waist = "Chaac Belt"
    }
    -- Combine DT and TH sets
    sets.TP.TH = set_combine(sets.TP.DT, sets.TP.TH_Gear)

    ----------------------- WS SETS -----------------------

    sets.WS = {}
    sets.WS.Torcleaver = {
        ammo = "Knobkierrie",
        head={ name="Odyssean Helm", augments={'Attack+4','Weapon skill damage +4%','Accuracy+14',}},
        body = "Ignominy Cuirass +3",
        hands={ name="Odyssean Gauntlets", augments={'Accuracy+17','Weapon skill damage +4%','Attack+5',}},
        legs = "Fallen's Flanchard +3",
        feet = "Heathen's Sollerets +2",
        waist = "Sailfi Belt +1",
        left_ear = "Thrud Earring",
        right_ear = {
            name = "Moonshade Earring",
            augments = {'Attack+4', 'TP Bonus +250'}
        },
        left_ring = "Niqmaddu Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Ankou's Mantle",
            augments = {'VIT+20', 'Accuracy+20 Attack+20', 'VIT+10', 'Weapon skill damage +10%', 'Phys. dmg. taken-10%'}
        }
    }

    sets.WS.Catastrophe = {
        ammo = "Knobkierrie",
        head={ name="Odyssean Helm", augments={'Attack+4','Weapon skill damage +4%','Accuracy+14',}},
        body = "Ignominy Cuirass +3",
        hands={ name="Odyssean Gauntlets", augments={'Accuracy+17','Weapon skill damage +4%','Attack+5',}},
        legs = "Fallen's Flanchard +3",
        feet = "Heathen's Sollerets +2",
        waist = "Sailfi Belt +1",
        left_ear = "Thrud Earring",
        right_ear = "Heathen's Earring +1",
        left_ring = "Niqmaddu Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Ankou's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%', 'Phys. dmg. taken-10%'}
        }
    }

    sets.WS.Resolution = {
        ammo = "Knobkierrie",
        head = "Flamma Zucchetto +2",
        body = "Ignominy Cuirass +3",
        hands = {
            name = "Valorous Mitts",
            augments = {'Weapon Skill Acc.+9', 'VIT+3', 'Weapon skill damage +3%', 'Accuracy+16 Attack+16'}
        },
        legs = "Ignominy Flanchard +3",
        feet = "Flam. Gambieras +2",
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Cessance Earring",
        right_ear = {
            name = "Moonshade Earring",
            augments = {'Attack+4', 'TP Bonus +250'}
        },
        left_ring = "Niqmaddu Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Ankou's Mantle",
            augments = {'VIT+20', 'Accuracy+20 Attack+20', 'VIT+10', 'Weapon skill damage +10%', 'Phys. dmg. taken-10%'}
        }
    }

    sets.WS.Shockwave = {
        ammo = "Knobkierrie",
        head = "Fallen's Burgeonet +3",
        body = "Ignominy Cuirass +3",
        hands = "Fallen's Finger Gauntlets +3",
        feet = "Fallen's Flanchard +3",
        waist = "Heathen's Sollerets +2",
        left_ear = "Thrud Earring",
        right_ear = {
            name = "Moonshade Earring",
            augments = {'Attack+4', 'TP Bonus +250'}
        },
        left_ring = "Karieyh Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Ankou's Mantle",
            augments = {'VIT+20', 'Accuracy+20 Attack+20', 'VIT+10', 'Weapon skill damage +10%', 'Phys. dmg. taken-10%'}
        }
    }

    sets.WS.SavageBlade = {

        ammo = "Crepuscular Pebble",
        head={ name="Odyssean Helm", augments={'Attack+4','Weapon skill damage +4%','Accuracy+14',}},
        body = "Ignominy Cuirass +3",
        hands={ name="Odyssean Gauntlets", augments={'Accuracy+17','Weapon skill damage +4%','Attack+5',}},
        legs = "Fallen's Flanchard +3",
        feet = "Heathen's Sollerets +2",
        waist = "Sailfi Belt +1",
        left_ear = "Thrud Earring",
        right_ear = {
            name = "Moonshade Earring",
            augments = {'Attack+4', 'TP Bonus +250'}
        },
        left_ring = "Niqmaddu Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Ankou's Mantle",
            augments = {'VIT+20', 'Accuracy+20 Attack+20', 'VIT+10', 'Weapon skill damage +10%', 'Phys. dmg. taken-10%'}
        }
    }

    ----------------------- MAGIC SETS -----------------------

    sets.FastCast = {}
    sets.FastCast = {
        ammo = "Sapience Orb",
        body = "Odyss. Chestplate",
        hands = {name = "Leyline Gloves", augments = {'Accuracy+15', 'Mag. Acc.+15', '"Mag.Atk.Bns."+15', '"Fast Cast"+3'}},
        legs = "Eschite Cuisses",
        feet= { name="Odyssean Greaves", augments={'"Fast Cast"+4','VIT+6','Accuracy+6',}},
        neck = "Voltsurge Torque",
        left_ear = "Loquac. Earring",
        right_ear = "Malignance Earring",
        left_ring = "Prolix Ring",
        right_ring = "Kishar Ring"
    }

    sets.Endark = {}
    sets.Endark = {
        ammo = "Sapience Orb",
        head = "Ignominy Burgeonet +1",
        body = "Carm. Scale Mail",
        hands = "Fallen's Finger Gauntlets +3",
        legs = "Heathen's Flanchard +2",
        feet = "Ratri Sollerets",
        waist = "Casso Sash",
        back = "Niht Mantle",
        right_ear = "Mani Earring",
        right_ring = "Evanescence Ring"
    }

    sets.Stun = {}
    sets.Stun = {
        ammo = "Sapience Orb",
        head = "Fallen's Burgeonet +3",
        body = "Carmine Scale Mail",
        hands = "Fallen's Finger Gauntlets +3",
        legs = "Eschite Cuisses",
        feet = "Ratri Sollerets",
        neck = "Sanctity Necklace",
        waist = "Eschan Stone",
        left_ear = "Malignance Earring",
        right_ear = "Heathen's Earring +1",
        left_ring = "Evanescence Ring",
        right_ring = "Kishar Ring"
    }

    sets.Drain = {}
    sets.Drain = {
        ammo = "Sapience Orb",
        head = "Fallen's Burgeonet +3",
        body = "Carm. Scale Mail",
        hands = "Fallen's Finger Gauntlets +3",
        legs = "Heathen's Flanchard +2",
        feet = "Ratri Sollerets",
        neck = "Sanctity Necklace",
        waist = "Eschan Stone",
        back = "Niht Mantle",
        left_ear = "Nehalennia Earring",
        right_ear = "Hirudinea Earring",
        left_ring = "Archon Ring",
        right_ring = "Evanescence Ring"
    }

    sets.DreadSpikes = {}
    sets.DreadSpikes = {
        ammo = "Happy Egg",
        head = "Ratri Sallet",
        body = "Heathen's Cuirass +2",
        hands = "Sakpata's Gauntlets",
        legs = "Sakpata's Cuisses",
        feet = "Ratri Sollerets",
        neck = "Bathy Choker +1",
        waist = "Plat. Mog. Belt",
        left_ear = "Tuisto Earring",
        right_ear = "Odnowa Earring",
        left_ring = "Niqmaddu Ring",
        right_ring = "Kunaji Ring"
    }

    sets.Enfeebling = {}
    sets.Enfeebling = {
        ammo = "Sapience Orb",
        head = "Sakpata's Helm",
        body = "Ignominy Cuirass +3",
        hands = "Fallen's Finger Gauntlets +3",
        legs = "Eschite Cuisses",
        feet = "Ignominy's Sollerets",
        neck = "Sanctity Necklace",
        waist = "Casso Sash",
        left_ear = "Malignance Earring",
        right_ear = "Vor Earring",
        left_ring = "Crepuscular Ring",
        right_ring = "Kishar Ring"
    }

    ----------------------- JOB ABILITY SETS -----------------------

    sets.JA = {}
    sets.JA.BloodWeapon = {
        body = "Fallen's Cuirass +1"
    }
    sets.JA.ArcaneCircle = {
        feet = "Ignominy Sollerets"
    }

    sets.JA.Souleater = {
        head = "Fallen's Burgeonet +3"
    }

    sets.JA.LastResort = {
        feet = "Fallen's Sollerets",
        back = {name = "Ankou's Mantle",augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}}
    }

    sets.JA.WeaponBash = {
        hands = "Ignominy Gauntlets"
    }

    sets.JA.DarkSeal = {
        head = "Fallen's Burgeonet +3"
    }
    sets.JA.NeitherVoid = {
        legs = "Hearten;s Flanchard +2"
    }

    ----------------------- ITEM SETS -----------------------

    sets.HolyWater = {
        neck = "Nicander's Necklace"
    }

end

-----------------------
------- SCRIPT --------
-----------------------

function precast(spell)

    if spell.type == 'WeaponSkill' and player.tp >= 1000 and player.target.distance < 4.5 then

        if spell.english == 'Torcleaver' then
            equip(sets.WS.Torcleaver)

        elseif spell.english == 'Catastrophe' then
            equip(sets.WS.Catastrophe)

        elseif spell.english == 'Resolution' then
            equip(sets.WS.Resolution)

        elseif spell.english == 'Shockwave' then
            equip(sets.WS.Shockwave)

        elseif spell.english == 'Savage Blade' then
            equip(sets.WS.SavageBlade)

        else
            equip(sets.WS.Torcleaver)
        end

    elseif spell.type == 'WeaponSkill' and player.tp >= 1000 and player.target.distance >= 6 then
        cancel_spell()
        send_command('@input /echo Weapon Skill Canceled  Target Out of Range')
    end

    if spell.name == 'Blood Weapon' then
        equip(sets.JA.BloodWeapon)

    elseif spell.name == 'Souleater' then
        equip(sets.JA.Souleater)

    elseif spell.name == 'Last Resort' then
        equip(sets.JA.LastResort)

    elseif spell.name == 'Weapon Bash' then
        equip(sets.JA.WeaponBash)

    elseif spell.name == 'Dark Seal' then
        equip(sets.JA.DarkSeal)

    elseif spell.name == 'Neither Void' then
        equip(sets.JA.NeitherVoid)

    elseif spell.action_type == 'Magic' then
        equip(sets.FastCast)
    
    elseif spell.action_type == 'Item' and spell.english == 'Holy Water' then
        equip(sets.HolyWater)
    end
    
end

function midcast(spell)

    if spell.name == 'Endark' or spell.name == 'Endark II' then
        equip(sets.Endark)

    elseif spell.name == 'Stun' then
        equip(sets.Stun)

    elseif spell.name == 'Drain' or spell.name == 'Drain II' or spell.name == 'Drain III' then
        equip(sets.Drain)

    elseif spell.name == 'Dread Spikes' then
        equip(sets.DreadSpikes)

    elseif spell.skill == 'Enfeebling Magic' then
        equip(sets.Enfeebling)

    end

end

function aftercast(spell)

    if player.status == 'Engaged' then
        equip(sets.TP[state.EngageMode.value])
        
        else
        equip(sets.Idle[state.IdleMode.value])
    end

    if spell.name == 'Blood Weapon' then
        windower.chat.input('/p ' .. string.char(0xFD, 0x02, 0x02, 0x1F, 0x1B, 0xFD) .. ' ' .. string.char(0xFD, 0x02, 0x02, 0x15, 0x0E, 0xFD))

    elseif spell.name == 'Soul Enslavement' then
        windower.chat.input('/p ' .. string.char(0xFD, 0x02, 0x02, 0x2A, 0x27, 0xFD) .. ' ' .. string.char(0xFD, 0x02, 0x02, 0x15, 0x0E, 0xFD))
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

    if command == 'equip weapon caladbolg' then
        equip(sets.Weapons.Caladbolg)
        send_command('input /echo -- Weapons Set changed to Caladbolg.')
        state.AutoWS = M{'Off', 'Torcleaver'}

    elseif command == 'equip weapon apocalypse' then
        equip(sets.Weapons.Apocalypse)
        send_command('input /echo -- Weapons Set changed to Apocalypse.')
        state.AutoWS = M{'Off', 'Catastrophe'}

    elseif command == 'equip TP.Normal' then
        state.EngageMode:set('Normal')
        update_jobset_display()
        windower.chat.input(('/echo -- TP Set changed to %s --'):format(state.EngageMode.value))
        if player.status == 'Engaged' then
            equip(sets.TP[state.EngageMode.value])
        end

    elseif command == 'equip TP.Accuracy' then
        state.EngageMode:set('Accuracy')
        update_jobset_display()
        windower.chat.input(('/echo -- TP Set changed to %s --'):format(state.EngageMode.value))
        if player.status == 'Engaged' then
            equip(sets.TP[state.EngageMode.value])
        end

    elseif command == 'equip TP.DT' then
        state.EngageMode:set('DT')
        update_jobset_display()
        windower.chat.input(('/echo -- TP Set changed to %s --'):format(state.EngageMode.value))
        if player.status == 'Engaged' then
            equip(sets.TP[state.EngageMode.value])
        end

    elseif command == 'toggle TP.Others' then
        
        if state.EngageMode.value == 'TH' then
            state.EngageMode:set('SB')
        
            elseif state.EngageMode.value == 'SB' then
                state.EngageMode:set('TH')
            
            else 
                state.EngageMode:set('TH')
        end
        
        update_jobset_display()
        windower.chat.input(('/echo -- TP Set changed to %s --'):format(state.EngageMode.value))
        if player.status == 'Engaged' then
            equip(sets.TP[state.EngageMode.value])
        end

    elseif command == 'toggle Idle' then
        state.IdleMode:cycle()
        update_jobset_display()
        windower.chat.input(('/echo -- Idle Set changed to %s --'):format(state.IdleMode.value))
        if player.status ~= 'Engaged' then
            equip(sets.Idle[state.IdleMode.value])
            send_command('@input /lockstyleset 160')
        end

    elseif command == 'toggle AutoWS' then
        state.AutoWS:cycle()
        update_jobset_display()
        windower.chat.input(('/echo -- Auto Weapon Skill %s --'):format(state.AutoWS.value))
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
    bg = {alpha = 100, red = 30, green = 2, blue = 2},
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
