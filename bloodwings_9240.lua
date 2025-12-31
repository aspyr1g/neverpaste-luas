s_DEBUG = true
local clipboard = require("neverlose/clipboard")
local base64 = require("neverlose/base64")
local anti_aim = require("neverlose/anti_aim")
local http = require("neverlose/http")
local screen_size = render.screen_size()
local x, o = '\x14\x14\x14\xFF', '\x0c\x0c\x0c\xFF'

local pattern = table.concat{
    x,x,o,x,
    o,x,o,x,
    o,x,x,x,
    o,x,o,x
}


local tex_id = render.load_image_rgba(pattern, vector(4,4))

function RGBAtoHEX(redArg, greenArg, blueArg, alphaArg)
    return string.format('%.2x%.2x%.2x%.2x', redArg, greenArg, blueArg, alphaArg)
end

local var_table = {};

local prev_simulation_time = 0

local function time_to_ticks(t)
    return math.floor(0.5 + (t / globals.tickinterval ))
end

local diff_sim = 0

function var_table:sim_diff() 
    local lp = entity.get_local_player()
    if lp == nil then return 0 end
    if not lp:is_alive() then return 0 end
    local current_simulation_time = time_to_ticks(lp["m_flSimulationTime"])
    local diff = current_simulation_time - prev_simulation_time
    prev_simulation_time = current_simulation_time
    diff_sim = diff
    return diff_sim
end

function text_fade_animation(speed, r, g, b, a, text)
    local final_text = ''
    local curtime = globals.curtime()
    for i=0, #text do
        local color = RGBAtoHEX(r, g, b, a*math.abs(1*math.cos(2*speed*curtime/4+i*5/30)))
        final_text = final_text..'\a'..color..text:sub(i, i)
    end
    return final_text
end

function text_fade_animation_guwno(speed, r, g, b, a, text)
    local final_text = ''
    local curtime = globals.curtime()
    for i = 0, #text do
        local color = RGBAtoHEX(r, g, b, a * math.abs(1 * math.cos(2 * speed * curtime / 4 - i * 5 / 30)))
        final_text = final_text .. '\a' .. color .. text:sub(i, i)
    end
    return final_text
end

