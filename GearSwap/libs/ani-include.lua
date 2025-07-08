class = function() return true end --ani told me to put this here because the class() function in libs/images.lua isn't defined or a dependance is missing. . . if there are problems in thefuture consider this line suspect
	prims = require('images')
	flags = {}
	LastSC = {}
	element = {}
		
	element['Fire'] = {}
	element['Earth'] = {}
	element['Water'] = {}
	element['Wind'] = {}
	element['Ice'] = {}
	element['Lightning'] = {}
	element['Light'] = {}
	element['Dark'] = {}
	
	element['Fire'].name = 'Fire'
	element['Earth'].name = 'Earth'
	element['Water'].name = 'Water'
	element['Wind'].name = 'Wind'
	element['Ice'].name = 'Ice'
	element['Lightning'].name = 'Lightning'
	element['Light'].name = 'Light'
	element['Dark'].name = 'Dark'
	
	element['Fire'].storm = 'Firestorm'
	element['Earth'].storm = 'Sandstorm'
	element['Water'].storm = 'Rainstorm'
	element['Wind'].storm = 'Windstorm'
	element['Ice'].storm = 'Hailstorm'
	element['Lightning'].storm = 'Thunderstorm'
	element['Light'].storm = 'Aurorastorm'
	element['Dark'].storm = 'Voidstorm'
	
	element['Fire'].weakness = element['Water']
	element['Earth'].weakness = element['Wind']
	element['Water'].weakness = element['Lightning']
	element['Wind'].weakness = element['Ice']
	element['Ice'].weakness = element['Water']
	element['Lightning'].weakness = element['Earth']
	element['Light'].weakness = element['Dark']
	element['Dark'].weakness = element['Light']
	
	if player.main_job == "BLM" or player.main_job == "SCH" or player.main_job == "RDM" or player.main_job == "GEO" or player.main_job == "DRK" or player.sub_job == "BLM" or player.sub_job == "SCH" or player.sub_job == "RDM" then
		element['Fire'].nuke = 'Fire'
		element['Earth'].nuke = 'Stone'
		element['Water'].nuke = 'Water'
		element['Wind'].nuke = 'Aero'
		element['Ice'].nuke = 'Blizzard'
		element['Lightning'].nuke = 'Thunder'
	end
	
	if player.main_job == "SCH" or player.sub_job == "SCH" then
		element['Fire'].helix = 'Pyrohelix'
		element['Earth'].helix = 'Geohelix'
		element['Water'].helix = 'Hydrohelix'
		element['Wind'].helix = 'Anemohelix'
		element['Ice'].helix = 'Cryohelix'
		element['Lightning'].helix = 'Ionohelix'
		element['Light'].helix = 'Luminohelix'
		element['Dark'].helix = 'Noctohelix'
	end
	
	if player.main_job == "GEO" or player.sub_job == "GEO" then
		element['Fire'].geo = 'Fira'
		element['Earth'].geo = 'Stonra'
		element['Water'].geo = 'Watera'
		element['Wind'].geo = 'Aera'
		element['Ice'].geo = 'Blizzara'
		element['Lightning'].geo = 'Thundara'
	end
	
	if player.main_job == "BLM" or player.sub_job == "BLM" then
		element["Fire" ].aga = "Firaga" 
		element["Earth" ].aga = "Stonega" 
		element["Water" ].aga = "Waterga" 
		element["Wind" ].aga = "Aeroga" 
		element["Ice" ].aga = "Blizzaga" 
		element["Lightning" ].aga = "Thundaga" 
	
		element["Fire" ].aja = "Firaja" 
		element["Earth" ].aja = "Stoneja" 
		element["Water" ].aja = "Waterja" 
		element["Wind" ].aja = "Aeroja" 
		element["Ice" ].aja = "Blizzaja" 
		element["Lightning" ].aja = "Thundaja" 
	
		element["Fire" ].ancient = "Flare" 
		element["Earth" ].ancient = "Quake" 
		element["Water" ].ancient = "Flood" 
		element["Wind" ].ancient = "Tornado" 
		element["Ice" ].ancient = "Freeze" 
		element["Lightning" ].ancient = "Burst" 
	end
		
	attacks = 0
	hits = 0
	trend = {}
	trend_write_pos = 0
	
	recast_id = { ["Fire"]=144, ["Blizzard"]=149, ["Aero"]=154, ["Stone"]=159, ["Thunder"]=164, ["Water"]=169, }
		
	HUD = {
		Create = function(t)
				merge = function(t1, t2)
					for k,v in pairs(t2) do 
						if type(v) == 'table' then
							t1[k] = t1[k] or {}
							merge(t1[k], v)
						else
							t1[k] = v 
						end
					end
					return t1
				end
				Settings = {
					textSettings = {flags={draggable=false}, bg = {visible = false}},
					bgSettings = {draggable = false,},
					borderSettings = {draggable = false,},
					Data = {},
					
					Boxes = {},
					Texts = {},	
				}
				Functions = {
					AddBox = function(x, y, w, h, v)
							local box = {}
							box.border = prims.new("", merge({}, HUD.borderSettings))
							--box.border = prims.new("")
							box.border:pos(HUD.x + x, HUD.y + y)
							box.border:size(w, h)
							box.bg = prims.new("", merge({}, HUD.bgSettings))
							box.bg:pos(HUD.x + x + 2, HUD.y + y + 2)
							box.bg:size(w - 4, h - 4)
							if type(v) == "function" then
								box.update = function(t)
										local b = v() or false
										t.border:visible(b) --and HUD.visible)
										t.bg:visible(b) --and HUD.visible)
									end
							elseif type(v) == "string" then
								box.update = function(t) 
										t.border:visible(HUD.Data[v] or false)
										t.bg:visible(HUD.Data[v] or false)
									end
							else
								if v then
									box.border:show()
									box.bg:show()
								end
								box.update = function() end
							end
							HUD.Boxes[#HUD.Boxes + 1] = box
						end,
					AddText = function(t, x, y, s, c, v)
							local tObj = {}
							tObj.text = texts.new(t, merge({}, (HUD.textSettings)))
							tObj.text:pos(HUD.x + x, HUD.y + y)
							tObj.text:size(s or 20)
							tObj.text:show()
							if c then
								tObj.text:color(c[1], c[2], c[3])
							end
							if type(v) == "function" then
								tObj.update = function(t)
										local tex
										local col 
										tex, col = v()
										t.text:text(tostring(tex or ""))
										if col ~= nil then
											t.text:color(col[1], col[2], col[3])
										end
									end
							elseif type(v) == "string" then
								tObj.update = function(t) t.text:text(tostring(HUD.Data[v] or "")) end
							else
								tObj.update = function() end
							end
							HUD.Texts[#HUD.Texts + 1] = tObj
						end,
					Update = function()
							for _,v in pairs(HUD.Boxes) do
								v:update()
							end
							for _,v in pairs(HUD.Texts) do
								v:update()
							end
						end,
					Finish = function()
							local _Data = HUD.Data
							HUD = {Data = {}, Boxes = HUD.Boxes, Texts = HUD.Texts, Update = HUD.Update, AutoRefresh = HUD.AutoRefresh, AutoUpdate = HUD.AutoUpdate}
							
							local mt = {
								__index = function (t,k)
										return _Data[k]
									end,
							
								__newindex = function (t,k,v)
										_Data[k] = v
										HUD.Update()
									end
							}
							setmetatable(HUD.Data, mt)
						end,
				}
				merge(HUD, Settings)
				merge(HUD, Functions)
				merge(HUD, t)
			end,
	}	
		
	function CreateRules(sets)
		local helper_functions = {
			Create = function()
				convert_debuffs_to_healing = function(spell)
					--print(spell.skill..': '..spell.target.type)
					retarget(spell)
					if spell.skill == 'Enfeebling Magic' and (spell.target.type == 'PLAYER' or spell.target.type == 'SELF') and (player.main_job == 'WHM' or player.sub_job == 'WHM' or buffactive['addendum: white']) then
						if spell.english == "Paralyze" or spell.english == "Paralyze II" then
							send_command('input /ma "Paralyna" '..spell.target.name..';')
							cancel_spell()
							return
						elseif spell.english == "Dia II" or spell.english == "Dia" or spell.english == "Dia III" then
							send_command('input /ma "Erase" '..spell.target.name..';')
							cancel_spell()
							return
						elseif spell.english == "Slow" then
							if spell.target.type == 'SELF' then
								send_command('input /ma "Esuna" <me>;')
								cancel_spell()
								return
							else
								send_command('input /ma "Sacrifice" '..spell.target.name..';')
								cancel_spell()
								return
							end
						elseif spell.english == "Silence" then
							if spell.target.type == 'SELF' and buffactive['silence'] then
								send_command('input /item "Echo Drops" <me>;')
								cancel_spell()
								return
							elseif spell.target.type == 'PLAYER' then
								send_command('input /ma "Silena" '..spell.target.name..';')
								cancel_spell()
								return
							end
						elseif spell.english == "Blind" or spell.english == "Blind II" then
							send_command('input /ma "Blindna" '..spell.target.name..';')
							cancel_spell()
							return
						elseif spell.english == "Poison" or spell.english == "Poison II" then
							send_command('input /ma "Poisona" '..spell.target.name..';')
							cancel_spell()
							return
						elseif spell.english == "Break" then
							send_command('input /ma "Stona" '..spell.target.name..';')
							cancel_spell()
							return
						elseif spell.english == "Gravity" or spell.english == "Gravity II" then
							send_command('input /ma "Cursna" '..spell.target.name..';')
							cancel_spell()
							return
						elseif spell.english == "Addle" or spell.english == "Addle II" or spell.english == "Bind" then
							send_command('input /ma "Viruna" '..spell.target.name..';')
							cancel_spell()
							return
						end
					end
					return
				end
	
				equip_weather_benefits = function(spell)
					if spell.element == world.day_element or spell.element == world.weather_element then
						obiSet = { back="Twilight Cape", waist = element[spell.element].obi	}
						if spell.element == world.day_element and spell.skill == "Elemental Magic" then
							obiSet.rring="Zodiac Ring"
						end
						equip(obiSet) 
					end
				end
			
				calcHPdown = function(spell)
					if spell.target.isallymember then
						party = windower.ffxi.get_party()
						--printTable(party, "")
						for k, v in pairs(party) do
							
							if type(v) ~= "number" and v.mob ~= nil then
								
								if v.mob.name == spell.target.name then
									return ((v.hp / (v.hpp / 100)) - v.hp) 
								end
							end
						end
					else
						return 2000 - (2000 * spell.target.hpp / 100) 
					end
					return 2000 - (2000 * spell.target.hpp / 100) 
				end
	
				retarget = function(spell)
					--add_to_chat(122,'retarget')
					if spell.target.type == "MONSTER" and ( (spell.skill == "Enhancing Magic" or spell.skill == "Healing Magic") or (spell.skill=="Enfeebling Magic" and player.status == "Engaged" and spell.target.raw == "<t>") ) then
						--add_to_chat(122,'retarget true')
						spell.cancel = true
						send_command('input /ma "'..spell.name..'" <st>')
					end
				end
	
				display_sleep_timer = function(spell)
					if spell.english == 'Sleep' then
						windower.send_command(string.format('timers create "%s (%s)" 60 down spells/00253.png',spell.target.name, spell.target.id:hex():slice(-3)))
					elseif spell.english == 'Sleep II' then
						windower.send_command(string.format('timers create "%s (%s)" 90 down spells/00259.png',spell.target.name, spell.target.id:hex():slice(-3)))
					elseif spell.english == 'Sleepga' then
						windower.send_command(string.format('timers create "%s (%s)" 60 down spells/00273.png',spell.target.name, spell.target.id:hex():slice(-3)))
					elseif spell.english == 'Sleepga II' then
						windower.send_command(string.format('timers create "%s (%s)" 90 down spells/00274.png',spell.target.name, spell.target.id:hex():slice(-3)))
					elseif spell.english == 'Break' then
						windower.send_command(string.format('timers create "%s (%s)" 30 down spells/00255.png',spell.target.name, spell.target.id:hex():slice(-3)))
					elseif spell.english == 'Breakga' then
						windower.send_command(string.format('timers create "%s (%s)" 90 down spells/00365.png',spell.target.name, spell.target.id:hex():slice(-3)))
					end
				end
				
				grimoire_up = function(spell) 
					return (buffactive['Light Arts'] and spell.type == "WhiteMagic") or (buffactive['Dark Arts'] and spell.type == "BlackMagic") 
				end
							
			end,
			
			Destroy = function()
				convert_debuffs_to_healing = nil
				lower_cure_tier = nil
				equip_weather_benefits = nil
				calcHPdown = nil
				retarget = nil
				display_sleep_timer = nil
			end
		}
		local builder_functions = {
			Create = function()
				local function is_condition(key)
					return key == 'command' or key == 'spell' or key == 'status' or key == 'when' or key == 'interrupted' or
								key == 'advanced' or key == 'skill' or key == 'spelltype' or key == 'subjob' or key == 'useobi' or key == 'daymatch' or key == 'weathermatch' or
								key == 'spelltargettype' or key == 'buffactive' or key == 'flag' or key == 'notflag' or key == "petstatus"
				end
	
				local function is_gear(key)
					key = key:lower()
					return key == 'main' or key == 'sub' or key == 'range' or key == 'ranged' or key == 'ammo' or
								 key == 'head' or key == 'neck' or key == 'lear' or key == 'left_ear' or key == 'rear' or key == 'right_ear' or
								 key == 'body' or key == 'hands' or key == 'lring' or key == 'left_ring' or key == 'rring' or key == 'right_ring' or
								 key == 'back' or key == 'waist' or key == 'legs' or key == 'feet'
				end
				
				local function create_boolean_function(key, value)
					key = key:lower()
					if key == 'command' then
						return function(spell) 
							--add_to_chat(122,tostring(key)..' == '..tostring(value)..': '..tostring(spell.action_type)) 
							return spell.action_type == value 
						end
					elseif key == 'spell' then
						if value:startswith('*') then
							local str = string.sub(value, 2)
							return function(spell) 
								--add_to_chat(122,tostring(key)..' ends with == '..str..': '..tostring(spell.english:endswith(str))) 
								return spell.english:endswith(str)
							end
						elseif value:endswith('*') then
							local str = string.sub(value, 1, -2)
							return function(spell) 
								--add_to_chat(122,tostring(key)..' starts with == '..tostring(str)..': '..tostring(spell.english:startswith(str))) 
								return spell.english:startswith(str)
							end
						else
							return function(spell) 
								--add_to_chat(122,tostring(key)..' == '..tostring(value)..': '..tostring(spell.english == value)) 
								return spell.english == value 
							end
						end
					elseif key == 'interrupted' then
						return function(spell) 
							return spell.interrupted == value
						end
					elseif key == 'useobi' then
						return function(spell) 
							local bonus = 0
							if buffactive[element[spell.element].storm] then
								if flags['StormII'] then bonus = bonus + 25
								else bonus = bonus + 10
								end
							elseif buffactive[element[spell.element].weakness.storm] then
								if flags['StormII'] then bonus = bonus - 25
								else bonus = bonus - 10
								end
							elseif world.weather_element == spell.element then
								if world.weather_id % 2 == 0 then
									bonus = bonus + 10
								else
									bonus = bonus + 25
								end
							elseif world.weather_element == element[spell.element].weakness.name then
								if world.weather_id % 2 == 0 then
									bonus = bonus - 10
								else
									bonus = bonus - 25
								end
							end
							if world.day_element == spell.element then
								bonus = bonus + 10
							elseif world.day_element == element[spell.element].weakness.name then
								bonus = bonus - 10
							end
							return (bonus > 0) == value
						end
					elseif key == 'daymatch' then
						return function(spell) 
							return (world.day_element == spell.element) == value
						end
					elseif key == 'weathermatch' then
						return function(spell) 
							return (buffactive[element[spell.element].storm] or world.weather_element == spell.element) == value
						end
					elseif key == 'subjob' then
						return function(spell) 
							return player.sub_job == value
						end
					elseif key == 'petstatus' then
						return function(spell) 
							local playerpet = windower.ffxi.get_player()
							if playerpet and playerpet.index then 
								playerpet = windower.ffxi.get_mob_by_index(playerpet.index)
								if playerpet and playerpet.pet_index then
									playerpet = windower.ffxi.get_mob_by_index(playerpet.pet_index)
									if playerpet.status == 0 then
										return value == "Idle"
									elseif playerpet.status == 1 then
										return value == "Engaged"
									end
								end
							end
							return value == "None"
						end
					elseif key == 'flag' then
						return function(spell) 
							--add_to_chat(122,tostring(key)..'['..tostring(value)..'] == '..tostring(flags[value])) 
							return flags[value] == true
						end
					elseif key == 'notflag' then
						if type(value) == 'table' then
							return function(spell) 
								for _,V in pairs(value) do 
									--add_to_chat(122,tostring(key)..'['..tostring(V)..'] == '..tostring(not flags[V])) 
									if flags[V] == true then
										return false
									end
								end
								return true
							end
						else
							return function(spell) 
								--add_to_chat(122,tostring(key)..'['..tostring(value)..'] == '..tostring(not flags[value])) 
								return flags[value] ~= true
							end
						end
					elseif key == 'spelltargettype' then
						return function(spell) 
							--add_to_chat(122,tostring(key)..' == '..tostring(value)..': '..tostring(spell.english == value)) 
							return spell.target.type == value 
						end
					elseif key == 'skill' then
						--add_to_chat(122,tostring(key)..' == '..tostring(value)) 
						return function(spell) 
							--add_to_chat(122,tostring(key)..' == '..tostring(value)..': '..tostring(spell.skill == value)) 
							return spell.skill == value 
						end
					elseif key == 'spelltype' then
						return function(spell) 
							--add_to_chat(122,tostring(key)..' == '..tostring(value)..': '..tostring(spell.english == value)) 
							return spell.type == value 
						end
					elseif key == 'status' then
						return function(spell) 
							--add_to_chat(122,tostring(key)..' == '..tostring(value)..': '..tostring(player.status == value)) 
							return player.status == value 
						end
					elseif key == 'when' then
						return function(spell) 
							--add_to_chat(122,tostring(key)..' == '..tostring(value)..': '..tostring(spell.phase == value)) 
							return spell.phase == value 
						end
					elseif key == 'advanced' then
						return function(spell) 
							--add_to_chat(122,tostring(key)..' == '..tostring(value)..': '..tostring(value(spell))) 
							return value(spell) 
						end
					elseif key == 'buffactive' then
						return function() 
							--add_to_chat(122,tostring(key)..' == '..tostring(value)..': '..tostring(buffactive[value]))
							return buffactive[value]
						end
					end
				end
	













				
				function create(rule)
					local children = {}
					local conditions = {}
					local gear = {}
					local action = nil
					local check = nil
					local equip_gear = false
					local parse_children = nil
						
					--add_to_chat(122,'~~~ New Rule ~~~')
					if rule['baseset'] ~= nil then
						--add_to_chat(122,'~~~ Base Set ~~~')
						baseset = rule['baseset']
						gear_used = true
						for key,value in pairs(baseset) do 
							--add_to_chat(122,'Key: '..tostring(key)..' Value: '..tostring(value))
							gear[key] = value
						end
						
						rule['baseset'] = nil
					end
					
					for key,value in pairs(rule) do 
						--add_to_chat(122,tostring(key)..' : '..tostring(value))
						if is_gear(key) then
							--print('gear = '..tostring(key)..' : '..tostring(value))
							gear_used = true
							gear[key] = value
						elseif tostring(key) == 'action' then
	
							action = value
							rule[key] = nil
						
						elseif is_condition(key) then
							--add_to_chat(122,'condition = '..tostring(key)..' : '..tostring(value))
							if type(value) == 'table' and key ~= 'notflag' then
								local functionlist = {}
								for K,V in pairs(value) do 
									functionlist[#functionlist+1] = create_boolean_function(key, V)
								end
								conditions[#conditions+1] = function(spell)
									for f=1, #functionlist do
										if functionlist[f](spell) then 
											return true
										end
									end
									return false
								end
							else
								conditions[#conditions+1] = create_boolean_function(key, value)
							end
							rule[key] = nil
						else
							--print('child = '..tostring(key))
							children[#children+1] = value
						end
					end
					
					--add_to_chat(122,'~~~ Final Gear Set ~~~')
					for key,value in pairs(gear) do 
						--add_to_chat(122,'Key: '..tostring(key)..' Value: '..tostring(value))
						rule[key] = value
					end
					
					if action == nil then
						action = function(spell) end
					end
						
					if #conditions == 0 or conditions == nil then
						--add_to_chat(122,'Check: 0')
						check = function(spell)
							return true
						end
					elseif #conditions == 1 then
						--add_to_chat(122,'Check: 1')
						check = conditions[1]
					else
						--add_to_chat(122,'Check: 1+')
						check = function(spell)
							for i=1,#conditions do 
								if conditions[i](spell) == false then
									return false
								end
							end
							return true
						end
					end
					
					if gear_used then
						equip_gear = function()
							--add_to_chat(122, 'Some Gear')
							equip(gear)
						end
					else
						equip_gear = function()
							--add_to_chat(122, 'No Gear')
						end
					end
					
					if #children == 0 then
						parse_children = function(spell) --print('parse_children(0)') 
						end
					elseif #children == 1 then
						children[1] = create(children[1])
						parse_children = function(spell) children[1](spell) end
					else
						for i=1,#children do 
							children[i] = create(children[i])
						end
						parse_children = function(spell)
							--print('parse_children(2)')
							for i=1,#children do 
								children[i](spell)
								if spell.cancel then
									return
								end
							end
						end
					end		
					return function(spell)
						--print('rules(spell)')
						if check(spell) then
							--add_to_chat(122,tostring(action))
							action(spell)
							--add_to_chat(122, 'spell.cancel = '..tostring(spell.cancel))
							if spell.cancel == nil or spell.cancel == false then
								equip_gear()
								parse_children(spell)
							else
								cancel_spell()
							end
						end
					end
				end
			end,
			
			Destroy = function() create = nil end
		}
		
		helper_functions:Create()
		builder_functions:Create()
		local rules = create(sets)
		
		--Function Author:  Byrth
		split = function(msg, match)
			msg = string.lower(msg)
			local length = msg:len()
			local splitarr = {}
			local u = 1
			while u <= length do
				local nextanch = msg:find(match,u)
				if nextanch ~= nil then
					splitarr[#splitarr+1] = msg:sub(u,nextanch-match:len())
					if nextanch~=length then
						u = nextanch+match:len()
					else
						u = lengthlua 
					end
				else
					splitarr[#splitarr+1] = msg:sub(u,length)
					u = length+1
				end
			end 
			return splitarr
		end
		pretarget = function(spell)
			if spell.skill == "Enfeebling Magic" then
				convert_debuffs_to_healing(spell)
			end
		end
		filtered_action = function(spell)
			aftercast({})
		end
		precast = function(spell)
			--add_to_chat(122, '~~~ Precast: Spell = '..spell.english)
			spell.cancel = false
			spell.phase = 'Precast'
			rules(spell)
		end
		midcast = function(spell)
			--add_to_chat(122, '~~~ Midcast: Spell = '..spell.english)
			spell.cancel = false
			spell.phase = 'Midcast'
			rules(spell)
		end
		aftercast = function(spell)
			--add_to_chat(122, '~~~ Aftercast: Spell = '..spell.english)
			spell.cancel = false
			spell.phase = 'Aftercast'
			rules(spell)
		end		
		
		status_change = function(new,old)
			aftercast({})
		end
		
		pet_midcast = function(spell)
			--print("Pet_Midcast")
			spell.cancel = false
			spell.phase = 'Pet_Midcast'
			rules(spell)
		end
		pet_aftercast = function(spell)
			--print("Pet_Aftercast")
			spell.cancel = false
			spell.phase = 'Aftercast'
			rules(spell)
		end
		
		--[[buff_change = function(name,gain,buff_table)
			if (name == "Sneak Attack" or name == "Trick Attack") then
				flags[name] = gain
				if gain == false then
					aftercast({})
				end
			end
		end]]--
		
		builder_functions:Destroy()
	end
	
	function swing(hit)
		trend_write_pos = trend_write_pos + 1
		if trend_write_pos > 30 then
			trend_write_pos = 1
		end
		
		if hit then
			hits = hits + 1
			attacks = attacks + 1
			trend[trend_write_pos] = 1
		else
			attacks = attacks + 1
			trend[trend_write_pos] = 0
		end
		
		HUD.Data['Accuracy'] = math.floor(hits / attacks * 100 - .1)
		HUD.Data['AccTrend'] = math.floor(table.sum(trend) / #trend * 100 - .1)
	end
	
	windower.register_event('action',function (act)
		--print(act.category)
		if act.category == 3 or act.category == 4 or act.category == 11 then -- WS
			local actor = windower.ffxi.get_mob_by_id(act.actor_id)
			-- if actor ~= nil then
			-- 	--if actor ~= nil and actor.in_party or actor.in_alliance then
			-- 		scMSG = act.targets[1].actions[1].add_effect_message
			-- 		if scMSG and scMSG > 287 and scMSG < 303 then
			-- 			setSC(scMSG, act.targets[1].id)
			-- 		elseif act.targets[1].id == LastSC.target and act.category == 3 then
			-- 			LastSC.duration = 0
			-- 		end
			-- 	--end
			-- end
			--[[for k,v in pairs(act.targets) do
				for k2, v2 in pairs(v.actions[1]) do
					print(k, v, k2, v2)
				end
				if v.actions.add_effect_message then
					print(v.actions.add_effect_message)
				end
			end]]--
		end
		if act.actor_id == windower.ffxi.get_player().id then
			if act.category == 1 then
				for i=1,act.targets[1].action_count do
					if act.targets[1].actions[i].message == 1 or act.targets[1].actions[i].message == 67 then
						swing(true)
					else
						swing(false)
					end
				end
			elseif act.category == 2 then
				for i=1,act.targets[1].action_count do
					if act.targets[1].actions[i].message == 354 then
						swing(false)
					else
						swing(true)
					end
				end
			end
		end
	end)
	
	windower.register_event('gain buff', function(buff)
		if buff > 588 and buff < 597 then --storm II
			flags['StormII'] = true
		end
	end)
	
	windower.register_event('lose buff', function(buff)
		if buff > 588 and buff < 597 then --storm II
			flags['StormII'] = false
		end
	end)
	