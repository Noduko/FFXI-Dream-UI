-----------------------MACRO BOOK------------------
-- This is the macro book and set that will be used when you log in.
-- You can change the book and set numbers to your preference.

send_command('input /macro book 2') -- Change to your preferred macro book
send_command('wait 4; input /macro set 10') -- Change to your preferred macro set (default is set 1)
send_command('wait 4; input /lockstyleset 40') -- Change to your preferred lockstyle set (in game under Macros > Edit Equips Set)

function sub_job_change(new, old)
    send_command('wait 3; input /lockstyleset 40') -- Set your lockstyle after sub job change
end

-----------------------BINDING------------------
-- This section binds keys to specific actions or commands.
-- For example, you can set CTRL+F1 to equip your TP Normal set or CTRL+12 to use your Warp ring.
-- E.g. "send_command('bind !numpad1 input /ja "Seigan" <me>; wait 1; input /ja "Third Eye" <me>')" to trigger Seigan and Third Eye with a single key press.


-- JA--
send_command('bind !numpad1 input /ja "Seigan" <me>; wait 1; input /ja "Third Eye" <me>')
send_command('bind !numpad2 input /ja "Third Eye" <me>')
send_command('bind !numpad3 input /ja "Provoke" <t>')

-- GEAR--
-- This section binds keys to equip specific gear sets.
-- E.g. "send_command('bind ^f1 gs c equip TP.Normal set')" will send the message "equip TP.Normal set" to GearSwap when you press CTRL+F1.
-- Under the section "self_command" further down this file, you can define what happens when you send that command.

send_command('bind ^f1 gs c equip TP.Normal set')
send_command('bind ^f2 gs c equip TP.Accuracy set')
send_command('bind ^f3 gs c equip TP.DT set')
send_command('bind ^f4 gs c equip TP.TH set')
send_command('bind ^f5 gs c toggle Idle set')
send_command('bind ^f6 gs c toggle AutoWS')
send_command('bind ^Q gs c toggle WS Accuracy set')

-- OTHER--
send_command(
    'bind ^F9 input /equip L.ring "Echad Ring"; input /echo EXP Ring equiped.; wait 7; input /item "Echad Ring" <me>') -- Bind CTRL+F9 to equip Echad Ring
send_command(
    'bind ^F10 input /equip L.ring "Trizek Ring"; input /echo CP Ring equiped.; wait 7; input /item "Trizek Ring" <me>') -- Bind CTRL+F10 to equip Trizek Ring
send_command(
    'bind ^F11 input /equip L.ring "Dim. Ring (Holla)"; input /echo TELEPORT TO HOLLA IN 10 SECONDS.;wait 12; input /item "Dim. Ring (Holla)" <me>') -- Bind CTRL+F11 to equip Dim. Ring (Holla)


---------------------
------- SETS --------
---------------------

