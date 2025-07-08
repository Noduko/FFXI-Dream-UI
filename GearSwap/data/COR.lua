-----------------------MACRO BOOK------------------
send_command('input /macro book 3')
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

    update_jobset_display()

    ammo = {
        QD = "Animikii Bullet",
        TP = "Eminent Bullet",
        WS = "Eminent Bullet",
        Cheap = "Bronze Bullet"
        }


    ----------------------- WEAPONS SETS -----------------------	

    sets.Weapons = {}
    state.WeaponEquipped = M {'Naegling', 'Tauret', 'NaeglingTauret', 'Other'}

    sets.Weapons.Naegling = {
        main = "Naegling",
        sub = "Blurred Knife +1"
    }

    sets.Weapons.Tauret = {
        main = "Tauret",
        sub = "Blurred Knife +1"
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
        neck = "Sanctity Necklace",
        -- neck="Commodore Charm +1",
        waist = "Windbuffet Belt",
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
        left_ear = "Steelflash Earring",
        right_ear = "Heartseeker Earring",
        left_ring = "Cacoethic Ring +1",
        right_ring = {name = "Chirich Ring +1", bag="Wardrobe 2"},
        back = "Null Shawl",
    }

    sets.TP.DT = {
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Null Loop",
        -- neck="Commodore Charm +1",
        waist = "Flume Belt",
        left_ear = "Brutal Earring",
        right_ear = "Cessance Earring",
        left_ring = "Petrov Ring",
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
        waist = "Yemaya Belt",
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
        right_ear = "Cessance Earring",
        left_ring = "Cacoethic Ring +1",
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
        hands="Meg. Gloves +2",
        legs="Meg. Chausses +2",
        feet={ name="Herculean Boots", augments={'Weapon skill damage +4%','STR+9','Attack+5',}},
        neck="Rep. Plat. Medal",
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
        hands="Mummu Wrists +2",
        legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3'} },
        feet="Mummu Gamash. +2",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250'} },
        right_ear="Cessance Earring",
        left_ring="Mummu Ring",
        right_ring="Begrudging Ring",
        back={ name="Camulus's Mantle", augments={'DEX+10','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%'} }
    }

    sets.AeolianEdge = {
        head={ name="Herculean Helm", augments={'Weapon skill damage +3%','STR+14','Accuracy+8','Attack+5'} },
        body="Lanun Frac +2",
        hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3'} },
        legs={ name="Herculean Trousers", augments={'Rng.Acc.+19','STR+10','Attack+7'} },
        feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect'} },
        neck="Commodore Charm +1",
        waist="Eschan Stone",
        left_ear="Friomisi Earring",
        right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250'} },
        left_ring="Shiva Ring",
        right_ring="Shiva Ring",
        back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Mag. Evasion+15'} }
}

    sets.LeadenSalute = {
        head="Pixie Hairpin +1",
        body="Lanun Frac +2",
        hands={ name="Herculean Gloves", augments={'"Mag.Atk.Bns."+21','Weapon skill damage +4%','AGI+4'} },
        legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+20','Attack+21','Accuracy+5 Attack+5','Mag. Acc.+6 "Mag.Atk.Bns."+6'} },
        feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect'} },
        neck={ name="Comm. Charm +1", augments={'Path: A'} },
        waist="Orpheus's Sash",
        left_ear="Friomisi Earring",
        right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250'} },
        left_ring="Cornelia's Ring",
        right_ring="Archon Ring",
        back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Mag. Evasion+15'} }
}


    sets.Wildfire = {
        head={ name="Herculean Helm", augments={'Weapon skill damage +3%','STR+14','Accuracy+8','Attack+5'} },
        body="Lanun Frac +2",
        hands={ name="Herculean Gloves", augments={'"Mag.Atk.Bns."+21','Weapon skill damage +4%','AGI+4'} },
        legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+20','Attack+21','Accuracy+5 Attack+5','Mag. Acc.+6 "Mag.Atk.Bns."+6'} },
        feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect'} },
        neck={ name="Comm. Charm +1", augments={'Path: A'} },
        waist="Eschan Stone",
        left_ear="Friomisi Earring",
        right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250'} },
        right_ring="Archon Ring",
        back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Mag. Evasion+15'} }
}


    sets.LastStand = {
        head={ name="Lanun Tricorne +2", augments={'Enhances "Winning Streak" effect'} },
        body="Laksa. Frac +3",
        hands="Meg. Gloves +2",
        legs="Meg. Chausses +2",
        feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect'} },
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Moonshade Earring",
        right_ear="Ishvara Earring",
        left_ring="Cornelia Ring",
        right_ring="Apate Ring",
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
        left_ring="Crepuscular Ring",
        right_ring="Mummu Ring"
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

function self_command(command)

    if command == 'equip weapon naegling' then
        state.WeaponEquipped:set("Naegling")
        update_jobset_display()
        equip(sets.Weapons.Naegling)
        send_command('input /echo -- Weapons Set changed to Naegling.')

    elseif command == 'equip weapon tauret' then
        state.WeaponEquipped:set("Tauret")
        update_jobset_display()
        equip(sets.Weapons.Tauret)
        send_command('input /echo -- Weapons Set changed to Tauret.')

    elseif command == 'equip weapon naeglingtauret' then
        state.WeaponEquipped:set("NaeglingTauret")
        update_jobset_display()
        equip(sets.Weapons.NaeglingTauret)
        send_command('input /echo -- Weapons Set changed to Naegling & Tauret.')

    elseif command == 'equip weapon other' then
        state.WeaponEquipped:set("Other")
        update_jobset_display()
        equip(sets.Weapons.Other)
        send_command('input /echo -- Weapons Set changed to Other.')

    elseif command == 'toggle RangedWeapons set' then
        state.GunEquipped:cycle()
        update_jobset_display()
        equip(sets.RangedWeapons[state.GunEquipped.value])
        windower.chat.input(('/echo -- Ranged Weapons Set changed to %s --'):format(state.GunEquipped.value))

    elseif command == 'toggle Idle set' then
        state.IdleMode:cycle()
        update_jobset_display()
        windower.chat.input(('/echo -- Idle Set changed to %s --'):format(state.IdleMode.value))
        if player.status ~= 'Engaged' then
            equip(sets.Idle[state.IdleMode.value])
            send_command('@input /lockstyleset 120')
        end

    elseif command == 'toggle Luzaf ring' then
        state.LuzafRing:cycle()
        update_jobset_display()
        windower.chat.input(('/echo -- Luzaf Ring %s --'):format(state.LuzafRing.value))
        

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


Rolls = {
	["Magus's Roll"] 		=	{Lucky = 2,	Unlucky = 6	},	["Choral Roll"] 		=	{Lucky = 2,	Unlucky = 6	},	["Samurai Roll"] 		=	{Lucky = 2,	Unlucky = 6	},	
	["Scholar's Roll"]		=	{Lucky = 2,	Unlucky = 6	},	["Caster's Roll"]		=	{Lucky = 2,	Unlucky = 7	},	["Companion's Roll"]	=	{Lucky = 2,	Unlucky = 10},
	["Naturalist's Roll"]	=	{Lucky = 3,	Unlucky = 7	},	["Healer's Roll"]		=	{Lucky = 3,	Unlucky = 7	},	["Monk's Roll"]			=	{Lucky = 3,	Unlucky = 7	},	
	["Puppet Roll"]			=	{Lucky = 3,	Unlucky = 7	},	["Gallant's Roll"]		=	{Lucky = 3,	Unlucky = 7	},	["Dancer's Roll"]		=	{Lucky = 3,	Unlucky = 7	},
	["Bolter's Roll"]		=	{Lucky = 3,	Unlucky = 9	},	["Courser's Roll"]		=	{Lucky = 3,	Unlucky = 9	},	["Allies' Roll"]		=	{Lucky = 3,	Unlucky = 10},	
	["Runeist's Roll"]		=	{Lucky = 4,	Unlucky = 8	}, 	["Ninja's Roll"]		=	{Lucky = 4,	Unlucky = 8	},	["Hunter's Roll"]		=	{Lucky = 4,	Unlucky = 8	},
	["Chaos Roll"]			=	{Lucky = 4,	Unlucky = 8	},	["Drachen Roll"]		=	{Lucky = 4,	Unlucky = 8	},	["Beast Roll"]			=	{Lucky = 4,	Unlucky = 8	},	
	["Warlock's Roll"] 		=	{Lucky = 4,	Unlucky = 8	},	["Avenger's Roll"]		=	{Lucky = 4,	Unlucky = 8	},	["Blitzer's Roll"]		=	{Lucky = 4,	Unlucky = 9	},
	["Miser's Roll"]		=	{Lucky = 5,	Unlucky = 7	},	["Tactician's Roll"]	=	{Lucky = 5,	Unlucky = 8	},	["Corsair's Roll"]		=	{Lucky = 5,	Unlucky = 9	},	
	["Evoker's Roll"] 		=	{Lucky = 5,	Unlucky = 9	},	["Rogue's Roll"] 		=	{Lucky = 5,	Unlucky = 9	},	["Fighter's Roll"] 		=	{Lucky = 5,	Unlucky = 9	},	
	["Wizard's Roll"] 		=	{Lucky = 5,	Unlucky = 9	},
}

----------------------- ROLL HUD -----------------------

texts = require('texts')
res = require('resources')

-- Create the display box
roll_display = texts.new({
    pos = {x = 1420, y = 730},
    text = {font = 'Segoe UI Emoji', size = 10, stroke = {width = 1.5, alpha = 255}},
    bg = {alpha = 120, red = 190, green =170, blue = 135},
    -- bg = {alpha = 230, red = 100, green = 35, blue = 35},
    
    padding = 4
})

current_roll_info = ''


-- Helper function to get the emoji icon based on the rolled number
function get_roll_icon(rolled_number, lucky, unlucky)
    if rolled_number == lucky then
        return "\\cs(110,190,135)🍀\\cr"
    elseif rolled_number == unlucky then
        return "\\cs(235,110,110)😥\\cr"
    elseif rolled_number == 11 then
        return "\\cs(205,205,125)🎉\\cr"
    else
        return ""
    end
end

-- Helper function to color the rolled number
function color_roll_number(rolled_number, lucky, unlucky)
    if rolled_number == lucky then
        return "\\cs(110,190,135)" .. rolled_number .. "\\cr"  -- green
    elseif rolled_number == unlucky then
        return "\\cs(240,60,60)" .. rolled_number .. "\\cr"  -- red
    elseif rolled_number == 11 then
        return "\\cs(205,205,125)" .. rolled_number .. "\\cr"  -- yellow
    else
        return tostring(rolled_number)
    end
end

-- Main event handler
windower.register_event('action', function(act)
    if act.category == 6 then -- Job Ability
        local ability = res.job_abilities[act.param]
        if ability and Rolls[ability.en] then
            local lucky = Rolls[ability.en].Lucky
            local unlucky = Rolls[ability.en].Unlucky
            local rolled_number = act.targets[1].actions[1].param

            local icon = get_roll_icon(rolled_number, lucky, unlucky)
            local colored_number = color_roll_number(rolled_number, lucky, unlucky)

            current_roll_info = string.format("🎲 %s\n            %s\n👍 \\cs(110,190,135)%d\\cr   [  %s  ]  👎 \\cs(240,60,60)%d\\cr", ability.en, icon, lucky, colored_number, unlucky)
            roll_display:text(current_roll_info)
            roll_display:show()
        end
    end
end)

windower.register_event('gain buff', function(buff_id)
    -- print('Buff gained:', buff_id)
    
    if buff_id == 309 then
        roll_display:hide()
    end
end)

windower.register_event('lose buff', function(buff_id)
    -- print('Buff lost:', buff_id)
    if buff_id == 308 then
        roll_display:hide()
    end
end)

----------------------- ACCURACY & SET DISPLAY HUD -----------------------

-- texts = require('texts')

-- Display setup
jobset_display = texts.new({
    pos = {x = 1420, y = 835},
    text = {font = 'Segoe UI Emoji', size = 9.5, stroke = {width = 2, alpha = 200}},
    flags = {draggable = true},
    bg = {alpha = 120, red = 190, green =170, blue = 135},
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
    local luzaf_ring = state.LuzafRing and state.LuzafRing.value or "N/A"
    local autows_mode = state.AutoWS and state.AutoWS.value or "N/A"

    -- local job_info = string.format("Job: %s/%s", player.main_job, player.sub_job)
     local crit_percent = (total_hits > 0) and math.floor((total_crits / total_hits) * 100) or 0
    local accuracy_percent = (total_swings > 0) and math.floor((total_hits / total_swings) * 100) or 100
    local accuracy_info = (total_swings > 0) 
        and string.format("🏹 %d%% ( %d | %d%% )", accuracy_percent, total_misses, crit_percent)
        or "🏹 --                     "

    -- Displays the NO Lusaf Ring icon if the Luzaf Ring is off.
    local luzaf_ring_info = (luzaf_ring == 'Off') and ' 💍❌' or ''
    local gearset_info = string.format("⚔️ %s %s\n 🧍  %s", engage_mode, luzaf_ring_info, idle_mode)
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