function gradient_text(text, speed, r,g,b,a)
    local final_text = ''
    local curtime = globals.curtime
    local center = math.floor(#text / 2) + 1  -- calculate the center of the text
    for i=1, #text do
        -- calculate the distance from the center character
        local distance = math.abs(i - center)
        -- calculate the alpha based on the distance and the speed and time
        a = 255 - math.abs(255 * math.sin(speed * curtime / 4 - distance * 4 / 20))
        local col = RGBAtoHEX(r,g,b,a)
        final_text = final_text .. '\a' .. col .. text:sub(i, i)
    end
    return final_text
end

local main_ref = ui.create("\adec3c3ff"..ui.get_icon("house-user"), "LUA", nil)
local info_ref = ui.create("\adec3c3ff"..ui.get_icon("house-user"), "information", nil)
local links_ref = ui.create("\adec3c3ff"..ui.get_icon("house-user"), "links", 2)
local config_ref = ui.create("\adec3c3ff"..ui.get_icon("house-user"), "configuration", 2)
local antiaim_ref = ui.create("\adec3c3ff"..ui.get_icon("shield-quartered"), "Settings", nil)
local builder_ref = ui.create("\adec3c3ff"..ui.get_icon("shield-quartered"), "Builder", nil)
local defensive_ref = ui.create("\adec3c3ff"..ui.get_icon("shield-quartered"), "Defensive", nil) 
local visuals_ref = ui.create("\adec3c3ff"..ui.get_icon("sparkles"), "Visuals", nil)
local misc_ref = ui.create("\adec3c3ff"..ui.get_icon("sparkles"), "Misc", nil)


main_ref:texture(render.load_image(network.get("https://i.imgur.com/EG1BhCn.png"), vector(270, 280)), vector(270, 280), color(255, 255, 255, 255), 'f')
label_anim = info_ref:label(".")
info_ref:label("\adec3c3ff" .. ui.get_icon("user") .. "\aFFFFFFFF Username: \adec3c3ff" .. common.get_username())--:create():color_picker("Accent Color", color(222, 195, 195, 255))
info_ref:label("\adec3c3ff" .. ui.get_icon("wand-magic-sparkles") .. "\aFFFFFFFF Build: \adec3c3ffRecode")
links_ref:button("\adec3c3ff         "..ui.get_icon("star").. " \aFFFFFFFFMain cfg        ", function()
    panorama.Open.SteamOverlayAPI.OpenExternalBrowserURL("https://en.neverlose.cc/market/item?id=Mmx615")
end, true)

local conditions_a = {"General","Stand","Slow walk","Move","Duck","Aerobic","Aerobic+"}

local Settings = {
    antiaim = {
        freestanding = antiaim_ref:switch("Freestanding"),
        avoidback = antiaim_ref:switch("Anti backstab"),
        yaw_base = antiaim_ref:combo("Yaw base", {"Local view","At target"}),
        antiaimy = builder_ref:combo("", conditions_a),
        delayek = false,
        manuals = antiaim_ref:switch("Manual Anti-Aim"),
    },

    visuals = {
        ind = visuals_ref:switch("Crosshair indicators"),


        watermark = visuals_ref:switch("Watermark"),


        defensive_panel = visuals_ref:switch("Defensive indicator"),
        slowed_down_panel = visuals_ref:switch("Slowed-down indicator"),
        hitlogs = visuals_ref:switch("Hitlogs"),
        aspect_ratio = visuals_ref:switch("Aspect ratio"),
        viewmodel_custom = visuals_ref:switch("Custom Viewmodel"),
        antiaim_arrows = visuals_ref:switch("Anti-aim Arrows"),
        menu_border = visuals_ref:switch("500$ Menu border"),
    },

    misc = {
        nade_throw = misc_ref:switch("Nade throw fix"),
        clantag = misc_ref:switch("Clan-tag"),
        lagswitch = misc_ref:switch("Lag-switch"),
        pingspike_limit = misc_ref:switch("Unlock Fake Latency"),
        hc_override = misc_ref:switch("Hitchance override"),
        trashtalk = misc_ref:switch("Trashtalk"),
    },
}

--create
manual_left = Settings.antiaim.manuals:create():switch("Left (BIND)")
manual_right = Settings.antiaim.manuals:create():switch("Right (BIND)")
ind_set_style = Settings.visuals.ind:create():combo("Style", {"#1", "#2"})
ind_set_mod = Settings.visuals.ind:create():selectable("Modification", {"In scope", "Animated"})
ind_set_color = Settings.visuals.ind:create():color_picker("Color", color(222, 195, 195, 255))
watermark_style = Settings.visuals.watermark:create():combo("Style", {"Normal", "Modern", "500$", "Shoppy.gg"})
watermark_options = Settings.visuals.watermark:create():selectable("Options", {"fps", "ping", "time"})
watermark_options_2 = Settings.visuals.watermark:create():combo("Options", {"Avatar", "Flag"})
watermark_color = Settings.visuals.watermark:create():color_picker("Color", color(222, 195, 195, 255))
defensive_color = Settings.visuals.defensive_panel:create():color_picker("Color", color(222, 195, 195, 255))
slowed_down_color = Settings.visuals.slowed_down_panel:create():color_picker("Color", color(222, 195, 195, 255))
hitlogs_type = Settings.visuals.hitlogs:create():selectable("Type", {"On screen", "Under crosshair"})
hitlogs_style = Settings.visuals.hitlogs:create():combo("Style", {"Default", "Skeet"})
hitlogs_color = Settings.visuals.hitlogs:create():color_picker("Color", color(222, 195, 195, 255))
aspect_ratio_value = Settings.visuals.aspect_ratio:create():slider("value",0, 200, 150, 0.01)
viewmodel_fov = Settings.visuals.viewmodel_custom:create():slider("Fov", 0, 100)
viewmodel_x = Settings.visuals.viewmodel_custom:create():slider("X", -10, 10, 0)
viewmodel_y = Settings.visuals.viewmodel_custom:create():slider("Y", -10, 10, 0)
viewmodel_z = Settings.visuals.viewmodel_custom:create():slider("Z", -10, 10, 0)
lag_switch_value = Settings.misc.lagswitch:create():slider("Delay", 1, 15, 9)
hc_override_type = Settings.misc.hc_override:create():selectable("Condition", {"No scope", "In air"})
hc_override_value = Settings.misc.hc_override:create():slider("Hitchance", 1, 100, 40)
arrows_antiaim_color =  Settings.visuals.antiaim_arrows:create():color_picker("Color", color(222, 195, 195, 255))
--trahstalk = Settings.misc.trashtalk:create():switch("Left (BIND)")
--

for a, b in pairs(conditions_a) do
    Settings.antiaim[a] = {
        enable = builder_ref:switch("Enable \adec3c3ff".. conditions_a[a] , false),
        pitch_x = builder_ref:combo("Pitch", {"Disabled", "Down", "Fake Up", "Fake Down"}),
        yaw = builder_ref:combo("Yaw", {"Disabled", "Backward", "Static"}),
        yaw_add_left = builder_ref:slider("Yaw add left", -180, 180, 0),
        yaw_add_right = builder_ref:slider("Yaw add right", -180, 180, 0),
        jitter_type = builder_ref:combo("Yaw jitter", {"Disabled", "Center", "Offset", "Random", "Spin", "3-Way", "5-Way"}),
        jitter_add = builder_ref:slider("Yaw jitter value", -180, 180, 0),
        fake_yaw_limit = builder_ref:slider("Fake-yaw limit", 0, 60, 0),
        delay = builder_ref:slider("Delay", 0, 10, 0, 1),


        def_enable = defensive_ref:switch("Enable \adec3c3ff".. conditions_a[a] , false),
        def_pitch = defensive_ref:combo("Pitch", {"Disabled", "Down", "Fake Up", "Fake Down"}),
        def_yaw = defensive_ref:combo("Yaw", {"Disabled", "Backward", "Static"}),
        def_preset = defensive_ref:combo("Preset", {"Disabled", "Force Defensive"}),
        def_yaw_add = defensive_ref:slider("Yaw Add", -180, 180, 0),
        def_jitter_type = defensive_ref:combo("Yaw jitter", {"Disabled", "Center", "Offset", "Random", "Spin", "3-Way", "5-Way"}),
        def_jitter_add = defensive_ref:slider("Yaw jitter value", -180, 180, 0),
    }
end

lol = 0
haha = 0
lolp = math.random(1, 5)

config_ref:button("\adec3c3ff  ".. ui.get_icon("file-export") .. " \aFFFFFFFFExport  ", function()
    local settings = {}
    for key, value in pairs(conditions_a) do
        settings[key] = {}
        for k, v in pairs(Settings.antiaim[key]) do 
            settings[key][k] = v:get()
        end
    end
    clipboard.set(base64.encode(json.stringify(settings)))
end, true)

config_ref:button("\adec3c3ff  ".. ui.get_icon("file-import") .. " \aFFFFFFFFImport", function()
    import_cfg()
end, true)

function import_cfg(input)
    local config = base64.decode(input ~= nil and input or clipboard.get())
    config = json.parse(config)

    for key, value in pairs(conditions_a) do
        for k, v in pairs(Settings.antiaim[key]) do
            v:set(config[key][k])
        end
    end
end

config_ref:button("\adec3c3ff  ".. ui.get_icon("file-pen") .. " \aFFFFFFFFDefault  ", function()
    import_cfg("W3siZGVmX2VuYWJsZSI6ZmFsc2UsImRlZl9qaXR0ZXJfYWRkIjowLjAsImRlZl9qaXR0ZXJfdHlwZSI6IkRpc2FibGVkIiwiZGVmX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZfcHJlc2V0IjoiRGlzYWJsZWQiLCJkZWZfeWF3IjoiRGlzYWJsZWQiLCJkZWZfeWF3X2FkZCI6MC4wLCJkZWxheSI6MC4wLCJlbmFibGUiOmZhbHNlLCJmYWtlX3lhd19saW1pdCI6MC4wLCJqaXR0ZXJfYWRkIjowLjAsImppdHRlcl90eXBlIjoiRGlzYWJsZWQiLCJwaXRjaF94IjoiRGlzYWJsZWQiLCJ5YXciOiJEaXNhYmxlZCIsInlhd19hZGRfbGVmdCI6MC4wLCJ5YXdfYWRkX3JpZ2h0IjowLjB9LHsiZGVmX2VuYWJsZSI6ZmFsc2UsImRlZl9qaXR0ZXJfYWRkIjowLjAsImRlZl9qaXR0ZXJfdHlwZSI6IkRpc2FibGVkIiwiZGVmX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZfcHJlc2V0IjoiRGlzYWJsZWQiLCJkZWZfeWF3IjoiRGlzYWJsZWQiLCJkZWZfeWF3X2FkZCI6MC4wLCJkZWxheSI6MC4wLCJlbmFibGUiOnRydWUsImZha2VfeWF3X2xpbWl0Ijo2MC4wLCJqaXR0ZXJfYWRkIjotODQuMCwiaml0dGVyX3R5cGUiOiJDZW50ZXIiLCJwaXRjaF94IjoiRG93biIsInlhdyI6IkJhY2t3YXJkIiwieWF3X2FkZF9sZWZ0IjowLjAsInlhd19hZGRfcmlnaHQiOjAuMH0seyJkZWZfZW5hYmxlIjpmYWxzZSwiZGVmX2ppdHRlcl9hZGQiOjAuMCwiZGVmX2ppdHRlcl90eXBlIjoiRGlzYWJsZWQiLCJkZWZfcGl0Y2giOiJEaXNhYmxlZCIsImRlZl9wcmVzZXQiOiJEaXNhYmxlZCIsImRlZl95YXciOiJEaXNhYmxlZCIsImRlZl95YXdfYWRkIjowLjAsImRlbGF5Ijo2LjAsImVuYWJsZSI6dHJ1ZSwiZmFrZV95YXdfbGltaXQiOjAuMCwiaml0dGVyX2FkZCI6MTA4LjAsImppdHRlcl90eXBlIjoiRGlzYWJsZWQiLCJwaXRjaF94IjoiRG93biIsInlhdyI6IkJhY2t3YXJkIiwieWF3X2FkZF9sZWZ0IjozMS4wLCJ5YXdfYWRkX3JpZ2h0IjotMjIuMH0seyJkZWZfZW5hYmxlIjpmYWxzZSwiZGVmX2ppdHRlcl9hZGQiOjAuMCwiZGVmX2ppdHRlcl90eXBlIjoiRGlzYWJsZWQiLCJkZWZfcGl0Y2giOiJEaXNhYmxlZCIsImRlZl9wcmVzZXQiOiJEaXNhYmxlZCIsImRlZl95YXciOiJEaXNhYmxlZCIsImRlZl95YXdfYWRkIjowLjAsImRlbGF5Ijo3LjAsImVuYWJsZSI6dHJ1ZSwiZmFrZV95YXdfbGltaXQiOjAuMCwiaml0dGVyX2FkZCI6MC4wLCJqaXR0ZXJfdHlwZSI6IkRpc2FibGVkIiwicGl0Y2hfeCI6IkRvd24iLCJ5YXciOiJCYWNrd2FyZCIsInlhd19hZGRfbGVmdCI6LTExLjAsInlhd19hZGRfcmlnaHQiOjIzLjB9LHsiZGVmX2VuYWJsZSI6ZmFsc2UsImRlZl9qaXR0ZXJfYWRkIjowLjAsImRlZl9qaXR0ZXJfdHlwZSI6IkRpc2FibGVkIiwiZGVmX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZfcHJlc2V0IjoiRGlzYWJsZWQiLCJkZWZfeWF3IjoiRGlzYWJsZWQiLCJkZWZfeWF3X2FkZCI6MC4wLCJkZWxheSI6Ni4wLCJlbmFibGUiOnRydWUsImZha2VfeWF3X2xpbWl0IjoxMC4wLCJqaXR0ZXJfYWRkIjowLjAsImppdHRlcl90eXBlIjoiRGlzYWJsZWQiLCJwaXRjaF94IjoiRG93biIsInlhdyI6IkJhY2t3YXJkIiwieWF3X2FkZF9sZWZ0IjotNy4wLCJ5YXdfYWRkX3JpZ2h0IjoxMi4wfSx7ImRlZl9lbmFibGUiOmZhbHNlLCJkZWZfaml0dGVyX2FkZCI6MC4wLCJkZWZfaml0dGVyX3R5cGUiOiJEaXNhYmxlZCIsImRlZl9waXRjaCI6IkRpc2FibGVkIiwiZGVmX3ByZXNldCI6IkRpc2FibGVkIiwiZGVmX3lhdyI6IkRpc2FibGVkIiwiZGVmX3lhd19hZGQiOjAuMCwiZGVsYXkiOjcuMCwiZW5hYmxlIjp0cnVlLCJmYWtlX3lhd19saW1pdCI6MC4wLCJqaXR0ZXJfYWRkIjowLjAsImppdHRlcl90eXBlIjoiRGlzYWJsZWQiLCJwaXRjaF94IjoiRG93biIsInlhdyI6IkJhY2t3YXJkIiwieWF3X2FkZF9sZWZ0IjotMjMuMCwieWF3X2FkZF9yaWdodCI6MzEuMH0seyJkZWZfZW5hYmxlIjpmYWxzZSwiZGVmX2ppdHRlcl9hZGQiOjAuMCwiZGVmX2ppdHRlcl90eXBlIjoiRGlzYWJsZWQiLCJkZWZfcGl0Y2giOiJEaXNhYmxlZCIsImRlZl9wcmVzZXQiOiJEaXNhYmxlZCIsImRlZl95YXciOiJEaXNhYmxlZCIsImRlZl95YXdfYWRkIjowLjAsImRlbGF5Ijo4LjAsImVuYWJsZSI6dHJ1ZSwiZmFrZV95YXdfbGltaXQiOjAuMCwiaml0dGVyX2FkZCI6MC4wLCJqaXR0ZXJfdHlwZSI6IkRpc2FibGVkIiwicGl0Y2hfeCI6IkRvd24iLCJ5YXciOiJCYWNrd2FyZCIsInlhd19hZGRfbGVmdCI6LTE1LjAsInlhd19hZGRfcmlnaHQiOjIyLjB9XQ==")
end, true)
local download
local function downloadFile()
	http.get(string.format("https://flagcdn.com/w160/%s.png", panorama.MyPersonaAPI.GetMyCountryCode():lower()), function(success, response)
		if not success or response.status ~= 200 then
			print("couldnt fetch the flag image")
            return
		end

		--download = response.body
        download = render.load_image(response.body, vector(25,16.8))
	end)
end
downloadFile()

function desync_delta()
    local desync_rotation = rage.antiaim:get_rotation(true)
    local real_rotation = rage.antiaim:get_rotation()
    local delta_to_draw = math.min(math.abs(real_rotation - desync_rotation) / 2, 60)
    return string.format("%.1f", delta_to_draw)
end
local fake_desync = desync_delta()
local currentTime = globals.curtime

local function get_mode()
    local lp = entity.get_local_player()
    if not lp:is_alive() then return end 
    local vecvelocity = lp['m_vecVelocity'] 
    local velocity = math.sqrt(vecvelocity.x ^ 2 + vecvelocity.y ^ 2)
    local on_ground = bit.band(lp['m_fFlags'], 1) == 1
    local not_moving = velocity < 2

    local slowwalk_key = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"):get()
    local teamnum = lp['m_iTeamNum']
    
    if not on_ground then
        return (lp['m_flDuckAmount'] > 0.7) and 7 or 6
    else
        if (lp['m_flDuckAmount'] > 0.7) then
            return 5 
        elseif not_moving then
            return 2
        elseif not not_moving then
            if slowwalk_key then
                return 3
            else
                return 4
            end
        end
    end
end

local last_execution = 0

function contains(tbl, val) 
    for i=1, #tbl do
        if tbl[i] == val then return true end 
    end 
    return false 
end

local ind_add_x = 0
local ind_add_x_gowno = 0
local ind_add_x_guwno_test = 0
local ind_add_x_state = 0
local ind_y = 0
local draw_ticks = 0
local draw = "no"

lerp = function(a, b, t)
    return a + (b - a) * t
end

function calculatePercentage(ticks, przez)
    local percentage = (ticks / przez) * 100
    return percentage
end

local last_sim_time = 0
local defensive_until = 0

local notify_lol = {}

function render_ogskeet_border(x,y,w,h,a,text)
    render.rect(vector(x - 10, y - 48), vector(x - 10 + w + 20, y - 48 + h + 16), color(12,12,12,a), 0, false)
    render.rect(vector(x - 9, y - 47), vector(x - 9 + w + 18, y - 47 + h + 14), color(60,60,60,a), 0, false)
    render.rect(vector(x - 8, y - 46), vector(x - 8 + w + 16, y - 46 + h + 12), color(40,40,40,a), 0, false)
    render.rect(vector(x - 5, y - 43), vector(x - 5 + w + 10, y - 43 + h + 6), color(60,60,60,a), 0, false)
    render.rect(vector(x - 4, y - 42), vector(x - 4 + w + 8, y - 42 + h + 4), color(12,12,12,a), 0, false)
    render.texture(tex_id, vector(x - 4, y - 42), vector(w + 8, h + 4), color(255, 255, 255, a), "r")
    render.gradient(vector(x - 4,y - 42), vector(x - 4 + w /2, y - 42 + 1), color(59, 175, 222, 255), color(202, 70, 205, 255), color(59, 175, 222, 255), color(202, 70, 205, 255), 0)
    render.gradient(vector(x - 4 + w / 2 ,y - 42), vector(x - 4 + w / 2 + w /2 + 8, y - 42 + 1), color(202, 70, 205, 255), color(204, 227, 53), color(202, 70, 205, 255), color(204, 227, 53), 0)
    render.text(1, vector(x, y - 40), color(255,255,255,230), "", text)
end

local clantags = {
        'B',
	'Bl',
	'Blo',
	'Bloo',
	'Blood',
	'BloodW',
	'BloodWi',
	'BloodWin',
	'BloodWing',
	'BloodWings',
	'𓆩𓆪BloodWings𓆩𓆪',
	'𓆩𓆪BloodWings𓆩𓆪',
        '∎',
        '∎∎',
        '∎∎∎',
        '∎∎',
        '∎',
	'BloodWings',
	'BloodWing',
	'BloodWin',
	'BloodWi',
	'BloodW',
	'Blood',
	'Bloo',
	'Blo',
	'Bl',
        'B',
        '',
}

local clantag_prev

local save_weapon = ui.find("Miscellaneous", "Main", "Other", "Weapon Actions"):get()
local save_body_yaw_opt = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"):get()

local ctx = (function()
    local ctx = {}

    ctx.renders = {
        glow_module = function(x, y, w, h,elo, r, g, b, a,rounding, gowno, r2,g2,b2)
            render.shadow(vector(x, y), vector(w, h), color(r2,g2,b2,a), elo, 0, 0)
            if gowno then
                render.rect(vector(x -1, y -1 ), vector(w + 2, h + 1), color(r,g,b,a), rounding, true)
            end
        end

    }

    ctx.ogmenu = {
        set = function()
            for a, b in pairs(conditions_a) do
                Settings.antiaim[a].enable:visibility(Settings.antiaim.antiaimy:get() == b)
                Settings.antiaim[a].pitch_x:visibility(Settings.antiaim[a].enable:get() and Settings.antiaim.antiaimy:get() == b)
                Settings.antiaim[a].yaw:visibility(Settings.antiaim[a].enable:get() and Settings.antiaim.antiaimy:get() == b)
                Settings.antiaim[a].yaw_add_left:visibility(Settings.antiaim[a].enable:get() and Settings.antiaim.antiaimy:get() == b and Settings.antiaim[a].yaw:get() ~= "Disabled")
                Settings.antiaim[a].yaw_add_right:visibility(Settings.antiaim[a].enable:get() and Settings.antiaim.antiaimy:get() == b and Settings.antiaim[a].yaw:get() ~= "Disabled")
                Settings.antiaim[a].jitter_type:visibility(Settings.antiaim[a].enable:get() and Settings.antiaim.antiaimy:get() == b)
                Settings.antiaim[a].jitter_add:visibility(Settings.antiaim[a].enable:get() and Settings.antiaim.antiaimy:get() == b and Settings.antiaim[a].jitter_type:get() ~= "Disabled")
                Settings.antiaim[a].fake_yaw_limit:visibility(Settings.antiaim[a].enable:get() and Settings.antiaim.antiaimy:get() == b)
                Settings.antiaim[a].delay:visibility(Settings.antiaim[a].enable:get() and Settings.antiaim.antiaimy:get() == b)
    
                local isPresetEnabled = Settings.antiaim[a].def_preset:get() ~= "Disabled"
                Settings.antiaim[a].def_enable:visibility(Settings.antiaim[a].enable:get() and Settings.antiaim.antiaimy:get() == b and not isPresetEnabled)
                Settings.antiaim[a].def_preset:visibility(Settings.antiaim[a].enable:get() and Settings.antiaim.antiaimy:get() == b and Settings.antiaim[a].def_enable:get())
                Settings.antiaim[a].def_pitch:visibility(Settings.antiaim[a].enable:get() and Settings.antiaim.antiaimy:get() == b and Settings.antiaim[a].def_enable:get() and not isPresetEnabled)
                Settings.antiaim[a].def_yaw_add:visibility(Settings.antiaim[a].enable:get() and Settings.antiaim.antiaimy:get() == b and Settings.antiaim[a].def_enable:get() and not isPresetEnabled)
                Settings.antiaim[a].def_yaw:visibility(Settings.antiaim[a].enable:get() and Settings.antiaim.antiaimy:get() == b and Settings.antiaim[a].def_enable:get() and not isPresetEnabled)
    
                Settings.antiaim[a].def_jitter_type:visibility(Settings.antiaim[a].enable:get() and Settings.antiaim.antiaimy:get() == b and Settings.antiaim[a].def_enable:get() and not isPresetEnabled)
                Settings.antiaim[a].def_jitter_add:visibility(Settings.antiaim[a].enable:get() and Settings.antiaim.antiaimy:get() == b and Settings.antiaim[a].def_enable:get() and Settings.antiaim[a].def_jitter_type:get() ~= "Disabled" and not isPresetEnabled)
            end
            ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"):disabled(true)
        end
    }

    ctx.is_defensive_active = {
        time_to_ticks = function(t) 
            return math.floor(0.5 + (t / globals.tickinterval)) 
        end,
        check = function()
            local tickcount = globals.tickcount
            local sim_time = ctx.is_defensive_active.time_to_ticks(entity.get_local_player()["m_flSimulationTime"])
            local sim_diff = sim_time - last_sim_time

            if sim_diff < 0 then
                defensive_until = tickcount + math.abs(sim_diff) - ctx.is_defensive_active.time_to_ticks(utils.net_channel().latency[1])
            end

            last_sim_time = sim_time

            return defensive_until > tickcount
        end
    }

    ctx.pingspike = {
        limit_remove = function()
            if Settings.misc.pingspike_limit:get() then
                cvar.sv_maxunlag:float(0.4)
            else
                cvar.sv_maxunlag:float(0.2)
            end
        end
    }

    ctx.hitchance_override = {
        run = function(cmd)
            local lp = entity.get_local_player()
            if not lp then return end

            local weapon = lp:get_player_weapon()
            if weapon == nil then return end
            local snipers = weapon:get_weapon_index() == 38 or weapon:get_weapon_index() == 11 or weapon:get_weapon_index() == 9 or weapon:get_weapon_index() == 40
        
            if Settings.misc.hc_override:get() then
                if contains(hc_override_type:get(), "No scope") and snipers and not lp["m_bIsScoped"] then
                    ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"):override(hc_override_value:get())
                end
                if contains(hc_override_type:get(), "In air") and snipers and cmd.in_jump then
                    ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"):override(hc_override_value:get())
                end

                if not (contains(hc_override_type:get(), "No scope") and snipers and not cmd.in_jump and not lp["m_bIsScoped"]) and not (contains(hc_override_type:get(), "In air") and snipers and cmd.in_jump) then
                    ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"):override()
                end
            end
        end
    }

    ctx.antiaim = {
        createmove = function(cmd, state) 
            if Settings.antiaim[state].delay:get() ~= 0 then
                if globals.tickcount % Settings.antiaim[state].delay:get() + 3 == 3 then
                    Settings.antiaim.delayek = not Settings.antiaim.delayek
                end
            else
                bodyyaw = entity.get_local_player().m_flPoseParameter[11] * 120 - 60
                side = bodyyaw > 0 and 1 or -1
            end

            if ctx.is_defensive_active.check() and Settings.antiaim[state].def_enable:get() then
                if Settings.antiaim[state].def_pitch:get()~= "Custom" then
                   ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"):override(Settings.antiaim[state].def_pitch:get())
                else 
                    rage.antiaim:override_hidden_pitch(Settings.antiaim[state].def_custom_pitch:get())
                end

                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"):override(Settings.antiaim[state].def_yaw:get())
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(Settings.antiaim[state].def_yaw_add:get())
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"):override(Settings.antiaim[state].def_jitter_type:get())
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"):override(Settings.antiaim[state].def_jitter_add:get())
                
                local isPresetEnabled = Settings.antiaim[state].def_preset:get() ~= "Disabled"

                if isPresetEnabled then
                    
                    if lol <= 175 then
                        lol = lol + math.random(0,4)
                    else
                        lol = -(lol + 175) + 25
                    end
                    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override((lol))
                    
                end


            else
                ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"):override(Settings.antiaim[state].pitch_x:get())
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"):override(Settings.antiaim[state].yaw:get())
                if Settings.antiaim[state].delay:get() ~= 0 then
                    ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"):reset()
                    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(Settings.antiaim.delayek and Settings.antiaim[state].yaw_add_left:get() or Settings.antiaim[state].yaw_add_right:get())
                else
                    ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"):override(save_body_yaw_opt)
                    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(side == 1 and Settings.antiaim[state].yaw_add_left:get() or Settings.antiaim[state].yaw_add_right:get())
                end
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"):override(Settings.antiaim[state].jitter_type:get())
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"):override(Settings.antiaim[state].jitter_add:get())
                ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"):override(Settings.antiaim[state].fake_yaw_limit:get())
                ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"):override(Settings.antiaim[state].fake_yaw_limit:get())
            end


            if Settings.antiaim.manuals:get() then
                if manual_left:get() then
                    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(-90)
                elseif manual_right:get() then
                    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(90)
                end
            end

            --lag_switch_value
            --Settings.misc.lagswitch
            if Settings.misc.lagswitch:get() then
                local me = entity.get_local_player()
                if me == nil then return end

                local timer = me["m_nTickBase"] % lag_switch_value:get() == 0
                local air = bit.band(me["m_fFlags"], 1) == 0
        
                if air then
                    ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):override(timer)
                else
                    ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):override(false)
                end
            end
        end
    }

    ctx.visuals = {
        render = function()
            if currentTime + 0.38 < globals.curtime then
                currentTime = globals.curtime
                fake_desync = desync_delta()
            end

            lp = entity.get_local_player()

            if not lp then return end

            local aA = {
                {ind_set_color:get().r,ind_set_color:get().g,ind_set_color:get().b, 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime /4 + 80 / 30))},
                {ind_set_color:get().r,ind_set_color:get().g,ind_set_color:get().b, 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime /4 + 75 / 30))},
                {ind_set_color:get().r,ind_set_color:get().g,ind_set_color:get().b, 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime/4 + 70 / 30))},
                {ind_set_color:get().r,ind_set_color:get().g,ind_set_color:get().b, 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime/4 + 65 / 30))},
                {ind_set_color:get().r,ind_set_color:get().g,ind_set_color:get().b, 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime/4 + 60 / 30))},
                {ind_set_color:get().r,ind_set_color:get().g,ind_set_color:get().b, 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime/4 + 55 / 30))},
                {ind_set_color:get().r,ind_set_color:get().g,ind_set_color:get().b, 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime/4 + 50 / 30))},
                {ind_set_color:get().r,ind_set_color:get().g,ind_set_color:get().b, 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime/4 + 45 / 30))},
                {ind_set_color:get().r,ind_set_color:get().g,ind_set_color:get().b, 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime/4 + 40 / 30))}
            }

            if contains(ind_set_mod:get(), "In scope") then
                ind_add_x = lerp(ind_add_x, lp['m_bIsScoped'] == true and 27 or 0, 10 * globals.frametime)
                ind_add_x_guwno_test = lerp(ind_add_x_guwno_test, lp['m_bIsScoped'] == true and 1 or 0, 10 * globals.frametime)
                ind_add_x_gowno = lp['m_bIsScoped'] == true and 4 or 0
                ind_add_x_state = lp['m_bIsScoped'] == true and 2000 or 0
                ind_y = lerp(ind_y, lp['m_bIsScoped'] == true and 9 or 0, 17 * globals.frametime)
            end

          --  if contains(Settings.ind_set_mod:get(), "Glow") then
            --    ctx.m_render.glow_module(screen_size.x /2 + ind_add_x - 18, screen_size.y /2 + 17 + 3, screen_size.x /2 + ind_add_x + 17, screen_size.y /2 + 17 - 3, 2, 255,255,255,255, (9))
          --  end
            if get_mode() == nil then return end
            
            local text_scale_ind = render.measure_text(1, "c", ""..conditions_a[get_mode()]:upper().."")
            local m_indicators = {{text = "DT",color = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get() == true and ind_set_color:get() or color(92,92,92)},{text = "OS",color = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):get() == true and ind_set_color:get() or color(92,92,92)}, {text = "QP", color = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"):get() == true and ind_set_color:get() or color(92,92,92)}, {text = "FS", color = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"):get_override() == true and ind_set_color:get() or color(92,92,92)}}
            local m_indicators2 = {
                {
                  text = "DT",
                  color = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get() and ind_set_color:get() or {r = 92, g = 92, b = 92}
                },
                {
                  text = "OS",
                  color = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):get() and ind_set_color:get() or {r = 92, g = 92, b = 92}
                }
            }
              
            if Settings.visuals.ind:get() and lp:is_alive() then
                if ind_set_style:get() == "#1" then
                    if not contains(ind_set_mod:get(), "Animated") then
                        render.text(2, vector(lp['m_bIsScoped'] == true and screen_size.x /2 + (ind_add_x - ind_add_x_gowno) or screen_size.x /2 + ind_add_x, screen_size.y /2 + 17), color(ind_set_color:get().r,ind_set_color:get().g,ind_set_color:get().b,ind_set_color:get().a), "c", string.upper("Bloodwings"))
                    else 
                        render.text(2, vector(lp['m_bIsScoped'] == true and screen_size.x /2 + (ind_add_x - ind_add_x_gowno) or screen_size.x /2 + ind_add_x, screen_size.y /2 + 17), color(ind_set_color:get().r,ind_set_color:get().g,ind_set_color:get().b,ind_set_color:get().a), "c", string.upper(string.format("\a%sb\a%sl\a%so\a%so\a%sd\a%sw\a%si\a%sn\a%sg\a%ss", RGBAtoHEX(unpack(aA[1])), RGBAtoHEX(unpack(aA[2])), RGBAtoHEX(unpack(aA[3])), RGBAtoHEX(unpack(aA[4])), RGBAtoHEX(unpack(aA[5])), RGBAtoHEX(unpack(aA[6])), RGBAtoHEX(unpack(aA[7])), RGBAtoHEX(unpack(aA[8])), RGBAtoHEX(unpack(aA[9])), RGBAtoHEX(unpack(aA[9])) )))
                    end
                    --state
                    render.text(2, vector(lp['m_bIsScoped'] == true and screen_size.x /2 + (ind_add_x + ind_add_x_state) or screen_size.x /2 + ind_add_x, screen_size.y /2 + 26), color(92,92,92,255), "c", conditions_a[get_mode()]:upper())

                    --binds
                    for i, v in pairs(m_indicators) do
                        render.text(2, vector(screen_size.x /2 + ind_add_x - 29 + i*12, screen_size.y /2 + 35 - ind_y), color(v.color.r, v.color.g, v.color.b), "c", v.text)
                    end
                end

                if ind_set_style:get() == "#2" then
                    render.text(2, vector(screen_size.x /2 + 20 * ind_add_x_guwno_test, screen_size.y /2 + 17), color(ind_set_color:get().r,ind_set_color:get().g,ind_set_color:get().b,ind_set_color:get().a), "c", string.upper("Bloodwings"))
                    render.text(2, vector(screen_size.x /2 + 10 * ind_add_x_guwno_test, screen_size.y /2 + 27), color(255,255,255,255), "c", math.floor(fake_desync).."%")
                    --binds
                    for i, v in pairs(m_indicators2) do
                        render.text(2, vector(screen_size.x /2 + 13 * ind_add_x_guwno_test - 18 + i*12, screen_size.y /2 + 37), color(v.color.r, v.color.g, v.color.b), "c", v.text)
                    end
                end

            end
        end
    }

    ctx.arrows_antiaim = {
        render = function()
            local lp = entity.get_local_player()
            if not lp then return end

            bodyyaw = lp.m_flPoseParameter[11] * 120 - 60
            side = bodyyaw > 0 and 1 or -1


            --arrows_antiaim_color =  Settings.visuals.antiaim_arrows:create():color_picker("Color", color(222, 195, 195, 255))
            if Settings.visuals.antiaim_arrows:get() then
                render.poly(manual_right:get() and color(75, 75, 75, 190) or color(25, 25, 25, 160), vector(screen_size.x/2 + 44,screen_size.y/2 + 9), vector(screen_size.x/2 + 57,screen_size.y/2), vector(screen_size.x/2 + 44,screen_size.y/2 - 9)) -- right
                render.poly(manual_left:get() and color(75, 75, 75, 190) or color(25, 25, 25, 160), vector(screen_size.x/2 - 44,screen_size.y/2 + 9), vector(screen_size.x/2 - 57,screen_size.y/2), vector(screen_size.x/2 - 44,screen_size.y/2 - 9)) -- left

                render.rect(vector(screen_size.x/2 - 41, screen_size.y/2 - 9), vector(screen_size.x/2 - 43, screen_size.y/2 + 9), side == 1 and color(arrows_antiaim_color:get().r,arrows_antiaim_color:get().g,arrows_antiaim_color:get().b,255) or color(25, 25, 25, 160)) -- left
                render.rect(vector(screen_size.x/2 + 41, screen_size.y/2 - 9), vector(screen_size.x/2 - 43, screen_size.y/2 + 9), side == 1 and color(25, 25, 25, 160) or color(arrows_antiaim_color:get().r,arrows_antiaim_color:get().g,arrows_antiaim_color:get().b,255)) -- right
            end
        end
    }

    ctx.watermark = {
        render = function()
            if Settings.visuals.watermark:get() then
                --render.gradient(position_a: vector, position_b: vector, top_left: color, top_right: color, bottom_left: color, bottom_right: color[, rounding: number])
                if watermark_style:get() == "Normal" then
                    local text = "\aFFFFFFFFBloodwings [recode]\a5C5C5CFF/\aFFFFFFFF ".. common.get_username() .. " \a5C5C5CFF/\aFFFFFFFF ".. common.get_date("%H:%M:%S")
                    local text_scale = render.measure_text(1, nil, text)
                    render.gradient(vector(screen_size.x - 25 - text_scale.x, 13), vector(screen_size.x, 34), color(watermark_color:get().r,watermark_color:get().g,watermark_color:get().b,0), watermark_color:get(), color(watermark_color:get().r,watermark_color:get().g,watermark_color:get().b,0), watermark_color:get())
                    render.text(1, vector(screen_size.x - 5 - text_scale.x / 2, 23), color(255,255,255,255), "c", text)
                end

                if watermark_style:get() == "Modern" then
                    local lp = entity.get_local_player()
                    if not lp then return end 

                    local avatar = lp:get_steam_avatar()

                    if download ~= nil then
                        local text_scale_c = render.measure_text(2, nil, "BLOODWINGS RECODE")
                        render.gradient(vector(2.5, screen_size.y / 2 + 35 -2), vector(2.5 + text_scale_c.x *2, screen_size.y / 2 + 35 -2 + text_scale_c.y * 2), watermark_color:get(), color(watermark_color:get().r,watermark_color:get().g,watermark_color:get().b,0), watermark_color:get(), color(watermark_color:get().r,watermark_color:get().g,watermark_color:get().b,0))
                        if watermark_options_2:get() == "Flag" then
                            render.texture(download, vector(5, screen_size.y / 2 + 35 -2 + 4))
                        else
                            render.texture(avatar, vector(5, screen_size.y / 2 + 35 -2 + 4), vector(25,16.8), color(255,255,255,255))
                        end
                        render.text(2, vector(35, screen_size.y /2 + 35 -2 + 2), color(255,255,255,255), nil, gradient_text(string.upper("bloodwings RECODE"), 5, 255,255,255,255))
                        render.text(2, vector(35, screen_size.y /2 + 35 -2 + 10), color(255,255,255,255), nil, string.upper("\a"..RGBAtoHEX(watermark_color:get().r,watermark_color:get().g,watermark_color:get().b, 255)..common.get_username()))
                    else
                        downloadFile()                 
                    end
                end

                if watermark_style:get () == "Shoppy.gg" then
                        render.text(1, vector(screen_size.x-200, 45), color(255), nil, "shoppy.gg/@bloodwings	")
                        render.shadow(vector(screen_size.x-200, 61), vector(screen_size.x-32, 45), color(255, 255, 255, 255), 20, 0, 0)
                end

                if watermark_style:get() == "500$" then
                    local r,g,b = watermark_color:get().r,watermark_color:get().g,watermark_color:get().b
                    local text = "\affffffe5bloodwings\a"..RGBAtoHEX(r,g,b,230).." RECODE\affffffe5 | "..common.get_username()..""

                    if contains(watermark_options:get(), "fps") then
                        local fps = (globals.is_connected and (1 / globals.frametime) or 0)
                        text = text .. " | "..math.floor(fps).."fps"
                    end
                    if contains(watermark_options:get(), "ping") then
                        local ping = (globals.is_connected and (utils.net_channel().latency[1] * 1000) or 0)
                        text = text .. " | "..math.floor(ping).."ms\affffffe5"
                    end
                    if contains(watermark_options:get(), "time") then
                        local time = common.get_system_time()
                        hours, minutes = string.format("%02d", time.hours), string.format("%02d", time.minutes)
                        text = text .. " | ".. hours .. ":" .. minutes .. ""
                    end

                    local text_size = render.measure_text(1, nil, text)
                    render_ogskeet_border(screen_size.x - text_size.x - 20, 55, text_size.x + 2, 12, 255, text)
                end
            else
                local float = math.sin(globals.realtime * 2.3) * 15
                render.text(1, vector(screen_size.x / 2, screen_size.y - 30 - float), color(255,255,255,255), "c", gradient_text("bloodwings",6, watermark_color:get().r,watermark_color:get().g,watermark_color:get().b,255))
            end
        end
    }

    ctx.custom_viewmodel = {
        run = function()
            if Settings.visuals.viewmodel_custom:get() then
                cvar.viewmodel_fov:int(viewmodel_fov:get())
                cvar.viewmodel_offset_x:float(viewmodel_x:get())
                cvar.viewmodel_offset_y:float(viewmodel_y:get())
                cvar.viewmodel_offset_z:float(viewmodel_z:get())
            end
        end
    }

    ctx.defensive_panel = {
        render = function()
            if Settings.visuals.defensive_panel:get() then
                local diff = var_table.sim_diff()
                if diff <= -1 then
                    draw = "yes"
                end

                if draw == "yes" and ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get() then
                    draw_per = draw_ticks * 100 / 40

                    render.text(1, vector(screen_size.x / 2 , screen_size.y / 2  * 0.4 - 10), color(255, 255, 255, 255), "c", string.format("\aFFFFFFFFdefensive \a%schoking", RGBAtoHEX(defensive_color:get().r, defensive_color:get().g, defensive_color:get().b, 255)))
                    ctx.renders.glow_module(screen_size.x /2 - 43, screen_size.y /2 * 0.4, screen_size.x /2 + 43, screen_size.y /2 * 0.4 + 2,50,30,30,30,255, 4, true, defensive_color:get().r, defensive_color:get().g, defensive_color:get().b)
                    render.rect(vector(screen_size.x /2 - 3, screen_size.y /2 * 0.4), vector(screen_size.x /2 -3 + draw_per /2 , screen_size.y /2 * 0.4 + 2), color(defensive_color:get().r, defensive_color:get().g, defensive_color:get().b,255), 4, true)
                    render.rect(vector(screen_size.x /2 + 5 - draw_per /2, screen_size.y /2 * 0.4), vector(screen_size.x /2 + 3, screen_size.y /2 * 0.4 + 2), color(defensive_color:get().r, defensive_color:get().g, defensive_color:get().b,255), 4, true)
                    
                    draw_ticks = draw_ticks + 1

                    if draw_ticks == 40 then
                        draw_ticks = 0
                        draw = "no"
                    end
                end
            end
        end
    }

    ctx.aspect = {
        run = function()
            if Settings.visuals.aspect_ratio:get() then
                cvar.r_aspectratio:float(aspect_ratio_value:get()/100)
            else
                cvar.r_aspectratio:float(0/100)
            end
        end
    }

    ctx.border_menu = {
        run = function()
            if Settings.visuals.menu_border:get() then
                if ui.get_alpha() > 0.5 then
                    render_ogskeet_border(ui.get_position().x + 3, ui.get_position().y + 40, ui.get_size().x - 6, ui.get_size().y - 1,255,"")
                end
            end
        end
    }

    ctx.sloweddown = {
        render = function()
            if Settings.visuals.slowed_down_panel:get() then
                --slowed_down_color

                local is_defensive = draw == "yes" and ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get()
                if entity.get_local_player() == nil then return end
                local slowed_down_value = entity.get_local_player()["m_flVelocityModifier"] * 100
                local size_bar = slowed_down_value * 98 / 100

                if slowed_down_value < 100 then
                    render.text(1, vector(screen_size.x / 2 , is_defensive and screen_size.y / 2  * 0.45 - 10 or screen_size.y / 2  * 0.4 - 10), color(255, 255, 255, 255), "c", string.format("\aFFFFFFFFslowed down \aFFFFFFFF(\a%s%s%%\aFFFFFFFF)", RGBAtoHEX(slowed_down_color:get().r,slowed_down_color:get().g,slowed_down_color:get().b, 255), math.floor(calculatePercentage(size_bar, 100))))
                    ctx.renders.glow_module(screen_size.x /2 - 43, is_defensive and screen_size.y /2 * 0.45 or screen_size.y /2 * 0.4, screen_size.x /2 + 43, is_defensive and screen_size.y /2 * 0.45 + 2 or screen_size.y /2 * 0.4 + 2,50,30,30,30,255, 4, true, slowed_down_color:get().r,slowed_down_color:get().g,slowed_down_color:get().b)
                    render.rect(vector(screen_size.x /2 - 3, is_defensive and screen_size.y /2 * 0.45 or screen_size.y /2 * 0.4), vector(screen_size.x /2 -3 + size_bar /2 , is_defensive and screen_size.y /2 * 0.45 + 2 or screen_size.y /2 * 0.4 + 2), color(slowed_down_color:get().r,slowed_down_color:get().g,slowed_down_color:get().b,255), 4, true)
                    render.rect(vector(screen_size.x /2 + 5 - size_bar /2, is_defensive and screen_size.y /2 * 0.45 or screen_size.y /2 * 0.4), vector(screen_size.x /2 + 3, is_defensive and screen_size.y /2 * 0.45 + 2 or screen_size.y /2 * 0.4 + 2), color(slowed_down_color:get().r,slowed_down_color:get().g,slowed_down_color:get().b,255), 4, true)
                end
            end
        end
    }

    ctx.hitlogs = {
        anim = function(t) 
            return (t > 0.5) and 4*((t-1)^3)+1 or 4*t^3;
        end,

        render = function()
            for i, info_noti in ipairs(notify_lol) do
                if i > 7 then
                    table.remove(notify_lol, i)
                end
                if info_noti.text ~= nil and info_noti.text ~= "" then
                    if info_noti.timer + 3.7 < globals.realtime then
                        info_noti.y = lerp(info_noti.y, screen_size.y - 100, globals.frametime * 1.5)
                        info_noti.alpha = lerp(info_noti.alpha, 0, globals.frametime * 4.5)
                    else
                        info_noti.y = lerp(info_noti.y, screen_size.y - 100, globals.frametime * 1.5)
                        info_noti.alpha = lerp(info_noti.alpha, 255, globals.frametime * 4.5)
                    end
                end
        
                local width = render.measure_text(1, "c", info_noti.text)
                r,g,b,a = 255,255,255,255


                if contains(hitlogs_type:get(), "Under crosshair") then
                    if hitlogs_style:get() == "500$" then
                        render_ogskeet_border(screen_size.x /2 - width.x /2, info_noti.y - i*35, width.x, 12, 255, info_noti.text)
                    elseif hitlogs_style:get() == "Default" then
                        render.text(1, vector(screen_size.x /2, info_noti.y - i*18), color(255,255,255,255), "c", info_noti.text)
                    end
                end

                if info_noti.timer + 4.3 < globals.realtime then
                    table.remove(notify_lol,i)
                end
            end
        end
    }

    ctx.hitlogs_preview = {
        render = function()
            r,g,b,a = hitlogs_color:get().r,hitlogs_color:get().g,hitlogs_color:get().b,hitlogs_color:get().a

            local text = "Hit \a"..RGBAtoHEX(r,g,b,a).."admin\aFFFFFFFF in the \a"..RGBAtoHEX(r,g,b,a).."head\aFFFFFFFF for \a"..RGBAtoHEX(r,g,b,a).."999\aFFFFFFFF damage"
            local width = render.measure_text(1, "c", text)
            
            if contains(hitlogs_type:get(), "Under crosshair") then
                if ui.get_alpha() > 0.5 then
                    if hitlogs_style:get() == "500$" then
                        render_ogskeet_border(screen_size.x /2 - width.x /2, screen_size.y - 200, width.x, 12, 255, text)
                    elseif hitlogs_style:get() == "Default" then
                        render.text(1, vector(screen_size.x /2, screen_size.y - 200), color(255,255,255,255), "c", text)
                    end 
                end
            end
        end
    }

    ctx.clantag = {
        run = function()
            local cur = math.floor(globals.tickcount / 30) % #clantags
            local clantag = clantags[cur+1]
        
            if clantag ~= clantag_prev then
                clantag_prev = clantag
                if Settings.misc.clantag:get() then
                    common.set_clan_tag(clantag)
                end
            end
        end
    }



    ctx.nade_throw = {
        fix = function()
            if Settings.misc.nade_throw:get() then
                
                local weapon = entity.get_local_player():get_player_weapon():get_weapon_info().weapon_name
                if weapon == "weapon_molotov" or weapon == "weapon_hegrenade" or weapon == "weapon_smokegrenade" then
                    ui.find("Miscellaneous", "Main", "Other", "Weapon Actions"):reset()
                else
                    ui.find("Miscellaneous", "Main", "Other", "Weapon Actions"):set(save_weapon)
                end
            end
        end
    }

    return ctx
