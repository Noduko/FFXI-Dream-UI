-----------------------MACRO BOOK------------------
send_command('input /macro book 1')
send_command('wait 4; input /macro set 10')
send_command('wait 4; input /lockstyleset 20')

function sub_job_change(new, old)
    send_command('wait 2; input /lockstyleset 20')
end

-----------------------BINDING------------------

-- WEAPON SKILLS & JA--

send_command('bind !numpad1 input /ma "Sudden Lunge" <t>')
send_command('bind !numpad2 input /ws "Sanguine Blade" <t>')

send_command('bind !numpad4 input /ja "Chain Affinity" <me>; input /recast "Chain Affinity"')
send_command('bind !numpad5 input /ja "Burst Affinity" <me>; input /recast "Burst Affinity"')
send_command('bind !numpad6 input /ja "Chain Affinity" <me>; wait 1.5; input /ja "Efflux" <me>')

send_command(
    'bind !numpad7 input /ja "Aggressor" <me>; wait 1.5; input /ja "Warcry" <me>; wait 1.5; input /ja "Berserk" <me>')
send_command(
    'bind !numpad9 input /ja "Chain Affinity" <me>; wait 2; input /ja "Burst Affinity" <me>; wait 2;; input /ws "Savage Blade" <t>; wait 4; input /ma "Thrashing Assault" <t>; wait 4; input /ma "Anvil Lightning" <t>')

send_command(
    'bind ^numpad1 input /ja "Unbridled Learning" <me>; input /recast "Unbridled Learning"; wait 1.5; input /ma "Mighty Guard" <me>; input /recast "Mighty Guard"')
send_command(
    'bind ^numpad2 input /ja "Unbridled Learning" <me>; input /recast "Unbridled Learning"; wait 1.5; input /ma "Carcharian Verve" <me>; input /recast "Carcharian Verve"')
send_command(
    'bind ^numpad3 input /ja "Unbridled Learning" <me>; input /recast "Unbridled Learning"; wait 1.5; input /ma "Bloodrake" <t>; input /recast "Bloodrake"')
send_command(
    'bind ^numpad4 input /ja "Diffusion" <me>; input /recast "Diffusion"; wait 1.5; input /ja "Unbridled Learning" <me>; input /recast "Unbridled Learning"; wait 1.5; input /ma "Mighty Guard" <me>; input /recast "Mighty Guard"')
send_command('bind ^numpad+ input /ma "Magic Fruit" <me>')
send_command('bind ^numpad- input /ma "White Wind" <me>')

-- GEAR--

send_command('bind ^f1 gs c equip TP.Normal set')
send_command('bind ^f2 gs c equip TP.Accuracy set')
send_command('bind ^f3 gs c equip TP.DT set')
send_command('bind ^f4 gs c equip TP.TH set')
send_command('bind ^f5 gs c toggle Idle set')
send_command('bind ^f6 gs c toggle AutoWS')
-- send_command('bind !Q gs c toggle Weapons set')

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

send_command('bind ^insert lua load bluguide')




---------------------
------- SETS --------
---------------------

