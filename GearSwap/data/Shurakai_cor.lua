function get_sets()
	include('organizer-lib.lua')
	include('ani-include.lua')

	options = { default_element = 'fire', default_step = 'Box Step',
		ammo = { QD = "Animikii Bullet", TP = "Chrono Bullet", WS = "Chrono Bullet", Cheap = "Chrono Bullet" }
	}
	
	HUD.Create({x = 1398, y = 716, 
		borderSettings = { color = {red = 30, green = 30, blue = 30} },
		bgSettings = { color = {red = 80, green = 20, blue = 20} },
		textSettings = { text = {red = 230, green = 230, blue = 230} },
	})
	HUD.AddBox(-9, -2, 80, 34, true)
	HUD.AddText("--", 0, 0, 20, nil, "Accuracy")
	HUD.AddText("--", 40, 2, 8, nil, "AccTrend")
	HUD.AddText("DD", 40, 14, 8, {255, 0, 0}, function()
			if flags['UsePDT'] then
				return 'PDT', {255, 255, 0}
			elseif flags['HighAcc'] then
				return 'ACC', {255, 0, 255}
			elseif flags['UseHYB'] then
				return 'HYB', {51, 204, 51}
			else
				return 'DD', {255, 0, 0}
			end
		end)
	HUD.AddBox(-9, -24, 80, 19, 'Double-Up')
	HUD.AddText("", 23, -22, 10, {255, 255, 255}, "RollValue")
	HUD.AddText("", 0, -21, 8, {0, 255, 0}, "RollLucky")
	HUD.AddText("", 52, -21, 8, {255, 0, 0}, "RollUnlucky")
	HUD.AddBox(-9, -46, 35, 19, 'Snake Eye')
	HUD.AddText("", -2, -43, 8, nil, function() return buffactive['Snake Eye'] and "S.E." or "" end)
	HUD.AddBox(36, -46, 35, 19, function() return flags['Luzaf'] or flags['Double-Luzaf'] end)
	HUD.AddText("", 43, -43, 8, nil, function() return (flags['Luzaf'] or flags['Double-Luzaf']) and "Luz" or "" end)
	HUD.Finish()

	send_command('input /macro book 2;wait .1;input /macro set 10')
	send_command('alias ls gs c lockstyle')
	send_command('alias use gs c setelement')
	send_command('alias luzaf gs c useluzaf')
	
	send_command('alias pdt gs c pdt')
	send_command('alias hyb gs c hyb')
	send_command('alias acc gs c usehighacc') -- Puts on high-acc gear
	--send_command('alias dw10 gs c dw10')
	
	send_command('alias buff gs c buffme')
	send_command('alias qd gs c qd')
	send_command('alias proc gs c proc')
	send_command('alias setcure gs c setcure')
	send_command('alias step gs c step')
	send_command('alias autopilot gs c autopilotgo')
	send_command('alias ws gs c autowsgo')	
	
	RollCape = {name="Gunslinger's Cape",augments={'"Phantom Roll" ability delay -3'}}
	MABCape = {name="Gunslinger's Cape",augments={'"Mag. Atk. Bns."+4'}}

    TPBoots = {name="Herculean Boots", augments={'Accuracy+25 Attack+25','"Triple Atk."+2','STR+8','Accuracy+12',}}

    ACCLegs = { name="Herculean Trousers", augments={'Accuracy+22 Attack+22','"Triple Atk."+2','AGI+4','Accuracy+8',}}
    
    MABWSHead={ name="Herculean Helm", augments={'"Mag.Atk.Bns."+25','Weapon skill damage +3%','STR+13',}}
    MABHead={ name="Herculean Helm", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','Enmity-3','MND+4','Mag. Acc.+11','"Mag.Atk.Bns."+14',}}
    
    MABBoots={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+19','Accuracy+7','Accuracy+3 Attack+3','Mag. Acc.+17 "Mag.Atk.Bns."+17',}}
    
    MABLegs={ name="Herculean Trousers", augments={'DEX+4','"Mag.Atk.Bns."+22','Phalanx +4','Accuracy+15 Attack+15','Mag. Acc.+20 "Mag.Atk.Bns."+20',}}
    
    SBHead={ name="Herculean Helm", augments={'Accuracy+20 Attack+20','STR+13','Accuracy+3','Attack+11',}}
    SBLegs={ name="Herculean Trousers", augments={'Accuracy+29','Weapon skill damage +5%','STR+1','Attack+9',}}

    SBBoots={ name="Herculean Boots", augments={'Accuracy+16','STR+8','Weapon skill damage +5%','Accuracy+2 Attack+2','Mag. Acc.+10 "Mag.Atk.Bns."+10',}}
    SBBody={ name="Herculean Vest", augments={'Accuracy+14 Attack+14','Weapon skill damage +4%',}}

    DTHands={ name="Herculean Gloves", augments={'STR+15','Chance of successful block +1','Damage taken-4%','Accuracy+1 Attack+1',}}
    DTBoots={ name="Herculean Boots", augments={'Attack+23','Damage taken-4%','DEX+3',}}

    FCBody={ name="Taeon Tabard", augments={'Accuracy+11','"Fast Cast"+5',}}

    TPCape={ name="Camulus's Mantle", augments={'DEX+20',}}
    SBCape={ name="Camulus's Mantle", augments={'STR+30',}}
    RACape={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}}
	
	organizer_items = {
	    Degen="Demersal Degen",
		PlusOneDegen="Demersal Degen +1",
		Fleuret="Fettering Blade",
		Atoyac="Atoyac",
		Doom="Doomsday",
		Eminent="Eminent Bullet",
		Bronze="Bronze Bullet",
		Card="Trump Card",
	}
	
	sets = {
		--action = function(spell) print(spell.command, spell.type, spell.english) end,
		Autoset = { when='Aftercast',
			Rolls = { spelltype = "CorsairRoll", 
				Success = {interrupted = false,
					action = function(spell) HUD.Data['RollLucky'] = Rolls[spell.name].Lucky HUD.Data['RollUnlucky'] = Rolls[spell.name].Unlucky HUD.Data['Double-Up'] = true end,
					Luzaf = { flag = "Luzaf", action = function() flags['Luzaf'] = false flags['Double-Luzaf'] = true end, },
				},
				Fail = {interrupted = true, action = function() flags['Luzaf'] = false flags['Double-Luzaf'] = false aftercast({}) end,},
			},
			Idle = { status='Idle',  --refresh, pdt, movement
				ammo = options.ammo.TP,
				head = 'Rawhide Mask',
                neck = 'Sanctity Necklace',
				lear="Infused Earring",			--7
				rear="Suppanomimi",	
                body = 'Mekosuchinae Harness',
                hands = 'Kurys Gloves',
                lring = 'Chirich Ring',
                rring = 'Defending Ring',
				back="Solemnity Cape",
                waist = 'Kentarch Belt +1',
                legs = 'Carmine Cuisses +1',
                feet = "Lanun Bottes +3",

                PDT = {	flag = 'UsePDT',
					head="Malignance Chapeau",
					neck="Loricate Torque +1",
					lear="Genmei Earring",
					rear="Suppanomimi",
					body = 'Malignance Tabard',
					hands=DTHands,
					ring1="Warden\'s Ring",
					ring2="Defending Ring",
					back="Solemnity Cape",
                	waist = 'Flume Belt',
              		legs = "Carmine Cuisses +1",
                	feet = DTBoots,
				},
				
				JackpotUp = { advanced = function() return buffactive[last11] end, rring="Roller's Ring", },
			}, --Idle
			Resting = { status="Resting", },
			Engaged = { status="Engaged",
				head = 'Malignance Chapeau',
                neck = 'Asperity Necklace',
				lear = "Eabani Earring",			
				rear = "Suppanomimi",	
                body = 'Adhemar Jacket',
                hands = 'Adhemar Wristbands +1',
                lring = 'Petrov Ring',
                rring = 'Epona\'s Ring',
				back = TPCape,
                waist = "Reiki Yotai",--'Sarissaphoroi Belt',
              	legs = 'Samnuha Tights',
                feet = TPBoots,
			
				--DualWield = { subjob = {'NIN', 'DNC'}, notflag = {'HighAcc', 'UsePDT'},
					--lear="Dudgeon Earring",
					--rear="Heartseeker Earring",
					--rring="Haverton Ring",
					--waist="Shetal Stone",
				
				--MeleeRefresh = { subjob = {'WHM', 'BLM', 'BLU'}, notflag = {'HighAcc', 'UsePDT'},
					--head="Rawhide Mask",
					--body="Mekosuchinae Harness",

				--DW10 = { flag = 'dw10', notflag = 'UsePDT',
					
				HighAcc = { flag = 'HighAcc', notflag = 'UsePDT',
				   	neck ='Subtlety spectacles',
					lear="Zennaroi Earring",
					lring="Chirich Ring",
					body = 'Malignance Tabard',
					waist="Kentarch Belt +1",
              		legs = "Malignance Tights",
				},
				PDT = {	flag = 'UsePDT',
					head="Malignance Chapeau",
					neck="Loricate Torque +1",
					lear="Genmei Earring",
					rear="Suppanomimi",
					body = 'Malignance Tabard',
					hands=DTHands,
					ring1="Warden\'s Ring",
					ring2="Defending Ring",
					back="Solemnity Cape",
                	waist = 'Flume Belt',
              		legs = "Malignance Tights",
                	feet = DTBoots,
                },
                Hyb = {	flag = 'UseHYB',
					head="Malignance Chapeau", --6% Haste
					neck="Loricate Torque +1", 
					lear="Eabani Earring", --4% DW
					rear="Suppanomimi", --5% DW
					body = 'Malignance Tabard', --4% Haste
					hands="Adhemar Wristbands +1", --5% Haste
					ring1='Epona\'s Ring',
					ring2="Defending Ring",
					back = TPCape, --10% DW
                	waist = "Reiki Yotai", -- 7% DW
              		legs = "Malignance Tights", -- 9% Haste
                	feet = DTBoots, --4% Haste
				},
			},
		},
-------------------------------------------------------------------------------------------------------------------
-- Abilities
-------------------------------------------------------------------------------------------------------------------
		Abilities = { command="Ability",
			JA = { spelltype = "JobAbility", when="Precast",
				Tripleshot = {spell = 'Triple Shot', body = "Chasseur's Frac" },
				RandomDeal = {spell = 'Random Deal', body = "Lanun Frac +3", },
				SnakeEye = {spell = 'Snake Eye', legs = "Lanun Trews" },
				Fold = {spell = 'Fold', legs = "Lanun Gants +1" },
				WildCard = { spell = 'Wild Card', feet = "Lanun Bottes +3", },
				DoubleUp = { spell="Double-Up", flag = {"Luzaf", "Double-Luzaf"}, lring = "Luzaf's Ring",
					action = function() flags['Luzaf'] = false flags['Double-Luzaf'] = true end, 
				},
			}, --JobAbilities
			QuickDraw = { spelltype = "CorsairShot",
				Damage = { advanced = function(spell) return spell.element ~= 'Light' and spell.element ~= 'Dark' end,
					Pre = { when="Precast",
						ammo=options.ammo.QD,
						head = MABHead,
		                neck = 'Sanctity Necklace',
		                lear = 'Friomisi Earring',
		                rear = "Hecate's Earring",
		                body = 'Lanun Frac +3',
		                hands = 'Carmine Finger Gauntlets +1',
		                lring = 'Arvina Ringlet +1',
		                rring = 'Adoulin Ring',
		                back = "Gunslinger's Cape",
		                waist = 'Eschan Stone',
		                legs = MABLegs,
		                feet = 'Chasseur\'s Bottes +1',
						Obi = {useobi = true, back="Twilight Cape", waist="Hachirin-no-Obi", },
					}, --Precast
				}, --Damage
				Debuff = { spell = {"Light Shot", "Dark Shot"}, when = "Precast",
					ammo=options.ammo.QD,
					head = 'Carmine Mask',
		            neck = 'Sanctity Necklace',
		            lear = 'Friomisi Earring',
		            rear = "Hecate's Earring",
		            body = 'Samnuha Coat',
		            hands = 'Leyline Gloves',
		            lring = 'Arvina Ringlet +1',
		            rring = 'Adoulin Ring',
		            back = "Gunslinger's Cape",
		            waist = 'Eschan Stone',
		            legs = MABLegs,
		            feet = 'Chasseur\'s Bottes +1',
				},
				After = { when="Aftercast", ammo = options.ammo.Cheap, }
			}, -- quickDraw
			Rolls = { spelltype = "CorsairRoll", when="Precast",
				head="Lanun Tricorne",
				neck="Regal Necklace",
				body="Malignance Tabard",
				hands="Chasseur's Gants",
				--lring="Barataria Ring",
				rring="Defending Ring",
		        back = TPCape,
				legs="Desultor Tassets",
				feet="Chasseur's Bottes +1",
				
				Luzaf = { flag = 'Luzaf', lring = "Luzaf's Ring" },
				--Casters = { spell = "Caster's Roll", legs = "Navarch's Culottes +2", },
				--Blitzer = { spell = "Blitzer's Roll", head = "Navarch's Tricorne +2", },
			}, -- Rolls
			WeaponSkills = { spelltype = 'WeaponSkill', when="Precast",
				Melee = { spell={"Requiescat", "Vorpal Blade", "Savage Blade", "Evisceration"},
					head="Dampening Tam",
					neck="Caro Necklace",
					lear="Ishvara Earring",
					rear="Moonshade Earring",
					body="Laksamana's Frac +3",
					hands="Meghanada gloves +2",
					lring="Petrov Ring",
					rring="Apate Ring",
					back=SBCape,
					waist="Grunfeld Rope",
					legs="Samnuha Tights",
					feet="Lanun Bottes +3",

					Savage = {spell="Savage Blade", legs=SBLegs, lring="Rufescent Ring", rring="Ifrit Ring +1", waist="Prosilio Belt +1", head=SBHead, },
					Requiescat = {spell="Requiescat", legs="Carmine Cuisses +1", lring="Rufescent Ring", rear="Lifestorm Earring", head="Carmine Mask", },

				},
				Magic = { spell={"Sanguine Blade", "Wildfire", "Circle Blade", "Aolean Edge",},
					ammo=options.ammo.Cheap,
					head = MABWSHead,
		            neck = 'Sanctity Necklace',
		            lear = 'Friomisi Earring',
		            rear = "Hecate's Earring",
		            body = "Lanun Frac +3",
		            hands = 'Carmine Finger Gauntlets +1',
		            lring = 'Arvina Ringlet +1',
		            rring = 'Adoulin Ring',
		            back = RACape,
		            waist = 'Eschan Stone',
		            legs = MABLegs,
		            feet="Lanun Bottes +3",
					
					Sanguine = {spell="Sanguine Blade", ammo="Animikii Bullet", head="Pixie Hairpin +1", lring="Archon Ring",},
					Obi = {useobi = true, back="Twilight Cape", waist="Hachirin-no-Obi", },
				},

				LS = { spell={"Leaden Salute",},
					ammo=options.ammo.Cheap,
					head = "Pixie Hairpin +1",
		            neck = 'Sanctity Necklace',
		            lear = 'Friomisi Earring',
		            rear = "Moonshade Earring",
		            body = "Laksamana's Frac +3",
		            hands = 'Carmine Finger Gauntlets +1',
		            lring = 'Archon Ring',
		            rring = 'Adoulin Ring',
		            back = RACape,
		            waist = 'Eschan Stone',
		            legs = MABLegs,
		            feet="Lanun Bottes +3",
					
					Obi = {useobi = true, waist="Anrin Obi", },
				},
				Gun = { spell={"Last Stand", "Slug Shot", "Detonator",},
					ammo = options.ammo.WS,
					head="Pursuer's Beret",
	                neck="Marked Gorget",
	                lear="Moonshade Earring",
	                rear="Ishvara earring",
	                body="Laksamana's Frac +3",
	                hands="Meghanada gloves +2",
	                rring="Garuda Ring",
	                lring="Adoulin Ring",
	                back= RACape,
	                waist="Kwahu Kachina Belt",
	                legs="Adhemar Kecks",
	                feet="Lanun Bottes +3",
										
					Detonator = { spell = "Detonator", rring = "Apate Ring", lring = "Rufescent Ring", head = MABWSHead, lear = "Ishvara Earring", rear = "Ennervating earring", back = SBCape, waist = "Light Belt", neck="Light Gorget",},
				},
			}, -- Weaponskills
			Steps = {spell = {'Quickstep', 'Box Step', 'Stutter Step'},  when='Precast',
				neck="Subtlety Spectacles",
				lear="Zennaroi Earring",
				rear="Suppanomimi",
				lring="Chirich Ring",
				rring="Enlivened Ring",
				back="Grounded Mantle",
				waist="Kentarch Belt +1",
				legs="Carmine Cuisses +1",
			},
		},
		RangedAttack = { spell="Ranged",
			Pre = { when="Precast", --SNAPSHOT (~60 for cap) + RAPID SHOT gear
				ammo=options.ammo.TP,
				head = 'Aurore Beret +1',  --5
                body="Skopos Jerkin",  --5
                --neck="Marked Gorget",
                --lear = 'Drone Earring',
                --rear = "Clearview earring",
                hands = "Carmine Finger Gauntlets +1", --8
                --lring = 'Adoulin Ring',
                --rring="Paqichikaji Ring",
                back = "Navarch's Mantle", --6.5
                waist = 'Impulse Belt', --3
				legs="Adhemar Kecks", --9
				feet="Adhemar Gamashes", --8
			}, --pre
			Mid = { when="Midcast",
				head = "Mummu Bonnet +1",
                body="Laksamana's Frac +3",
                neck="Marked Gorget",
                lear = 'Enervating Earring',
                rear = "Volley Earring",
                hands = "Adhemar Wristbands +1",		--"Floral Gauntlets",
                lring = 'Chirich Ring',
                rring="Paqichikaji Ring",
                back = RACape,
                waist = 'Kwahu Kachina Belt',
				legs="Malignance Tights",
				feet="Mummu Gamashes +1",
			}, --mid
		}, -- ranged
-------------------------------------------------------------------------------------------------------------------
-- Magic
-------------------------------------------------------------------------------------------------------------------
		Magic = { command = 'Magic',

			Pre = { when="Precast", 
				head="Carmine Mask", --12
				--neck="Voltsurge Torque",
				lear="Loquacious Earring", --2
				rear="Etiolation Earring", --1
				body=FCBody, --9
				hands="Leyline Gloves", --5
				lring="Kishar Ring", --4
				ring2="Prolix Ring",--3
				--waist = 'Witful Belt', 
				legs="Carmine Cuisses +1",
				feet="Carmine greaves", --7
				back="Swith Cape +1", --4
			},
			Mid = { when="Midcast",
				head="Herculean Helm",
				neck="Voltsurge Torque",
				lear="Loquacious Earring",
				body="Samnuha Coat",
				hands="Leyline Gloves",
				lring="Prolix Ring",
				waist="Eschan Stone",
				
				Cures = { spell={"Cure*", "Cura*", "Magic Fruit", 'Plenilune Embrace', 'Wild Carrot', 'Pollen', 'White Wind', 'Healing Breeze' },
					
				},
				--Trust = { spelltype = "Trust",  --full 119 gear
					--head="Adhemar Bonnet",
					--body="Adhemar Jacket",
					--hands="Adhemar Wristbands +1",
					--legs="Carmine Cuisses +1",
					--feet="Adhemar Gamashes",
					--sub="Demersal Degen",
				--},
			},
		}, --Magic
-------------------------------------------------------------------------------------------------------------------
-- Commands
-------------------------------------------------------------------------------------------------------------------
		SelfCommand = { command = 'SelfCommand', -- rules for interpreting gearswap commands
			Style = { spell = "lockstyle", action = function(spell)  send_command('input /lockstyleset 004;gs c regear;') end },
			ReGear = { spell = "regear", action = function() aftercast({}) end },
			UsePDT = { spell = "pdt", action = function() flags['UsePDT'] = not flags['UsePDT']	HUD.Update() aftercast({}) end },
			UseHYB = { spell = "hyb", action = function() flags['UseHYB'] = not flags['UseHYB']	HUD.Update() aftercast({}) end },
			UseHighAcc = { spell = "usehighacc", action = function() flags['HighAcc'] = not flags['HighAcc'] HUD.Update() aftercast({}) end },
			StartAutows = { spell = 'autowsgo', action = function() options.autows = true autows() end },
			SelfBuff = { spell = "buffme", action = function()
					if (buffactive['addendum: white'] or player.sub_job == 'WHM') and not buffactive['reraise'] then
						send_command('input /ma "Reraise" <me>')
					elseif not buffactive['refresh'] and player.sub_job == 'RDM' then
						send_command('input /ma "Refresh" <me>')
					elseif not buffactive['haste'] and (player.sub_job == 'RDM' or player.sub_job == 'WHM') then
						send_command('input /ma "Haste" <me>')
					elseif not buffactive['phalanx'] and player.sub_job == 'RDM' then
						send_command('input /ma "Phalanx" <me>')	
					elseif not buffactive['blink'] and (player.sub_job == 'RDM' or player.sub_job == 'WHM' or player.sub_job == 'SCH') then
						send_command('input /ma "Blink" <me>')
					elseif not buffactive['stoneskin'] and not buffactive['magic shield'] and (player.sub_job == 'RDM' or player.sub_job == 'WHM' or player.sub_job == 'SCH')  then
						send_command('input /ma "Stoneskin" <me>')
					else
						add_to_chat(122,'~~~ Buffs Ready ~~~')
					end
				end
			},
			Step = { spell = "step", action = function()
					if options.default_step == "Cycle Step" or options.default_step == "Cycle Step 1" then
						send_command('input /ja "Quickstep" <t>')
						options.default_step = "Cycle Step 2"
					elseif options.default_step == "Cycle Step 2" then
						send_command('input /ja "Box Step" <t>')
						options.default_step = "Cycle Step 3"
					elseif options.default_step == "Cycle Step 3" then
						send_command('input /ja "Stutter Step" <t>')
						options.default_step = "Cycle Step 1"
					else
						send_command('input /ja "'..options.default_step..'" <t>')
					end
				end
			},
			Cure = { spell = "setcure", action = function()
					if player.sub_job == 'BLU' then
						send_command('input /ma "Magic Fruit" <stpc>')
					elseif player.sub_job == 'WHM' or player.sub_job == 'RDM' then
						send_command('input /ma "Cure IV" <stpc>')
					elseif player.sub_job == 'SCH' then
						send_command('input /ma "Cure III" <stpc>')
					elseif player.sub_job == 'DNC' then
						send_command('input /ja "Curing Waltz III" <stpc>')
					end
				end
			},
			Luzaf = { spell='useluzaf', action = function() flags['Luzaf'] = not (flags['Luzaf'] or flags['Double-Luzaf']) flags['Double-Luzaf'] = false HUD.Update() end },
			QDAmmo = { spell = "qdammo", action = function() options.ammo.QD = player.equipment.ammo show_ammo() end, },
			WSAmmo = { spell = "wsammo", action = function() options.ammo.WS = player.equipment.ammo show_ammo() end, },
			TPAmmo = { spell = "tpammo", action = function() options.ammo.TP = player.equipment.ammo show_ammo() end, },
			CheapAmmo = { spell = "cheapammo", action = function() options.ammo.Cheap = player.equipment.ammo show_ammo() end, },
			SetElement = { spell = 'setelement', action = set_default_element },
			QD = { spell = 'qd', action = function() 
					if options['default_element'] then
						send_command(options['default_element']..' shot') 
					end
				end },
		}  --End SelfCommand
	} --End of Rules	

	CreateRules(sets)
end
-------------------------------------------------------------------------------------------------------------------
-- AutoPilot
-------------------------------------------------------------------------------------------------------------------	
		
function autows()
	if options.autows then
		local jarecast = windower.ffxi.get_ability_recasts()
		local marecast = windower.ffxi.get_spell_recasts()
		
		if player.mp > 90 and player.tp > 999 and player.status == "Engaged" and player.target.distance < 7 then
			send_command('input /ws "Savage Blade" <t>;wait 3;gs c autowsgo')
		else
			send_command('wait 1;gs c autowsgo')
		end
	end
end

-------------------------------------------------------------------------------------------------------------------
-- show_ammo
-------------------------------------------------------------------------------------------------------------------	
	function show_ammo()
		add_to_chat(122, 'Quick Draw Ammo = '..options.ammo.QD)
		add_to_chat(122, 'Weapon Skill Ammo = '..options.ammo.WS)
		add_to_chat(122, 'Ranged Attack Ammo = '..options.ammo.TP)
		add_to_chat(122, 'Magic WS Ammo = '..options.ammo.Cheap)
	end

	windower.register_event('action',function (act)
		if act.actor_id == windower.ffxi.get_player().id and act.category == 6 and ((act.param > 96 and act.param < 124) or (act.param > 301 and act.param < 306) or (act.param > 389 and act.param < 392)) then
			local action = act.targets[#act.targets]
			action = action.actions[#action.actions]
			HUD.Data['RollValue'] = string.format('%2d', action.param)
			if RollValue == 11 then
				last11 = lastRollName
			end
		end
	end)

buff_change = function(name,gain,buff_table)
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
