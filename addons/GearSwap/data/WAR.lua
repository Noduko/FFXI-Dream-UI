-----------------------MACRO BOOK------------------
send_command('input /macro book 2')
send_command('wait 4; input /macro set 10')
send_command('wait 4; input /lockstyleset 140')

function sub_job_change(new, old)
    send_command('wait 4; input /lockstyleset 140')
end

-----------------------BINDING------------------

-- JA--

send_command('bind !numpad1 input /ja "Provoke" <t>')
send_command('bind !numpad2 input /ja "Tomahawk" <t>')
send_command('bind !numpad3 input /ja "Defender" <me>')

-- GEAR--

send_command('bind ^f1 gs c equip TP.Normal')
send_command('bind ^f2 gs c equip TP.Accuracy')
send_command('bind ^f3 gs c equip TP.DT')
send_command('bind ^f4 gs c toggle TP.Others')
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
    state.EngageMode = M{'Normal', 'Accuracy', 'DT', 'TH', 'SB'}
    state.Stance = M{'Fencer', 'DualWield', 'TwoHanded'} 

    if player.equipment.main == 'Naegling' then state.AutoWS = M{'Off', 'Savage Blade'}
            elseif player.equipment.main == 'Shining One' then state.AutoWS = M{'Off', 'Impulse Drive'}
            elseif player.equipment.main == 'Montante +1' then state.AutoWS = M{'Off', 'Resolution'}
            elseif player.equipment.main == 'Loxotic Mace +1' then state.AutoWS = M{'Off', 'Judgement'}
            else state.AutoWS = M{'Off'}
        end

    update_jobset_display()

    ----------------------- WEAPONS SETS -----------------------	

    sets.Weapons = {}
    sets.Weapons.Naegling = {
        main = "Naegling",
        sub = "Blurred Shield +1"
    }

    sets.Weapons.NaeglingKnife = {
        main = "Naegling",
        sub = "Blurred Knife +1"
    }

    sets.Weapons.ShiningOne = {
        main = "Shining One",
        sub = "Utu Grip"
    }

    sets.Weapons.Montante = {
        main = "Montante +1",
        sub = "Utu Grip"
    }

    sets.Weapons.Loxotic = {
        main = "Loxotic Mace +1",
        sub = "Blurred Shield +1"
    }

    ----------------------- IDLE SETS -----------------------
    sets.Idle = {}
    sets.Idle.Normal = {
        ammo = "Staunch Tathlum +1",
        head = {
            name = "Valorous Mask",
            augments = {'Accuracy+17', 'Weapon skill damage +4%', 'STR+9', 'Attack+1'}
        },
        body = "Boii Lorica +2",
        hands = "Sakpata's Gauntlets",
        legs = "Pumm. Cuisses +3",
        feet = {
            name = "Valorous Greaves",
            augments = {'AGI+10', 'Attack+13', 'Weapon skill damage +8%', 'Accuracy+10 Attack+10',
                        'Mag. Acc.+12 "Mag.Atk.Bns."+12'}
        },
        neck = "Elite Royal Collar",
        waist = "Null Belt",
        left_ear = "Hearty Earring",
        right_ear = "Etiolation Earring",
        left_ring = "Karieyh Ring",
        right_ring = {name = "Chirich Ring +1", bag="Wardrobe 2"},
        back = {
            name = "Cichol's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Damage taken-5%'}
        }
    }

    sets.Idle.DT = {
        ammo = "Staunch Tathlum +1",
        head = {
            name = "Valorous Mask",
            augments = {'Accuracy+17', 'Weapon skill damage +4%', 'STR+9', 'Attack+1'}
        },
        body = "Boii Lorica +2",
        hands = "Sakpata's Gauntlets",
        legs = "Pumm. Cuisses +3",
        feet = {
            name = "Valorous Greaves",
            augments = {'AGI+10', 'Attack+13', 'Weapon skill damage +8%', 'Accuracy+10 Attack+10',
                        'Mag. Acc.+12 "Mag.Atk.Bns."+12'}
        },
        neck = "Elite Royal Collar",
        -- neck = "Warrior's Bead Necklace +1",
        waist = "Platinum Moogle Belt",
        left_ear = "Hearty Earring",
        right_ear = "Etiolation Earring",
        left_ring = "Karieyh Ring",
        right_ring = "Defending Ring",
        back = {
            name = "Cichol's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Damage taken-5%'}
        }
    }


    ----------------------- TP SETS -----------------------

    sets.TP = {}
    sets.TP.Fencer = {

        -- NORMAL:
        Normal = {
            ammo = "Coiste Bodhar",
            head = "Boii Mask +2",
            body = "Sakpata's Breastplate",
            hands = "Sakpata's Gauntlets",
            legs = "Pumm. Cuisses +3",
            feet = "Pumm. Calligae +3",
            neck = "Warrior's Bead Necklace +1",
            waist = "Sailfi Belt +1",
            left_ear = "Schere Earring",
            right_ear = {
                name = "Boii Earring",
                augments = {'System: 1 ID: 1676 Val: 0', 'Accuracy+8', 'Mag. Acc.+8'}
            },

            left_ring = "Niqmaddu Ring",
            right_ring = "Petrov Ring",
            back = {name = "Cichol's Mantle", augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Damage taken-5%'}}
        },

        -- ACCURACY:
        Accuracy = {

            ammo = "Coiste Bodhar",
            head = "Boii Mask +2",
            body = "Sakpata's Breastplate",
            hands = "Sakpata's Gauntlets",
            legs = "Pumm. Cuisses +3",
            feet = "Pumm. Calligae +3",
            neck = "Warrior's Bead Necklace +1",
            waist = "Sailfi Belt +1",
            left_ear = "Schere Earring",
            right_ear = {
                name = "Boii Earring",
                augments = {'System: 1 ID: 1676 Val: 0', 'Accuracy+8', 'Mag. Acc.+8'}
            },

            left_ring = {name = "Chirich Ring +1", bag="Wardrobe 1"},
            right_ring = {name = "Chirich Ring +1", bag="Wardrobe 2"},
            back = "Null Shawl",
        },

        -- DAMAGE TAKEN:
        DT = {

            ammo = "Staunch Tathlum +1",
            head = "Boii Mask +2",
            body = "Sakpata's Breastplate",
            hands = "Sakpata's Gauntlets",
            legs = "Pumm. Cuisses +3",
            feet = "Pumm. Calligae +3",
            neck = "Warrior's Bead Necklace +1",
            waist = "Sailfi Belt +1",
            left_ear = "Schere Earring",
            right_ear = {
                name = "Boii Earring",
                augments = {'System: 1 ID: 1676 Val: 0', 'Accuracy+8', 'Mag. Acc.+8'}
            },

            left_ring = "Niqmaddu Ring",
            right_ring = "Defending Ring",
            back = {
                name = "Cichol's Mantle",
                augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Damage taken-5%'}
            }
        }
    }

    sets.TP.DualWield = {

        -- NORMAL:
        Normal = {
            ammo = "Coiste Bodhar",
            head = "Boii Mask +2",
            body = "Agoge Lorica +3",
            hands = "Sakpata's Gauntlets",
            legs = "Pumm. Cuisses +3",
            feet = "Pumm. Calligae +3",
            neck = "Warrior's Bead Necklace +1",
            waist = "Ioskeha Belt +1",
            left_ear = "Eabani Earring",
            right_ear = {
                name = "Boii Earring",
                augments = {'System: 1 ID: 1676 Val: 0', 'Accuracy+8', 'Mag. Acc.+8'}
            },
            left_ring = "Niqmaddu Ring",
            right_ring = "Petrov Ring",
            back = {
                name = "Cichol's Mantle",
                augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Damage taken-5%'}
            }
            -- back="Aptitude mantle +1",
        },

        -- ACCURACY:
        Accuracy = {},

        -- DAMAGE TAKEN:
        DT = {}
    }

    sets.TP.TwoHanded = {

        -- NORMAL:
        Normal = {
            ammo = "Coiste Bodhar",
            head = "Boii Mask +2",
            body = "Boii Lorica +2",
            hands = "Sakpata's Gauntlets",
            legs = "Pumm. Cuisses +3",
            feet = "Pumm. Calligae +3",
            neck = "Warrior's Bead Necklace +1",
            waist = "Ioskeha Belt +1",
            left_ear = "Schere Earring",
            right_ear = {
                name = "Boii Earring",
                augments = {'System: 1 ID: 1676 Val: 0', 'Accuracy+8', 'Mag. Acc.+8'}
            },

            left_ring = "Niqmaddu Ring",
            right_ring = "Petrov Ring",
            back = {
                name = "Cichol's Mantle",
                augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Damage taken-5%'}
            }
            -- back = "Aptitude mantle +1"
        },

        -- ACCURACY:
        Accuracy = {},

        -- DAMAGE TAKEN:
        DT = {}
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
        back = {name = "Cichol's Mantle", augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Damage taken-5%'}}
    }

    sets.TP.TH_Gear = {
        ammo = "Per. Lucky Egg",
        head = "White Rarab Cap +1",
        waist = "Chaac Belt"
    }
    -- Combine DT and TH sets
    sets.TP.TH = set_combine(sets.TP.DT, sets.TP.TH_Gear)

    sets.FastCast = {}
    sets.FastCast = {
        ammo = "Sapience Orb",
        head = "Sakpata's Helm",
        neck = "Voltsurge Torque",
        body = "Odyss. Chestplate",
        hands = {name = "Leyline Gloves", augments = {'Accuracy+15', 'Mag. Acc.+15', '"Mag.Atk.Bns."+15', '"Fast Cast"+3'}},
        legs = {name = "Psycloth Lappas",augments = {'MP+80', 'Mag. Acc.+15', '"Fast Cast"+7'}},
        feet= { name="Odyssean Greaves", augments={'"Fast Cast"+4','VIT+6','Accuracy+6',}},
        left_ear = "Loquac. earring",
        right_ring = "Prolix Ring",
        left_ring="Kishar Ring",
    }

    ----------------------- WS SETS -----------------------

    sets.WS = {}
    sets.WS.SavageBlade = {

        ammo = "Knobkierrie",
        head = {
            name = "Agoge Mask +3",
            augments = {'Enhances "Savagery" effect'}
        },
        body = "Pumm. Lorica +3",
        hands = "Sakpata's Gauntlets",
        legs = "Pumm. Cuisses +3",
        feet = "Sulev. Leggings +2",
        neck = "Warrior's Bead Necklace +1",
        waist = "Sailfi Belt +1",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Attack+4', 'TP Bonus +250'}
        },
        right_ear = "Thrud Earring",
        left_ring = "Karieyh Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Cichol's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }

    sets.WS.ImpulseDrive = {
        ammo = "Knobkierrie",
        head = "Boii Mask +2",
        body = "Pumm. Lorica +3",
        hands = "Sakpata's Gauntlets",
        legs = "Pumm. Cuisses +3",
        feet = "Sulev. Leggings +2",
        neck = "Warrior's Bead Necklace +1",
        waist = "Sailfi Belt +1",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Attack+4', 'TP Bonus +250'}
        },
        right_ear = "Thrud Earring",
        left_ring = "Begrudging Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Cichol's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }

    sets.WS.Resolution = {
        ammo = "Knobkierrie",
        head = "Sakpata's Helm",
        body = "Sakpata's Breastplate",
        hands = "Sakpata's Gauntlets",
        legs = "Sulev. Cuisses +2",
        feet = "Sulev. Leggings +2",
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Attack+4', 'TP Bonus +250'}
        },
        right_ear = {
            name = "Boii Earring",
            augments = {'System: 1 ID: 1676 Val: 0', 'Accuracy+8', 'Mag. Acc.+8'}
        },
        left_ring = "Niqmaddu Ring",
        right_ring = "Petrov Ring",
        back = {
            name = "Cichol's Mantle",
            augments = {'DEX+20', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dbl.Atk."+10', 'Damage taken-5%'}
        }
    }

    sets.WS.Shockwave = {
        ammo = "Knobkierrie",
        head = "Agoge Mask +3",
        body = "Pumm. Lorica +3",
        hands = "Sakpata's Gauntlets",
        legs = "Flamma Dirs +2",
        feet = "Sulev. Leggings +2",
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Attack+4', 'TP Bonus +250'}
        },
        right_ear = "Ishvara Earring",
        left_ring = "Niqmaddu Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Cichol's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%', 'Damage taken-5%'}
        }
    }

    ----------------------- JOB ABILITY SETS -----------------------

    sets.JA = {}

    sets.JA.Berserk = {
        body = "Pumm. Lorica +3",
        feet = "Agoge Calligae +1"
    }
    sets.JA.Warcry = {
        head = "Agoge Mask +3"
    }
    sets.JA.Aggressor = {
        body = "Agoge Lorica +1"
    }

    sets.JA.BloodRage = {
        body = "Boii Lorica +2"
    }

    sets.JA.Tomahawk = {
        ammo = "Throwing Tomahawk",
        feet = "Agoge Calligae +1"
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

    if spell.type == 'WeaponSkill' and player.tp >= 1000 and player.target.distance < 6.5 then

        if spell.english == 'Savage Blade' then
            equip(sets.WS.SavageBlade)

        elseif spell.english == 'Sanguine Blade' then
            equip(sets.WS.SanguineBlade)

        elseif spell.english == 'Impulse Drive' then
            equip(sets.WS.ImpulseDrive)

        elseif spell.english == 'Resolution' then
            equip(sets.WS.Resolution)

        elseif spell.english == 'Shockwave' then
            equip(sets.WS.Shockwave)

        else
            equip(sets.WS.SavageBlade)
        end

    elseif spell.type == 'WeaponSkill' and player.tp >= 1000 and player.target.distance >= 6.5 then
        cancel_spell()
        send_command('@input /echo Weapon Skill Canceled  Target Out of Range')

    end

    if spell.name == 'Berserk' then
        equip(sets.JA.Berserk)

    elseif spell.name == 'Warcry' then
        equip(sets.JA.Warcry)

    elseif spell.name == 'Aggressor' then
        equip(sets.JA.Aggressor)

    elseif spell.name == 'Blood Rage' then
        equip(sets.JA.BloodRage)

    elseif spell.name == 'Tomahawk' then
        equip(sets.JA.Tomahawk)

    elseif spell.action_type == 'Magic' then
        equip(sets.FastCast)
    
    elseif spell.action_type == 'Item' and spell.english == 'Holy Water' then
        equip(sets.HolyWater)
    end

end

function aftercast(spell)
        
    if player.status == 'Engaged' then

         if state.EngageMode.value == 'TH' or state.EngageMode.value == 'SB' then
            equip(sets.TP[state.EngageMode.value])
            else        
            equip(sets.TP[state.Stance.value][state.EngageMode.value])
        end

        else
        equip(sets.Idle[state.IdleMode.value])
    end

    if spell.name == 'Mighty Strikes' then
        windower.chat.input('/p ' .. string.char(0xFD, 0x02, 0x02, 0x1F, 0x22, 0xFD) .. ' ' .. string.char(0xFD, 0x02, 0x02, 0x15, 0x0E, 0xFD))

    elseif spell.name == 'Brazen Rush' then
    windower.chat.input('/p ' .. string.char(0xFD, 0x02, 0x02, 0x2A, 0x06, 0xFD) .. ' ' .. string.char(0xFD, 0x02, 0x02, 0x15, 0x0E, 0xFD))
   

    elseif spell.name == 'Blood Rage' then
        windower.chat.input('/p ' .. string.char(0xFD, 0x02, 0x02, 0x2A, 0x05, 0xFD) .. ' ' .. string.char(0xFD, 0x02, 0x02, 0x15, 0x0E, 0xFD))

    elseif spell.name == 'Warcry' then
        windower.chat.input('/p ' .. string.char(0xFD, 0x02, 0x02, 0x1F, 0x1F, 0xFD) .. ' ' .. string.char(0xFD, 0x02, 0x02, 0x15, 0x0E, 0xFD))
    end

end

function status_change(new, old)

    if new == 'Engaged' then
        if state.EngageMode.value == 'TH' or state.EngageMode.value == 'SB' then
            equip(sets.TP[state.EngageMode.value])
            else        
            equip(sets.TP[state.Stance.value][state.EngageMode.value])
        end

        else
        equip(sets.Idle[state.IdleMode.value])
    end
end

function self_command(command)

    if command == 'equip weapon naegling' then
        equip(sets.Weapons.Naegling)
        state.Stance:set('Fencer')
        state.AutoWS = M{'Off', 'Savage Blade'}
        if player.status == 'Engaged' then
            equip(sets.TP[state.Stance.value][state.EngageMode.value])
            send_command('input /echo -- TP Set changed to Fencer.')
        end

    elseif command == 'equip weapon naeglingknife' then
        equip(sets.Weapons.NaeglingKnife)
        state.Stance:set('DualWield')
        state.AutoWS = M{'Off', 'Savage Blade'}
        if player.status == 'Engaged' then
            equip(sets.TP[state.Stance.value][state.EngageMode.value])
            send_command('input /echo -- TP Set changed to Dual Wield.')
        end

    elseif command == 'equip weapon shining' then
        equip(sets.Weapons.ShiningOne)
        state.Stance:set('TwoHanded')
        state.AutoWS = M{'Off', 'Impulse Drive'}
        if player.status == 'Engaged' then
            equip(sets.TP[state.Stance.value][state.EngageMode.value])
            send_command('input /echo -- TP Set changed to Two-Handed.')
        end

    elseif command == 'equip weapon montante' then
        equip(sets.Weapons.Montante)
        state.Stance:set('TwoHanded')
        state.AutoWS = M{'Off', 'Resolution '}
        if player.status == 'Engaged' then
            equip(sets.TP[state.Stance.value][state.EngageMode.value])
            send_command('input /echo -- TP Set changed to Two-Handed.')
        end

    elseif command == 'equip weapon loxotic' then
        equip(sets.Weapons.Loxotic)
        state.Stance:set('Fencer')
        state.AutoWS = M{'Off', 'Judgment'}
        if player.status == 'Engaged' then
            equip(sets.TP[state.Stance.value][state.EngageMode.value])
            send_command('input /echo -- TP Set changed to Fencer.')
        end

    elseif command == 'equip TP.Normal' then
        state.EngageMode:set('Normal')
        update_jobset_display()
        windower.chat.input(('/echo -- TP Set changed to %s --'):format(state.EngageMode.value))
        if player.status == 'Engaged' then
            equip(sets.TP[state.Stance.value][state.EngageMode.value])
        end

    elseif command == 'equip TP.Accuracy' then
        state.EngageMode:set('Accuracy')
        update_jobset_display()
        windower.chat.input(('/echo -- TP Set changed to %s --'):format(state.EngageMode.value))
        if player.status == 'Engaged' then
            equip(sets.TP[state.Stance.value][state.EngageMode.value])
        end

    elseif command == 'equip TP.DT' then
        state.EngageMode:set('DT')
        update_jobset_display()
        windower.chat.input(('/echo -- TP Set changed to %s --'):format(state.EngageMode.value))
        if player.status == 'Engaged' then
            equip(sets.TP[state.Stance.value][state.EngageMode.value])
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

    elseif command == 'toggle Idle set' then
        state.IdleMode:cycle()
        update_jobset_display()
        windower.chat.input(('/echo -- Idle Set changed to %s --'):format(state.IdleMode.value))
        if player.status ~= 'Engaged' then
            equip(sets.Idle[state.IdleMode.value])
            send_command('@input /lockstyleset 140')
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
    bg = {alpha = 130, red = 60, green = 90, blue = 130},
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
