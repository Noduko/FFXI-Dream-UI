-----------------------LOCKSTYLE------------------
local lockstyle = 120
send_command('wait 4; input /lockstyleset ' .. lockstyle)

-----------------------MACRO BOOK------------------
send_command('input /macro book 3')
send_command('wait 4; input /macro set 10')

-----------------------BINDING------------------

-- JA --
send_command('bind !numpad4 input /ja "Quickstep" <t>')
send_command('bind !numpad5 input /ja "Box Step" <t>')
send_command('bind !numpad6 input /ja "Stutter Step" <t>')
send_command('bind !numpad7 input /ja "Light Shot" <t>')
send_command('bind !numpad9 input /ja "Dark Shot" <t>')
send_command('bind ^numpad+ input /ja "Curing Waltz III" <st>')
send_command('bind ^numpad- input /ja "Healing Waltz" <st>')



-- GEAR--
send_command('bind ^f1 gs c equip TP.Normal set')
send_command('bind ^f2 gs c equip TP.Accuracy set')
send_command('bind ^f3 gs c equip TP.DT set')
send_command('bind ^f4 gs c equip TP.TH set')
send_command('bind ^f5 gs c toggle Idle set')
send_command('bind ^f6 gs c toggle AutoWS')

send_command('bind %~Q gs c toggle Luzaf ring')
send_command('bind ^Q gs c toggle RangedWeapons set')