function get_sets()

    include('Modes')

    state = {}
    state.IdleMode = M{'Normal', 'DT'}
    state.EngageMode = M{'Normal', 'Accuracy', 'DT', 'TH'}
    state.WeaponEquipped = M{'Tizona', 'Naegling', 'Maxentius', 'Other'}
    state.AutoWS = M{'Off', 'Savage Blade', 'Expiacion'}  

    update_jobset_display()

    ----------------------- WEAPONS SETS -----------------------	
    sets.Weapons = {}
    sets.Weapons.Tizona = {
        main = "Tizona",
        sub = {
            name = "Thibron",
            augments = {'TP Bonus +1000'}
        }
    }

    sets.Weapons.Naegling = {
        main = "Naegling",
        sub = {
            name = "Thibron",
            augments = {'TP Bonus +1000'}
        }
    }

    sets.Weapons.Maxentius = {
        main = "Maxentius",
        sub = "Bunzi's Rod",
    }

    sets.Weapons.Other = {}

    ----------------------- IDLE SETS -----------------------
    sets.Idle = {}
    sets.Idle.Normal = {
        ammo = "Staunch Tathlum +1",
        head = "Malignance Chapeau",
        neck = "Elite Royal Collar",
        body = "Hashishin Mintan +2",
        hands = "Malignance Gloves",
        legs = "Carmine Cuisses +1",
        feet = "Malignance Boots",
        left_ear = "Etiolation Earring",
        right_ear = "Brutal Earring",
        left_ring = "Karieyh Ring",
        right_ring = {name = "Chirich Ring +1", bag="Wardrobe 2"},
        waist = "Null Belt",
        back = {name = "Rosmerta's Cape", augments = {'DEX+20', 'Accuracy+20 Attack+20', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}}
    }

    sets.Idle.DT = {
        ammo = "Staunch Tathlum +1",
        head = "Malignance Chapeau",
        neck = "Elite Royal Collar",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Carmine Cuisses +1",
        feet = "Malignance Boots",
        left_ear = "Etiolation Earring",
        right_ear = "Brutal Earring",
        left_ring = "Karieyh Ring",
        right_ring = "Defending Ring",
        waist = "Platinum Moogle Belt",
        back = {name = "Rosmerta's Cape",augments = {'DEX+20', 'Accuracy+20 Attack+20', '"Dbl.Atk."+10', 'Phys. dmg. taken-10%'}}
    }

    ----------------------- TP SETS -----------------------
    sets.TP = {}
    sets.TP.Normal = {
        ammo = "Coiste Bodhar",
        head = "Adhemar Bonnet +1",
        neck = "Mirage Stole +1",
        body = "Adhemar Jacket",
        hands = "Adhemar Wrist. +1",
        legs = "Samnuha Tights",
        feet={ name="Herculean Boots", augments={'"Dbl.Atk."+2','"Subtle Blow"+9','Quadruple Attack +2','Accuracy+12 Attack+12','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
        left_ear = "Telos Earring",
        right_ear = "Suppanomimi",
        left_ring = {name = "Chirich Ring +1", bag="Wardrobe 1"},
        right_ring = {name = "Chirich Ring +1", bag="Wardrobe 2"},
        waist = "Sailfi Belt +1",
        back = "Null Shawl",
        -- back="Aptitude mantle +1",
    }

    sets.TP.Accuracy = {
        ammo = "Honed Tathlum",
        head = "Malignance Chapeau",
        neck = "Null Loop",
        body = "Malignance Tabard",
        hands = "Adhemar wristbands +1",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        left_ear = "Telos Earring",
        right_ear = "Suppanomimi",
        left_ring = {name = "Chirich Ring +1", bag="Wardrobe 1"},
        right_ring = {name = "Chirich Ring +1", bag="Wardrobe 2"},
        waist = "Null Belt",
        back = "Null Shawl",
        -- back="Aptitude mantle +1",
    }

    sets.TP.DT = {
        ammo = "Staunch Tathlum +1",
        head = "Malignance Chapeau",
        neck = "Null Loop",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        left_ear = "Telos Earring",
        right_ear = "Suppanomimi",
        right_ring = "Defending Ring",
        left_ring = {name = "Chirich Ring +1", bag="Wardrobe 1"},
        waist = "Sailfi Belt +1",
        back = "Null Shawl",
    }

    sets.TP.TH_Gear = {
        ammo = "Per. Lucky Egg",
        head = {name = "Herculean Helm",augments = {'Pet: STR+15', 'Accuracy+20', '"Treasure Hunter"+1'}},
        feet={ name="Herculean Boots", augments={'Crit. hit damage +4%','"Mag.Atk.Bns."+16','"Treasure Hunter"+1','Accuracy+19 Attack+19',}},
        waist = "Chaac Belt"
    }

    -- Combine DT and TH sets
    sets.TP.TH = set_combine(sets.TP.DT, sets.TP.TH_Gear)


    ----------------------- WS SETS -----------------------

    sets.SavageBlade = {
        ammo = "Oshasha's Treatise",
        head = "Hashishin Kavuk +2",
        neck = "Mirage Stole +1",
        body = "Assim. Jubbah +3",
        hands = "Jhakri Cuffs +2",
        legs = "Luhlaza Shalwar +3",
        feet = {name = "Herculean Boots", augments = {'Weapon skill damage +4%', 'STR+9', 'Attack+5'}},
        waist = "Sailfi Belt +1",
        left_ear = {name = "Moonshade Earring", augments = {'Attack+4', 'TP Bonus +250'}},
        right_ear = "Ishvara Earring",
        left_ring = "Karieyh Ring",
        right_ring = "Cornelia's Ring",
        back = {name = "Rosmerta's Cape", augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+2', 'Weapon skill damage +10%'}}
    }

    sets.Expiacion = {
        ammo = "Oshasha's Treatise",
        head = "Hashishin Kavuk +2",
        body = "Assim. Jubbah +3",
        hands = "Jhakri Cuffs +2",
        legs = "Luhlaza Shalwar +3",
        feet = {name = "Herculean Boots", augments = {'Weapon skill damage +4%', 'STR+9', 'Attack+5'}},
        neck = "Mirage Stole +1",
        waist = "Sailfi Belt +1",
        left_ear = {name = "Moonshade Earring", augments = {'Attack+4', 'TP Bonus +250'}},
        right_ear = "Ishvara Earring",
        left_ring = "Karieyh Ring",
        right_ring = "Cornelia's Ring",
        back = {name = "Rosmerta's Cape", augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+2', 'Weapon skill damage +10%'}}
    }

    sets.ChantDuCygne = {
        ammo = "Jukukik Feather",
        head = {name = "Adhemar Bonnet +1", augments = {'DEX+12', 'AGI+12', 'Accuracy+20'}},
        neck = "Mirage Stole +1",
        body = {name = "Herculean Vest", augments = {'Attack+27', 'Crit. hit damage +4%', 'DEX+8'}},
        hands = {name = "Adhemar Wrist. +1", augments = {'DEX+12', 'AGI+12', 'Accuracy+20'}},
        legs = {name = "Samnuha Tights", augments = {'STR+10', 'DEX+10', '"Dbl.Atk."+3', '"Triple Atk."+3'}},
        feet = {name = "Herculean Boots", augments = {'Weapon skill damage +4%', 'STR+9', 'Attack+5'}},
        left_ear = {name = "Moonshade Earring", augments = {'Attack+4', 'TP Bonus +250'}},
        right_ear = "Brutal Earring",
        left_ring = "Begrudging Ring",
        right_ring = "Epona's Ring",
        waist = "Fotia Belt",
        back = {name = "Rosmerta's Cape", augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Crit.hit rate+10'}}
    }

    sets.Requiescat = {
        head = "Jhakri Coronal +2",
        neck = "Fotia Gorget",
        body = "Jhakri Robe +2",
        hands = "Jhakri Cuffs +2",
        legs = "Jhakri Slops +2",
        feet = "Jhakri Pigaches +2",
        left_ear = {name = "Moonshade Earring", augments = {'Attack+4', 'TP Bonus +250'}},
        right_ear = "Cessance Earring",
        left_ring = "Epona's Ring",
        right_ring = "Levia. Ring",
        waist = "Fotia Belt",
        back = {name = "Rosmerta's Cape", augments = {'DEX+20', 'Accuracy+20 Attack+20', '"Dbl.Atk."+10'}}
    }

    sets.SanguineBlade = {
        ammo = "Dosis Tathlum",
        head = "Pixie Hairpin +1",
        body = "Jhakri Robe +2",
        hands = "Jhakri Cuffs +2",
        legs = "Luhlaza Shalwar +3",
        feet = "Jhakri Pigaches +2",
        neck = "Sibyl Scarf",
        waist = "Orpheus's Sash",
        left_ear = "Hecate's Earring",
        right_ear = "Friomisi Earring",
        left_ring = "Shiva Ring",
        right_ring = "Archon Ring",
        back = {name = "Rosmerta's Cape", augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'Haste+10'}}
    }

    ----------------------- BLUE MAGIC SETS -----------------------
    sets.BlueMagic = {}    
    sets.BlueMagic.STR = {
        head = {name = "Herculean Helm", augments = {'Weapon skill damage +3%', 'STR+14', 'Accuracy+8', 'Attack+5'}},
        neck = "Mirage Stole +1",
        body = "Assim. Jubbah +3",
        legs = "Hashishin Tayt +2",
        feet = {name = "Herculean Boots", augments = {'Weapon skill damage +4%', 'STR+9', 'Attack+5'}},
        left_ear = "Flame Pearl",
        right_ear = "Flame Pearl",
        left_ring = "Rajas Ring",
        right_ring = "Ifrit Ring",
        waist = "Pipilaka Belt",
        back = {name = "Rosmerta's Cape", augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+2', 'Weapon skill damage +10%'}}

    }

    sets.BlueMagic.INT = {
        main = "Maxentius",
        sub = "Bunzi's Rod",
        ammo = "Dosis Tathlum",
        neck = "Sibyl Scarf",
        head = "Hashishin Kavuk +2",
        body = "Hashishin Mintan +2",
        hands = "Hashishin Bazubands +2",
        legs = "Luhlaza Shalwar +3",
        feet = "Hashishin Basmak +2",
        left_ear = "Hecate's Earring",
        right_ear = "Friomisi Earring",
        left_ring = "Shiva Ring",
        right_ring = "Shiva Ring",
        waist = "Orpheus's Sash",
        back = {name = "Rosmerta's Cape", augments = {'INT+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'Haste+10'}}
    }

    sets.BlueMagic.Cure = {
        body = "Hashishin Mintan +2",
        neck = "Nuna Gorget",
        hands = "Telchine Gloves",
        legs = "Carmine Cuisses +1",
        feet = {
            name = "Medium's Sabots",
            augments = {'MP+50', 'MND+10', '"Conserve MP"+7', '"Cure" potency +5%'}
        },
        left_ear = "Aqua Pearl",
        right_ear = "Aqua Pearl",
        left_ring = "Levia. Ring",
        right_ring = "Aquasoul Ring",
        waist = "Cognizant Belt",
        back = "Solemnity Cape"
    }

    sets.BlueMagic.SelfCure = {
        neck = "Nuna Gorget",
        body = "Hashishin Mintan +2",
        hands = "Telchine Gloves",
        legs = "Carmine Cuisses +1",
        feet = {
            name = "Medium's Sabots",
            augments = {'MP+50', 'MND+10', '"Conserve MP"+7', '"Cure" potency +5%'}
        },
        left_ear = "Aqua Pearl",
        right_ear = "Aqua Pearl",
        left_ring = "Levia. Ring",
        right_ring = "Kunaji Ring",
        waist = "Gishdubar Sash",
        back = "Solemnity Cape"
    }

    sets.BlueMagic.WhiteWind = {
        neck = "Nuna Gorget",
        body = "Hashishin Mintan +2",
        hands = "Telchine Gloves",
        legs = "Gyve Trousers",
        feet = {
            name = "Medium's Sabots",
            augments = {'MP+50', 'MND+10', '"Conserve MP"+7', '"Cure" potency +5%'}
        },
        left_ear = "Tuisto Earring",
        right_ear = "Aqua Pearl",
        left_ring = "Levia. Ring",
        right_ring = "Aquasoul Ring",
        waist = "Cognizant Belt",
        back = "Solemnity Cape"
    }

    sets.BlueMagic.Skill = {
        ammo = "Mavi tathlum",
        head = "Luh. Keffiyeh",
        body = "Assim. Jubbah +3",
        legs = "Mavi tayt +2",
        feet = "Luhlaza charuqs",
        left_ear = "Loquac. earring",
        waist = "Twilight belt",
        back = "Cornflower cape"
    }

    sets.BlueMagic.SkillRecast = {
        ammo = "Mavi tathlum",
        head = "Luh. Keffiyeh",
        body = "Assim. Jubbah +3",
        hands = "Hashishin Bazubands +2",
        legs = "Mavi tayt +2",
        feet = "Luhlaza charuqs",
        left_ear = "Loquac. earring",
        waist = "Twilight belt",
        back = "Cornflower cape"
    }

    ----------------------- JOB ABILITY SETS -----------------------

    sets.JA = {}
    sets.JA.ChainAffinity = {
        head = "Hashishin kavuk +2",
        feet = "Assim. charuqs +1"
    }

    sets.JA.BurstAffinity = {
        feet = "Hashishin Basmak +2"
    }

    sets.JA.Efflux = {
        legs = "Hashishin tayt +2",
        back = {name = "Rosmerta's Cape", augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+2', 'Weapon skill damage +10%'}}
    }

    sets.JA.Diffusion = {
        feet = "Luhlaza Charuqs"
    }

    ----------------------- FASTCAST SETS -----------------------
    sets.FastCast = {}
    sets.FastCast.Normal = {
        ammo = "Sapience Orb",
        head = {name = "Herculean Helm", augments = {'Weapon skill damage +3%', 'STR+14', 'Accuracy+8', 'Attack+5'}},
        neck = "Voltsurge Torque",
        body = {
            name = "Taeon Tabard",
            augments = {'"Fast Cast"+5'}
        },
        hands = {name = "Leyline Gloves", augments = {'Accuracy+15', 'Mag. Acc.+15', '"Mag.Atk.Bns."+15', '"Fast Cast"+3'}},
        legs = {name = "Psycloth Lappas", augments = {'MP+80', 'Mag. Acc.+15', '"Fast Cast"+7'}},
        left_ear = "Loquac. earring",
        left_ring = "Kishar Ring",
        right_ring = "Prolix Ring",
        back = {name = "Rosmerta's Cape", augments = {'"Fast Cast"+10'}}
    }

    sets.FastCast.Blue = {
        ammo = "Sapience Orb",
        head = {name = "Herculean Helm", augments = {'Weapon skill damage +3%', 'STR+14', 'Accuracy+8', 'Attack+5'}},
        neck = "Voltsurge torgue",
        body = "Hashishin Mintan +2",
        hands = "Hashishin Bazubands +2",
        legs = {name = "Psycloth Lappas", augments = {'MP+80', 'Mag. Acc.+15', '"Fast Cast"+7'}},
        left_ring = "Kishar Ring",
        right_ring = "Prolix Ring",
        back = {name = "Rosmerta's Cape", augments = {'"Fast Cast"+10'}}
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

    if midaction() then
        -- canceled = true
        cancel_spell()
        return
    end

    if canceled then
        return
    end

    if spell.action_type == 'Magic' then
        equip(sets.FastCast.Normal)

    elseif spell.skill == 'Blue Magic' then
        equip(sets.FastCast.Blue)

    

    elseif spell.type == 'WeaponSkill' and player.tp >= 1000 and player.target.distance < 4.5 then

        if spell.english == 'Savage Blade' then
            equip(sets.SavageBlade)

        elseif spell.english == 'Expiacion' then
            equip(sets.Expiacion)

        elseif spell.english == 'Chant du Cygne' then
            equip(sets.ChantDuCygne)

        elseif spell.english == 'Requiescat' then
            equip(sets.Requiescat)

        elseif spell.english == 'Sanguine Blade' then
            equip(sets.SanguineBlade)

        else
            equip(sets.SavageBlade)
        end

    elseif spell.type == 'WeaponSkill' and player.tp >= 1000 and player.target.distance >= 6 then
        cancel_spell()
        send_command('@input /echo Weapon Skill Canceled  Target Out of Range')

    elseif spell.action_type == 'Item' and spell.english == 'Holy Water' then
        equip(sets.HolyWater)
    end

end

function midcast(spell, act)

    if canceled then
        return
    end

    if PhysicalSpells:contains(spell.english) then
        equip(sets.BlueMagic.STR)

        if buffactive['Chain Affinity'] then
            equip(sets.JA.ChainAffinity)
        end
        if buffactive['Efflux'] then
            equip(sets.JA.Efflux)
        end
    

    elseif MagicalSpells:contains(spell.english) then

        if state.EngageMode.value == "TH" then
            equip(set_combine(sets.BlueMagic.INT, sets.TP.TH))
        else
            equip(sets.BlueMagic.INT)
        end

        if buffactive['Burst Affinity'] then
            equip(sets.JA.BurstAffinity)
        end
    

    elseif BlueMagic_Healing:contains(spell.english) then
        equip(sets.BlueMagic.Cure)
        if spell.target.name == player.name and string.find(spell.english, 'Magic Fruit') or
            string.find(spell.english, 'Plenilune Embrace') or string.find(spell.english, 'Wild Carrot') or
            string.find(spell.english, 'Cure III') or string.find(spell.english, 'Cure IV') then
            equip(sets.BlueMagic.SelfCure)
        
            elseif spell.english == 'White Wind' then
                equip(sets.BlueMagic.WhiteWind)
        end

    elseif BlueMagic_Skill:contains(spell.english) then
        equip(sets.BlueMagic.SkillRecast)

        if buffactive['Diffusion'] then
            equip(sets.JA.Diffusion)
        end
    

    elseif BlueMagic_Buffs:contains(spell.english) then
        if buffactive['Diffusion'] then
            equip(sets.JA.Diffusion)
        end
    end  

end

function aftercast(spell)

    if canceled then
        return
    end

    if player.status == 'Engaged' then
        equip(sets.TP[state.EngageMode.value])
        equip(sets.Weapons[state.WeaponEquipped.value])
    else
        equip(sets.Idle[state.IdleMode.value])
        equip(sets.Weapons[state.WeaponEquipped.value])
    end

    if spell.name == 'Azure Lore' then
        windower.chat.input('/p ' .. string.char(0xFD, 0x02, 0x02, 0x1F, 0x42, 0xFD) .. ' ' .. string.char(0xFD, 0x02, 0x02, 0x15, 0x0E, 0xFD))

    elseif spell.name == 'Unbridled Wisdom' then
        windower.chat.input('/p ' .. string.char(0xFD, 0x02, 0x02, 0x2A, 0x30, 0xFD) .. ' ' .. string.char(0xFD, 0x02, 0x02, 0x15, 0x0E, 0xFD))
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

    if command == 'equip weapon tizona' then
        state.WeaponEquipped:set("Tizona")
        equip(sets.Weapons.Tizona)
        send_command('input /echo -- Weapons Set changed to Tizona.')

    elseif command == 'equip weapon naegling' then
        state.WeaponEquipped:set("Naegling")
        equip(sets.Weapons.Naegling)
        send_command('input /echo -- Weapons Set changed to Naegling.')

    elseif command == 'equip weapon maxentius' then
        state.WeaponEquipped:set("Maxentius")
        equip(sets.Weapons.Maxentius)
        send_command('input /echo -- Weapons Set changed to Maxentius.')

    elseif command == 'equip weapon other' then
        state.WeaponEquipped:set("Other")
        equip(sets.Weapons.Other)
        send_command('input /echo -- Weapons Set changed to Other.')

    elseif command == 'toggle Idle set' then
        state.IdleMode:cycle()
        update_jobset_display()
        windower.chat.input(('/echo -- Idle Set changed to %s --'):format(state.IdleMode.value))
        if player.status ~= 'Engaged' then
            equip(sets.Idle[state.IdleMode.value])
            send_command('@input /lockstyleset 20')
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
        windower.chat.input(('/echo -- Auto Weapon Skill %s --'):format(state.AutoWS.value))

    end

end


windower.register_event('tp change', function(tp)

    if player.status == 'Engaged' and state.AutoWS.value ~= 'Off' and tp >= 1000 then
        windower.send_command('input /ws "' .. state.AutoWS.value .. '" <t>')
    end

end)

-------------------------
--   BLU Spells List   --
-------------------------

PhysicalSpells = S {'Asuran Claws', 'Bilgestorm', 'Bludgeon', 'Body Slam', 'Feather Storm', 'Mandibular Bite',
                    'Queasyshroom', 'Power Attack', 'Ram Charge', 'Saurian Slide', 'Screwdriver', 'Sickle Slash',
                    'Smite of Rage', 'Spinal Cleave', 'Spiral Spin', 'Sweeping Gouge', 'Terror Touch', 'Battle Dance',
                    'Bloodrake', 'Death Scissors', 'Dimensional Death', 'Empty Thrash', 'Quadrastrike', 'Uppercut',
                    'Tourbillion', 'Thrashing Assault', 'Vertical Cleave', 'Whirl of Rage', 'Amorphic Spikes',
                    'Barbed Crescent', 'Claw Cyclone', 'Disseverment', 'Foot Kick', 'Frenetic Rip', 'Goblin Rush',
                    'Hysteric Barrage', 'Paralyzing Triad', 'Seedspray', 'Sinker Drill', 'Vanity Dive', 'Cannonball',
                    'Delta Thrust', 'Glutinous Dart', 'Grand Slam', 'Quad. Continuum', 'Sprout Smack',
                    'Benthic Typhoon', 'Helldive', 'Hydro Shot', 'Jet Stream', 'Pinecone Bomb', 'Wild Oats',
                    'Sweeping Gouge'}

MagicalSpells = S {'Acrid Stream', 'Anvil Lightning', 'Crashing Thunder', 'Charged Whisker', 'Droning Whirlwind',
                   'Firespit', 'Foul Waters', 'Gates of Hades', 'Leafstorm', 'Molting Plumage', 'Magic Barrier',
                   'Nectarous Deluge', 'Polar Roar', 'Regurgitation', 'Rending Deluge', 'Scouring Spate',
                   'Searing Tempest', 'Silent Storm', 'Spectral Floe', 'Subduction', 'Tem. Upheaval', 'Thermal Pulse',
                   'Thunderbolt', 'Uproot', 'Water Bomb', 'Atra. Libations', 'Blood Saber', 'Dark Orb', 'Death Ray',
                   'Eyes On Me', 'Blazing Bound', 'Evryone. Grudge', 'Palling Salvo', 'Tenebral Crush',
                   'Blinding Fulgor', 'Diffusion Ray', 'Ice Break', 'Magic Hammer', 'Rail Cannon', 'Retinal Glare',
                   'Embalming Earth', 'Entomb', 'Sandspin', 'Vapor Spray', 'Dream Flower', 'Sheep Song'}

BlueMagic_Buffs = S {'Barrier Tusk', 'Cocoon', 'Erratic Flutter', 'Harden Shell', 'Orcish Counterstance',
                     'Plasma Charge', 'Pyric Bulwark', 'Memento Mori', 'Nat. Meditation', 'Reactor Cool', 'Saline Coat',
                     'Feather Barrier', 'Refueling', 'Warm-Up', 'Zephyr Mantle', 'Reactor Cool', 'Plasma Charge',
                     'Amplification', 'Mighty Guard', 'Carcharian Verve', 'Magic Barrier'}

BlueMagic_Healing = S {'Healing Breeze', 'Magic Fruit', 'Plenilune Embrace', 'Pollen', 'Restoral', 'Wild Carrot',
                       'White Wind'}

BlueMagic_Skill = S {'Diamondhide', 'Metallic Body', 'Magic Barrier', 'Occultation', 'Atra. Libations', 'MP Drainkiss',
                     'Digest', 'Blood Saber', 'Osmosis', 'Retinal Glare', 'Sudden Lunge'}










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
    bg = {alpha = 120, red = 35, green = 55, blue = 100},
    padding = 2,

})

-- Accuracy tracking variables
total_swings = 0
total_hits = 0
total_crits = 0



res = require('resources')


-- HUD info display settings
function update_jobset_display()

    if not player or not player.main_job then return end

    local idle_mode = state.IdleMode and state.IdleMode.value or "N/A"
    local engage_mode   = state.EngageMode and state.EngageMode.value or "N/A"
    local autows_mode = state.AutoWS and state.AutoWS.value or "N/A"


    -- Check for specific spells and set emoji
    local spell_emoji_map = {
    ["Spectral Floe"] = "🔮", -- Unique spell from Magic set
    ["Anvil Lightning"] = "🧿", -- Unique spell from Accuracy set
    ["Amorphic Spikes"] = "🗝️", -- Uniue spell from Treasure Hunder set
    }   

    local equipped_emoji = nil
    local blu_data = windower.ffxi.get_mjob_data()

    if blu_data and blu_data.spells then
        for _, spell_id in ipairs(blu_data.spells) do
            local spell = res.spells[spell_id]
            if spell then
                local emoji = spell_emoji_map[spell.en]
                if emoji then
                    equipped_emoji = emoji
                    break -- stop at first matched spell
                end
            end
        end
    end

    local blu_magic_set_info = equipped_emoji or ""

    local crit_percent = (total_hits > 0) and math.floor((total_crits / total_hits) * 100) or 0
    local accuracy_percent = (total_swings > 0) and math.floor((total_hits / total_swings) * 100) or 100
    local accuracy_info = (total_swings > 0) 
        and string.format("🏹 %d%% ( %d | %d%% )", accuracy_percent, total_misses, crit_percent)
        or "🏹 --                     "

    local gearset_info = string.format("⚔️ %s  %s\n 🧍  %s", engage_mode, blu_magic_set_info, idle_mode)
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

-- Event: Incoming text - update HUD when AzureSets is mentioned to display an emoji based on equipped spell set.
windower.register_event('incoming text', function(original, modified, color)
    if color == 207 and modified:find('AzureSets:') then
        update_jobset_display()
    end
end)
