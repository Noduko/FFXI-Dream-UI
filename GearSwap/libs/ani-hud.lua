class = function()
    return true
end -- ani told me to put this here because the class() function in libs/images.lua isn't defined or a dependance is missing. . . if there are problems in thefuture consider this line suspect

prims = require('images')
flags = {}
LastSC = {}
element = {}

attacks = 0
hits = 0
trend = {}
trend_write_pos = 0

HUD = {
    Create = function(t)
        merge = function(t1, t2)
            for k, v in pairs(t2) do
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
            textSettings = {
                flags = {
                    draggable = false
                },
                bg = {
                    visible = false
                }
            },
            bgSettings = {
                draggable = false
            },
            borderSettings = {
                draggable = false
            },
            Data = {},

            Boxes = {},
            Texts = {}
        }
        Functions = {
            AddBox = function(x, y, w, h, v)
                local box = {}
                box.border = prims.new("", merge({}, HUD.borderSettings))
                -- box.border = prims.new("")
                box.border:pos(HUD.x + x, HUD.y + y)
                box.border:size(w, h)
                box.bg = prims.new("", merge({}, HUD.bgSettings))
                box.bg:pos(HUD.x + x + 2, HUD.y + y + 2)
                box.bg:size(w - 4, h - 4)
                if type(v) == "function" then
                    box.update = function(t)
                        local b = v() or false
                        t.border:visible(b) -- and HUD.visible)
                        t.bg:visible(b) -- and HUD.visible)
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
                    box.update = function()
                    end
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
                    tObj.update = function(t)
                        t.text:text(tostring(HUD.Data[v] or ""))
                    end
                else
                    tObj.update = function()
                    end
                end
                HUD.Texts[#HUD.Texts + 1] = tObj
            end,
            Update = function()
                for _, v in pairs(HUD.Boxes) do
                    v:update()
                end
                for _, v in pairs(HUD.Texts) do
                    v:update()
                end
            end,
            Finish = function()
                local _Data = HUD.Data
                HUD = {
                    Data = {},
                    Boxes = HUD.Boxes,
                    Texts = HUD.Texts,
                    Update = HUD.Update,
                    AutoRefresh = HUD.AutoRefresh,
                    AutoUpdate = HUD.AutoUpdate
                }

                local mt = {
                    __index = function(t, k)
                        return _Data[k]
                    end,

                    __newindex = function(t, k, v)
                        _Data[k] = v
                        HUD.Update()
                    end
                }
                setmetatable(HUD.Data, mt)
            end
        }
        merge(HUD, Settings)
        merge(HUD, Functions)
        merge(HUD, t)
    end
}

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

windower.register_event('action', function(act)

    if act.category == 3 or act.category == 4 or act.category == 11 then -- WS
        local actor = windower.ffxi.get_mob_by_id(act.actor_id)
    end

    if act.actor_id == windower.ffxi.get_player().id then
        if act.category == 1 then
            for i = 1, act.targets[1].action_count do
                if act.targets[1].actions[i].message == 1 or act.targets[1].actions[i].message == 67 then
                    swing(true)
                else
                    swing(false)
                end
            end
        elseif act.category == 2 then
            for i = 1, act.targets[1].action_count do
                if act.targets[1].actions[i].message == 354 then
                    swing(false)
                else
                    swing(true)
                end
            end
        end
    end
end)
