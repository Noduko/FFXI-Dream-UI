-----------------------MACRO BOOK------------------
send_command('input /macro book 7')
send_command('wait 4; input /macro set 10')
send_command('wait 4; input /lockstyleset 120')

function sub_job_change(new, old)
    send_command('wait 2; input /lockstyleset 120')
end

-----------------------BINDING------------------

-- GEAR--

send_command('bind ^f1 gs c equip TP.Standard set')
send_command('bind ^f2 gs c equip TP.Accuracy set')
send_command('bind ^f3 gs c equip TP.DT set')
send_command('bind ^f4 gs c equip TP.mEVA set')
send_command('bind ^f5 gs c toggle Idle set')
send_command('bind ^f6 gs c toggle AutoWS')

send_command('bind %~Q gs c toggle Luzaf set')
send_command('bind !Q gs c toggle Weapons set')
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
            QD = "Eminent Bullet",
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
        elseif flags['UseMEVA'] then
            return 'MEVA', {51, 204, 51}
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
    sets.Weapons.mode = M {'Naegling', 'Dagger', 'Other'}

    sets.Weapons.Naegling = {
        main = "Kaja Sword",
        sub = "Eminent Scimitar"
    }

    sets.Weapons.Dagger = {
        main = "",
        sub = "Kaja Sword"
    }

    sets.Weapons.Other = {}

    sets.RangedWeapons = {}
    sets.RangedWeapons.mode = M {'Ataktos', 'Doomsday'}

    sets.RangedWeapons.Ataktos = {
        range = "Ataktos",
        ammo = options.ammo.Cheap
    }

    sets.RangedWeapons.Doomsday = {
        range = "Doomsday",
        ammo = options.ammo.Cheap
    }

    ----------------------- IDLE SETS -----------------------

    sets.Idle = {}
    sets.Idle.mode = M {'Standard', 'DT'}

    sets.Idle.Standard = {
        ammo = options.ammo.Cheap,
        head = "Meghanada Visor +1",
        body = "Meg. Cuirie +1",
        hands = "Meg. Gloves +1",
        legs = "Meg. Chausses +1",
        feet = "Meg. Jam. +1",
        neck = "Asperity Necklace",
        --  neck="Commodore Charm +1",
        waist = "Windbuffet Belt",
        left_ear = "",
        right_ear = "",
        left_ring = "Meghanada Ring",
        right_ring = "Epona's Ring",
        back = "Nexus Cape"
        -- back="Aptitude Mantle +1",
    }

    sets.Idle.DT = {
        ammo = options.ammo.Cheap,
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Elite Royal Collar",
        -- neck="Commodore Charm +1",
        waist = "Flume Belt",
        left_ear = "Brutal Earring",
        right_ear = "Cessance Earring",
        left_ring = {
            name = "Dark Ring",
            augments = {'Phys. dmg. taken -4%'}
        },
        right_ring = "Defending Ring",
        back = {
            name = "Camulus's Mantle",
            augments = {'DEX+10', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dual Wield"+10', 'Phys. dmg. taken-10%'}
        }
    }

    ----------------------- TP SETS -----------------------
    sets.TP = {}
    sets.TP.mode = M {'Standard', 'Accuracy', 'DT', 'mEVA'}

    sets.TP.Standard = {
        ammo = options.ammo.Cheap,
        head = "Meghanada Visor +1",
        body = "Meg. Cuirie +1",
        hands = "Meg. Gloves +1",
        legs = "Meg. Chausses +1",
        feet = "Meg. Jam. +1",
        neck = "Elite Royal Collar",
        --  neck="Commodore Charm +1",
        waist = "Windbuffet Belt",
        left_ear = "",
        right_ear = "",
        left_ring = "Meghanada Ring",
        right_ring = "Epona's Ring",
        back = {
            name = "Camulus's Mantle",
            augments = {'Accuracy+20 Attack+20', '"Dual Wield"+10'}
        }
    }

    sets.TP.Accuracy = {
        ammo = options.ammo.Cheap,
        head = {
            name = "Adhemar Bonnet +1",
            augments = {'DEX+12', 'AGI+12', 'Accuracy+20'}
        },
        body = "Malignance Tabard",
        hands = {
            name = "Adhemar Wrist. +1",
            augments = {'DEX+12', 'AGI+12', 'Accuracy+20'}
        },
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Sanctity Necklace",
        -- neck="Commodore Charm +1",
        waist = "Null Belt",
        left_ear = "Steelflash Earring",
        right_ear = "Heartseeker Earring",
        left_ring = "Cacoethic Ring +1",
        right_ring = {name = "Chirich Ring +1", bag="Wardrobe 2"},
        back = {
            name = "Camulus's Mantle",
            augments = {'DEX+10', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dual Wield"+10', 'Phys. dmg. taken-10%'}
        }
    }

    sets.TP.DT = {
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Elite Royal Collar",
        -- neck="Commodore Charm +1",
        waist = "Flume Belt",
        left_ear = "Brutal Earring",
        right_ear = "Cessance Earring",
        left_ring = {
            name = "Dark Ring",
            augments = {'Phys. dmg. taken -4%'}
        },
        right_ring = "Defending Ring",
        back = {
            name = "Camulus's Mantle",
            augments = {'DEX+10', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dual Wield"+10', 'Phys. dmg. taken-10%'}
        }
    }

    sets.TP.mEVA = {
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Sanctity Necklace",
        -- neck="Commodore Charm +1",
        waist = "Windbuffet Belt",
        left_ear = "Brutal Earring",
        right_ear = "Suppanomimi",
        left_ring = "Petrov Ring",
        right_ring = "Epona's Ring",
        back = {
            name = "Camulus's Mantle",
            augments = {'DEX+10', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dual Wield"+10', 'Phys. dmg. taken-10%'}
        }
    }

    sets.PreRanged = {}
    sets.PreRanged = {
        head = "Chass. Tricorne +1",
        body = "Laksa. Frac +2",
        hands = {
            name = "Lanun Gants +2",
            augments = {'Enhances "Fold" effect'}
        },
        legs = "Malignance Tights",
        feet = "Meg. Jam. +2",
        neck = "Commodore Charm +1",
        left_ear = "Neritic Earring",
        waist = "Yemaya Belt",
        back = {
            name = "Camulus's Mantle",
            augments = {'INT+20', 'Eva.+20 /Mag. Eva.+20', 'Mag. Evasion+10', '"Snapshot"+10', 'Mag. Evasion+15'}
        }
    }

    sets.Ranged = {}
    sets.Ranged = {
        head = "Malignance Chapeau",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
        neck = "Ocachi Gorget",
        waist = "Yemaya Belt",
        left_ear = "Cessance Earring",
        right_ear = "Enervating Earring",
        left_ring = "Cacoethic Ring +1",
        right_ring = "Crepuscular Ring",
        back = {
            name = "Camulus's Mantle",
            augments = {'AGI+20', 'Rng.Acc.+20 Rng.Atk.+20', 'Rng.Acc.+10', '"Store TP"+10', 'Mag. Evasion+15'}
        }
    }

    ----------------------- WS SETS -----------------------

    sets.WS = {}
    sets.WS.mode = M {'Standard', 'Accuracy'}

    sets.SavageBlade = {}
    sets.SavageBlade.mode = M {'Standard', 'Accuracy'}

    sets.SavageBlade.Standard = {
        back = {
            name = "Camulus's Mantle",
            augments = {'Accuracy+20 Attack+20', 'Weapon skill damage +10%'}
        }
    }

    sets.SavageBlade.Accuracy = {
        head = "Meghanada Visor +2",
        body = "Laksa. Frac +2",
        hands = "Meg. Gloves +2",
        legs = {
            name = "Herculean Trousers",
            augments = {'Rng.Acc.+19', 'STR+10', 'Attack+7'}
        },
        feet = {
            name = "Lanun Bottes +2",
            augments = {'Enhances "Wild Card" effect'}
        },
        neck = "Commodore Charm +1",
        waist = "Eschan Stone",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Attack+4', 'TP Bonus +250'}
        },
        right_ear = "Ishvara Earring",
        left_ring = "Karieyh Ring",
        right_ring = "Cornelia's Ring",
        back = {
            name = "Camulus's Mantle",
            augments = {'INT+20', 'Eva.+20 /Mag. Eva.+20', 'Mag. Evasion+10', '"Snapshot"+10', 'Mag. Evasion+15'}
        }
    }

    sets.Requiescat = {}
    sets.Requiescat = {
        head = {
            name = "Adhemar Bonnet +1",
            augments = {'DEX+12', 'AGI+12', 'Accuracy+20'}
        },
        body = {
            name = "Adhemar Jacket",
            augments = {'DEX+10', 'AGI+10', 'Accuracy+15'}
        },
        hands = "Meg. Gloves +2",
        legs = "Meg. Chausses +2",
        feet = "Meg. Jam. +2",
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Attack+4', 'TP Bonus +250'}
        },
        right_ear = "Cessance Earring",
        left_ring = "Levia. Ring",
        right_ring = "Epona's Ring",
        back = {
            name = "Camulus's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%', 'Mag. Evasion+15'}
        }
    }

    sets.Evisceration = {}
    sets.Evisceration = {
        head = {
            name = "Adhemar Bonnet +1",
            augments = {'DEX+12', 'AGI+12', 'Accuracy+20'}
        },
        body = "Mummu Jacket +2",
        hands = "Mummu Wrists +2",
        legs = {
            name = "Samnuha Tights",
            augments = {'STR+10', 'DEX+10', '"Dbl.Atk."+3', '"Triple Atk."+3'}
        },
        feet = "Mummu Gamash. +2",
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = {
            name = "Moonshade Earring",
            augments = {'Attack+4', 'TP Bonus +250'}
        },
        right_ear = "Cessance Earring",
        left_ring = "Mummu Ring",
        right_ring = "Begrudging Ring",
        back = {
            name = "Camulus's Mantle",
            augments = {'DEX+10', 'Accuracy+20 Attack+20', 'Accuracy+10', '"Dual Wield"+10', 'Phys. dmg. taken-10%'}
        }
    }

    sets.AeolianEdge = {}
    sets.AeolianEdge = {
        head = {
            name = "Herculean Helm",
            augments = {'Weapon skill damage +3%', 'STR+14', 'Accuracy+8', 'Attack+5'}
        },
        hands = {
            name = "Leyline Gloves",
            augments = {'Accuracy+15', 'Mag. Acc.+15', '"Mag.Atk.Bns."+15', '"Fast Cast"+3'}
        },
        body = "Lanun Frac +2",
        legs = {
            name = "Herculean Trousers",
            augments = {'Rng.Acc.+19', 'STR+10', 'Attack+7'}
        },
        feet = {
            name = "Lanun Bottes +2",
            augments = {'Enhances "Wild Card" effect'}
        },
        neck = "Commodore Charm +1",
        waist = "Eschan Stone",
        left_ear = "Friomisi Earring",
        right_ear = {
            name = "Moonshade Earring",
            augments = {'Attack+4', 'TP Bonus +250'}
        },
        left_ring = "Shiva Ring",
        right_ring = "Shiva Ring",
        back = {
            name = "Camulus's Mantle",
            augments = {'STR+20', 'Accuracy+20 Attack+20', 'STR+10', 'Weapon skill damage +10%', 'Mag. Evasion+15'}
        }
    }

    sets.LeadenSalute = {}
    sets.LeadenSalute = {
        ammo = options.ammo.WS,
        head = "Pixie Hairpin +1",
        body = "Lanun Frac +2",
        hands = {
            name = "Herculean Gloves",
            augments = {'"Mag.Atk.Bns."+21', 'Weapon skill damage +4%', 'AGI+4'}
        },
        legs = {
            name = "Herculean Trousers",
            augments = {'"Mag.Atk.Bns."+20', 'Attack+21', 'Accuracy+5 Attack+5', 'Mag. Acc.+6 "Mag.Atk.Bns."+6'}
        },
        feet = {
            name = "Lanun Bottes +2",
            augments = {'Enhances "Wild Card" effect'}
        },
        neck = {
            name = "Comm. Charm +1",
            augments = {'Path: A'}
        },
        waist = "Eschan Stone",
        left_ear = "Friomisi Earring",
        right_ear = {
            name = "Moonshade Earring",
            augments = {'Attack+4', 'TP Bonus +250'}
        },
        right_ring = "Archon Ring",
        back = {
            name = "Camulus's Mantle",
            augments = {'AGI+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'AGI+10', 'Weapon skill damage +10%', 'Mag. Evasion+15'}
        }
    }

    sets.Wildfire = {}
    sets.Wildfire = {
        ammo = options.ammo.WS,
        head = {
            name = "Herculean Helm",
            augments = {'Weapon skill damage +3%', 'STR+14', 'Accuracy+8', 'Attack+5'}
        },
        body = "Lanun Frac +2",
        hands = {
            name = "Herculean Gloves",
            augments = {'"Mag.Atk.Bns."+21', 'Weapon skill damage +4%', 'AGI+4'}
        },
        legs = {
            name = "Herculean Trousers",
            augments = {'"Mag.Atk.Bns."+20', 'Attack+21', 'Accuracy+5 Attack+5', 'Mag. Acc.+6 "Mag.Atk.Bns."+6'}
        },
        feet = {
            name = "Lanun Bottes +2",
            augments = {'Enhances "Wild Card" effect'}
        },
        neck = {
            name = "Comm. Charm +1",
            augments = {'Path: A'}
        },
        waist = "Eschan Stone",
        left_ear = "Friomisi Earring",
        right_ear = {
            name = "Moonshade Earring",
            augments = {'Attack+4', 'TP Bonus +250'}
        },
        right_ring = "Archon Ring",
        back = {
            name = "Camulus's Mantle",
            augments = {'AGI+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'AGI+10', 'Weapon skill damage +10%', 'Mag. Evasion+15'}
        }

    }

    sets.LastStand = {}
    sets.LastStand = {
        ammo = options.ammo.WS,
        head = {
            name = "Lanun Tricorne +2",
            augments = {'Enhances "Winning Streak" effect'}
        },
        body = "Meg. Cuirie +2",
        hands = "Meg. Gloves +2",
        legs = "Meg. Chausses +2",
        feet = {
            name = "Lanun Bottes +2",
            augments = {'Enhances "Wild Card" effect'}
        },
        neck = "Fotia Gorget",
        waist = "Fotia Belt",
        left_ear = "Friomisi Earring",
        right_ear = "Ishvara Earring",
        right_ring = "Apate Ring",
        back = {
            name = "Camulus's Mantle",
            augments = {'AGI+20', 'Mag. Acc+20 /Mag. Dmg.+20', 'AGI+10', 'Weapon skill damage +10%', 'Mag. Evasion+15'}
        }
    }

    ----------------------- JOB ABILITY SETS -----------------------

    sets.PhantomRoll = {}
    sets.PhantomRoll.mode = M {'ON', 'OFF'}

    sets.PhantomRoll.ON = {
        main = "Lanun Knife",
        range = "Compensator",
        head = "Lanun Tricorne",
        body = "Malignance Tabard",
        hands = "Chasseur's Gants",
        legs = {
            name = "Desultor Tassets",
            augments = {'"Phantom Roll" ability delay -5', 'Movement speed +8%+2'}
        },
        feet = "Malignance Boots",
        neck = "Regal Necklace",
        waist = "Flume Belt",
        left_ear = "Etiolation Earring",
        right_ear = "Odnowa Earring",
        left_ring = "Barataria Ring",
        right_ring = "Luzaf's Ring",
        back = {
            name = "Camulus's Mantle",
            augments = {'INT+20', 'Eva.+20 /Mag. Eva.+20', 'Mag. Evasion+10', '"Snapshot"+10', 'Mag. Evasion+15'}
        }
    }

    sets.PhantomRoll.OFF = {
        main = "Lanun Knife",
        range = "Compensator",
        head = {
            name = "Lanun Tricorne +2",
            augments = {'Enhances "Winning Streak" effect'}
        },
        body = "Malignance Tabard",
        hands = "Chasseur's Gants +1",
        legs = {
            name = "Desultor Tassets",
            augments = {'"Phantom Roll" ability delay -5', 'Movement speed +8%+2'}
        },
        feet = "Malignance Boots",
        neck = "Regal Necklace",
        waist = "Flume Belt",
        left_ear = "Brutal Earring",
        right_ear = "Odnowa Earring",
        left_ring = "Barataria Ring",
        right_ring = "Defending Ring",
        back = {
            name = "Camulus's Mantle",
            augments = {'INT+20', 'Eva.+20 /Mag. Eva.+20', 'Mag. Evasion+10', '"Snapshot"+10', 'Mag. Evasion+15'}
        }
    }

    sets.TripleShot = {}
    sets.TripleShot = {
        head = "Oshosi Mask"

    }

    sets.QuickDrawDMG = {}
    sets.QuickDrawDMG = {}

    sets.QuickDrawMACC = {}
    sets.QuickDrawMACC = {}
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

    sets.Magic = {}
    sets.Magic.Cure = {
        head = "Meghanada Visor +2",
        body = {
            name = "Adhemar Jacket",
            augments = {'DEX+10', 'AGI+10', 'Accuracy+15'}
        },
        legs = "Carmine Cuisses +1",
        left_ear = "Aqua Pearl",
        right_ear = "Aqua Pearl",
        left_ring = "Levia. Ring",
        right_ring = "Aquasoul Ring",
        back = "Solemnity Cape"
    }

    ----------------------- AUTO WEAPON SKILL -----------------------

    sets.AutoWS = {}
    sets.AutoWS.mode = M {'Disabled', 'Enabled (Savage Blade)', 'Enabled (Aeolian Edge)'}

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

        end

        -- elseif spell.type == 'WeaponSkill' and player.tp >= 1000 and player.target.distance >= 6 then
        -- 	cancel_spell()
        -- 	send_command('@input /echo Weapon Skill Canceled  Target Out of Range') 
    end

    if spell.action_type == 'Ranged Attack' then
        equip(sets.PreRanged)
    end

    if spell.type == 'CorsairRoll' then
        equip(sets.PhantomRoll[sets.PhantomRoll.mode.value])

    end

    if spell.english == 'Triple Shot' then
        equip(sets.TripleShot)
    end

    if spell.type == 'CorsairShot' then
        if (spell.english ~= 'Light Shot' or spell.english ~= 'Dark Shot') then
            equip(sets.QuickDrawMACC)
        else
            equip(sets.QuickDrawDMG)
        end
    end

    if spell.action_type == 'Magic' then
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

    if spell.english == 'Cure' or spell.english == 'Cure II' or spell.english == 'Cure III' or spell.english ==
        'Cure IV' then
        equip(sets.Magic.Cure)
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

    if command == 'toggle Weapons set' then
        sets.Weapons.mode:cycle()
        send_command('@input /equipset 102')
        equip(sets.Weapons[sets.Weapons.mode.value])
        windower.chat.input(('/echo -- Weapons Set changed to %s --'):format(sets.Weapons.mode.value))

    elseif command == 'toggle RangedWeapons set' then
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

    elseif command == 'equip TP.Standard set' then
        sets.TP.mode:set('Standard')
        send_command('input /echo -- TP Set changed to Standard')
        if player.status == 'Engaged' then
            equip(sets.TP.Standard)
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

    elseif command == 'equip TP.mEVA set' then
        sets.TP.mode:set('mEVA')
        send_command('input /echo -- TP Set changed to mEVA')
        if player.status == 'Engaged' then
            equip(sets.TP.mEVA)
        end

    elseif command == 'equip Idle set' then
        equip(sets.Idle[sets.Idle.mode.value])

    elseif command == 'toggle AutoWS' then
        sets.AutoWS.mode:cycle()
        windower.chat.input(('/echo -- Auto Weapon Skill %s --'):format(sets.AutoWS.mode.value))

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

        elseif sets.AutoWS.mode.value == 'Enabled (Aeolian Edge)' and tp >= 1000 then
            windower.send_command('input /ws "Aeolian Edge" <t>')

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
--             -- 		equip(sets.Idle.Standard)
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