-- OTHER--
send_command('bind !numpad1 input /ja "Bolter\'s Roll" <me>')
send_command('unbind !numpad2')
send_command('unbind !numpad3')

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
    state.WeaponEquipped = M{'Naegling', 'Tauret', 'NaeglingTauret', 'Other'}
    state.GunEquipped = M{'Ataktos', 'Doomsday'}
    state.AutoWS = M{'Off', 'Savage Blade'}  
    state.LuzafRing = M{'On', 'Off'}

    update_infohud_display()

    ammo = {
        QD = "Animikii Bullet",
        TP = "Eminent Bullet",
        WS = "Eminent Bullet",
        Cheap = "Bronze Bullet"
        }


    ----------------------- WEAPONS SETS -----------------------	

    sets.Weapons = {}
    sets.Weapons.Naegling = {
        main = "Naegling",
        sub = "Gleti's Knife"
    }

    sets.Weapons.Tauret = {
        main = "Tauret",
        sub = "Gleti's Knife"
    }

    sets.Weapons.NaeglingTauret = {
        main = "Naegling",
        sub = "Tauret"
    }

    sets.Weapons.Other = {
        main = "",
        sub = ""
    }

    sets.RangedWeapons = {}
    sets.RangedWeapons.Ataktos = {
        range = "Ataktos",
        ammo = ammo.TP
    }

    sets.RangedWeapons.Doomsday = {
        range = "Doomsday",
        ammo = ammo.TP
    }

    ----------------------- IDLE SETS -----------------------

    sets.Idle = {}
    sets.Idle.Normal = {
        ammo = ammo.TP,
        head = "Meghanada Visor +2",
        body = "Meg. Cuirie +2",
        hands = "Meg. Gloves +2",
        legs = "Carmine Cuisses +1",
        feet = "Meg. Jam. +2",
        neck = "Elite Royal Collar",
        waist = "Null Belt",
        left_ear = "Brutal Earring",
        right_ear = "Cessance Earring",
        left_ring = "Karieyh Ring",
        right_ring = "Defending Ring",
        back = {
            name = "Camulus's Mantle",
            augments = {'INT+20', 'Eva.+20 /Mag. Eva.+20', 'Mag. Evasion+10', '"Snapshot"+10', 'Mag. Evasion+15'}
        }
    }

    sets.Idle.DT = { 
        ammo = ammo.TP,
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Elite Royal Collar",
        waist = "Flume Belt",
        left_ear = "Brutal Earring",
        right_ear = "Cessance Earring",
        left_ring = "Karieyh Ring",
        right_ring = "Defending Ring",
        back = {
            name = "Camulus's Mantle",
            augments = {'DEX+10', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dual Wield"+10', 'Phys. dmg. taken-10%'}
        }
    }

    ----------------------- TP SETS -----------------------
    sets.TP = {}
    sets.TP.Normal = {
        ammo = ammo.TP,
        head = {name = "Adhemar Bonnet +1", augments = {'DEX+12', 'AGI+12', 'Accuracy+20'}},
        body = {name = "Adhemar Jacket", augments = {'DEX+10', 'AGI+10', 'Accuracy+15'}},
        hands = {name = "Adhemar Wrist. +1", augments = {'DEX+12', 'AGI+12', 'Accuracy+20'}},
        legs = { name = "Samnuha Tights", augments = {'STR+10', 'DEX+10', '"Dbl.Atk."+3', '"Triple Atk."+3'}},
        feet = {name = "Herculean Boots", augments = {'"Dbl.Atk."+2', '"Subtle Blow"+9', 'Quadruple Attack +2', 'Accuracy+12 Attack+12', 'Mag. Acc.+18 "Mag.Atk.Bns."+18'}},
        neck = "Iskur Gorget",
        -- neck="Commodore Charm +1",
        waist = "Windbuffet Belt +1",
        left_ear = "Telos Earring",
        right_ear = "Suppanomimi",
        left_ring = "Petrov Ring",
        right_ring = "Epona's Ring",
        back = {name = "Camulus's Mantle", augments = {'DEX+10', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dual Wield"+10', 'Phys. dmg. taken-10%'}}
    }

    sets.TP.Accuracy = {
        ammo = ammo.TP,
        head = {name = "Adhemar Bonnet +1", augments = {'DEX+12', 'AGI+12', 'Accuracy+20'}},
        body = "Malignance Tabard",
        hands = {name = "Adhemar Wrist. +1", augments = {'DEX+12', 'AGI+12', 'Accuracy+20'}},
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Null Loop",
        -- neck="Commodore Charm +1",
        waist = "Null Belt",
        left_ear = "Dedition Earring",
        right_ear = "Brutal Earring",
        left_ring = {name = "Chirich Ring +1", bag="Wardrobe 1"},
        right_ring = {name = "Chirich Ring +1", bag="Wardrobe 2"},
        back = "Null Shawl",
    }

    sets.TP.DT = {
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Adhemar Wrist. +1",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Iskur Gorget",
        -- neck="Commodore Charm +1",
        waist = "Windbuffet Belt +1",
        left_ear = "Dedition Earring",
        right_ear = "Cessance Earring",
        left_ring = "Epona's Ring",
        right_ring = "Defending Ring",
        back = {name = "Camulus's Mantle", augments = {'DEX+10', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dual Wield"+10', 'Phys. dmg. taken-10%'}}
    }

    sets.TP.TH_Gear = {
        ammo = "Per. Lucky Egg",
        head = {name = "Herculean Helm",augments = {'Pet: STR+15', 'Accuracy+20', '"Treasure Hunter"+1'}},
        feet={ name="Herculean Boots", augments={'Crit. hit damage +4%','"Mag.Atk.Bns."+16','"Treasure Hunter"+1','Accuracy+19 Attack+19',}},
        waist = "Chaac Belt"

    }

    -- Combine DT and TH sets
    sets.TP.TH = set_combine(sets.TP.DT, sets.TP.TH_Gear)

    ----------------------- RANGED SETS -----------------------

    sets.PreRanged = {
        head = "Chass. Tricorne +1",
        body = "Laksa. Frac +3",
        hands = {
            name = "Lanun Gants +2",
            augments = {'Enhances "Fold" effect'}
        },
        legs = "Malignance Tights",
        feet = "Meg. Jam. +2",
        neck = "Commodore Charm +1",
        left_ear = "Neritic Earring",
        left_ring = "Crepuscular Ring ",
        waist = "Impulse Belt",
        back = {name = "Camulus's Mantle", augments = {'INT+20', 'Eva.+20 /Mag. Eva.+20', 'Mag. Evasion+10', '"Snapshot"+10', 'Mag. Evasion+15'}}
    }

    sets.Ranged = {
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Null Loop",
        waist = "Yemaya Belt",
        left_ear = "Enervating Earring",
        right_ear = "Telos Earring",
        left_ring = "Ilabrat Ring",
        right_ring = "Crepuscular Ring",
        back = {
            name = "Camulus's Mantle",
            augments = {'AGI+20', 'Rng.Acc.+20 Rng.Atk.+20', 'Rng.Acc.+10', '"Store TP"+10', 'Mag. Evasion+15'}
        }
    }

    ----------------------- WS SETS -----------------------
  
    sets.SavageBlade = {
        head={ name="Herculean Helm", augments={'Weapon skill damage +3%','STR+14','Accuracy+8','Attack+5',}},
        body="Laksa. Frac +3",
        hands="Nyame Gauntlets",
        legs="Meg. Chausses +2",
        feet = "Nyame Sollerets",
        neck="Commodore Charm +1",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        right_ear="Ishvara Earring",
        left_ring="Karieyh Ring",
        right_ring="Cornelia's Ring",
        back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Mag. Evasion+15',}},
    }

    sets.Requiescat = {
        head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20'} },
        body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15'} },
        hands="Meg. Gloves +2",
        legs="Meg. Chausses +2",
        feet="Meg. Jam. +2",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250'} },
        right_ear="Cessance Earring",
        left_ring="Levia. Ring",
        right_ring="Epona's Ring",
        back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Mag. Evasion+15'} }
}


    sets.Evisceration = {
        head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20'} },
        body="Mummu Jacket +2",
        hands="Nyame Gauntlets",
        legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3'} },
        feet="Mummu Gamash. +2",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250'} },
        right_ear="Cessance Earring",
        left_ring="Epona's Ring",
        right_ring="Begrudging Ring",
        back={ name="Camulus's Mantle", augments={'DEX+10','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%'} }
    }

    sets.AeolianEdge = {
        head={ name="Herculean Helm", augments={'Weapon skill damage +3%','STR+14','Accuracy+8','Attack+5'} },
        body="Lanun Frac +2",
        hands="Nyame Gauntlets",
        legs={ name="Herculean Trousers", augments={'Rng.Acc.+19','STR+10','Attack+7'} },
        feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect'} },
        neck="Commodore Charm +1",
        waist="Orpheus's Sash",
        left_ear="Friomisi Earring",
        right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250'} },
        left_ring="Dingir Ring",
        right_ring="Cornelia's Ring",
        back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Mag. Evasion+15'} }
}

    sets.LeadenSalute = {
        head="Pixie Hairpin +1",
        body="Lanun Frac +2",
        hands="Nyame Gauntlets",
        legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+20','Attack+21','Accuracy+5 Attack+5','Mag. Acc.+6 "Mag.Atk.Bns."+6'} },
        feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect'} },
        neck={ name="Comm. Charm +1", augments={'Path: A'} },
        waist="Orpheus's Sash",
        left_ear="Friomisi Earring",
        right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250'} },
        left_ring="Dingir Ring",
        right_ring="Archon Ring",
        back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Mag. Evasion+15'} }
}


    sets.Wildfire = {
        head={ name="Herculean Helm", augments={'Weapon skill damage +3%','STR+14','Accuracy+8','Attack+5'} },
        body="Lanun Frac +2",
        hands="Nyame Gauntlets",
        legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+20','Attack+21','Accuracy+5 Attack+5','Mag. Acc.+6 "Mag.Atk.Bns."+6'} },
        feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect'} },
        neck={ name="Comm. Charm +1", augments={'Path: A'} },
        waist="Eschan Stone",
        left_ear="Friomisi Earring",
        right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250'} },
        right_ring="Cornelia's Ring",
        left_ring="Dingir Ring",
        back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Mag. Evasion+15'} }
}


    sets.LastStand = {
        head={ name="Lanun Tricorne +2", augments={'Enhances "Winning Streak" effect'} },
        body="Laksa. Frac +3",
        hands="Nyame Gauntlets",
        legs="Meg. Chausses +2",
        feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect'} },
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Moonshade Earring",
        right_ear="Ishvara Earring",
        left_ring="Cornelia Ring",
        right_ring="Dingir Ring",
        back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+5','Weapon skill damage +10%'} }
}

    sets.HotShot = {
        head={ name="Lanun Tricorne +2", augments={'Enhances "Winning Streak" effect'} },
        body="Laksa. Frac +3",
        hands="Nyame Gauntlets",
        legs="Meg. Chausses +2",
        feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect'} },
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Moonshade Earring",
        right_ear="Friomisi Earring",
        left_ring="Cornelia Ring",
        right_ring="Dingir Ring",
        back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+5','Weapon skill damage +10%'} }
    }
    ----------------------- JOB ABILITY SETS -----------------------

    sets.PhantomRoll = {
        main="Lanun Knife",
        range="Compensator",
        head= "Lanun Tricorne +2",
        body="Malignance Tabard",
        hands="Chasseur's Gants +1",
        legs= "Desultor Tassets",
        feet="Malignance Boots",
        neck="Regal Necklace",
        waist="Flume Belt",
        left_ear="Etiolation Earring",
        right_ear="Odnowa Earring",
        right_ring="Defending Ring",
        left_ring="Luzaf's Ring",
        back={ name="Camulus's Mantle", augments={'INT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Snapshot"+10','Mag. Evasion+15'} }
}

    sets.TripleShot = {
        head = "Oshosi Mask"
    }

    sets.QuickDrawDMG = {
        ammo = ammo.QD,
        head="Malignance Chapeau",
        body={ name="Lanun Frac +2", augments={'Enhances "Loaded Deck" effect'} },
        hands="Malignance Gloves",
        legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+25','Mag. Acc.+13 "Mag.Atk.Bns."+13'} },
        feet="Chasseur's Bottes +2",
        neck={ name="Comm. Charm +1", augments={'Path: A'} },
        waist="Eschan Stone",
        left_ear="Friomisi Earring",
        right_ear="Hecate's Earring",
        left_ring="Dingir Ring",
        right_ring="Crepuscular Ring",
}

   sets.QuickDrawMACC = {
        ammo = ammo.QD,
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Mummu Wrists +2",
        legs="Malignance Tights",
        feet="Mummu Gamash. +2",
        neck= "Comm. Charm +1",
        left_ring="Shiva Ring",
        right_ring="Shiva Ring"
}

    ----------------------- MAGIC SETS -----------------------
    
    sets.FastCast = {
        head={ name="Herculean Helm", augments={'Weapon skill damage +3%','STR+14','Accuracy+8','Attack+5'} },
        body={ name="Taeon Tabard", augments={'"Fast Cast"+5'} },
        hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3'} },
        neck="Voltsurge Torque",
        left_ear="Loquac. Earring",
        left_ring="Prolix Ring",
        right_ring="Kishar Ring",
}

    sets.Utsusemi = {
        head={ name="Herculean Helm", augments={'Weapon skill damage +3%','STR+14','Accuracy+8','Attack+5'} },
        body={ name="Taeon Tabard", augments={'"Fast Cast"+5'} },
        hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3'} },
        neck="Magoraga Beads",
        left_ear="Loquac. Earring",
        left_ring="Prolix Ring",
        right_ring="Kishar Ring",
}

    sets.Cure = {
        head="Meghanada Visor +2",
        body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15'} },
        legs="Carmine Cuisses +1",
        left_ear="Aqua Pearl",
        right_ear="Aqua Pearl",
        left_ring="Levia. Ring",
        right_ring="Aquasoul Ring",
        back="Solemnity Cape"
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

    if spell.type == 'WeaponSkill' and player.tp >= 1000 then

        if spell.english == 'Savage Blade' then
            equip(sets.SavageBlade)

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

        elseif spell.english == 'Hot Shot' then
            equip(sets.HotShot)

        else
            equip(sets.SavageBlade)

        end

    end

    if spell.action_type == 'Ranged Attack' then
        equip(sets.PreRanged)

    elseif spell.type == 'CorsairRoll' then
        equip(sets.PhantomRoll)
        if state.LuzafRing.value == 'On' then
            equip({left_ring = "Luzaf's Ring"})
            
            else
            equip({left_ring = "Petrov Ring"})
        end

    elseif spell.english == 'Triple Shot' then
        equip(sets.TripleShot)

    elseif spell.type == 'CorsairShot' then
        if (spell.english ~= 'Light Shot' or spell.english ~= 'Dark Shot') then
            equip(sets.QuickDrawMACC)
        else
            equip(sets.QuickDrawDMG)
        end

    elseif spell.action_type == 'Magic' then
        if (spell.english == 'Utsusemi: Ichi' or spell.english == 'Utsusemi: Ni') then
            equip(sets.Utsusemi)

            else
            equip(sets.FastCast)
        end

    elseif spell.action_type == 'Item' and spell.english == 'Holy Water' then
        equip(sets.HolyWater)
    end

end

function midcast(spell, act)

    if canceled then
        return
    end

    if spell.action_type == 'Ranged Attack' then
        equip(sets.Ranged)
    end

    if spell.english == 'Cure' or spell.english == 'Cure II' or spell.english == 'Cure III' or spell.english ==
        'Cure IV' then
        equip(sets.Cure)
    end

end

function aftercast(spell)

    if player.status == 'Engaged' then
        equip(sets.TP[state.EngageMode.value])
        equip(sets.Weapons[state.WeaponEquipped.value])
        equip(sets.RangedWeapons[state.GunEquipped.value])
        
        else
        equip(sets.Idle[state.IdleMode.value])
        equip(sets.Weapons[state.WeaponEquipped.value])
        equip(sets.RangedWeapons[state.GunEquipped.value])
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
        equip(sets.TP[state.EngageMode.value])
        equip(sets.Weapons[state.WeaponEquipped.value])
        equip(sets.RangedWeapons[state.GunEquipped.value])
        
        else
        equip(sets.Idle[state.IdleMode.value])
        equip(sets.Weapons[state.WeaponEquipped.value])
        equip(sets.RangedWeapons[state.GunEquipped.value])
    end
end

function sub_job_change(new, old)
    send_command('wait 2; input /lockstyleset ' .. lockstyle)
end


function self_command(command)

    if command == 'equip weapon naegling' then
        state.WeaponEquipped:set("Naegling")
        update_infohud_display()
        equip(sets.Weapons.Naegling)
        send_command('input /echo -- Weapons Set changed to Naegling.')

    elseif command == 'equip weapon tauret' then
        state.WeaponEquipped:set("Tauret")
        update_infohud_display()
        equip(sets.Weapons.Tauret)
        send_command('input /echo -- Weapons Set changed to Tauret.')

    elseif command == 'equip weapon naeglingtauret' then
        state.WeaponEquipped:set("NaeglingTauret")
        update_infohud_display()
        equip(sets.Weapons.NaeglingTauret)
        send_command('input /echo -- Weapons Set changed to Naegling & Tauret.')

    elseif command == 'equip weapon other' then
        state.WeaponEquipped:set("Other")
        update_infohud_display()
        equip(sets.Weapons.Other)
        send_command('input /echo -- Weapons Set changed to Other.')

    elseif command == 'toggle RangedWeapons set' then
        state.GunEquipped:cycle()
        update_infohud_display()
        equip(sets.RangedWeapons[state.GunEquipped.value])
        windower.chat.input(('/echo -- Ranged Weapons Set changed to %s --'):format(state.GunEquipped.value))

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

    elseif command == 'toggle Luzaf ring' then
        state.LuzafRing:cycle()
        update_infohud_display()
        windower.chat.input(('/echo -- Luzaf Ring %s --'):format(state.LuzafRing.value))
        

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
        windower.chat.input(('/echo -- Auto Weapon Skill (%s) --'):format(state.AutoWS.value))        
    end    
end

function update_infohud_display()
    
    windower.send_command('showset idle ' .. state.IdleMode.value)
    windower.send_command('showset engage ' .. state.EngageMode.value)
    windower.send_command('showset luzaf ' .. state.LuzafRing.value)
    windower.send_command('showset autows ' .. state.AutoWS.value)
end