end)()




local phrases = {"𝘽𝙡𝙤𝙤𝙙𝙒𝙞𝙣𝙜𝙨.𝙣𝙡 𝙤𝙣 𝙩𝙤𝙥 𝙤𝙛 𝙩𝙝𝙚 𝙬𝙤𝙧𝙡𝙙", "𝔸𝕟𝕥𝕚-𝔸𝕚𝕞𝕓𝕠𝕥 𝕚𝕤 𝕒 𝕥𝕠𝕠𝕝 𝕒𝕟𝕕 𝕪𝕠𝕦𝕣𝕤 𝕚𝕤 𝕓𝕣𝕠𝕜𝕖𝕟",
              "𝐏𝐫𝐞𝐭𝐨 𝐝𝐞 𝐦𝐞𝐫𝐝𝐚 𝐯𝐨𝐥𝐭𝐚 𝐩𝐫𝐚 𝐭𝐮𝐚 𝐭𝐞𝐫𝐫𝐚", "𝙈𝙞𝙠𝙖 𝙖𝙙𝙙𝙚𝙙 𝙩𝙝𝙞𝙨 𝙩𝙤 𝘽𝙡𝙤𝙤𝙙𝙒𝙞𝙣𝙜𝙨 𝙖𝙣𝙙 𝙢𝙖𝙙𝙚 𝙞𝙩 𝙨𝙤 𝙢𝙪𝙘𝙝 𝙗𝙚𝙩𝙩𝙚𝙧",
              "𝙀𝙫𝙚𝙧𝙮𝙤𝙣𝙚 𝙝𝙖𝙫𝙚 𝙣𝙞𝙜𝙝𝙩𝙢𝙖𝙧𝙚𝙨 , 𝙗𝙡𝙤𝙤𝙙𝙬𝙞𝙣𝙜𝙨 𝘼𝘼 𝙨𝙮𝙨𝙩𝙚𝙢 𝙞𝙨 𝙮𝙤𝙪𝙧 𝙗𝙞𝙜𝙜𝙚𝙨𝙩 𝙤𝙣𝙚", "𝟐.𝟓𝟎 𝐧𝐥𝐞 𝐥𝐮𝐚 𝐤𝐢𝐥𝐥𝐢𝐧𝐠 𝐲𝐨𝐮𝐫 𝐞𝐧𝐭𝐢𝐫𝐞 𝐭𝐞𝐚𝐦? 𝐁𝐥𝐨𝐨𝐝𝐖𝐢𝐧𝐠𝐬 𝐨𝐧 𝐭𝐨𝐩", "🇾 🇴 🇺  🇼 🇦 🇳 🇹  🇹 🇴  🇧 🇪  🇱 🇮 🇰 🇪  🇲 🇪 ? ᵇᵘʸ ᵇˡᵒᵒᵈʷⁱⁿᵍˢ",
               "𝘽𝙡𝙤𝙤𝙙𝙒𝙞𝙣𝙜𝙨 𝙜𝙤𝙩 ʳᵉᶜᵒᵈᵉᵈ 𝙖𝙜𝙖𝙞𝙣 𝙖𝙣𝙙 𝙞𝙩𝙨 𝙗𝙚𝙩𝙩𝙚𝙧 𝙩𝙝𝙚𝙣 𝙚𝙫𝙚𝙧!", '𝘼 𝙙𝙤𝙢𝙞𝙣𝙖𝙧 𝙤 𝙝𝙫𝙝 𝙙𝙚𝙨𝙙𝙚 2022', "✰𝔾𝕠𝕕 𝕚 𝕨𝕚𝕤𝕙 𝕚 𝕙𝕒𝕕 𝕓𝕝𝕠𝕠𝕕𝕨𝕚𝕟𝕘𝕤✰",
               "World cup is every 4 year , next chance to kill me is in 10", "ℕ𝕖𝕧𝕖𝕣𝕝𝕠𝕤𝕖 𝕔𝕗𝕘 𝕒𝕟𝕕 𝕝𝕦𝕒 --> 𝕄𝕚𝕜𝕒𝕙𝕧𝕙"," I just love the smell of death", 'Bloodwings are not for kings👑 , 𝔹𝕝𝕠𝕠𝕕𝕎𝕚𝕟𝕘𝕤 𝕚𝕥𝕤 𝕗𝕠𝕣 𝕝𝕖𝕘𝕖𝕟𝕕𝕤', "🇾 🇴 🇺  🇭 🇦 🇻 🇪  🇳 🇴  🇨 🇭 🇦 🇳 🇨 🇪  >:(", "𝙉𝙚𝙫𝙚𝙧𝙡𝙤𝙨𝙚 & 𝘽𝙡𝙤𝙤𝙙𝙬𝙞𝙣𝙜𝙨 = 𝙂0𝙙 𝘼𝘼", "𝕐𝕠𝕦𝕣 𝔸𝔸 𝕤𝕪𝕤𝕥𝕖𝕞 𝕥𝕒𝕡𝕡𝕖𝕕 𝕝𝕚𝕜𝕖 𝕗𝕦𝕔𝕜𝕚𝕟𝕘 𝕦𝕜𝕣𝕒𝕚𝕟 𝕦𝕤𝕚𝕟𝕘 𝕣𝕦𝕤𝕤𝕚𝕒 𝕓𝕠𝕞𝕓𝕤 𝕒𝕩𝕒𝕩𝕒𝕩𝕒𝕩𝕒", "[ 𝙴𝚉 𝙼𝙰𝙿𝙰 𝟿-𝟶 ]","(◣_◢)BloodWings RECODE (◣_◢)", ' Im pdiddy you are tupac , you just got shot', 'BloodWings users > All shit luas users', "Godbless NEVERLOSE.CC","𝘿𝙤 𝙮𝙤𝙪 𝙬𝙖𝙣𝙩 𝘽𝙡𝙤𝙤𝙙𝙒𝙞𝙣𝙜𝙨?? NO BLOODWINGS FOR YOU HAHAHAHA","It looks like you lost 9-0"}