function get_sets()
-- This is where you specify all your sets and modes.
-- TP Set refers to your melee set, Idle Set refers to your out-of-combat set, and WS Set refers to your Weapon Skill set.
-- DT set refers to your Damage Taken set (DMG mitigation), and TH set refers to your Treasure Hunter set.

    include('Modes')

    state = {}
    state.IdleMode = M{'Normal', 'DT'}
    state.EngageMode = M{'Normal', 'Accuracy', 'DT', 'TH'}
    state.AutoWS = M{'Off', 'Tachi: Fudo', 'Tachi: Shoha'} -- Change the Weapon Skills you want to spam automatically when you reach 1000 TP.

    update_jobset_display()

    ----------------------- WEAPONS SETS -----------------------	
    -- Replace with your weapons.

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
    -- Replace with your Idle sets and items you want to equip when you are not engaged in combat.

    sets.Idle = {}
    sets.Idle.Normal = {
        ammo = "",
        head = "",
        neck = "",
        body = "",
        hands = "",
        legs = "",
        feet = "",
        left_ear = "",
        right_ear = "",
        left_ring = "",
        right_ring = "",
        waist = "",
        back = ""
    }

    sets.Idle.DT = {
        ammo = "",
        head = "",
        neck = "",
        body = "",
        hands = "",
        legs = "",
        feet = "",
        left_ear = "",
        right_ear = "",
        left_ring = "",
        right_ring = "",
        waist = "",
        back = ""
    }

    ----------------------- TP SETS -----------------------
    -- Replace with your TP sets and items you want to equip when you are engaged in combat.
    
    sets.TP = {}
    sets.TP.Normal = {
        ammo = "",
        head = "",
        neck = "",
        body = "",
        hands = "",
        legs = "",
        feet = "",
        left_ear = "",
        right_ear = "",
        left_ring = "",
        right_ring = "",
        waist = "",
        back = ""
    }

    sets.TP.Accuracy = {
        ammo = "",
        head = "",
        neck = "",
        body = "",
        hands = "",
        legs = "",
        feet = "",
        left_ear = "",
        right_ear = "",
        left_ring = "",
        right_ring = "",
        waist = "",
        back = ""
    }

    sets.TP.DT = {
        ammo = "",
        head = "",
        neck = "",
        body = "",
        hands = "",
        legs = "",
        feet = "",
        left_ear = "",
        right_ear = "",
        left_ring = "",
        right_ring = "",
        waist = "",
        back = ""
    }

   sets.TP.TH_Gear = {
        ammo = "Per. Lucky Egg",
        head = "White Rarab Cap +1",
        waist = "Chaac Belt"
    }

    -- Combine DT (Damage Taken) and TH (Treasure Hunter) sets
    sets.TP.TH = set_combine(sets.TP.DT, sets.TP.TH_Gear)

    sets.FastCast = {
        ammo = "",
        neck = "",
        hands = "",
        left_ear = ""
    }

    sets.Ranged = {
        range = "",
        ammo = ""
    }

    ----------------------- WS SETS -----------------------
    sets.Fudo = {}
    sets.Fudo.Normal = {
        ammo = "",
        head = "",
        neck = "",
        body = "",
        hands = "",
        legs = "",
        feet = "",
        left_ear = "",
        right_ear = "",
        left_ring = "",
        right_ring = "",
        waist = "",
        back = ""
    }

    sets.Fudo.Accuracy = {
        ammo = "",
        head = "",
        neck = "",
        body = "",
        hands = "",
        legs = "",
        feet = "",
        left_ear = "",
        right_ear = "",
        left_ring = "",
        right_ring = "",
        waist = "",
        back = ""
    }

    sets.Shoha = {}
    sets.Shoha.Normal = {
        ammo = "",
        head = "",
        neck = "",
        body = "",
        hands = "",
        legs = "",
        feet = "",
        left_ear = "",
        right_ear = "",
        left_ring = "",
        right_ring = "",
        waist = "",
        back = ""
    }

    sets.Shoha.Accuracy = {
        ammo = "",
        head = "",
        neck = "",
        body = "",
        hands = "",
        legs = "",
        feet = "",
        left_ear = "",
        right_ear = "",
        left_ring = "",
        right_ring = "",
        waist = "",
        back = ""
    }

    sets.Ageha = {
        ammo = "",
        head = "",
        body = "",
        hands = "",
        legs = "",
        feet = "",
        back = ""
    }

    ----------------------- JOB ABILITY SETS -----------------------
    -- Replace with your Job Abilities and items you want to equip when using them.

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
-- THese are the gear equipments that will be swapped when you cast a spell or use a job ability.

    if spell.type == 'WeaponSkill' and player.tp >= 1000 and player.target.distance < 4.5 then

        if spell.english == 'Tachi: Fudo' then
            equip(sets.Fudo)

        elseif spell.english == 'Tachi: Shoha' then
            equip(sets.Shoha)

        elseif spell.english == 'Tachi: Ageha' then
            equip(sets.Ageha)

        else
            equip(sets.Fudo) -- Your default Weapon Skill set for any other WS
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
-- This function is called after a spell or job ability has been cast so it swaps back to the appropriate Engage or Idle gear set.
    if player.status == 'Engaged' then
        equip(sets.TP[state.EngageMode.value])

    else
        equip(sets.Idle[state.IdleMode.value])
    end

    -- This section is for sending messages to party members (with Auto Translate) when using specific job abilities or spells.
    if spell.name == 'Meikyo Shisui' then
        windower.chat.input('/p ' .. string.char(0xFD, 0x02, 0x02, 0x1F, 0x27, 0xFD) .. ': Do not interrupt skillchain. <call22>')

    elseif spell.name == 'Yaegasumi' then
        windower.chat.input('/p ' .. string.char(0xFD, 0x02, 0x02, 0x2A, 0x2C, 0xFD) .. ' ' .. string.char(0xFD, 0x02, 0x02, 0x15, 0x0E, 0xFD))
    end

end

function status_change(new, old)
-- This function is called when the player's status changes (e.g., from Idle to Engaged or vice versa).

    if new == 'Engaged' then
        equip(sets.TP[state.EngageMode.value])

    else
        equip(sets.Idle[state.IdleMode.value])
    end
end

function self_command(command)
-- This function triggers any actions based on the commands sent from the key bindings or via //gs c <message>.

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
        update_jobset_display()
        windower.chat.input(('/echo -- Idle Set changed to %s --'):format(state.IdleMode.value))
         if player.status ~= 'Engaged' then
            equip(sets.Idle[state.IdleMode.value])
            send_command('@input /lockstyleset 40') -- Lockstyle after Idle set change
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
-- This event automatically uses a Weapon Skill when the player's TP reaches 1000 or more, if AutoWS mode is enabled (default is CTRL+F6, see the binding section).

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
    bg = {alpha = 100, red = 0, green = 0, blue = 5},
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