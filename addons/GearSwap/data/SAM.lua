-----------------------LOCKSTYLE------------------
local lockstyle = 40
send_command('wait 4; input /lockstyleset ' .. lockstyle)

-----------------------MACRO BOOK------------------
send_command('input /macro book 2')
send_command('wait 4; input /macro set 10')

-----------------------BINDING------------------

-- JA--
send_command('bind !numpad1 input /ja "Seigan" <me>; wait 1; input /ja "Third Eye" <me>')
send_command('bind !numpad2 input /ja "Third Eye" <me>')
send_command('bind !numpad3 input /ja "Provoke" <t>')

-- GEAR--

send_command('bind ^f1 gs c equip TP.Normal set')
send_command('bind ^f2 gs c equip TP.Accuracy set')
send_command('bind ^f3 gs c equip TP.DT set')
send_command('bind ^f4 gs c equip TP.TH set')
send_command('bind ^f5 gs c toggle Idle set')
send_command('bind ^f6 gs c toggle AutoWS')
send_command('bind ^Q gs c toggle WS Accuracy set')

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
    state.WSAccuracyMode = M{'Normal', 'Accuracy'}
    state.AutoWS = M{'Off', 'Tachi: Fudo', 'Tachi: Shoha'} 

    update_infohud_display()

    ----------------------- WEAPONS SETS -----------------------	
    sets.Weapons = {}
    sets.Weapons.Masamune = {
        main = "Masamune",
        sub = "Utu Grip"
    }

    sets.Weapons.Dojikiri = {
        main = "Dojikiri Yasutsuna",
        sub = "Utu Grip"
    }

    sets.Weapons.Soboro = {
        main = "Soboro Sukehiro",
        sub = "Utu Grip"
    }

    sets.Weapons.Shining = {
        main = "Shining One",
        sub = "Utu Grip"
    }
    ----------------------- IDLE SETS -----------------------
    sets.Idle = {}
    sets.Idle.Normal = {
        ammo = "Staunch Tathlum +1",
        head = {
            name = "Valorous Mask",
            augments = {'STR+9', 'Accuracy+17', 'Attack+1', 'Weapon skill damage +4%'}
        },
        neck = "Elite Royal Collar",
        body = "Kasuga Domaru +2",
        hands = "Tatenashi gote +1",
        legs = "Kasuga Haidate +2",
        feet = "Danzo Sune-Ate",
        left_ear = "Cessance Earring",
        right_ear = "Brutal Earring",
        left_ring = {name = "Chirich Ring +1", bag="Wardrobe 1"},
        right_ring = "Karieyh Ring",
        waist = "Null Belt",
        back = {
            name = "Smertrios's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}
        }
    }

    sets.Idle.DT = {
        ammo = "Staunch Tathlum +1",
        head = "Crepuscular Helm",
        neck = "Elite Royal Collar",
        body = "Kasuga Domaru +2",
        hands = "Tatenashi gote +1",
        right_ring = "Defending Ring",
        left_ring = {name = "Chirich Ring +1", bag="Wardrobe 1"},
        waist = "Platinum Moogle Belt",
        back = {
            name = "Smertrios's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}
        }
    }

    ----------------------- TP SETS -----------------------
    sets.TP = {}
    sets.TP.Normal = {
        ammo = "Coiste Bodhar",
        head = "Kasuga Kabuto +2",
        neck = "Samurai's Nodowa +2",
        body = "Kasuga Domaru +2",
        hands = "Tatenashi gote +1",
        legs = "Kasuga Haidate +2",
        feet = {
            name = "Ryuo Sune-Ate",
            augments = {'STR+10', 'DEX+10', 'Accuracy+15'}
        },
        left_ear = "Schere Earring",
        right_ear = "Dedition Earring",
        right_ring = {name = "Chirich Ring +1", bag="Wardrobe 2"},
        left_ring = "Niqmaddu Ring",
        waist = "Ioskeha Belt +1",
        back = "Null Shawl",
        -- back="Aptitude mantle +1",
    }

    sets.TP.Accuracy = {
        ammo = "Coiste Bodhar",
        head = "Kasuga Kabuto +2",
        neck = "Null Loop",
        body = "Kasuga Domaru +2",
        hands = "Tatenashi gote +1",
        legs = "Kasuga Haidate +2",
        feet = "Wakido Sune-Ate +3",
        left_ear = "Schere Earring",
        right_ear = "Brutal Earring",
        right_ring = {name = "Chirich Ring +1", bag="Wardrobe 2"},
        left_ring = "Niqmaddu Ring",
        waist = "Ioskeha Belt +1",
        back = "Null Shawl",
    }

    sets.TP.DT = {
        ammo = "Staunch Tathlum +1",
        head = "Kasuga Kabuto +2",
        neck = "Samurai's Nodowa +2",
        body = "Kasuga Domaru +2",
        hands = "Tatenashi gote +1",
        legs = "Kasuga Haidate +2",
        feet = "Wakido Sune-Ate +3",
        left_ear = "Dedition Earring",
        right_ear = "Brutal Earring",
        right_ring = "Defending Ring",
        left_ring = "Niqmaddu Ring",
        waist = "Ioskeha Belt +1",
        back = "Null Shawl",
    }

    sets.TP.TH_Gear = {
        ammo = "Per. Lucky Egg",
        head = "White Rarab Cap +1",
        waist = "Chaac Belt"

    }

    -- Combine DT and TH sets
    sets.TP.TH = set_combine(sets.TP.DT, sets.TP.TH_Gear)

    sets.FastCast = {
        ammo = "Sapience Orb",
        neck = "Voltsurge Torque",
        hands = "Leyline Gloves",
        left_ear = "Loquac. earring"
    }

    sets.Ranged = {
        range = "Kaja Bow",
        ammo = "Stone Arrow"
    }

    ----------------------- WS SETS -----------------------

    sets.Fudo = {}
    sets.Fudo.Normal = {
        ammo = "Knobkierrie",
        head = "Mpaca's Cap",
        neck = "Samurai's Nodowa +2",
        body = "Sakonji Domaru +3",
        hands = "Kasuga Kote +2",
        legs = "Wakido Haidate +3",
        feet = "Nyame Sollerets",
        left_ear = "Thrud Earring",
        right_ear = {name = "Moonshade Earring", augments = {'Attack+4', 'TP Bonus +250'}},
        left_ring = "Karieyh Ring",
        right_ring = "Cornelia's Ring",
        waist = "Sailfi Belt +1",
        back = {name = "Smertrios's Mantle", augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}}
    }

    sets.Fudo.Accuracy = {
        ammo = "Knobkierrie",
        head = "Mpaca's Cap",
        neck = "Samurai's Nodowa +2",
        body = "Sakonji Domaru +3",
        hands = "Kasuga Kote +2",
        legs = "Wakido Haidate +3",
        feet = "Nyame Sollerets",
        left_ear = "Thrud Earring",
        right_ear = {name = "Moonshade Earring", augments = {'Attack+4', 'TP Bonus +250'}},
        left_ring = {name = "Chirich Ring +1", bag="Wardrobe 1"},
        right_ring = "Cornelia's Ring",
        waist = "Null Belt",
        back = {name = "Smertrios's Mantle", augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}}
    }

    sets.Shoha = {}
    sets.Shoha.Normal = {
        ammo = "Knobkierrie",
        head = "Mpaca's Cap",
        neck = "Samurai's Nodowa +2",
        body = "Sakonji Domaru +3",
        hands = "Kasuga Kote +2",
        legs = "Wakido Haidate +3",
        feet = "Kasuga Sune-Ate +2",
        left_ear = "Thrud Earring",
        right_ear = {
            name = "Moonshade Earring",
            augments = {'Attack+4', 'TP Bonus +250'}
        },
        right_ring = "Cornelia's Ring",
        left_ring = "Niqmaddu Ring",
        waist = "Sailfi Belt +1",
        back = {
            name = "Smertrios's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}
        }
    }

    sets.Shoha.Accuracy = {
        ammo = "Knobkierrie",
        head = "Mpaca's Cap",
        neck = "Samurai's Nodowa +2",
        body = "Sakonji Domaru +3",
        hands = "Kasuga Kote +2",
        legs = "Wakido Haidate +3",
        feet = "Kasuga Sune-Ate +2",
        left_ear = "Thrud Earring",
        right_ear = {name = "Moonshade Earring",augments = {'Attack+4', 'TP Bonus +250'}},
        left_ring = {name = "Chirich Ring +1", bag="Wardrobe 1"},
        right_ring = "Cornelia's Ring",
        waist = "Null Belt",
        back = {name = "Smertrios's Mantle",augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}}
    }

    sets.Rana = {
        ammo = "Coiste Bodhar",
        head = "Mpaca's Cap",
        neck = "Samurai's Nodowa +2",
        body = "Sakonji Domaru +3",
        hands = "Kasuga Kote +2",
        legs = "Wakido Haidate +3",
        feet = "Kasuga Sune-Ate +2",
        left_ear = "Thrud Earring",
        right_ear = "Schere Earring",
        right_ring = "Cornelia's Ring",
        left_ring = "Niqmaddu Ring",
        waist = "Sailfi Belt +1",
        back = {name = "Smertrios's Mantle",augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}}
    }

    sets.Ageha = {
        ammo = "Knobkierrie",
        head = "Flam. Zucchetto +2",
        body = "Kasuga Domaru +2",
        hands = "Wakido Kote +3",
        legs = "Kasuga Haidate +2",
        feet = "Flam. Gambieras +2",
        back = {name = "Smertrios's Mantle",augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}}
    }

    sets.ImpulseDrive = {
        ammo = "Knobkierrie",
        head = "Mpaca's Cap",
        neck = "Samurai's Nodowa +2",
        body = "Sakonji Domaru +3",
        hands = "Kasuga Kote +2",
        legs = "Wakido Haidate +3",
        feet = "Nyame Sollerets",
        left_ear = "Thrud Earring",
        right_ear = {name = "Moonshade Earring",augments = {'Attack+4', 'TP Bonus +250'}},
        right_ring = "Begrudging Ring",
        left_ring = "Niqmaddu Ring",
        waist = "Sailfi Belt +1",
        back = {name = "Smertrios's Mantle",augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%'}}
    }

    ----------------------- JOB ABILITY SETS -----------------------

    sets.JA = {}
    sets.JA.Meikyo = {
        feet = "Sakonji Sune-Ate"
    }
    sets.JA.Meditate = {
        head = "Wakido Kabuto +3",
        hands = "Sakonji Kote +3"
    }
    sets.JA.Hasso = {
        hands = "Wakido Kote +3",
        legs = "Kasuga Haidate +2",
        feet = "Wakido Sune-Ate +3"
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

        if spell.english == 'Tachi: Fudo' then
            equip(sets.Fudo[state.WSAccuracyMode.value])

        elseif spell.english == 'Tachi: Shoha' then
            equip(sets.Shoha[state.WSAccuracyMode.value])

        elseif spell.english == 'Tachi: Rana' then
            equip(sets.Rana)

        elseif spell.english == 'Tachi: Ageha' then
            equip(sets.Ageha)

        elseif spell.english == 'Impulse Drive' then
            equip(sets.ImpulseDrive)

        else
            equip(sets.Fudo[state.WSAccuracyMode.value])
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

    elseif spell.action_type == 'Item' and spell.english == 'Holy Water' then
        equip(sets.HolyWater)
    end

end

function aftercast(spell)
    if player.status == 'Engaged' then
        equip(sets.TP[state.EngageMode.value])

    else
        equip(sets.Idle[state.IdleMode.value])
    end

    if spell.name == 'Meikyo Shisui' then
        windower.chat.input('/p ' .. string.char(0xFD, 0x02, 0x02, 0x1F, 0x27, 0xFD) .. ': Do not interrupt skillchain. <call22>')

    elseif spell.name == 'Yaegasumi' then
        windower.chat.input('/p ' .. string.char(0xFD, 0x02, 0x02, 0x2A, 0x2C, 0xFD) .. ' ' .. string.char(0xFD, 0x02, 0x02, 0x15, 0x0E, 0xFD))
    end

end

function status_change(new, old)
    if new == 'Engaged' then
        equip(sets.TP[state.EngageMode.value])

    else
        equip(sets.Idle[state.IdleMode.value])
    end
end

function sub_job_change(new, old)
    send_command('wait 3; input /lockstyleset ' .. lockstyle)
end


function self_command(command)

    if command == 'equip weapon masamune' then
        equip(sets.Weapons.Masamune)
        send_command('input /echo -- Weapons Set changed to Masamune.')
        state.AutoWS = M{'Off', 'Tachi: Fudo', 'Tachi: Shoha'} 

    elseif command == 'equip weapon dojikiri' then
        equip(sets.Weapons.Dojikiri)
        send_command('input /echo -- Weapons Set changed to Dojikiri Yasutsuna.')
        state.AutoWS = M{'Off', 'Tachi: Fudo', 'Tachi: Shoha'} 

    elseif command == 'equip weapon soboro' then
        
        equip(sets.Weapons.Soboro)
        send_command('input /echo -- Weapons Set changed to Soboro Sukehiro.')
        state.AutoWS = M{'Off', 'Tachi: Fudo', 'Tachi: Shoha'} 

    elseif command == 'equip weapon shining' then
        equip(sets.Weapons.Shining)
        send_command('input /echo -- Weapons Set changed to Shining One.')
        state.AutoWS = M{'Off', 'Impulse Drive'} 

    elseif command == 'toggle Idle set' then
        state.IdleMode:cycle()
        update_infohud_display()
        windower.chat.input(('/echo -- Idle Set changed to %s --'):format(state.IdleMode.value))
         if player.status ~= 'Engaged' then
            equip(sets.Idle[state.IdleMode.value])
            send_command('@input /lockstyleset ' .. lockstyle)
        end

    elseif command == 'equip Idle.DT set' then
        state.IdleMode:set('DT')
        update_infohud_display()
        send_command('input /echo -- Idle Set changed to DT.')
        if player.status ~= 'Engaged' then
            equip(sets.Idle.DT)
        end

    elseif command == 'toggle WS Accuracy set' then
        state.WSAccuracyMode:cycle()
        update_infohud_display()
        windower.chat.input(('/echo -- Weapon Skill Accuracy Set changed to %s --'):format(state.WSAccuracyMode.value))

    elseif command == 'equip TP.Normal set' then
        state.EngageMode:set('Normal')
        update_infohud_display()
        send_command('input /echo -- TP Set changed to Normal.')
        if player.status == 'Engaged' then
            equip(sets.TP.Normal)
        end

    elseif command == 'equip TP.Accuracy set' then
        state.EngageMode:set('Accuracy')
        update_infohud_display()
        send_command('input /echo -- TP Set changed to Accuracy.')
        if player.status == 'Engaged' then
            equip(sets.TP.Accuracy)
        end

    elseif command == 'equip TP.DT set' then
        state.EngageMode:set('DT')
        update_infohud_display()
        send_command('input /echo -- TP Set changed to DT.')
        if player.status == 'Engaged' then
            equip(sets.TP.DT)
        end

    elseif command == 'equip TP.TH set' then
        state.EngageMode:set('TH')
        update_infohud_display()
        send_command('input /echo -- TP Set changed to Treasure Hunter.')
        if player.status == 'Engaged' then
            equip(sets.TP.TH)
        end

    elseif command == 'toggle AutoWS' then
        state.AutoWS:cycle()
        update_infohud_display()
        windower.chat.input(('/echo -- Auto Weapon Skill %s --'):format(state.AutoWS.value))
    end
end

function update_infohud_display()
    
    windower.send_command('infohud idle ' .. state.IdleMode.value)
    windower.send_command('infohud engage ' .. state.EngageMode.value)
    windower.send_command('infohud wsaccuracy ' .. state.WSAccuracyMode.value)
    windower.send_command('infohud autows ' .. state.AutoWS.value)

end