local death_phrases = {}




function get_phrase()
    return phrases[utils.random_int(1, #phrases)]:gsub('"', '')
end


events.player_death:set(function(e)
    if not Settings.misc.trashtalk:get() then return end
    if Settings.misc.trashtalk:get() then
        local me = entity.get_local_player()
        local attacker = entity.get(e.attacker, true)
        local victim = entity.get(e.userid, true)

        if victim ~= me and attacker == me then
            utils.console_exec('say "' .. get_phrase(phrases) .. '"')
        end
    end
end)






function new_notify(string)
    local notification = {
        text = string,
        timer = globals.realtime,
        alpha = 0
    }

    if #notify_lol == 0 then
        notification.y = screen_size.y - 40
    else
        local lastNotification = notify_lol[#notify_lol]
        notification.y = lastNotification.y + 20 
    end

    table.insert(notify_lol, notification)
end

local hitgroup_str = {
    [0] = 'generic',
    'head', 'chest', 'stomach',
    'left arm', 'right arm',
    'left leg', 'right leg',
    'neck', 'generic', 'gear'
}

events.aim_ack:set(function(e)


    local hitgroup = hitgroup_str[e.hitgroup]

    r,g,b,a = hitlogs_color:get().r,hitlogs_color:get().g,hitlogs_color:get().b,hitlogs_color:get().a

    if e.state == nil then
        new_notify("Hit \a"..RGBAtoHEX(r,g,b,a)..e.target:get_name().. "\aFFFFFFFF in the \a"..RGBAtoHEX(r,g,b,a)..hitgroup.. "\aFFFFFFFF for \a"..RGBAtoHEX(r,g,b,a).. e.damage.." damage")
        if contains(hitlogs_type:get(), "On screen") then
            common.add_event("Hit \a"..RGBAtoHEX(r,g,b,a)..e.target:get_name().. "\aFFFFFFFF in the \a"..RGBAtoHEX(r,g,b,a)..hitgroup.. "\aFFFFFFFF for \a"..RGBAtoHEX(r,g,b,a).. e.damage.." damage")
        end
    else
        new_notify("Missed \a"..RGBAtoHEX(255,40,40,255)..e.target:get_name().. "\aFFFFFFFF in the \a"..RGBAtoHEX(255,40,40,255)..hitgroup_str[e.wanted_hitgroup].. "\aFFFFFFFF due \a"..RGBAtoHEX(255,40,40,255)..e.state)
        if contains(hitlogs_type:get(), "On screen") then
            common.add_event("Missed \a"..RGBAtoHEX(255,40,40,255)..e.target:get_name().. "\aFFFFFFFF in the \a"..RGBAtoHEX(255,40,40,255)..hitgroup_str[e.wanted_hitgroup].. "\aFFFFFFFF due \a"..RGBAtoHEX(255,40,40,255)..e.state)
        end
    end

end)

events.render:set(function()
    local aA = {
        {222, 195, 195, 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime /4 + 80 / 30))},
        {222, 195, 195, 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime /4 + 75 / 30))},
        {222, 195, 195, 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime/4 + 70 / 30))},
        {222, 195, 195, 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime/4 + 65 / 30))},
        {222, 195, 195, 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime/4 + 60 / 30))},
        {222, 195, 195, 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime/4 + 55 / 30))},
        {222, 195, 195, 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime/4 + 50 / 30))},
        {222, 195, 195, 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime/4 + 45 / 30))},
        {222, 195, 195, 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime/4 + 40 / 30))},
        {222, 195, 195, 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime/4 + 40 / 30))},
        {222, 195, 195, 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime/4 + 40 / 30))}
    }

      --Bloodwings
    label_text = string.format("                 \aFFFFFFFF࣪ ִֶָ☾.     \a%sb\a%sl\a%so\a%so\a%sd\a%sw\a%si\a%sn\a%sg\a%ss    \aFFFFFFFF࣪ ִֶָ☾.", RGBAtoHEX(unpack(aA[1])), RGBAtoHEX(unpack(aA[2])), RGBAtoHEX(unpack(aA[3])), RGBAtoHEX(unpack(aA[4])), RGBAtoHEX(unpack(aA[5])), RGBAtoHEX(unpack(aA[6])), RGBAtoHEX(unpack(aA[7])), RGBAtoHEX(unpack(aA[8])), RGBAtoHEX(unpack(aA[9])), RGBAtoHEX(unpack(aA[10])))
    lua_name_text = string.format("\a%sb\a%sl\a%so\a%so\a%sd\a%sw\a%si\a%sn\a%sg\a%ss", RGBAtoHEX(unpack(aA[1])), RGBAtoHEX(unpack(aA[2])), RGBAtoHEX(unpack(aA[3])), RGBAtoHEX(unpack(aA[4])), RGBAtoHEX(unpack(aA[5])), RGBAtoHEX(unpack(aA[6])), RGBAtoHEX(unpack(aA[7])), RGBAtoHEX(unpack(aA[8])), RGBAtoHEX(unpack(aA[9])), RGBAtoHEX(unpack(aA[10])))

    ui.sidebar(lua_name_text, "\adec3c3ff"..ui.get_icon("galaxy"))
    label_anim:name(label_text)

    watermark_options:visibility(watermark_style:get() == "500$")
    watermark_options_2:visibility(watermark_style:get() == "Modern")

    ctx.ogmenu.set()
    ctx.visuals.render()
    ctx.hitlogs.render()
    ctx.watermark.render()
    ctx.defensive_panel.render()
    ctx.sloweddown.render()
    ctx.arrows_antiaim.render()
    ctx.aspect.run()
    ctx.custom_viewmodel.run()
    ctx.border_menu.run()
    ctx.hitlogs_preview.render()
end)

local saved_lag = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):get()

events.createmove:set(function(cmd)
    local localplayer = entity.get_local_player()

    if localplayer == nil then return end

    local flags = localplayer.m_fFlags
 
    if Settings.antiaim[get_mode()].def_enable:get() then
        if lolp == 1 then
            ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override("Disabled")
        else
            ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override("Always On")

        end
else
    ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override(saved_lag)
end

    if Settings.antiaim.avoidback:get() then
        ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"):override(true)
    else
        ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"):override(false)
    end

    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"):override(Settings.antiaim.yaw_base:get())
    ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"):override(Settings.antiaim.freestanding:get())

    if get_mode() ~= nil then
        if Settings.antiaim[get_mode()].enable:get() then
            ctx.antiaim.createmove(cmd, get_mode())
        else
            if Settings.antiaim[1].enable:get() then
                ctx.antiaim.createmove(cmd, 1)
            end
        end
    end

    ctx.nade_throw.fix()
    ctx.pingspike.limit_remove()
    ctx.hitchance_override.run(cmd)
end)

events.net_update_end:set(function()
    ctx.clantag.run()
end)