local _ = require("ffi");
local l_pui_0 = require("neverlose/pui");
local l_base64_0 = require("neverlose/base64");
local l_clipboard_0 = require("neverlose/clipboard");
local l_smoothy_0 = require("neverlose/smoothy");
local _ = require("neverlose/inspect");
local l_lambotruck_0 = require("neverlose/lambotruck");
utility_lerp = function(v7, v8, v9)
    return v7 + (v8 - v7) * v9;
end;
local v726 = new_class():struct("globals")({
    current_logo = 0, 
    logo_counter = 0, 
    states = {
        [1] = "stand", 
        [2] = "slow walk", 
        [3] = "run", 
        [4] = "duck", 
        [5] = "jump", 
        [6] = "duck jump", 
        [7] = "duck move"
    }, 
    main_states = {
        [1] = "stand", 
        [2] = "slow walk", 
        [3] = "run", 
        [4] = "duck", 
        [5] = "jump", 
        [6] = "duck jump", 
        [7] = "duck move"
    }, 
    player_team = {
        [1] = "terrorist", 
        [2] = "counter-terrorist"
    }, 
    addition_options = {
        [1] = "Warmup AA", 
        [2] = "Round end AA", 
        [3] = "Hide Head", 
        [4] = "Avoid Backstab", 
        [5] = "Fluctuate Fakelag"
    }, 
    hidehead_options = {
        [1] = "Standing", 
        [2] = "Crouch", 
        [3] = "Air Crouch Knife", 
        [4] = "Distance", 
        [5] = "Height Advantage", 
        [6] = "Taser In Air"
    }, 
    troll_aa_options = {
        [1] = "Spin", 
        [2] = "Half Spin"
    }, 
    manual_aa_options = {
        [1] = "Off", 
        [2] = "Left", 
        [3] = "Right", 
        [4] = "Forward"
    }
}):struct("ref")({
    antiaim = {
        enable = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
        pitch = ui.find("Aimbot", "Anti aim", "Angles", "Pitch"), 
        yaw = ui.find("Aimbot", "Anti aim", "Angles", "Yaw"), 
        hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"), 
        yaw_offset = ui.find("Aimbot", "Anti aim", "Angles", "Yaw", "Offset"), 
        yaw_target = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
        avoid_backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
        yaw_modifier = ui.find("Aimbot", "Anti aim", "Angles", "Yaw Modifier"), 
        yaw_modifieramount = ui.find("Aimbot", "Anti aim", "Angles", "Yaw Modifier", "Offset"), 
        body_yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
        body_yaw_options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
        leftfake = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
        rightfake = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
        inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
        freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
        slowwalk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
        legmovement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"), 
        legs = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement")
    }, 
    rage = {
        dt = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
        dtlag = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
        dt_fakelag = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"), 
        hs = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
        hs2 = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"), 
        fb = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
        dmg = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
        quickpeek = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"), 
        teleport = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Immediate Teleport"), 
        fakelag = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"), 
        fakelag_enabled = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"), 
        fd = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
        dormant_aimbot = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"), 
        safe_point = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"), 
        ping = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"), 
        hitchance = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance")
    }, 
    visuals = {
        scope_overlay = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"), 
        force_thirdperson = ui.find("Visuals", "World", "Main", "Force Thirdperson")
    }
}):struct("ui")({
    menu = {
        global = {}, 
        aa = {}, 
        vis = {}, 
        misc = {}, 
        cfg = {}, 
        debug = {}
    }, 
    execute = function(v10)
        -- upvalues: l_pui_0 (ref), l_base64_0 (ref), l_clipboard_0 (ref)
        local v11 = {
            [1] = {
                [1] = "select", 
                [2] = "\nSELECTION"
            }, 
            [2] = {
                [1] = "select2", 
                [2] = "\nSELECTION2", 
                [3] = 1
            }, 
            [3] = {
                [1] = "user_info", 
                [2] = "\nUSER_INFO", 
                [3] = 1
            }, 
            [4] = {
                [1] = "user_settings", 
                [2] = "\nUSER_SETTINGS", 
                [3] = 1
            }, 
            [5] = {
                [1] = "main", 
                [2] = "\nMAIN", 
                [3] = 2
            }, 
            [6] = {
                [1] = "main2", 
                [2] = "", 
                [3] = 1
            }, 
            [7] = {
                [1] = "builder_state", 
                [2] = "\na", 
                [3] = 1
            }, 
            [8] = {
                [1] = "lagcomp", 
                [2] = "\nlagcomp", 
                [3] = 1
            }, 
            [9] = {
                [1] = "other", 
                [2] = "\nMODE", 
                [3] = 1
            }, 
            [10] = {
                [1] = "addon", 
                [2] = "\nEXTRA", 
                [3] = 1
            }, 
            [11] = {
                [1] = "movement", 
                [2] = "\nMOVEMENT", 
                [3] = 2
            }, 
            [12] = {
                [1] = "builder", 
                [2] = "\nBUILDER", 
                [3] = 2
            }, 
            [13] = {
                [1] = "configs", 
                [2] = "\nCONFIGS"
            }, 
            [14] = {
                [1] = "visuals", 
                [2] = "\nVISUALS", 
                [3] = 2
            }, 
            [15] = {
                [1] = "user_interface", 
                [2] = "\nUSER INTERFACE"
            }, 
            [16] = {
                [1] = "overlays", 
                [2] = "\nOVERLAYS"
            }, 
            [17] = {
                [1] = "info", 
                [2] = "\ninfo"
            }, 
            [18] = {
                [1] = "movement", 
                [2] = "\nMOVEMENT"
            }, 
            [19] = {
                [1] = "ragebot", 
                [2] = "\nRAGE BOT"
            }, 
            [20] = {
                [1] = "common", 
                [2] = "\nCOMMON"
            }
        };
        local v12 = l_pui_0.create("\v\f<house>", v11);
        local v13 = l_pui_0.create("\v\f<diagram-project>", v11);
        local v14 = l_pui_0.create("\v\f<gear>", v11);
        v10.menu.global.username = v12.user_info:label("User");
        v10.menu.global.user_button = v12.user_info:button("\v " .. common.get_username() .. " ", nil, true);
        v10.menu.global.version = v12.user_info:label("Build");
        v10.menu.global.version_button = v12.user_info:button("\vLIVE", nil, true);
        v10.menu.global.update = v12.user_info:label("Updated");
        v10.menu.global.update_button = v12.user_info:button("\v31.11.2025", nil, true);
        v10.menu.global.credits = v12.user_info:label("dumped and fixed by zadyma.");
        v10.menu.global.sidebar = v12.user_settings:label("Sidebar");
        local v15 = v10.menu.global.sidebar:create();
        v10.menu.global.sidebar_color = v15:label("Color", color(158, 155, 178, 255));
        v10.menu.global.sidebar_text = v15:input("");
        v10.menu.global.sidebar_speed = v15:slider("Speed", 1, 8, 0, 1);
        v10.menu.global.watermark = v12.user_settings:label("Watermark");
        local v16 = v10.menu.global.watermark:create();
        v10.menu.global.watermark_color = v16:label("Color", color(158, 155, 178, 255));
        v10.menu.global.watermark_style = v16:combo("Watermark styles", {
            [1] = "Gingersense", 
            [2] = "Modern", 
            [3] = "Custom"
        });
        v10.menu.global.watermark_text = v16:input(""):depend({
            [1] = nil, 
            [2] = "Custom", 
            [1] = v10.menu.global.watermark_style
        });
        v10.menu.global.watermark_font = v16:slider("Font", 1, 4, 0, 1, function(v17)
            if v17 == 1 then
                return "Default";
            elseif v17 == 2 then
                return "Pixel";
            elseif v17 == 3 then
                return "Console";
            elseif v17 == 4 then
                return "Bold";
            else
                return;
            end;
        end):depend({
            [1] = nil, 
            [2] = "Custom", 
            [1] = v10.menu.global.watermark_style
        });
        v10.menu.global.watermark_gradient = v16:slider("Gradient", 1, 2, 0, 1, function(v18)
            if v18 == 1 then
                return "Off";
            elseif v18 == 2 then
                return "On";
            else
                return;
            end;
        end):depend({
            [1] = nil, 
            [2] = "Custom", 
            [1] = v10.menu.global.watermark_style
        });
        v10.menu.global.watermark_speed = v16:slider("Speed", 1, 8, 0, 1):depend({
            [1] = nil, 
            [2] = 2, 
            [1] = v10.menu.global.watermark_gradient
        }):depend({
            [1] = nil, 
            [2] = "Custom", 
            [1] = v10.menu.global.watermark_style
        });
        v10.menu.global.logs = v12.user_settings:label("Logs");
        local v19 = v10.menu.global.logs:create();
        v10.menu.global.log_prefix = v19:input("");
        v10.menu.aa.state = v13.builder_state:combo("State \v\f<people-group>", v10.globals.main_states);
        v10.menu.aa.select_team = v13.builder_state:combo("Team \v\f<person>", v10.globals.player_team);
        v10.menu.aa.states = {};
        for _, v21 in ipairs(v10.globals.player_team) do
            v10.menu.aa.states[v21] = {};
            for _, v23 in ipairs(v10.globals.main_states) do
                v10.menu.aa.states[v21][v23] = {};
                local v24 = v10.menu.aa.states[v21][v23];
                v24.yaw_additions = v13.builder:label("\v\226\128\162\r Yaw \a00000000[" .. v23 .. v21 .. "]");
                local v25 = v24.yaw_additions:create();
                v24.yaw_add = v25:slider("Yaw Left" .. "\n" .. v23 .. v21, -180, 180, -35, 1);
                v24.yaw_add_r = v25:slider("Yaw Right" .. "\n" .. v23 .. v21, -180, 180, 35, 1);
                v24.yaw_jitter = v13.builder:combo("     \v\f<turn-down-right>\r  Yaw Jitter\n" .. v23 .. v21, {
                    [1] = "Off", 
                    [2] = "Offset", 
                    [3] = "Center", 
                    [4] = "Random", 
                    [5] = "Spin", 
                    [6] = "Gingerbomber"
                });
                local v26 = v24.yaw_jitter:create();
                v24.yaw_jitter_mode = v26:combo("Mode\n" .. v23 .. v21, {
                    [1] = "Default", 
                    [2] = "Custom"
                }):depend({
                    [1] = nil, 
                    [2] = "Offset", 
                    [3] = "Center", 
                    [4] = "Random", 
                    [5] = "Spin", 
                    [1] = v24.yaw_jitter
                });
                v24.yaw_jitter_add = v26:slider("Degree\n" .. v23 .. v21, -180, 180, 0, 1):depend({
                    [1] = nil, 
                    [2] = "Offset", 
                    [3] = "Center", 
                    [4] = "Random", 
                    [5] = "Spin", 
                    [1] = v24.yaw_jitter
                }):depend({
                    [1] = nil, 
                    [2] = "Default", 
                    [1] = v24.yaw_jitter_mode
                });
                v24.yaw_sliders = v26:slider("Sliders\n as" .. v23 .. v21, 1, 6, 0, 1):depend({
                    [1] = nil, 
                    [2] = "Custom", 
                    [1] = v24.yaw_jitter_mode
                }):depend({
                    [1] = nil, 
                    [2] = "Offset", 
                    [3] = "Center", 
                    [4] = "Random", 
                    [5] = "Spin", 
                    [1] = v24.yaw_jitter
                });
                for v27 = 1, 6 do
                    v24["yaw_jitter_slider" .. v27] = v26:slider("" .. v27 .. "\n" .. v23 .. v21 .. "\n", -180, 180, 50, 1):depend({
                        [1] = nil, 
                        [2] = nil, 
                        [3] = 10, 
                        [1] = v24.yaw_sliders, 
                        [2] = v27
                    }):depend({
                        [1] = nil, 
                        [2] = "Custom", 
                        [1] = v24.yaw_jitter_mode
                    }):depend({
                        [1] = nil, 
                        [2] = "Offset", 
                        [3] = "Center", 
                        [4] = "Random", 
                        [5] = "Spin", 
                        [1] = v24.yaw_jitter
                    });
                end;
                v24.yaw_jitter_own1 = v26:slider("Min. offset\n" .. v23 .. v21, -180, 180, 0, 1):depend({
                    [1] = nil, 
                    [2] = "Gingerbomber", 
                    [1] = v24.yaw_jitter
                });
                v24.yaw_jitter_own2 = v26:slider("Max. offset\n" .. v23 .. v21, -180, 180, 0, 1):depend({
                    [1] = nil, 
                    [2] = "Gingerbomber", 
                    [1] = v24.yaw_jitter
                });
                v24.switch_value = v26:slider("Switch value\n" .. v23 .. v21, 0, 10, 4, 1):depend({
                    [1] = nil, 
                    [2] = "Gingerbomber", 
                    [1] = v24.yaw_jitter
                });
                v24.aa_extra = v13.builder:label("          \v\f<turn-down-right>\r  Additions \a00000000[" .. v23 .. v21 .. "]");
                local v28 = v24.aa_extra:create();
                v24.delay = v28:switch("Delay\n" .. v23 .. v21);
                v24.delay_interaction_type = v28:combo("Interaction type\n" .. v23 .. v21, {
                    [1] = "Createmove", 
                    [2] = "Net_update"
                }):depend({
                    [1] = nil, 
                    [2] = true, 
                    [1] = v24.delay
                });
                v24.delay_method = v28:combo("Method\n" .. v23 .. v21, {
                    [1] = "Default", 
                    [2] = "Random", 
                    [3] = "Custom"
                }):depend({
                    [1] = nil, 
                    [2] = true, 
                    [1] = v24.delay
                });
                v24.switch_delay = v28:slider("Timing\n" .. v23 .. v21, 1, 23, 0, 1, function(v29)
                    return v29 .. "t";
                end):depend({
                    [1] = nil, 
                    [2] = "Default", 
                    [1] = v24.delay_method
                }):depend({
                    [1] = nil, 
                    [2] = true, 
                    [1] = v24.delay
                });
                v24.random_delay_value_1 = v28:slider("Min. Timing\n" .. v23 .. v21, 1, 23, 0, 1, function(v30)
                    return v30 .. "t";
                end):depend({
                    [1] = nil, 
                    [2] = "Random", 
                    [1] = v24.delay_method
                }):depend({
                    [1] = nil, 
                    [2] = true, 
                    [1] = v24.delay
                });
                v24.random_delay_value_2 = v28:slider("Max. Timing\n" .. v23 .. v21, 1, 23, 0, 1, function(v31)
                    return v31 .. "t";
                end):depend({
                    [1] = nil, 
                    [2] = "Random", 
                    [1] = v24.delay_method
                }):depend({
                    [1] = nil, 
                    [2] = true, 
                    [1] = v24.delay
                });
                v24.delay_sliders = v28:slider("Sliders\n as" .. v23 .. v21, 1, 6, 0, 1):depend({
                    [1] = nil, 
                    [2] = "Custom", 
                    [1] = v24.delay_method
                }):depend({
                    [1] = nil, 
                    [2] = true, 
                    [1] = v24.delay
                });
                for v32 = 1, 6 do
                    v24["switch_delay_sliders" .. v32] = v28:slider("" .. v32 .. "\n" .. v23 .. v21 .. "\n", 1, 23, 0, 1):depend({
                        [1] = nil, 
                        [2] = nil, 
                        [3] = 10, 
                        [1] = v24.delay_sliders, 
                        [2] = v32
                    }):depend({
                        [1] = nil, 
                        [2] = "Custom", 
                        [1] = v24.delay_method
                    }):depend({
                        [1] = nil, 
                        [2] = true, 
                        [1] = v24.delay
                    });
                end;
                v24.randomization = v28:slider("Randomization" .. "\n" .. v23 .. v21, 0, 100, 0, 1, function(v33)
                    return v33 .. "%";
                end);
                v24.body_yaw = v13.builder:combo("\v\f<turn-down-right>\r Desync\n" .. v23 .. v21, {
                    [1] = "Off", 
                    [2] = "Jitter", 
                    [3] = "Random", 
                    [4] = "Tick", 
                    [5] = "Experimental"
                });
                local v34 = v24.body_yaw:create();
                v24.body_yaw_ticks = v34:slider("Ticks" .. "\n" .. v23 .. v21, 0, 22, 12, 1, function(v35)
                    return v35 .. "t";
                end):depend({
                    [1] = nil, 
                    [2] = "Tick", 
                    [1] = v24.body_yaw
                });
                v24.fakelimit_options = v34:combo("Fakelimit\n" .. v23 .. v21, {
                    [1] = "Default", 
                    [2] = "Min-Max", 
                    [3] = "Random"
                });
                v24.fakelimit_l = v34:slider("Left" .. "\n" .. v23 .. v21, 0, 60, 32, 1):depend({
                    [1] = nil, 
                    [2] = "Default", 
                    [1] = v24.fakelimit_options
                });
                v24.fakelimit_r = v34:slider("Right" .. "\n" .. v23 .. v21, 0, 60, 32, 1):depend({
                    [1] = nil, 
                    [2] = "Default", 
                    [1] = v24.fakelimit_options
                });
                v24.fakelimit_l2 = v34:slider("Min" .. "\n" .. v23 .. v21, 0, 60, 32, 1):depend({
                    [1] = nil, 
                    [2] = "Min-Max", 
                    [3] = "Random", 
                    [1] = v24.fakelimit_options
                });
                v24.fakelimit_r2 = v34:slider("Max" .. "\n" .. v23 .. v21, 0, 60, 32, 1):depend({
                    [1] = nil, 
                    [2] = "Min-Max", 
                    [3] = "Random", 
                    [1] = v24.fakelimit_options
                });
                v24.fakelimit_speed = v34:slider("Speed" .. "\n" .. v23 .. v21, 0, 12, 5, 1, function(v36)
                    return v36 .. "t";
                end):depend({
                    [1] = nil, 
                    [2] = "Min-Max", 
                    [1] = v24.fakelimit_options
                });
                v24.defensive_activation_options = v13.lagcomp:selectable("\v\f<triangle-exclamation>\r Break lc" .. "\n" .. v23 .. v21, "Weapon switch", "Weapon reload", "Always");
                v24.defensive_disable_option = v13.lagcomp:switch("     \v\f<turn-down-right>\r  Dont override LC on Quickpeek" .. "\n" .. v23 .. v21, false):depend({
                    [1] = nil, 
                    [2] = "Always", 
                    [1] = v24.defensive_activation_options
                });
                v24.antibruteforce_enable = v13.builder:switch("\v\f<user-ninja>\r Anti-Bruteforce \n" .. v23 .. v21);
                v24.antibruteforce_modifiers = v24.antibruteforce_enable:create():selectable("Modifiers \n" .. v23 .. v21, "Fake limit", "Delay", "Modifier"):depend({
                    [1] = nil, 
                    [2] = true, 
                    [1] = v24.antibruteforce_enable
                });
                v24.yaw_headbehindchest = v13.lagcomp:switch("\v\226\128\139\240\159\135\167\226\128\139\226\128\139\240\159\135\170\226\128\139\226\128\139\240\159\135\185\226\128\139\226\128\139\240\159\135\166\226\128\139 \rHead Behind Burger" .. "\n" .. v23 .. v21, false, "Puts head behind chest when needed to avoid getting resolved");
                v24.cleanrecords = v13.lagcomp:switch("\v\226\128\139\240\159\135\167\226\128\139\226\128\139\240\159\135\170\226\128\139\226\128\139\240\159\135\185\226\128\139\226\128\139\240\159\135\166\226\128\139 \rClear AntiAim Records" .. "\n" .. v23 .. v21, false);
                v24.cleanrecords_usefakelag = v13.lagcomp:switch("      \v\f<triangle-exclamation>  Choke after defensive" .. "\n" .. v23 .. v21, false):depend({
                    [1] = nil, 
                    [2] = true, 
                    [1] = v24.cleanrecords
                });
                v24.cleanrecords_random_flick = v13.lagcomp:switch("      \v\f<triangle-exclamation>  Randomly flick" .. "\n" .. v23 .. v21, false):depend({
                    [1] = nil, 
                    [2] = true, 
                    [1] = v24.cleanrecords
                });
                for _, v38 in pairs(v24) do
                    local v39 = {
                        [1] = {
                            [1] = v10.menu.aa.state, 
                            [2] = v23
                        }, 
                        [2] = {
                            [1] = v10.menu.aa.select_team, 
                            [2] = v21
                        }
                    };
                    v38:depend(table.unpack(v39));
                end;
            end;
        end;
        v10.menu.aa.send_to_another_team = v13.builder_state:button("send to opposite team", function()
            -- upvalues: v10 (ref), l_pui_0 (ref), l_base64_0 (ref)
            local v40 = "state";
            local v41 = v10.menu.aa.select_team:get();
            local v42 = v10.menu.aa.state:get();
            local _ = v10.config:export(v40, v41, v42);
            local v44 = v41 == "counter-terrorist" and "terrorist" or "counter-terrorist";
            local v45 = l_pui_0.setup({
                [1] = v10.menu.aa.states[v41][v42]
            }, true):save();
            local v46 = l_base64_0.encode(json.stringify(v45));
            local v47 = l_base64_0.decode(v46);
            local v48 = json.parse(v47);
            l_pui_0.setup({
                [1] = v10.menu.aa.states[v44][v42]
            }, true):load(v48);
        end, true);
        v10.menu.aa.options = v13.addon:selectable("\v\f<box>\r Options", table.unpack(v10.globals.addition_options));
        local v49 = v10.menu.aa.options:create();
        v10.menu.aa.troll_aa_options = v49:combo("Troll AA", table.unpack(v10.globals.troll_aa_options)):depend({
            [1] = nil, 
            [2] = "Warmup AA", 
            [3] = "Round end AA", 
            [1] = v10.menu.aa.options
        });
        v10.menu.aa.troll_aa_speed = v49:slider("Speed", 1, 10, 0, 1, function(v50)
            return v50 .. "t";
        end):depend({
            [1] = nil, 
            [2] = "Warmup AA", 
            [3] = "Round end AA", 
            [1] = v10.menu.aa.options
        });
        v49 = v10.menu.aa.options:create();
        v10.menu.aa.hidehead_options = v49:selectable("Hide head", table.unpack(v10.globals.hidehead_options)):depend({
            [1] = nil, 
            [2] = "Hide Head", 
            [1] = v10.menu.aa.options
        });
        v10.menu.aa.freestanding = v13.addon:switch("\v\f<arrows-turn-to-dots>\r Freestanding");
        v49 = v10.menu.aa.freestanding:create();
        v10.menu.aa.freestanding_disablers = v49:selectable("Disable conditions", v10.globals.states):depend({
            [1] = nil, 
            [2] = true, 
            [1] = v10.menu.aa.freestanding
        });
        v10.menu.aa.yawmodifier = v49:selectable("Modifier behavior", {
            [1] = "Force static"
        }):depend({
            [1] = nil, 
            [2] = true, 
            [1] = v10.menu.aa.freestanding
        });
        v10.menu.aa.manual_aa = v13.addon:combo("\v\f<right-left>\r Manual Anti-Aim", v10.globals.manual_aa_options);
        v49 = v10.menu.aa.manual_aa:create();
        v10.menu.aa.static_manual = v49:switch("Force static");
        v10.menu.aa.manual_target = v49:combo("Manual mode", {
            [1] = "At targets", 
            [2] = "Local View"
        });
        v10.menu.aa.airlag = v13.addon:switch("\v\f<wind>\r Airlag");
        v10.menu.cfg.list = v12.main:list("\nsaved_configs", {});
        v10.menu.cfg.list:set_callback(function()
            -- upvalues: v10 (ref)
            v10.config:select_current_config();
        end);
        v10.menu.cfg.name = v12.main:input("Config name -");
        v10.menu.cfg.save = v12.main:button("Save", function()
            -- upvalues: v10 (ref)
            v10.config:save();
        end, true);
        v10.menu.cfg.load = v12.main:button("Load", function()
            -- upvalues: v10 (ref)
            v10.config:load();
        end, true);
        v10.menu.cfg.delete = v12.main:button("Remove", function()
            -- upvalues: v10 (ref)
            v10.config:delete();
        end, true);
        v10.menu.cfg.export = v12.main:button("Export", function()
            -- upvalues: l_clipboard_0 (ref), v10 (ref)
            l_clipboard_0.set(v10.config:export("config"));
        end, true);
        v10.menu.cfg.import = v12.main:button("Import", function()
            -- upvalues: l_clipboard_0 (ref), v10 (ref)
            local v51 = l_clipboard_0.get();
            if v51 and v51 ~= "" then
                v10.config:import(v51, "config");
            end;
        end, true);
        v10.menu.vis.scope_overlay = v14.overlays:switch("\v\f<gun>\r Custom Scope Overlay");
        local v52 = v10.menu.vis.scope_overlay:create();
        v10.menu.vis.scope_overlay_color = v52:label("Color", color(255, 255, 255, 255));
        v10.menu.vis.scope_overlay_line = v52:slider("Line", 0, 200, 50, 1);
        v10.menu.vis.scope_overlay_gap = v52:slider("Gap", 0, 200, 10, 1);
        v10.menu.vis.scope_overlay_rotate = v52:switch("Rotate", false);
        v10.menu.vis.aspect_ratio_enable = v14.visuals:switch("\v\f<image-landscape>\r Aspect Ratio", false);
        local v53 = v10.menu.vis.aspect_ratio_enable:create();
        v10.menu.vis.aspectratio = v53:slider("Aspect Ratio", 0, 200, 0, 0.01);
        v10.menu.vis.console_color = v14.visuals:switch("\v\f<terminal>\r  Console Color", false, color(150, 150, 150, 255));
        v10.menu.vis.extravisual = v14.visuals:label("\v\f<person-rifle>\r Custom Viewmodel");
        local v54 = v10.menu.vis.extravisual:create();
        v10.menu.vis.viewmodel_fov = v54:slider("FOV", 0, 1000, 690, 0.1);
        v10.menu.vis.viewmodel_x = v54:slider("X", -150, 150, 25, 0.1);
        v10.menu.vis.viewmodel_y = v54:slider("Y", -150, 150, 25, 0.1);
        v10.menu.vis.viewmodel_z = v54:slider("Z", -150, 150, 25, 0.1);
        v10.menu.vis.viewmodel_knifehand = v54:switch("Opposite knife hand", false);
        v10.menu.vis.jitter_legs = v14.user_interface:switch("\v\f<person-walking-with-cane>\r Jitter legs", false);
        local v55 = v10.menu.vis.jitter_legs:create();
        v10.menu.vis.jitter_legs_from = v55:slider("From\n", 1, 100, 0, 1, function(v56)
            return v56 / 100 .. "x";
        end):depend({
            [1] = nil, 
            [2] = true, 
            [1] = v10.menu.vis.jitter_legs
        });
        v10.menu.vis.jitter_legs_to = v55:slider("To\n", 1, 100, 0, 1, function(v57)
            return v57 / 100 .. "x";
        end):depend({
            [1] = nil, 
            [2] = true, 
            [1] = v10.menu.vis.jitter_legs
        });
        v10.menu.vis.animations_fall_amount = v14.user_interface:slider("\v\f<person-falling>\r Falling", 1, 100, 50, 1, function(v58)
            return v58 .. "%";
        end);
        v10.menu.vis.animations_lean_amount = v14.user_interface:slider("\v\f<person>\r Leaning", 1, 100, 0, 1, function(v59)
            return v59 .. "%";
        end);
        v10.menu.vis.animations_slide_amount = v14.user_interface:slider("\v\f<person-walking>\r Sliding", 1, 100, 50, 1, function(v60)
            return v60 .. "%";
        end):depend({
            [1] = nil, 
            [2] = false, 
            [1] = v10.menu.vis.jitter_legs
        });
        v10.menu.vis.disable_sleeves = v14.visuals:switch("\v\f<hand>\r Disable Sleeves", false);
        v10.menu.vis.netgraph_enable = v14.visuals:switch("\v\f<wifi>\r Custom Netgraph", false, color(158, 155, 178, 255));
        v10.menu.vis.lagcomp_debug = v14.visuals:switch("\v\f<ban-bug>\r Lagcomp Debug", false);
        v10.menu.vis.dmgindicator = v14.overlays:switch("\v\f<claw-marks>\r Minimum Damage Indicator");
        local v61 = v10.menu.vis.dmgindicator:create();
        v10.menu.vis.dmgindicator_show = v61:switch("Only show when overriding"):depend({
            [1] = nil, 
            [2] = true, 
            [1] = v10.menu.vis.dmgindicator
        });
        v10.menu.vis.dmg_color = v61:label("Color", color(255, 255, 255, 255)):depend({
            [1] = nil, 
            [2] = true, 
            [1] = v10.menu.vis.dmgindicator
        });
        v10.menu.vis.manual_arrows = v14.overlays:switch("\v\f<arrows-to-dot>\r Visualize Manual AA", false, color(255, 0, 0, 255));
        v10.menu.vis.hit_marker = v14.overlays:switch("\v\f<crosshairs-simple>\r Hit Marker [Crosshair]", false, color(255, 255, 255, 255));
        v10.menu.vis.kibit_marker = v14.overlays:switch("\v\f<crosshairs-simple>\r Hit Marker [World]", false);
        v10.menu.vis.gingerindicators = v14.overlays:switch("\v\f<burger>\r Happy Meal Indicators", false);
        v10.menu.misc.fakeduck_label = v14.movement:label("\v\f<duck>\r Fakeduck Modifiers");
        v10.menu.misc.no_fall = v14.movement:switch("\v\f<person-falling>\r No Fall Damage", false);
        local v62 = v10.menu.misc.fakeduck_label:create();
        v10.menu.misc.freezetime_fakeduck = v62:switch("Freezetime Fakeduck", false);
        v10.menu.misc.unlock_fakeduck_speed = v62:switch("Override Fakeduck Speed", false);
        v10.menu.misc.disable_cvars = v14.common:switch("\v\f<layer-group>\r Disable Useless Cvars");
        v10.menu.misc.keep_model_transparency = v14.common:switch("\v\f<person-falling>\r Keep Model Transparency");
        v10.menu.misc.pingspike = v14.common:label("\v\f<signal-stream>\r Unlock Fake Latency");
        local v63 = v10.menu.misc.pingspike:create();
        v10.menu.misc.extended_ping_amount = v63:slider("Fake Latency", 0, 200, 0, nil);
        v10.menu.misc.fast_ladder = v14.movement:switch("\v\f<water-ladder>\r Fast Ladder", false);
        v10.menu.misc.hitlogs_label = v14.common:label("\v\f<calendar-lines-pen>\r Print Events");
        local v64 = v10.menu.misc.hitlogs_label:create();
        v10.menu.misc.hitlog_options = v64:selectable("Log", "Shots", "Nades");
        v10.menu.misc.hitlogs = v64:selectable("Appereance", "On screen", "Console", "Center screen");
        v10.menu.misc.hitlog_color = v64:label("", color(161, 135, 153)):depend({
            [1] = nil, 
            [2] = "On screen", 
            [1] = v10.menu.misc.hitlogs
        }):depend({
            [1] = nil, 
            [2] = "On screen", 
            [1] = v10.menu.misc.hitlogs
        });
        v10.menu.misc.extra_notifications = v14.common:label("\v\f<calendar-xmark>\r Notifications");
        local v65 = v10.menu.misc.extra_notifications:create();
        v10.menu.misc.extra_notification_options = v65:selectable("Display", "Anti-Bruteforce");
        v10.menu.misc.killsay = v14.common:label("\v\f<trash>\r Trashtalk");
        local v66 = v10.menu.misc.killsay:create();
        v10.menu.misc.trashtalk_states = v66:selectable("Trashtalk on", "Death", "Kill");
    end, 
    sidebarname = function(v67)
        -- upvalues: l_pui_0 (ref)
        local v68 = {
            [1] = "\240\159\146\128", 
            [2] = "\240\159\152\173", 
            [3] = "\240\159\152\158", 
            [4] = "\240\159\145\191", 
            [5] = "\240\159\171\131"
        };
        local v69 = v67.menu.global.sidebar_color:get_color();
        local l_r_0 = v69.r;
        local l_g_0 = v69.g;
        local l_b_0 = v69.b;
        local l_a_0 = v69.a;
        if v67.globals.current_logo > 5 then
            v67.globals.current_logo = 0;
        end;
        if v67.globals.logo_counter % 125 == 0 then
            v67.globals.current_logo = v67.globals.current_logo + 1;
        end;
        l_pui_0.sidebar(v67.helpers:gradienttext(globals.curtime, v67.menu.global.sidebar_text:get(), l_r_0, l_g_0, l_b_0, l_a_0, 255, 87, 31, 255, v67.menu.global.sidebar_speed:get()), v68[v67.globals.current_logo]);
        v67.globals.logo_counter = v67.globals.logo_counter + 1;
    end
}):struct("config")({
    config_file = "gingersense_cfgs", 
    storage = {}, 
    default_configs = {
        pirex = "{gingersense:config}:W3sibG9nX3ByZWZpeCI6IltnaW5naV0iLCJzaWRlYmFyX2NvbG9yIjoiI0IyRTRCM0ZGIiwic2lkZWJhcl9zcGVlZCI6My4wLCJzaWRlYmFyX3RleHQiOiJHSU5HSSAo4pejX+KXoikiLCJ3YXRlcm1hcmtfY29sb3IiOiIjQjVCRURBRDgiLCJ3YXRlcm1hcmtfZm9udCI6NC4wLCJ3YXRlcm1hcmtfZ3JhZGllbnQiOjIuMCwid2F0ZXJtYXJrX3NwZWVkIjoxLjAsIndhdGVybWFya19zdHlsZSI6IkN1c3RvbSIsIndhdGVybWFya190ZXh0IjoiR0lOR0lTRU5aIFRPTyBUVUZGICjil6Nf4peiKSJ9LHsiYWlybGFnIjpmYWxzZSwiZnJlZXN0YW5kaW5nIjpmYWxzZSwiZnJlZXN0YW5kaW5nX2Rpc2FibGVycyI6WyJkdWNrIiwianVtcCIsImR1Y2sganVtcCIsIn4iXSwiaGlkZWhlYWRfb3B0aW9ucyI6WyJBaXIgQ3JvdWNoIEtuaWZlIiwiVGFzZXIgSW4gQWlyIiwifiJdLCJtYW51YWxfYWEiOiJPZmYiLCJtYW51YWxfdGFyZ2V0IjoiTG9jYWwgVmlldyIsIm9wdGlvbnMiOlsiUm91bmQgZW5kIEFBIiwiSGlkZSBIZWFkIiwiQXZvaWQgQmFja3N0YWIiLCJ+Il0sInNlbGVjdF90ZWFtIjoiY291bnRlci10ZXJyb3Jpc3QiLCJzdGF0ZSI6ImR1Y2sganVtcCIsInN0YXRlcyI6eyJjb3VudGVyLXRlcnJvcmlzdCI6eyJkdWNrIjp7ImFudGlicnV0ZWZvcmNlX2VuYWJsZSI6dHJ1ZSwiYW50aWJydXRlZm9yY2VfbW9kaWZpZXJzIjpbIkRlbGF5IiwifiJdLCJib2R5X3lhdyI6IkppdHRlciIsImJvZHlfeWF3X3RpY2tzIjoxMi4wLCJjbGVhbnJlY29yZHMiOnRydWUsImNsZWFucmVjb3Jkc19yYW5kb21fZmxpY2siOmZhbHNlLCJjbGVhbnJlY29yZHNfdXNlZmFrZWxhZyI6ZmFsc2UsImRlZmVuc2l2ZV9hY3RpdmF0aW9uX29wdGlvbnMiOlsiQWx3YXlzIiwifiJdLCJkZWZlbnNpdmVfZGlzYWJsZV9vcHRpb24iOnRydWUsImRlbGF5Ijp0cnVlLCJkZWxheV9pbnRlcmFjdGlvbl90eXBlIjoiQ3JlYXRlbW92ZSIsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9zbGlkZXJzIjo2LjAsImZha2VsaW1pdF9sIjo1OC4wLCJmYWtlbGltaXRfbDIiOjMyLjAsImZha2VsaW1pdF9vcHRpb25zIjoiRGVmYXVsdCIsImZha2VsaW1pdF9yIjo1OC4wLCJmYWtlbGltaXRfcjIiOjMyLjAsImZha2VsaW1pdF9zcGVlZCI6NS4wLCJyYW5kb21fZGVsYXlfdmFsdWVfMSI6Mi4wLCJyYW5kb21fZGVsYXlfdmFsdWVfMiI6My4wLCJyYW5kb21pemF0aW9uIjo4LjAsInN3aXRjaF9kZWxheSI6Mi4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczEiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMyIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMyI6NC4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczQiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM1IjoyLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNiI6Mi4wLCJzd2l0Y2hfdmFsdWUiOjQuMCwieWF3X2FkZCI6MC4wLCJ5YXdfYWRkX3IiOjAuMCwieWF3X2hlYWRiZWhpbmRjaGVzdCI6ZmFsc2UsInlhd19qaXR0ZXIiOiJPZmZzZXQiLCJ5YXdfaml0dGVyX2FkZCI6MS4wLCJ5YXdfaml0dGVyX21vZGUiOiJEZWZhdWx0IiwieWF3X2ppdHRlcl9vd24xIjowLjAsInlhd19qaXR0ZXJfb3duMiI6MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjEiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyMiI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXIzIjo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjQiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNSI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI2Ijo1MC4wLCJ5YXdfc2xpZGVycyI6MS4wfSwiZHVjayBqdW1wIjp7ImFudGlicnV0ZWZvcmNlX2VuYWJsZSI6dHJ1ZSwiYW50aWJydXRlZm9yY2VfbW9kaWZpZXJzIjpbIkZha2UgbGltaXQiLCJ+Il0sImJvZHlfeWF3IjoiSml0dGVyIiwiYm9keV95YXdfdGlja3MiOjEyLjAsImNsZWFucmVjb3JkcyI6ZmFsc2UsImNsZWFucmVjb3Jkc19yYW5kb21fZmxpY2siOmZhbHNlLCJjbGVhbnJlY29yZHNfdXNlZmFrZWxhZyI6ZmFsc2UsImRlZmVuc2l2ZV9hY3RpdmF0aW9uX29wdGlvbnMiOlsiQWx3YXlzIiwifiJdLCJkZWZlbnNpdmVfZGlzYWJsZV9vcHRpb24iOmZhbHNlLCJkZWxheSI6dHJ1ZSwiZGVsYXlfaW50ZXJhY3Rpb25fdHlwZSI6IkNyZWF0ZW1vdmUiLCJkZWxheV9tZXRob2QiOiJSYW5kb20iLCJkZWxheV9zbGlkZXJzIjo2LjAsImZha2VsaW1pdF9sIjo1OC4wLCJmYWtlbGltaXRfbDIiOjMyLjAsImZha2VsaW1pdF9vcHRpb25zIjoiRGVmYXVsdCIsImZha2VsaW1pdF9yIjo1OC4wLCJmYWtlbGltaXRfcjIiOjMyLjAsImZha2VsaW1pdF9zcGVlZCI6NS4wLCJyYW5kb21fZGVsYXlfdmFsdWVfMSI6My4wLCJyYW5kb21fZGVsYXlfdmFsdWVfMiI6Ni4wLCJyYW5kb21pemF0aW9uIjo4LjAsInN3aXRjaF9kZWxheSI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczEiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMyIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMyI6MjAuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM0IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNSI6NS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczYiOjMuMCwic3dpdGNoX3ZhbHVlIjoxLjAsInlhd19hZGQiOi0yNy4wLCJ5YXdfYWRkX3IiOjM1LjAsInlhd19oZWFkYmVoaW5kY2hlc3QiOmZhbHNlLCJ5YXdfaml0dGVyIjoiR2luZ2VyYm9tYmVyIiwieWF3X2ppdHRlcl9hZGQiOjAuMCwieWF3X2ppdHRlcl9tb2RlIjoiQ3VzdG9tIiwieWF3X2ppdHRlcl9vd24xIjotNy4wLCJ5YXdfaml0dGVyX293bjIiOjEwLjAsInlhd19qaXR0ZXJfc2xpZGVyMSI6NS4wLCJ5YXdfaml0dGVyX3NsaWRlcjIiOi01LjAsInlhd19qaXR0ZXJfc2xpZGVyMyI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI0Ijo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjUiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNiI6NTAuMCwieWF3X3NsaWRlcnMiOjIuMH0sImR1Y2sgbW92ZSI6eyJhbnRpYnJ1dGVmb3JjZV9lbmFibGUiOmZhbHNlLCJhbnRpYnJ1dGVmb3JjZV9tb2RpZmllcnMiOlsifiJdLCJib2R5X3lhdyI6IkppdHRlciIsImJvZHlfeWF3X3RpY2tzIjoxMi4wLCJjbGVhbnJlY29yZHMiOmZhbHNlLCJjbGVhbnJlY29yZHNfcmFuZG9tX2ZsaWNrIjpmYWxzZSwiY2xlYW5yZWNvcmRzX3VzZWZha2VsYWciOmZhbHNlLCJkZWZlbnNpdmVfYWN0aXZhdGlvbl9vcHRpb25zIjpbIldlYXBvbiBzd2l0Y2giLCJXZWFwb24gcmVsb2FkIiwifiJdLCJkZWZlbnNpdmVfZGlzYWJsZV9vcHRpb24iOmZhbHNlLCJkZWxheSI6dHJ1ZSwiZGVsYXlfaW50ZXJhY3Rpb25fdHlwZSI6IkNyZWF0ZW1vdmUiLCJkZWxheV9tZXRob2QiOiJSYW5kb20iLCJkZWxheV9zbGlkZXJzIjoyLjAsImZha2VsaW1pdF9sIjo1OS4wLCJmYWtlbGltaXRfbDIiOjMyLjAsImZha2VsaW1pdF9vcHRpb25zIjoiRGVmYXVsdCIsImZha2VsaW1pdF9yIjo1OS4wLCJmYWtlbGltaXRfcjIiOjMyLjAsImZha2VsaW1pdF9zcGVlZCI6NS4wLCJyYW5kb21fZGVsYXlfdmFsdWVfMSI6NS4wLCJyYW5kb21fZGVsYXlfdmFsdWVfMiI6MTAuMCwicmFuZG9taXphdGlvbiI6MC4wLCJzd2l0Y2hfZGVsYXkiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMxIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMiI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczMiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM0IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNSI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczYiOjEuMCwic3dpdGNoX3ZhbHVlIjo0LjAsInlhd19hZGQiOi0yMC4wLCJ5YXdfYWRkX3IiOjQwLjAsInlhd19oZWFkYmVoaW5kY2hlc3QiOmZhbHNlLCJ5YXdfaml0dGVyIjoiT2ZmIiwieWF3X2ppdHRlcl9hZGQiOjAuMCwieWF3X2ppdHRlcl9tb2RlIjoiRGVmYXVsdCIsInlhd19qaXR0ZXJfb3duMSI6MC4wLCJ5YXdfaml0dGVyX293bjIiOjAuMCwieWF3X2ppdHRlcl9zbGlkZXIxIjo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjIiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyMyI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI0Ijo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjUiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNiI6NTAuMCwieWF3X3NsaWRlcnMiOjEuMH0sImp1bXAiOnsiYW50aWJydXRlZm9yY2VfZW5hYmxlIjp0cnVlLCJhbnRpYnJ1dGVmb3JjZV9tb2RpZmllcnMiOlsiRmFrZSBsaW1pdCIsIk1vZGlmaWVyIiwifiJdLCJib2R5X3lhdyI6IkppdHRlciIsImJvZHlfeWF3X3RpY2tzIjoxMi4wLCJjbGVhbnJlY29yZHMiOmZhbHNlLCJjbGVhbnJlY29yZHNfcmFuZG9tX2ZsaWNrIjpmYWxzZSwiY2xlYW5yZWNvcmRzX3VzZWZha2VsYWciOmZhbHNlLCJkZWZlbnNpdmVfYWN0aXZhdGlvbl9vcHRpb25zIjpbIkFsd2F5cyIsIn4iXSwiZGVmZW5zaXZlX2Rpc2FibGVfb3B0aW9uIjpmYWxzZSwiZGVsYXkiOmZhbHNlLCJkZWxheV9pbnRlcmFjdGlvbl90eXBlIjoiQ3JlYXRlbW92ZSIsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9zbGlkZXJzIjoxLjAsImZha2VsaW1pdF9sIjo1OS4wLCJmYWtlbGltaXRfbDIiOjMyLjAsImZha2VsaW1pdF9vcHRpb25zIjoiRGVmYXVsdCIsImZha2VsaW1pdF9yIjo1OS4wLCJmYWtlbGltaXRfcjIiOjMyLjAsImZha2VsaW1pdF9zcGVlZCI6NS4wLCJyYW5kb21fZGVsYXlfdmFsdWVfMSI6MS4wLCJyYW5kb21fZGVsYXlfdmFsdWVfMiI6MS4wLCJyYW5kb21pemF0aW9uIjowLjAsInN3aXRjaF9kZWxheSI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczEiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMyIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMyI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczQiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM1IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNiI6MS4wLCJzd2l0Y2hfdmFsdWUiOjQuMCwieWF3X2FkZCI6MC4wLCJ5YXdfYWRkX3IiOjAuMCwieWF3X2hlYWRiZWhpbmRjaGVzdCI6ZmFsc2UsInlhd19qaXR0ZXIiOiJPZmYiLCJ5YXdfaml0dGVyX2FkZCI6MC4wLCJ5YXdfaml0dGVyX21vZGUiOiJEZWZhdWx0IiwieWF3X2ppdHRlcl9vd24xIjowLjAsInlhd19qaXR0ZXJfb3duMiI6MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjEiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyMiI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXIzIjo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjQiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNSI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI2Ijo1MC4wLCJ5YXdfc2xpZGVycyI6MS4wfSwicnVuIjp7ImFudGlicnV0ZWZvcmNlX2VuYWJsZSI6dHJ1ZSwiYW50aWJydXRlZm9yY2VfbW9kaWZpZXJzIjpbIkRlbGF5IiwifiJdLCJib2R5X3lhdyI6IkppdHRlciIsImJvZHlfeWF3X3RpY2tzIjoxMi4wLCJjbGVhbnJlY29yZHMiOmZhbHNlLCJjbGVhbnJlY29yZHNfcmFuZG9tX2ZsaWNrIjpmYWxzZSwiY2xlYW5yZWNvcmRzX3VzZWZha2VsYWciOmZhbHNlLCJkZWZlbnNpdmVfYWN0aXZhdGlvbl9vcHRpb25zIjpbIldlYXBvbiBzd2l0Y2giLCJXZWFwb24gcmVsb2FkIiwifiJdLCJkZWZlbnNpdmVfZGlzYWJsZV9vcHRpb24iOnRydWUsImRlbGF5IjpmYWxzZSwiZGVsYXlfaW50ZXJhY3Rpb25fdHlwZSI6IkNyZWF0ZW1vdmUiLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0IiwiZGVsYXlfc2xpZGVycyI6MS4wLCJmYWtlbGltaXRfbCI6MjguMCwiZmFrZWxpbWl0X2wyIjoyOC4wLCJmYWtlbGltaXRfb3B0aW9ucyI6Ik1pbi1NYXgiLCJmYWtlbGltaXRfciI6NjAuMCwiZmFrZWxpbWl0X3IyIjo1OC4wLCJmYWtlbGltaXRfc3BlZWQiOjUuMCwicmFuZG9tX2RlbGF5X3ZhbHVlXzEiOjEuMCwicmFuZG9tX2RlbGF5X3ZhbHVlXzIiOjEuMCwicmFuZG9taXphdGlvbiI6MTAuMCwic3dpdGNoX2RlbGF5IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMSI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczIiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMzIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNCI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczUiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM2IjoxLjAsInN3aXRjaF92YWx1ZSI6NC4wLCJ5YXdfYWRkIjotMjcuMCwieWF3X2FkZF9yIjozNy4wLCJ5YXdfaGVhZGJlaGluZGNoZXN0IjpmYWxzZSwieWF3X2ppdHRlciI6IlJhbmRvbSIsInlhd19qaXR0ZXJfYWRkIjozNC4wLCJ5YXdfaml0dGVyX21vZGUiOiJDdXN0b20iLCJ5YXdfaml0dGVyX293bjEiOjAuMCwieWF3X2ppdHRlcl9vd24yIjowLjAsInlhd19qaXR0ZXJfc2xpZGVyMSI6MS4wLCJ5YXdfaml0dGVyX3NsaWRlcjIiOjMuMCwieWF3X2ppdHRlcl9zbGlkZXIzIjozNC4wLCJ5YXdfaml0dGVyX3NsaWRlcjQiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNSI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI2Ijo1MC4wLCJ5YXdfc2xpZGVycyI6Mi4wfSwic2xvdyB3YWxrIjp7ImFudGlicnV0ZWZvcmNlX2VuYWJsZSI6dHJ1ZSwiYW50aWJydXRlZm9yY2VfbW9kaWZpZXJzIjpbIkZha2UgbGltaXQiLCJEZWxheSIsIk1vZGlmaWVyIiwifiJdLCJib2R5X3lhdyI6IkppdHRlciIsImJvZHlfeWF3X3RpY2tzIjoxMi4wLCJjbGVhbnJlY29yZHMiOmZhbHNlLCJjbGVhbnJlY29yZHNfcmFuZG9tX2ZsaWNrIjpmYWxzZSwiY2xlYW5yZWNvcmRzX3VzZWZha2VsYWciOmZhbHNlLCJkZWZlbnNpdmVfYWN0aXZhdGlvbl9vcHRpb25zIjpbIkFsd2F5cyIsIn4iXSwiZGVmZW5zaXZlX2Rpc2FibGVfb3B0aW9uIjpmYWxzZSwiZGVsYXkiOmZhbHNlLCJkZWxheV9pbnRlcmFjdGlvbl90eXBlIjoiQ3JlYXRlbW92ZSIsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9zbGlkZXJzIjoxLjAsImZha2VsaW1pdF9sIjo1OC4wLCJmYWtlbGltaXRfbDIiOjMyLjAsImZha2VsaW1pdF9vcHRpb25zIjoiRGVmYXVsdCIsImZha2VsaW1pdF9yIjo1OC4wLCJmYWtlbGltaXRfcjIiOjMyLjAsImZha2VsaW1pdF9zcGVlZCI6NS4wLCJyYW5kb21fZGVsYXlfdmFsdWVfMSI6MS4wLCJyYW5kb21fZGVsYXlfdmFsdWVfMiI6MS4wLCJyYW5kb21pemF0aW9uIjoyMC4wLCJzd2l0Y2hfZGVsYXkiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMxIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMiI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczMiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM0IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNSI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczYiOjEuMCwic3dpdGNoX3ZhbHVlIjo0LjAsInlhd19hZGQiOi0xMC4wLCJ5YXdfYWRkX3IiOi0xMC4wLCJ5YXdfaGVhZGJlaGluZGNoZXN0IjpmYWxzZSwieWF3X2ppdHRlciI6Ik9mZnNldCIsInlhd19qaXR0ZXJfYWRkIjoxLjAsInlhd19qaXR0ZXJfbW9kZSI6IkRlZmF1bHQiLCJ5YXdfaml0dGVyX293bjEiOjAuMCwieWF3X2ppdHRlcl9vd24yIjowLjAsInlhd19qaXR0ZXJfc2xpZGVyMSI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXIyIjo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjMiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNCI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI1Ijo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjYiOjUwLjAsInlhd19zbGlkZXJzIjoxLjB9LCJzdGFuZCI6eyJhbnRpYnJ1dGVmb3JjZV9lbmFibGUiOnRydWUsImFudGlicnV0ZWZvcmNlX21vZGlmaWVycyI6WyJ+Il0sImJvZHlfeWF3IjoiSml0dGVyIiwiYm9keV95YXdfdGlja3MiOjEyLjAsImNsZWFucmVjb3JkcyI6dHJ1ZSwiY2xlYW5yZWNvcmRzX3JhbmRvbV9mbGljayI6ZmFsc2UsImNsZWFucmVjb3Jkc191c2VmYWtlbGFnIjpmYWxzZSwiZGVmZW5zaXZlX2FjdGl2YXRpb25fb3B0aW9ucyI6WyJXZWFwb24gc3dpdGNoIiwiV2VhcG9uIHJlbG9hZCIsIn4iXSwiZGVmZW5zaXZlX2Rpc2FibGVfb3B0aW9uIjp0cnVlLCJkZWxheSI6ZmFsc2UsImRlbGF5X2ludGVyYWN0aW9uX3R5cGUiOiJDcmVhdGVtb3ZlIiwiZGVsYXlfbWV0aG9kIjoiRGVmYXVsdCIsImRlbGF5X3NsaWRlcnMiOjEuMCwiZmFrZWxpbWl0X2wiOjU5LjAsImZha2VsaW1pdF9sMiI6MzIuMCwiZmFrZWxpbWl0X29wdGlvbnMiOiJEZWZhdWx0IiwiZmFrZWxpbWl0X3IiOjU5LjAsImZha2VsaW1pdF9yMiI6MzIuMCwiZmFrZWxpbWl0X3NwZWVkIjo1LjAsInJhbmRvbV9kZWxheV92YWx1ZV8xIjoxLjAsInJhbmRvbV9kZWxheV92YWx1ZV8yIjoxLjAsInJhbmRvbWl6YXRpb24iOjguMCwic3dpdGNoX2RlbGF5IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMSI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczIiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMzIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNCI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczUiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM2IjoxLjAsInN3aXRjaF92YWx1ZSI6NC4wLCJ5YXdfYWRkIjowLjAsInlhd19hZGRfciI6MC4wLCJ5YXdfaGVhZGJlaGluZGNoZXN0Ijp0cnVlLCJ5YXdfaml0dGVyIjoiT2Zmc2V0IiwieWF3X2ppdHRlcl9hZGQiOjEuMCwieWF3X2ppdHRlcl9tb2RlIjoiRGVmYXVsdCIsInlhd19qaXR0ZXJfb3duMSI6MC4wLCJ5YXdfaml0dGVyX293bjIiOjAuMCwieWF3X2ppdHRlcl9zbGlkZXIxIjo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjIiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyMyI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI0Ijo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjUiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNiI6NTAuMCwieWF3X3NsaWRlcnMiOjEuMH19LCJ0ZXJyb3Jpc3QiOnsiZHVjayI6eyJhbnRpYnJ1dGVmb3JjZV9lbmFibGUiOnRydWUsImFudGlicnV0ZWZvcmNlX21vZGlmaWVycyI6WyJEZWxheSIsIn4iXSwiYm9keV95YXciOiJKaXR0ZXIiLCJib2R5X3lhd190aWNrcyI6MTIuMCwiY2xlYW5yZWNvcmRzIjp0cnVlLCJjbGVhbnJlY29yZHNfcmFuZG9tX2ZsaWNrIjpmYWxzZSwiY2xlYW5yZWNvcmRzX3VzZWZha2VsYWciOmZhbHNlLCJkZWZlbnNpdmVfYWN0aXZhdGlvbl9vcHRpb25zIjpbIkFsd2F5cyIsIn4iXSwiZGVmZW5zaXZlX2Rpc2FibGVfb3B0aW9uIjp0cnVlLCJkZWxheSI6ZmFsc2UsImRlbGF5X2ludGVyYWN0aW9uX3R5cGUiOiJOZXRfdXBkYXRlIiwiZGVsYXlfbWV0aG9kIjoiQ3VzdG9tIiwiZGVsYXlfc2xpZGVycyI6Ni4wLCJmYWtlbGltaXRfbCI6NjAuMCwiZmFrZWxpbWl0X2wyIjozMi4wLCJmYWtlbGltaXRfb3B0aW9ucyI6IkRlZmF1bHQiLCJmYWtlbGltaXRfciI6NjAuMCwiZmFrZWxpbWl0X3IyIjozMi4wLCJmYWtlbGltaXRfc3BlZWQiOjUuMCwicmFuZG9tX2RlbGF5X3ZhbHVlXzEiOjEuMCwicmFuZG9tX2RlbGF5X3ZhbHVlXzIiOjEuMCwicmFuZG9taXphdGlvbiI6OC4wLCJzd2l0Y2hfZGVsYXkiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMxIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMiI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczMiOjQuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM0IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNSI6Mi4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczYiOjIuMCwic3dpdGNoX3ZhbHVlIjo0LjAsInlhd19hZGQiOjAuMCwieWF3X2FkZF9yIjowLjAsInlhd19oZWFkYmVoaW5kY2hlc3QiOnRydWUsInlhd19qaXR0ZXIiOiJPZmZzZXQiLCJ5YXdfaml0dGVyX2FkZCI6LTEuMCwieWF3X2ppdHRlcl9tb2RlIjoiRGVmYXVsdCIsInlhd19qaXR0ZXJfb3duMSI6MC4wLCJ5YXdfaml0dGVyX293bjIiOjAuMCwieWF3X2ppdHRlcl9zbGlkZXIxIjo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjIiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyMyI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI0Ijo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjUiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNiI6NTAuMCwieWF3X3NsaWRlcnMiOjEuMH0sImR1Y2sganVtcCI6eyJhbnRpYnJ1dGVmb3JjZV9lbmFibGUiOnRydWUsImFudGlicnV0ZWZvcmNlX21vZGlmaWVycyI6WyJEZWxheSIsIn4iXSwiYm9keV95YXciOiJKaXR0ZXIiLCJib2R5X3lhd190aWNrcyI6MTIuMCwiY2xlYW5yZWNvcmRzIjpmYWxzZSwiY2xlYW5yZWNvcmRzX3JhbmRvbV9mbGljayI6ZmFsc2UsImNsZWFucmVjb3Jkc191c2VmYWtlbGFnIjpmYWxzZSwiZGVmZW5zaXZlX2FjdGl2YXRpb25fb3B0aW9ucyI6WyJBbHdheXMiLCJ+Il0sImRlZmVuc2l2ZV9kaXNhYmxlX29wdGlvbiI6ZmFsc2UsImRlbGF5Ijp0cnVlLCJkZWxheV9pbnRlcmFjdGlvbl90eXBlIjoiQ3JlYXRlbW92ZSIsImRlbGF5X21ldGhvZCI6IlJhbmRvbSIsImRlbGF5X3NsaWRlcnMiOjYuMCwiZmFrZWxpbWl0X2wiOjYwLjAsImZha2VsaW1pdF9sMiI6MzIuMCwiZmFrZWxpbWl0X29wdGlvbnMiOiJEZWZhdWx0IiwiZmFrZWxpbWl0X3IiOjYwLjAsImZha2VsaW1pdF9yMiI6MzIuMCwiZmFrZWxpbWl0X3NwZWVkIjo1LjAsInJhbmRvbV9kZWxheV92YWx1ZV8xIjoyLjAsInJhbmRvbV9kZWxheV92YWx1ZV8yIjozLjAsInJhbmRvbWl6YXRpb24iOjUuMCwic3dpdGNoX2RlbGF5IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMSI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczIiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMzIjoyMC4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczQiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM1Ijo1LjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNiI6My4wLCJzd2l0Y2hfdmFsdWUiOjIuMCwieWF3X2FkZCI6LTI3LjAsInlhd19hZGRfciI6MzQuMCwieWF3X2hlYWRiZWhpbmRjaGVzdCI6dHJ1ZSwieWF3X2ppdHRlciI6IkdpbmdlcmJvbWJlciIsInlhd19qaXR0ZXJfYWRkIjowLjAsInlhd19qaXR0ZXJfbW9kZSI6IkN1c3RvbSIsInlhd19qaXR0ZXJfb3duMSI6LTcuMCwieWF3X2ppdHRlcl9vd24yIjoxMS4wLCJ5YXdfaml0dGVyX3NsaWRlcjEiOjEuMCwieWF3X2ppdHRlcl9zbGlkZXIyIjotMS4wLCJ5YXdfaml0dGVyX3NsaWRlcjMiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNCI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI1Ijo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjYiOjUwLjAsInlhd19zbGlkZXJzIjoyLjB9LCJkdWNrIG1vdmUiOnsiYW50aWJydXRlZm9yY2VfZW5hYmxlIjpmYWxzZSwiYW50aWJydXRlZm9yY2VfbW9kaWZpZXJzIjpbIn4iXSwiYm9keV95YXciOiJKaXR0ZXIiLCJib2R5X3lhd190aWNrcyI6MTIuMCwiY2xlYW5yZWNvcmRzIjpmYWxzZSwiY2xlYW5yZWNvcmRzX3JhbmRvbV9mbGljayI6ZmFsc2UsImNsZWFucmVjb3Jkc191c2VmYWtlbGFnIjpmYWxzZSwiZGVmZW5zaXZlX2FjdGl2YXRpb25fb3B0aW9ucyI6WyJXZWFwb24gc3dpdGNoIiwiV2VhcG9uIHJlbG9hZCIsIn4iXSwiZGVmZW5zaXZlX2Rpc2FibGVfb3B0aW9uIjp0cnVlLCJkZWxheSI6dHJ1ZSwiZGVsYXlfaW50ZXJhY3Rpb25fdHlwZSI6IkNyZWF0ZW1vdmUiLCJkZWxheV9tZXRob2QiOiJSYW5kb20iLCJkZWxheV9zbGlkZXJzIjoyLjAsImZha2VsaW1pdF9sIjo1OS4wLCJmYWtlbGltaXRfbDIiOjMyLjAsImZha2VsaW1pdF9vcHRpb25zIjoiRGVmYXVsdCIsImZha2VsaW1pdF9yIjo1OS4wLCJmYWtlbGltaXRfcjIiOjMyLjAsImZha2VsaW1pdF9zcGVlZCI6NS4wLCJyYW5kb21fZGVsYXlfdmFsdWVfMSI6My4wLCJyYW5kb21fZGVsYXlfdmFsdWVfMiI6NS4wLCJyYW5kb21pemF0aW9uIjowLjAsInN3aXRjaF9kZWxheSI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczEiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMyIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMyI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczQiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM1IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNiI6MS4wLCJzd2l0Y2hfdmFsdWUiOjQuMCwieWF3X2FkZCI6LTIwLjAsInlhd19hZGRfciI6NDAuMCwieWF3X2hlYWRiZWhpbmRjaGVzdCI6ZmFsc2UsInlhd19qaXR0ZXIiOiJPZmZzZXQiLCJ5YXdfaml0dGVyX2FkZCI6MC4wLCJ5YXdfaml0dGVyX21vZGUiOiJDdXN0b20iLCJ5YXdfaml0dGVyX293bjEiOjAuMCwieWF3X2ppdHRlcl9vd24yIjowLjAsInlhd19qaXR0ZXJfc2xpZGVyMSI6NS4wLCJ5YXdfaml0dGVyX3NsaWRlcjIiOi01LjAsInlhd19qaXR0ZXJfc2xpZGVyMyI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI0Ijo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjUiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNiI6NTAuMCwieWF3X3NsaWRlcnMiOjIuMH0sImp1bXAiOnsiYW50aWJydXRlZm9yY2VfZW5hYmxlIjp0cnVlLCJhbnRpYnJ1dGVmb3JjZV9tb2RpZmllcnMiOlsiRmFrZSBsaW1pdCIsIk1vZGlmaWVyIiwifiJdLCJib2R5X3lhdyI6IkppdHRlciIsImJvZHlfeWF3X3RpY2tzIjoxMi4wLCJjbGVhbnJlY29yZHMiOmZhbHNlLCJjbGVhbnJlY29yZHNfcmFuZG9tX2ZsaWNrIjpmYWxzZSwiY2xlYW5yZWNvcmRzX3VzZWZha2VsYWciOmZhbHNlLCJkZWZlbnNpdmVfYWN0aXZhdGlvbl9vcHRpb25zIjpbIkFsd2F5cyIsIn4iXSwiZGVmZW5zaXZlX2Rpc2FibGVfb3B0aW9uIjpmYWxzZSwiZGVsYXkiOmZhbHNlLCJkZWxheV9pbnRlcmFjdGlvbl90eXBlIjoiQ3JlYXRlbW92ZSIsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9zbGlkZXJzIjoxLjAsImZha2VsaW1pdF9sIjo1OS4wLCJmYWtlbGltaXRfbDIiOjMyLjAsImZha2VsaW1pdF9vcHRpb25zIjoiRGVmYXVsdCIsImZha2VsaW1pdF9yIjo1OS4wLCJmYWtlbGltaXRfcjIiOjMyLjAsImZha2VsaW1pdF9zcGVlZCI6NS4wLCJyYW5kb21fZGVsYXlfdmFsdWVfMSI6MS4wLCJyYW5kb21fZGVsYXlfdmFsdWVfMiI6MS4wLCJyYW5kb21pemF0aW9uIjowLjAsInN3aXRjaF9kZWxheSI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczEiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMyIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMyI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczQiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM1IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNiI6MS4wLCJzd2l0Y2hfdmFsdWUiOjQuMCwieWF3X2FkZCI6MC4wLCJ5YXdfYWRkX3IiOjAuMCwieWF3X2hlYWRiZWhpbmRjaGVzdCI6ZmFsc2UsInlhd19qaXR0ZXIiOiJPZmYiLCJ5YXdfaml0dGVyX2FkZCI6LTEuMCwieWF3X2ppdHRlcl9tb2RlIjoiRGVmYXVsdCIsInlhd19qaXR0ZXJfb3duMSI6MC4wLCJ5YXdfaml0dGVyX293bjIiOjAuMCwieWF3X2ppdHRlcl9zbGlkZXIxIjo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjIiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyMyI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI0Ijo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjUiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNiI6NTAuMCwieWF3X3NsaWRlcnMiOjEuMH0sInJ1biI6eyJhbnRpYnJ1dGVmb3JjZV9lbmFibGUiOnRydWUsImFudGlicnV0ZWZvcmNlX21vZGlmaWVycyI6WyJGYWtlIGxpbWl0IiwiTW9kaWZpZXIiLCJ+Il0sImJvZHlfeWF3IjoiSml0dGVyIiwiYm9keV95YXdfdGlja3MiOjEyLjAsImNsZWFucmVjb3JkcyI6dHJ1ZSwiY2xlYW5yZWNvcmRzX3JhbmRvbV9mbGljayI6ZmFsc2UsImNsZWFucmVjb3Jkc191c2VmYWtlbGFnIjpmYWxzZSwiZGVmZW5zaXZlX2FjdGl2YXRpb25fb3B0aW9ucyI6WyJBbHdheXMiLCJ+Il0sImRlZmVuc2l2ZV9kaXNhYmxlX29wdGlvbiI6dHJ1ZSwiZGVsYXkiOmZhbHNlLCJkZWxheV9pbnRlcmFjdGlvbl90eXBlIjoiQ3JlYXRlbW92ZSIsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9zbGlkZXJzIjoxLjAsImZha2VsaW1pdF9sIjozMi4wLCJmYWtlbGltaXRfbDIiOjI4LjAsImZha2VsaW1pdF9vcHRpb25zIjoiTWluLU1heCIsImZha2VsaW1pdF9yIjozMi4wLCJmYWtlbGltaXRfcjIiOjU4LjAsImZha2VsaW1pdF9zcGVlZCI6NS4wLCJyYW5kb21fZGVsYXlfdmFsdWVfMSI6MS4wLCJyYW5kb21fZGVsYXlfdmFsdWVfMiI6MS4wLCJyYW5kb21pemF0aW9uIjoxMC4wLCJzd2l0Y2hfZGVsYXkiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMxIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMiI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczMiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM0IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNSI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczYiOjEuMCwic3dpdGNoX3ZhbHVlIjo0LjAsInlhd19hZGQiOjAuMCwieWF3X2FkZF9yIjowLjAsInlhd19oZWFkYmVoaW5kY2hlc3QiOmZhbHNlLCJ5YXdfaml0dGVyIjoiT2Zmc2V0IiwieWF3X2ppdHRlcl9hZGQiOi0xLjAsInlhd19qaXR0ZXJfbW9kZSI6IkRlZmF1bHQiLCJ5YXdfaml0dGVyX293bjEiOjI1LjAsInlhd19qaXR0ZXJfb3duMiI6LTEyLjAsInlhd19qaXR0ZXJfc2xpZGVyMSI6MS4wLCJ5YXdfaml0dGVyX3NsaWRlcjIiOjMuMCwieWF3X2ppdHRlcl9zbGlkZXIzIjo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjQiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNSI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI2Ijo1MC4wLCJ5YXdfc2xpZGVycyI6Mi4wfSwic2xvdyB3YWxrIjp7ImFudGlicnV0ZWZvcmNlX2VuYWJsZSI6dHJ1ZSwiYW50aWJydXRlZm9yY2VfbW9kaWZpZXJzIjpbIkZha2UgbGltaXQiLCJEZWxheSIsIk1vZGlmaWVyIiwifiJdLCJib2R5X3lhdyI6IkppdHRlciIsImJvZHlfeWF3X3RpY2tzIjoxMi4wLCJjbGVhbnJlY29yZHMiOmZhbHNlLCJjbGVhbnJlY29yZHNfcmFuZG9tX2ZsaWNrIjpmYWxzZSwiY2xlYW5yZWNvcmRzX3VzZWZha2VsYWciOmZhbHNlLCJkZWZlbnNpdmVfYWN0aXZhdGlvbl9vcHRpb25zIjpbIkFsd2F5cyIsIn4iXSwiZGVmZW5zaXZlX2Rpc2FibGVfb3B0aW9uIjpmYWxzZSwiZGVsYXkiOmZhbHNlLCJkZWxheV9pbnRlcmFjdGlvbl90eXBlIjoiQ3JlYXRlbW92ZSIsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9zbGlkZXJzIjoxLjAsImZha2VsaW1pdF9sIjo1OC4wLCJmYWtlbGltaXRfbDIiOjU4LjAsImZha2VsaW1pdF9vcHRpb25zIjoiRGVmYXVsdCIsImZha2VsaW1pdF9yIjo1OC4wLCJmYWtlbGltaXRfcjIiOjU4LjAsImZha2VsaW1pdF9zcGVlZCI6NS4wLCJyYW5kb21fZGVsYXlfdmFsdWVfMSI6MS4wLCJyYW5kb21fZGVsYXlfdmFsdWVfMiI6MS4wLCJyYW5kb21pemF0aW9uIjoyMC4wLCJzd2l0Y2hfZGVsYXkiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMxIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMiI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczMiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM0IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNSI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczYiOjEuMCwic3dpdGNoX3ZhbHVlIjo0LjAsInlhd19hZGQiOi0xMC4wLCJ5YXdfYWRkX3IiOi0xMC4wLCJ5YXdfaGVhZGJlaGluZGNoZXN0IjpmYWxzZSwieWF3X2ppdHRlciI6Ik9mZnNldCIsInlhd19qaXR0ZXJfYWRkIjotMS4wLCJ5YXdfaml0dGVyX21vZGUiOiJEZWZhdWx0IiwieWF3X2ppdHRlcl9vd24xIjozMS4wLCJ5YXdfaml0dGVyX293bjIiOjY1LjAsInlhd19qaXR0ZXJfc2xpZGVyMSI6MjUuMCwieWF3X2ppdHRlcl9zbGlkZXIyIjoxMS4wLCJ5YXdfaml0dGVyX3NsaWRlcjMiOjMyLjAsInlhd19qaXR0ZXJfc2xpZGVyNCI6MjEuMCwieWF3X2ppdHRlcl9zbGlkZXI1Ijo1LjAsInlhd19qaXR0ZXJfc2xpZGVyNiI6NTAuMCwieWF3X3NsaWRlcnMiOjUuMH0sInN0YW5kIjp7ImFudGlicnV0ZWZvcmNlX2VuYWJsZSI6dHJ1ZSwiYW50aWJydXRlZm9yY2VfbW9kaWZpZXJzIjpbIkRlbGF5IiwifiJdLCJib2R5X3lhdyI6IkppdHRlciIsImJvZHlfeWF3X3RpY2tzIjoxMi4wLCJjbGVhbnJlY29yZHMiOmZhbHNlLCJjbGVhbnJlY29yZHNfcmFuZG9tX2ZsaWNrIjpmYWxzZSwiY2xlYW5yZWNvcmRzX3VzZWZha2VsYWciOmZhbHNlLCJkZWZlbnNpdmVfYWN0aXZhdGlvbl9vcHRpb25zIjpbIkFsd2F5cyIsIn4iXSwiZGVmZW5zaXZlX2Rpc2FibGVfb3B0aW9uIjp0cnVlLCJkZWxheSI6ZmFsc2UsImRlbGF5X2ludGVyYWN0aW9uX3R5cGUiOiJDcmVhdGVtb3ZlIiwiZGVsYXlfbWV0aG9kIjoiRGVmYXVsdCIsImRlbGF5X3NsaWRlcnMiOjEuMCwiZmFrZWxpbWl0X2wiOjYwLjAsImZha2VsaW1pdF9sMiI6MzIuMCwiZmFrZWxpbWl0X29wdGlvbnMiOiJEZWZhdWx0IiwiZmFrZWxpbWl0X3IiOjYwLjAsImZha2VsaW1pdF9yMiI6MzIuMCwiZmFrZWxpbWl0X3NwZWVkIjo1LjAsInJhbmRvbV9kZWxheV92YWx1ZV8xIjoxLjAsInJhbmRvbV9kZWxheV92YWx1ZV8yIjoxLjAsInJhbmRvbWl6YXRpb24iOjguMCwic3dpdGNoX2RlbGF5IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMSI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczIiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMzIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNCI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczUiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM2IjoxLjAsInN3aXRjaF92YWx1ZSI6MC4wLCJ5YXdfYWRkIjowLjAsInlhd19hZGRfciI6MC4wLCJ5YXdfaGVhZGJlaGluZGNoZXN0Ijp0cnVlLCJ5YXdfaml0dGVyIjoiT2Zmc2V0IiwieWF3X2ppdHRlcl9hZGQiOi0xLjAsInlhd19qaXR0ZXJfbW9kZSI6IkRlZmF1bHQiLCJ5YXdfaml0dGVyX293bjEiOjEyLjAsInlhd19qaXR0ZXJfb3duMiI6MTIuMCwieWF3X2ppdHRlcl9zbGlkZXIxIjo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjIiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyMyI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI0Ijo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjUiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNiI6NTAuMCwieWF3X3NsaWRlcnMiOjEuMH19fSwic3RhdGljX21hbnVhbCI6dHJ1ZSwidHJvbGxfYWFfb3B0aW9ucyI6IlNwaW4iLCJ0cm9sbF9hYV9zcGVlZCI6NS4wLCJ5YXdtb2RpZmllciI6WyJGb3JjZSBzdGF0aWMiLCJ+Il19LHsiZGlzYWJsZV9jdmFycyI6dHJ1ZSwiZXh0ZW5kZWRfcGluZ19hbW91bnQiOjU3LjAsImV4dHJhX25vdGlmaWNhdGlvbl9vcHRpb25zIjpbIn4iXSwiZmFzdF9sYWRkZXIiOnRydWUsImZyZWV6ZXRpbWVfZmFrZWR1Y2siOnRydWUsImhpdGxvZ19jb2xvciI6IiNGRkZGRkZGRiIsImhpdGxvZ19vcHRpb25zIjpbIlB1cmNoYXNlcyIsIlNob3RzIiwiTmFkZXMiLCJ+Il0sImhpdGxvZ3MiOlsiT24gc2NyZWVuIiwiQ29uc29sZSIsIn4iXSwia2VlcF9tb2RlbF90cmFuc3BhcmVuY3kiOnRydWUsIm5vX2ZhbGwiOnRydWUsInRyYXNodGFsa19zdGF0ZXMiOlsifiJdLCJ1bmxvY2tfZmFrZWR1Y2tfc3BlZWQiOnRydWV9LHsiKmNvbnNvbGVfY29sb3IiOiIjNDM0MDQ2QkYiLCIqaGl0X21hcmtlciI6IiNGRkZGRkZGRiIsIiptYW51YWxfYXJyb3dzIjoiI0QyQjNDREZGIiwiKm5ldGdyYXBoX2VuYWJsZSI6IiM5RTlCQjJGRiIsImFuaW1hdGlvbnNfZmFsbF9hbW91bnQiOjEuMCwiYW5pbWF0aW9uc19sZWFuX2Ftb3VudCI6MTAwLjAsImFuaW1hdGlvbnNfc2xpZGVfYW1vdW50IjoxLjAsImFzcGVjdF9yYXRpb19lbmFibGUiOnRydWUsImFzcGVjdHJhdGlvIjoxMzMuMCwiY29uc29sZV9jb2xvciI6dHJ1ZSwiZGlzYWJsZV9zbGVldmVzIjp0cnVlLCJkbWdfY29sb3IiOiIjRkZGRkZGRkYiLCJkbWdpbmRpY2F0b3IiOnRydWUsImRtZ2luZGljYXRvcl9zaG93IjpmYWxzZSwiZ2luZ2VyaW5kaWNhdG9ycyI6dHJ1ZSwiaGl0X21hcmtlciI6dHJ1ZSwiaml0dGVyX2xlZ3MiOmZhbHNlLCJqaXR0ZXJfbGVnc19mcm9tIjo2NC4wLCJqaXR0ZXJfbGVnc190byI6OTEuMCwia2liaXRfbWFya2VyIjpmYWxzZSwibGFnY29tcF9kZWJ1ZyI6dHJ1ZSwibWFudWFsX2Fycm93cyI6dHJ1ZSwibmV0Z3JhcGhfZW5hYmxlIjpmYWxzZSwic2NvcGVfb3ZlcmxheSI6dHJ1ZSwic2NvcGVfb3ZlcmxheV9jb2xvciI6IiM3MTcxNzFGRiIsInNjb3BlX292ZXJsYXlfZ2FwIjoxMS4wLCJzY29wZV9vdmVybGF5X2xpbmUiOjMyLjAsInNjb3BlX292ZXJsYXlfcm90YXRlIjpmYWxzZSwidmlld21vZGVsX2ZvdiI6NjQwLjAsInZpZXdtb2RlbF9rbmlmZWhhbmQiOmZhbHNlLCJ2aWV3bW9kZWxfeCI6MTUuMCwidmlld21vZGVsX3kiOjAuMCwidmlld21vZGVsX3oiOjIyLjB9XQ==", 
        xyztick_aggressive = "{gingersense:config}:W3sibG9nX3ByZWZpeCI6Im1vcmEud2F2Iiwic2lkZWJhcl9jb2xvciI6IiM5QUQ3RUNGRiIsInNpZGViYXJfc3BlZWQiOjIuMCwic2lkZWJhcl90ZXh0IjoiamltbXkgYm9uZ28g8J+qmCIsIndhdGVybWFya19jb2xvciI6IiM5N0I4OTlGRiIsIndhdGVybWFya19mb250Ijo0LjAsIndhdGVybWFya19ncmFkaWVudCI6Mi4wLCJ3YXRlcm1hcmtfc3BlZWQiOjIuMCwid2F0ZXJtYXJrX3N0eWxlIjoiQ3VzdG9tIiwid2F0ZXJtYXJrX3RleHQiOiIkJCQgR0lOR0lTRU5TRSDimZsgQkVUQSB2Mi4xOSDCo8KjwqMifSx7ImFpcmxhZyI6ZmFsc2UsImZyZWVzdGFuZGluZyI6ZmFsc2UsImZyZWVzdGFuZGluZ19kaXNhYmxlcnMiOlsiZHVjayIsImp1bXAiLCJkdWNrIGp1bXAiLCJ+Il0sImhpZGVoZWFkX29wdGlvbnMiOlsiQWlyIENyb3VjaCBLbmlmZSIsIlRhc2VyIEluIEFpciIsIn4iXSwibWFudWFsX2FhIjoiT2ZmIiwibWFudWFsX3RhcmdldCI6IkxvY2FsIFZpZXciLCJvcHRpb25zIjpbIldhcm11cCBBQSIsIlJvdW5kIGVuZCBBQSIsIkhpZGUgSGVhZCIsIkF2b2lkIEJhY2tzdGFiIiwifiJdLCJzZWxlY3RfdGVhbSI6ImNvdW50ZXItdGVycm9yaXN0Iiwic3RhdGUiOiJkdWNrIGp1bXAiLCJzdGF0ZXMiOnsiY291bnRlci10ZXJyb3Jpc3QiOnsiZHVjayI6eyJhbnRpYnJ1dGVmb3JjZV9lbmFibGUiOnRydWUsImFudGlicnV0ZWZvcmNlX21vZGlmaWVycyI6WyJEZWxheSIsIn4iXSwiYm9keV95YXciOiJKaXR0ZXIiLCJib2R5X3lhd190aWNrcyI6MTIuMCwiY2xlYW5yZWNvcmRzIjp0cnVlLCJjbGVhbnJlY29yZHNfcmFuZG9tX2ZsaWNrIjpmYWxzZSwiY2xlYW5yZWNvcmRzX3VzZWZha2VsYWciOmZhbHNlLCJkZWZlbnNpdmVfYWN0aXZhdGlvbl9vcHRpb25zIjpbIkFsd2F5cyIsIn4iXSwiZGVmZW5zaXZlX2Rpc2FibGVfb3B0aW9uIjp0cnVlLCJkZWxheSI6ZmFsc2UsImRlbGF5X2ludGVyYWN0aW9uX3R5cGUiOiJOZXRfdXBkYXRlIiwiZGVsYXlfbWV0aG9kIjoiQ3VzdG9tIiwiZGVsYXlfc2xpZGVycyI6Ni4wLCJmYWtlbGltaXRfbCI6NTguMCwiZmFrZWxpbWl0X2wyIjozMi4wLCJmYWtlbGltaXRfb3B0aW9ucyI6IkRlZmF1bHQiLCJmYWtlbGltaXRfciI6NTguMCwiZmFrZWxpbWl0X3IyIjozMi4wLCJmYWtlbGltaXRfc3BlZWQiOjUuMCwicmFuZG9tX2RlbGF5X3ZhbHVlXzEiOjEuMCwicmFuZG9tX2RlbGF5X3ZhbHVlXzIiOjEuMCwicmFuZG9taXphdGlvbiI6OC4wLCJzd2l0Y2hfZGVsYXkiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMxIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMiI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczMiOjQuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM0IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNSI6Mi4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczYiOjIuMCwic3dpdGNoX3ZhbHVlIjo0LjAsInlhd19hZGQiOjAuMCwieWF3X2FkZF9yIjowLjAsInlhd19oZWFkYmVoaW5kY2hlc3QiOmZhbHNlLCJ5YXdfaml0dGVyIjoiT2Zmc2V0IiwieWF3X2ppdHRlcl9hZGQiOjEuMCwieWF3X2ppdHRlcl9tb2RlIjoiRGVmYXVsdCIsInlhd19qaXR0ZXJfb3duMSI6MC4wLCJ5YXdfaml0dGVyX293bjIiOjAuMCwieWF3X2ppdHRlcl9zbGlkZXIxIjo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjIiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyMyI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI0Ijo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjUiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNiI6NTAuMCwieWF3X3NsaWRlcnMiOjEuMH0sImR1Y2sganVtcCI6eyJhbnRpYnJ1dGVmb3JjZV9lbmFibGUiOnRydWUsImFudGlicnV0ZWZvcmNlX21vZGlmaWVycyI6WyJGYWtlIGxpbWl0IiwifiJdLCJib2R5X3lhdyI6IkppdHRlciIsImJvZHlfeWF3X3RpY2tzIjoxMi4wLCJjbGVhbnJlY29yZHMiOmZhbHNlLCJjbGVhbnJlY29yZHNfcmFuZG9tX2ZsaWNrIjpmYWxzZSwiY2xlYW5yZWNvcmRzX3VzZWZha2VsYWciOmZhbHNlLCJkZWZlbnNpdmVfYWN0aXZhdGlvbl9vcHRpb25zIjpbIkFsd2F5cyIsIn4iXSwiZGVmZW5zaXZlX2Rpc2FibGVfb3B0aW9uIjpmYWxzZSwiZGVsYXkiOnRydWUsImRlbGF5X2ludGVyYWN0aW9uX3R5cGUiOiJOZXRfdXBkYXRlIiwiZGVsYXlfbWV0aG9kIjoiQ3VzdG9tIiwiZGVsYXlfc2xpZGVycyI6Ni4wLCJmYWtlbGltaXRfbCI6NTguMCwiZmFrZWxpbWl0X2wyIjozMi4wLCJmYWtlbGltaXRfb3B0aW9ucyI6IkRlZmF1bHQiLCJmYWtlbGltaXRfciI6NTguMCwiZmFrZWxpbWl0X3IyIjozMi4wLCJmYWtlbGltaXRfc3BlZWQiOjUuMCwicmFuZG9tX2RlbGF5X3ZhbHVlXzEiOjEuMCwicmFuZG9tX2RlbGF5X3ZhbHVlXzIiOjEuMCwicmFuZG9taXphdGlvbiI6NS4wLCJzd2l0Y2hfZGVsYXkiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMxIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMiI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczMiOjIwLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNCI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczUiOjUuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM2IjozLjAsInN3aXRjaF92YWx1ZSI6NC4wLCJ5YXdfYWRkIjotMjAuMCwieWF3X2FkZF9yIjozNi4wLCJ5YXdfaGVhZGJlaGluZGNoZXN0IjpmYWxzZSwieWF3X2ppdHRlciI6IlJhbmRvbSIsInlhd19qaXR0ZXJfYWRkIjowLjAsInlhd19qaXR0ZXJfbW9kZSI6IkN1c3RvbSIsInlhd19qaXR0ZXJfb3duMSI6MC4wLCJ5YXdfaml0dGVyX293bjIiOjAuMCwieWF3X2ppdHRlcl9zbGlkZXIxIjo1LjAsInlhd19qaXR0ZXJfc2xpZGVyMiI6LTUuMCwieWF3X2ppdHRlcl9zbGlkZXIzIjo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjQiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNSI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI2Ijo1MC4wLCJ5YXdfc2xpZGVycyI6Mi4wfSwiZHVjayBtb3ZlIjp7ImFudGlicnV0ZWZvcmNlX2VuYWJsZSI6ZmFsc2UsImFudGlicnV0ZWZvcmNlX21vZGlmaWVycyI6WyJ+Il0sImJvZHlfeWF3IjoiSml0dGVyIiwiYm9keV95YXdfdGlja3MiOjEyLjAsImNsZWFucmVjb3JkcyI6ZmFsc2UsImNsZWFucmVjb3Jkc19yYW5kb21fZmxpY2siOmZhbHNlLCJjbGVhbnJlY29yZHNfdXNlZmFrZWxhZyI6ZmFsc2UsImRlZmVuc2l2ZV9hY3RpdmF0aW9uX29wdGlvbnMiOlsiV2VhcG9uIHN3aXRjaCIsIldlYXBvbiByZWxvYWQiLCJ+Il0sImRlZmVuc2l2ZV9kaXNhYmxlX29wdGlvbiI6ZmFsc2UsImRlbGF5Ijp0cnVlLCJkZWxheV9pbnRlcmFjdGlvbl90eXBlIjoiQ3JlYXRlbW92ZSIsImRlbGF5X21ldGhvZCI6IlJhbmRvbSIsImRlbGF5X3NsaWRlcnMiOjIuMCwiZmFrZWxpbWl0X2wiOjU5LjAsImZha2VsaW1pdF9sMiI6MzIuMCwiZmFrZWxpbWl0X29wdGlvbnMiOiJEZWZhdWx0IiwiZmFrZWxpbWl0X3IiOjU5LjAsImZha2VsaW1pdF9yMiI6MzIuMCwiZmFrZWxpbWl0X3NwZWVkIjo1LjAsInJhbmRvbV9kZWxheV92YWx1ZV8xIjo1LjAsInJhbmRvbV9kZWxheV92YWx1ZV8yIjoxMC4wLCJyYW5kb21pemF0aW9uIjowLjAsInN3aXRjaF9kZWxheSI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczEiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMyIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMyI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczQiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM1IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNiI6MS4wLCJzd2l0Y2hfdmFsdWUiOjQuMCwieWF3X2FkZCI6LTIwLjAsInlhd19hZGRfciI6NDAuMCwieWF3X2hlYWRiZWhpbmRjaGVzdCI6ZmFsc2UsInlhd19qaXR0ZXIiOiJPZmYiLCJ5YXdfaml0dGVyX2FkZCI6MC4wLCJ5YXdfaml0dGVyX21vZGUiOiJEZWZhdWx0IiwieWF3X2ppdHRlcl9vd24xIjowLjAsInlhd19qaXR0ZXJfb3duMiI6MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjEiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyMiI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXIzIjo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjQiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNSI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI2Ijo1MC4wLCJ5YXdfc2xpZGVycyI6MS4wfSwianVtcCI6eyJhbnRpYnJ1dGVmb3JjZV9lbmFibGUiOnRydWUsImFudGlicnV0ZWZvcmNlX21vZGlmaWVycyI6WyJGYWtlIGxpbWl0IiwiTW9kaWZpZXIiLCJ+Il0sImJvZHlfeWF3IjoiSml0dGVyIiwiYm9keV95YXdfdGlja3MiOjEyLjAsImNsZWFucmVjb3JkcyI6ZmFsc2UsImNsZWFucmVjb3Jkc19yYW5kb21fZmxpY2siOmZhbHNlLCJjbGVhbnJlY29yZHNfdXNlZmFrZWxhZyI6ZmFsc2UsImRlZmVuc2l2ZV9hY3RpdmF0aW9uX29wdGlvbnMiOlsiQWx3YXlzIiwifiJdLCJkZWZlbnNpdmVfZGlzYWJsZV9vcHRpb24iOmZhbHNlLCJkZWxheSI6ZmFsc2UsImRlbGF5X2ludGVyYWN0aW9uX3R5cGUiOiJDcmVhdGVtb3ZlIiwiZGVsYXlfbWV0aG9kIjoiRGVmYXVsdCIsImRlbGF5X3NsaWRlcnMiOjEuMCwiZmFrZWxpbWl0X2wiOjU5LjAsImZha2VsaW1pdF9sMiI6MzIuMCwiZmFrZWxpbWl0X29wdGlvbnMiOiJEZWZhdWx0IiwiZmFrZWxpbWl0X3IiOjU5LjAsImZha2VsaW1pdF9yMiI6MzIuMCwiZmFrZWxpbWl0X3NwZWVkIjo1LjAsInJhbmRvbV9kZWxheV92YWx1ZV8xIjoxLjAsInJhbmRvbV9kZWxheV92YWx1ZV8yIjoxLjAsInJhbmRvbWl6YXRpb24iOjAuMCwic3dpdGNoX2RlbGF5IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMSI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczIiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMzIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNCI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczUiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM2IjoxLjAsInN3aXRjaF92YWx1ZSI6NC4wLCJ5YXdfYWRkIjowLjAsInlhd19hZGRfciI6MC4wLCJ5YXdfaGVhZGJlaGluZGNoZXN0IjpmYWxzZSwieWF3X2ppdHRlciI6Ik9mZiIsInlhd19qaXR0ZXJfYWRkIjowLjAsInlhd19qaXR0ZXJfbW9kZSI6IkRlZmF1bHQiLCJ5YXdfaml0dGVyX293bjEiOjAuMCwieWF3X2ppdHRlcl9vd24yIjowLjAsInlhd19qaXR0ZXJfc2xpZGVyMSI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXIyIjo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjMiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNCI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI1Ijo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjYiOjUwLjAsInlhd19zbGlkZXJzIjoxLjB9LCJydW4iOnsiYW50aWJydXRlZm9yY2VfZW5hYmxlIjp0cnVlLCJhbnRpYnJ1dGVmb3JjZV9tb2RpZmllcnMiOlsiRGVsYXkiLCJ+Il0sImJvZHlfeWF3IjoiSml0dGVyIiwiYm9keV95YXdfdGlja3MiOjEyLjAsImNsZWFucmVjb3JkcyI6ZmFsc2UsImNsZWFucmVjb3Jkc19yYW5kb21fZmxpY2siOmZhbHNlLCJjbGVhbnJlY29yZHNfdXNlZmFrZWxhZyI6ZmFsc2UsImRlZmVuc2l2ZV9hY3RpdmF0aW9uX29wdGlvbnMiOlsiV2VhcG9uIHN3aXRjaCIsIldlYXBvbiByZWxvYWQiLCJ+Il0sImRlZmVuc2l2ZV9kaXNhYmxlX29wdGlvbiI6dHJ1ZSwiZGVsYXkiOmZhbHNlLCJkZWxheV9pbnRlcmFjdGlvbl90eXBlIjoiQ3JlYXRlbW92ZSIsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9zbGlkZXJzIjoxLjAsImZha2VsaW1pdF9sIjoyOC4wLCJmYWtlbGltaXRfbDIiOjI4LjAsImZha2VsaW1pdF9vcHRpb25zIjoiTWluLU1heCIsImZha2VsaW1pdF9yIjo2MC4wLCJmYWtlbGltaXRfcjIiOjU4LjAsImZha2VsaW1pdF9zcGVlZCI6NS4wLCJyYW5kb21fZGVsYXlfdmFsdWVfMSI6MS4wLCJyYW5kb21fZGVsYXlfdmFsdWVfMiI6MS4wLCJyYW5kb21pemF0aW9uIjoxMC4wLCJzd2l0Y2hfZGVsYXkiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMxIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMiI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczMiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM0IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNSI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczYiOjEuMCwic3dpdGNoX3ZhbHVlIjo0LjAsInlhd19hZGQiOi0yNy4wLCJ5YXdfYWRkX3IiOjM3LjAsInlhd19oZWFkYmVoaW5kY2hlc3QiOnRydWUsInlhd19qaXR0ZXIiOiJSYW5kb20iLCJ5YXdfaml0dGVyX2FkZCI6MzQuMCwieWF3X2ppdHRlcl9tb2RlIjoiQ3VzdG9tIiwieWF3X2ppdHRlcl9vd24xIjowLjAsInlhd19qaXR0ZXJfb3duMiI6MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjEiOjEuMCwieWF3X2ppdHRlcl9zbGlkZXIyIjozLjAsInlhd19qaXR0ZXJfc2xpZGVyMyI6MzQuMCwieWF3X2ppdHRlcl9zbGlkZXI0Ijo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjUiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNiI6NTAuMCwieWF3X3NsaWRlcnMiOjIuMH0sInNsb3cgd2FsayI6eyJhbnRpYnJ1dGVmb3JjZV9lbmFibGUiOnRydWUsImFudGlicnV0ZWZvcmNlX21vZGlmaWVycyI6WyJGYWtlIGxpbWl0IiwiRGVsYXkiLCJNb2RpZmllciIsIn4iXSwiYm9keV95YXciOiJKaXR0ZXIiLCJib2R5X3lhd190aWNrcyI6MTIuMCwiY2xlYW5yZWNvcmRzIjpmYWxzZSwiY2xlYW5yZWNvcmRzX3JhbmRvbV9mbGljayI6ZmFsc2UsImNsZWFucmVjb3Jkc191c2VmYWtlbGFnIjpmYWxzZSwiZGVmZW5zaXZlX2FjdGl2YXRpb25fb3B0aW9ucyI6WyJBbHdheXMiLCJ+Il0sImRlZmVuc2l2ZV9kaXNhYmxlX29wdGlvbiI6ZmFsc2UsImRlbGF5IjpmYWxzZSwiZGVsYXlfaW50ZXJhY3Rpb25fdHlwZSI6IkNyZWF0ZW1vdmUiLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0IiwiZGVsYXlfc2xpZGVycyI6MS4wLCJmYWtlbGltaXRfbCI6NTguMCwiZmFrZWxpbWl0X2wyIjozMi4wLCJmYWtlbGltaXRfb3B0aW9ucyI6IkRlZmF1bHQiLCJmYWtlbGltaXRfciI6NTguMCwiZmFrZWxpbWl0X3IyIjozMi4wLCJmYWtlbGltaXRfc3BlZWQiOjUuMCwicmFuZG9tX2RlbGF5X3ZhbHVlXzEiOjEuMCwicmFuZG9tX2RlbGF5X3ZhbHVlXzIiOjEuMCwicmFuZG9taXphdGlvbiI6MjAuMCwic3dpdGNoX2RlbGF5IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMSI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczIiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMzIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNCI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczUiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM2IjoxLjAsInN3aXRjaF92YWx1ZSI6NC4wLCJ5YXdfYWRkIjotMTAuMCwieWF3X2FkZF9yIjotMTAuMCwieWF3X2hlYWRiZWhpbmRjaGVzdCI6ZmFsc2UsInlhd19qaXR0ZXIiOiJPZmZzZXQiLCJ5YXdfaml0dGVyX2FkZCI6MS4wLCJ5YXdfaml0dGVyX21vZGUiOiJEZWZhdWx0IiwieWF3X2ppdHRlcl9vd24xIjowLjAsInlhd19qaXR0ZXJfb3duMiI6MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjEiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyMiI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXIzIjo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjQiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNSI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI2Ijo1MC4wLCJ5YXdfc2xpZGVycyI6MS4wfSwic3RhbmQiOnsiYW50aWJydXRlZm9yY2VfZW5hYmxlIjp0cnVlLCJhbnRpYnJ1dGVmb3JjZV9tb2RpZmllcnMiOlsifiJdLCJib2R5X3lhdyI6IkppdHRlciIsImJvZHlfeWF3X3RpY2tzIjoxMi4wLCJjbGVhbnJlY29yZHMiOnRydWUsImNsZWFucmVjb3Jkc19yYW5kb21fZmxpY2siOmZhbHNlLCJjbGVhbnJlY29yZHNfdXNlZmFrZWxhZyI6ZmFsc2UsImRlZmVuc2l2ZV9hY3RpdmF0aW9uX29wdGlvbnMiOlsiV2VhcG9uIHN3aXRjaCIsIldlYXBvbiByZWxvYWQiLCJ+Il0sImRlZmVuc2l2ZV9kaXNhYmxlX29wdGlvbiI6dHJ1ZSwiZGVsYXkiOmZhbHNlLCJkZWxheV9pbnRlcmFjdGlvbl90eXBlIjoiQ3JlYXRlbW92ZSIsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9zbGlkZXJzIjoxLjAsImZha2VsaW1pdF9sIjo1OS4wLCJmYWtlbGltaXRfbDIiOjMyLjAsImZha2VsaW1pdF9vcHRpb25zIjoiRGVmYXVsdCIsImZha2VsaW1pdF9yIjo1OS4wLCJmYWtlbGltaXRfcjIiOjMyLjAsImZha2VsaW1pdF9zcGVlZCI6NS4wLCJyYW5kb21fZGVsYXlfdmFsdWVfMSI6MS4wLCJyYW5kb21fZGVsYXlfdmFsdWVfMiI6MS4wLCJyYW5kb21pemF0aW9uIjo4LjAsInN3aXRjaF9kZWxheSI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczEiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMyIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMyI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczQiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM1IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNiI6MS4wLCJzd2l0Y2hfdmFsdWUiOjQuMCwieWF3X2FkZCI6MC4wLCJ5YXdfYWRkX3IiOjAuMCwieWF3X2hlYWRiZWhpbmRjaGVzdCI6dHJ1ZSwieWF3X2ppdHRlciI6Ik9mZnNldCIsInlhd19qaXR0ZXJfYWRkIjoxLjAsInlhd19qaXR0ZXJfbW9kZSI6IkRlZmF1bHQiLCJ5YXdfaml0dGVyX293bjEiOjAuMCwieWF3X2ppdHRlcl9vd24yIjowLjAsInlhd19qaXR0ZXJfc2xpZGVyMSI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXIyIjo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjMiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNCI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI1Ijo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjYiOjUwLjAsInlhd19zbGlkZXJzIjoxLjB9fSwidGVycm9yaXN0Ijp7ImR1Y2siOnsiYW50aWJydXRlZm9yY2VfZW5hYmxlIjp0cnVlLCJhbnRpYnJ1dGVmb3JjZV9tb2RpZmllcnMiOlsiRGVsYXkiLCJ+Il0sImJvZHlfeWF3IjoiSml0dGVyIiwiYm9keV95YXdfdGlja3MiOjEyLjAsImNsZWFucmVjb3JkcyI6dHJ1ZSwiY2xlYW5yZWNvcmRzX3JhbmRvbV9mbGljayI6ZmFsc2UsImNsZWFucmVjb3Jkc191c2VmYWtlbGFnIjpmYWxzZSwiZGVmZW5zaXZlX2FjdGl2YXRpb25fb3B0aW9ucyI6WyJBbHdheXMiLCJ+Il0sImRlZmVuc2l2ZV9kaXNhYmxlX29wdGlvbiI6dHJ1ZSwiZGVsYXkiOmZhbHNlLCJkZWxheV9pbnRlcmFjdGlvbl90eXBlIjoiTmV0X3VwZGF0ZSIsImRlbGF5X21ldGhvZCI6IkN1c3RvbSIsImRlbGF5X3NsaWRlcnMiOjYuMCwiZmFrZWxpbWl0X2wiOjYwLjAsImZha2VsaW1pdF9sMiI6MzIuMCwiZmFrZWxpbWl0X29wdGlvbnMiOiJEZWZhdWx0IiwiZmFrZWxpbWl0X3IiOjYwLjAsImZha2VsaW1pdF9yMiI6MzIuMCwiZmFrZWxpbWl0X3NwZWVkIjo1LjAsInJhbmRvbV9kZWxheV92YWx1ZV8xIjoxLjAsInJhbmRvbV9kZWxheV92YWx1ZV8yIjoxLjAsInJhbmRvbWl6YXRpb24iOjguMCwic3dpdGNoX2RlbGF5IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMSI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczIiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMzIjo0LjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNCI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczUiOjIuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM2IjoyLjAsInN3aXRjaF92YWx1ZSI6NC4wLCJ5YXdfYWRkIjowLjAsInlhd19hZGRfciI6MC4wLCJ5YXdfaGVhZGJlaGluZGNoZXN0Ijp0cnVlLCJ5YXdfaml0dGVyIjoiT2Zmc2V0IiwieWF3X2ppdHRlcl9hZGQiOi0xLjAsInlhd19qaXR0ZXJfbW9kZSI6IkRlZmF1bHQiLCJ5YXdfaml0dGVyX293bjEiOjAuMCwieWF3X2ppdHRlcl9vd24yIjowLjAsInlhd19qaXR0ZXJfc2xpZGVyMSI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXIyIjo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjMiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNCI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI1Ijo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjYiOjUwLjAsInlhd19zbGlkZXJzIjoxLjB9LCJkdWNrIGp1bXAiOnsiYW50aWJydXRlZm9yY2VfZW5hYmxlIjp0cnVlLCJhbnRpYnJ1dGVmb3JjZV9tb2RpZmllcnMiOlsiRGVsYXkiLCJNb2RpZmllciIsIn4iXSwiYm9keV95YXciOiJKaXR0ZXIiLCJib2R5X3lhd190aWNrcyI6MTIuMCwiY2xlYW5yZWNvcmRzIjp0cnVlLCJjbGVhbnJlY29yZHNfcmFuZG9tX2ZsaWNrIjpmYWxzZSwiY2xlYW5yZWNvcmRzX3VzZWZha2VsYWciOmZhbHNlLCJkZWZlbnNpdmVfYWN0aXZhdGlvbl9vcHRpb25zIjpbIkFsd2F5cyIsIn4iXSwiZGVmZW5zaXZlX2Rpc2FibGVfb3B0aW9uIjpmYWxzZSwiZGVsYXkiOmZhbHNlLCJkZWxheV9pbnRlcmFjdGlvbl90eXBlIjoiQ3JlYXRlbW92ZSIsImRlbGF5X21ldGhvZCI6IkN1c3RvbSIsImRlbGF5X3NsaWRlcnMiOjYuMCwiZmFrZWxpbWl0X2wiOjYwLjAsImZha2VsaW1pdF9sMiI6MzIuMCwiZmFrZWxpbWl0X29wdGlvbnMiOiJEZWZhdWx0IiwiZmFrZWxpbWl0X3IiOjYwLjAsImZha2VsaW1pdF9yMiI6MzIuMCwiZmFrZWxpbWl0X3NwZWVkIjo1LjAsInJhbmRvbV9kZWxheV92YWx1ZV8xIjoxLjAsInJhbmRvbV9kZWxheV92YWx1ZV8yIjoxLjAsInJhbmRvbWl6YXRpb24iOjYuMCwic3dpdGNoX2RlbGF5IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMSI6NS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczIiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMzIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNCI6Mi4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczUiOjcuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM2IjoyMC4wLCJzd2l0Y2hfdmFsdWUiOjQuMCwieWF3X2FkZCI6LTIwLjAsInlhd19hZGRfciI6MzYuMCwieWF3X2hlYWRiZWhpbmRjaGVzdCI6ZmFsc2UsInlhd19qaXR0ZXIiOiJPZmZzZXQiLCJ5YXdfaml0dGVyX2FkZCI6MC4wLCJ5YXdfaml0dGVyX21vZGUiOiJDdXN0b20iLCJ5YXdfaml0dGVyX293bjEiOjAuMCwieWF3X2ppdHRlcl9vd24yIjowLjAsInlhd19qaXR0ZXJfc2xpZGVyMSI6MS4wLCJ5YXdfaml0dGVyX3NsaWRlcjIiOi0xLjAsInlhd19qaXR0ZXJfc2xpZGVyMyI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI0Ijo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjUiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNiI6NTAuMCwieWF3X3NsaWRlcnMiOjIuMH0sImR1Y2sgbW92ZSI6eyJhbnRpYnJ1dGVmb3JjZV9lbmFibGUiOmZhbHNlLCJhbnRpYnJ1dGVmb3JjZV9tb2RpZmllcnMiOlsifiJdLCJib2R5X3lhdyI6IkppdHRlciIsImJvZHlfeWF3X3RpY2tzIjoxMi4wLCJjbGVhbnJlY29yZHMiOmZhbHNlLCJjbGVhbnJlY29yZHNfcmFuZG9tX2ZsaWNrIjpmYWxzZSwiY2xlYW5yZWNvcmRzX3VzZWZha2VsYWciOmZhbHNlLCJkZWZlbnNpdmVfYWN0aXZhdGlvbl9vcHRpb25zIjpbIldlYXBvbiBzd2l0Y2giLCJXZWFwb24gcmVsb2FkIiwifiJdLCJkZWZlbnNpdmVfZGlzYWJsZV9vcHRpb24iOnRydWUsImRlbGF5IjpmYWxzZSwiZGVsYXlfaW50ZXJhY3Rpb25fdHlwZSI6IkNyZWF0ZW1vdmUiLCJkZWxheV9tZXRob2QiOiJSYW5kb20iLCJkZWxheV9zbGlkZXJzIjoyLjAsImZha2VsaW1pdF9sIjo1OS4wLCJmYWtlbGltaXRfbDIiOjMyLjAsImZha2VsaW1pdF9vcHRpb25zIjoiRGVmYXVsdCIsImZha2VsaW1pdF9yIjo1OS4wLCJmYWtlbGltaXRfcjIiOjMyLjAsImZha2VsaW1pdF9zcGVlZCI6NS4wLCJyYW5kb21fZGVsYXlfdmFsdWVfMSI6NS4wLCJyYW5kb21fZGVsYXlfdmFsdWVfMiI6MTAuMCwicmFuZG9taXphdGlvbiI6MC4wLCJzd2l0Y2hfZGVsYXkiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMxIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMiI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczMiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM0IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNSI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczYiOjEuMCwic3dpdGNoX3ZhbHVlIjo0LjAsInlhd19hZGQiOi0yMC4wLCJ5YXdfYWRkX3IiOjQwLjAsInlhd19oZWFkYmVoaW5kY2hlc3QiOmZhbHNlLCJ5YXdfaml0dGVyIjoiT2Zmc2V0IiwieWF3X2ppdHRlcl9hZGQiOjAuMCwieWF3X2ppdHRlcl9tb2RlIjoiQ3VzdG9tIiwieWF3X2ppdHRlcl9vd24xIjowLjAsInlhd19qaXR0ZXJfb3duMiI6MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjEiOjUuMCwieWF3X2ppdHRlcl9zbGlkZXIyIjotNS4wLCJ5YXdfaml0dGVyX3NsaWRlcjMiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNCI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI1Ijo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjYiOjUwLjAsInlhd19zbGlkZXJzIjoyLjB9LCJqdW1wIjp7ImFudGlicnV0ZWZvcmNlX2VuYWJsZSI6dHJ1ZSwiYW50aWJydXRlZm9yY2VfbW9kaWZpZXJzIjpbIkZha2UgbGltaXQiLCJNb2RpZmllciIsIn4iXSwiYm9keV95YXciOiJKaXR0ZXIiLCJib2R5X3lhd190aWNrcyI6MTIuMCwiY2xlYW5yZWNvcmRzIjpmYWxzZSwiY2xlYW5yZWNvcmRzX3JhbmRvbV9mbGljayI6ZmFsc2UsImNsZWFucmVjb3Jkc191c2VmYWtlbGFnIjpmYWxzZSwiZGVmZW5zaXZlX2FjdGl2YXRpb25fb3B0aW9ucyI6WyJBbHdheXMiLCJ+Il0sImRlZmVuc2l2ZV9kaXNhYmxlX29wdGlvbiI6ZmFsc2UsImRlbGF5IjpmYWxzZSwiZGVsYXlfaW50ZXJhY3Rpb25fdHlwZSI6IkNyZWF0ZW1vdmUiLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0IiwiZGVsYXlfc2xpZGVycyI6MS4wLCJmYWtlbGltaXRfbCI6NTkuMCwiZmFrZWxpbWl0X2wyIjozMi4wLCJmYWtlbGltaXRfb3B0aW9ucyI6IkRlZmF1bHQiLCJmYWtlbGltaXRfciI6NTkuMCwiZmFrZWxpbWl0X3IyIjozMi4wLCJmYWtlbGltaXRfc3BlZWQiOjUuMCwicmFuZG9tX2RlbGF5X3ZhbHVlXzEiOjEuMCwicmFuZG9tX2RlbGF5X3ZhbHVlXzIiOjEuMCwicmFuZG9taXphdGlvbiI6MC4wLCJzd2l0Y2hfZGVsYXkiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMxIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMiI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczMiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM0IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNSI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczYiOjEuMCwic3dpdGNoX3ZhbHVlIjo0LjAsInlhd19hZGQiOjAuMCwieWF3X2FkZF9yIjowLjAsInlhd19oZWFkYmVoaW5kY2hlc3QiOmZhbHNlLCJ5YXdfaml0dGVyIjoiT2ZmIiwieWF3X2ppdHRlcl9hZGQiOi0xLjAsInlhd19qaXR0ZXJfbW9kZSI6IkRlZmF1bHQiLCJ5YXdfaml0dGVyX293bjEiOjAuMCwieWF3X2ppdHRlcl9vd24yIjowLjAsInlhd19qaXR0ZXJfc2xpZGVyMSI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXIyIjo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjMiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNCI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI1Ijo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjYiOjUwLjAsInlhd19zbGlkZXJzIjoxLjB9LCJydW4iOnsiYW50aWJydXRlZm9yY2VfZW5hYmxlIjp0cnVlLCJhbnRpYnJ1dGVmb3JjZV9tb2RpZmllcnMiOlsiRmFrZSBsaW1pdCIsIk1vZGlmaWVyIiwifiJdLCJib2R5X3lhdyI6IkppdHRlciIsImJvZHlfeWF3X3RpY2tzIjoxMi4wLCJjbGVhbnJlY29yZHMiOnRydWUsImNsZWFucmVjb3Jkc19yYW5kb21fZmxpY2siOmZhbHNlLCJjbGVhbnJlY29yZHNfdXNlZmFrZWxhZyI6ZmFsc2UsImRlZmVuc2l2ZV9hY3RpdmF0aW9uX29wdGlvbnMiOlsiQWx3YXlzIiwifiJdLCJkZWZlbnNpdmVfZGlzYWJsZV9vcHRpb24iOnRydWUsImRlbGF5IjpmYWxzZSwiZGVsYXlfaW50ZXJhY3Rpb25fdHlwZSI6IkNyZWF0ZW1vdmUiLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0IiwiZGVsYXlfc2xpZGVycyI6MS4wLCJmYWtlbGltaXRfbCI6MzIuMCwiZmFrZWxpbWl0X2wyIjoyOC4wLCJmYWtlbGltaXRfb3B0aW9ucyI6Ik1pbi1NYXgiLCJmYWtlbGltaXRfciI6MzIuMCwiZmFrZWxpbWl0X3IyIjo1OC4wLCJmYWtlbGltaXRfc3BlZWQiOjUuMCwicmFuZG9tX2RlbGF5X3ZhbHVlXzEiOjEuMCwicmFuZG9tX2RlbGF5X3ZhbHVlXzIiOjEuMCwicmFuZG9taXphdGlvbiI6MTAuMCwic3dpdGNoX2RlbGF5IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMSI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczIiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMzIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNCI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczUiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM2IjoxLjAsInN3aXRjaF92YWx1ZSI6NC4wLCJ5YXdfYWRkIjowLjAsInlhd19hZGRfciI6MC4wLCJ5YXdfaGVhZGJlaGluZGNoZXN0Ijp0cnVlLCJ5YXdfaml0dGVyIjoiT2Zmc2V0IiwieWF3X2ppdHRlcl9hZGQiOi0xLjAsInlhd19qaXR0ZXJfbW9kZSI6IkRlZmF1bHQiLCJ5YXdfaml0dGVyX293bjEiOjI1LjAsInlhd19qaXR0ZXJfb3duMiI6LTEyLjAsInlhd19qaXR0ZXJfc2xpZGVyMSI6MS4wLCJ5YXdfaml0dGVyX3NsaWRlcjIiOjMuMCwieWF3X2ppdHRlcl9zbGlkZXIzIjo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjQiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNSI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI2Ijo1MC4wLCJ5YXdfc2xpZGVycyI6Mi4wfSwic2xvdyB3YWxrIjp7ImFudGlicnV0ZWZvcmNlX2VuYWJsZSI6dHJ1ZSwiYW50aWJydXRlZm9yY2VfbW9kaWZpZXJzIjpbIkZha2UgbGltaXQiLCJEZWxheSIsIk1vZGlmaWVyIiwifiJdLCJib2R5X3lhdyI6IkppdHRlciIsImJvZHlfeWF3X3RpY2tzIjoxMi4wLCJjbGVhbnJlY29yZHMiOmZhbHNlLCJjbGVhbnJlY29yZHNfcmFuZG9tX2ZsaWNrIjpmYWxzZSwiY2xlYW5yZWNvcmRzX3VzZWZha2VsYWciOmZhbHNlLCJkZWZlbnNpdmVfYWN0aXZhdGlvbl9vcHRpb25zIjpbIkFsd2F5cyIsIn4iXSwiZGVmZW5zaXZlX2Rpc2FibGVfb3B0aW9uIjpmYWxzZSwiZGVsYXkiOmZhbHNlLCJkZWxheV9pbnRlcmFjdGlvbl90eXBlIjoiQ3JlYXRlbW92ZSIsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9zbGlkZXJzIjoxLjAsImZha2VsaW1pdF9sIjo1OC4wLCJmYWtlbGltaXRfbDIiOjU4LjAsImZha2VsaW1pdF9vcHRpb25zIjoiRGVmYXVsdCIsImZha2VsaW1pdF9yIjo1OC4wLCJmYWtlbGltaXRfcjIiOjU4LjAsImZha2VsaW1pdF9zcGVlZCI6NS4wLCJyYW5kb21fZGVsYXlfdmFsdWVfMSI6MS4wLCJyYW5kb21fZGVsYXlfdmFsdWVfMiI6MS4wLCJyYW5kb21pemF0aW9uIjoyMC4wLCJzd2l0Y2hfZGVsYXkiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMxIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMiI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczMiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM0IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNSI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczYiOjEuMCwic3dpdGNoX3ZhbHVlIjo0LjAsInlhd19hZGQiOi0xMC4wLCJ5YXdfYWRkX3IiOi0xMC4wLCJ5YXdfaGVhZGJlaGluZGNoZXN0IjpmYWxzZSwieWF3X2ppdHRlciI6Ik9mZnNldCIsInlhd19qaXR0ZXJfYWRkIjotMS4wLCJ5YXdfaml0dGVyX21vZGUiOiJEZWZhdWx0IiwieWF3X2ppdHRlcl9vd24xIjozMS4wLCJ5YXdfaml0dGVyX293bjIiOjY1LjAsInlhd19qaXR0ZXJfc2xpZGVyMSI6MjUuMCwieWF3X2ppdHRlcl9zbGlkZXIyIjoxMS4wLCJ5YXdfaml0dGVyX3NsaWRlcjMiOjMyLjAsInlhd19qaXR0ZXJfc2xpZGVyNCI6MjEuMCwieWF3X2ppdHRlcl9zbGlkZXI1Ijo1LjAsInlhd19qaXR0ZXJfc2xpZGVyNiI6NTAuMCwieWF3X3NsaWRlcnMiOjUuMH0sInN0YW5kIjp7ImFudGlicnV0ZWZvcmNlX2VuYWJsZSI6dHJ1ZSwiYW50aWJydXRlZm9yY2VfbW9kaWZpZXJzIjpbIkRlbGF5IiwifiJdLCJib2R5X3lhdyI6IkppdHRlciIsImJvZHlfeWF3X3RpY2tzIjoxMi4wLCJjbGVhbnJlY29yZHMiOmZhbHNlLCJjbGVhbnJlY29yZHNfcmFuZG9tX2ZsaWNrIjpmYWxzZSwiY2xlYW5yZWNvcmRzX3VzZWZha2VsYWciOmZhbHNlLCJkZWZlbnNpdmVfYWN0aXZhdGlvbl9vcHRpb25zIjpbIkFsd2F5cyIsIn4iXSwiZGVmZW5zaXZlX2Rpc2FibGVfb3B0aW9uIjp0cnVlLCJkZWxheSI6ZmFsc2UsImRlbGF5X2ludGVyYWN0aW9uX3R5cGUiOiJDcmVhdGVtb3ZlIiwiZGVsYXlfbWV0aG9kIjoiRGVmYXVsdCIsImRlbGF5X3NsaWRlcnMiOjEuMCwiZmFrZWxpbWl0X2wiOjYwLjAsImZha2VsaW1pdF9sMiI6MzIuMCwiZmFrZWxpbWl0X29wdGlvbnMiOiJEZWZhdWx0IiwiZmFrZWxpbWl0X3IiOjYwLjAsImZha2VsaW1pdF9yMiI6MzIuMCwiZmFrZWxpbWl0X3NwZWVkIjo1LjAsInJhbmRvbV9kZWxheV92YWx1ZV8xIjoxLjAsInJhbmRvbV9kZWxheV92YWx1ZV8yIjoxLjAsInJhbmRvbWl6YXRpb24iOjguMCwic3dpdGNoX2RlbGF5IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMSI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczIiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMzIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNCI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczUiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM2IjoxLjAsInN3aXRjaF92YWx1ZSI6MC4wLCJ5YXdfYWRkIjowLjAsInlhd19hZGRfciI6MC4wLCJ5YXdfaGVhZGJlaGluZGNoZXN0Ijp0cnVlLCJ5YXdfaml0dGVyIjoiT2Zmc2V0IiwieWF3X2ppdHRlcl9hZGQiOi0xLjAsInlhd19qaXR0ZXJfbW9kZSI6IkRlZmF1bHQiLCJ5YXdfaml0dGVyX293bjEiOjEyLjAsInlhd19qaXR0ZXJfb3duMiI6MTIuMCwieWF3X2ppdHRlcl9zbGlkZXIxIjo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjIiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyMyI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI0Ijo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjUiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNiI6NTAuMCwieWF3X3NsaWRlcnMiOjEuMH19fSwic3RhdGljX21hbnVhbCI6ZmFsc2UsInRyb2xsX2FhX29wdGlvbnMiOiJTcGluIiwidHJvbGxfYWFfc3BlZWQiOjUuMCwieWF3bW9kaWZpZXIiOlsifiJdfSx7ImRpc2FibGVfY3ZhcnMiOnRydWUsImV4dGVuZGVkX3BpbmdfYW1vdW50IjoyNy4wLCJleHRyYV9ub3RpZmljYXRpb25fb3B0aW9ucyI6WyJ+Il0sImZhc3RfbGFkZGVyIjp0cnVlLCJmcmVlemV0aW1lX2Zha2VkdWNrIjp0cnVlLCJoaXRsb2dfY29sb3IiOiIjRkZGRkZGRkYiLCJoaXRsb2dfb3B0aW9ucyI6WyJQdXJjaGFzZXMiLCJTaG90cyIsIk5hZGVzIiwifiJdLCJoaXRsb2dzIjpbIk9uIHNjcmVlbiIsIkNvbnNvbGUiLCJ+Il0sImtlZXBfbW9kZWxfdHJhbnNwYXJlbmN5Ijp0cnVlLCJub19mYWxsIjp0cnVlLCJ0cmFzaHRhbGtfc3RhdGVzIjpbIn4iXSwidW5sb2NrX2Zha2VkdWNrX3NwZWVkIjp0cnVlfSx7Iipjb25zb2xlX2NvbG9yIjoiIzQzNDA0NkJGIiwiKmhpdF9tYXJrZXIiOiIjRkZGRkZGRkYiLCIqbWFudWFsX2Fycm93cyI6IiNEMkIzQ0RGRiIsIipuZXRncmFwaF9lbmFibGUiOiIjOUU5QkIyRkYiLCJhbmltYXRpb25zX2ZhbGxfYW1vdW50IjoxLjAsImFuaW1hdGlvbnNfbGVhbl9hbW91bnQiOjEwMC4wLCJhbmltYXRpb25zX3NsaWRlX2Ftb3VudCI6MS4wLCJhc3BlY3RfcmF0aW9fZW5hYmxlIjp0cnVlLCJhc3BlY3RyYXRpbyI6MTM1LjAsImNvbnNvbGVfY29sb3IiOnRydWUsImRpc2FibGVfc2xlZXZlcyI6dHJ1ZSwiZG1nX2NvbG9yIjoiI0ZGRkZGRkZGIiwiZG1naW5kaWNhdG9yIjpmYWxzZSwiZG1naW5kaWNhdG9yX3Nob3ciOmZhbHNlLCJnaW5nZXJpbmRpY2F0b3JzIjpmYWxzZSwiaGl0X21hcmtlciI6dHJ1ZSwiaml0dGVyX2xlZ3MiOmZhbHNlLCJqaXR0ZXJfbGVnc19mcm9tIjo2NC4wLCJqaXR0ZXJfbGVnc190byI6OTEuMCwia2liaXRfbWFya2VyIjpmYWxzZSwibGFnY29tcF9kZWJ1ZyI6dHJ1ZSwibWFudWFsX2Fycm93cyI6dHJ1ZSwibmV0Z3JhcGhfZW5hYmxlIjpmYWxzZSwic2NvcGVfb3ZlcmxheSI6dHJ1ZSwic2NvcGVfb3ZlcmxheV9jb2xvciI6IiM3RDdEN0RGRiIsInNjb3BlX292ZXJsYXlfZ2FwIjo5LjAsInNjb3BlX292ZXJsYXlfbGluZSI6NDAuMCwic2NvcGVfb3ZlcmxheV9yb3RhdGUiOmZhbHNlLCJ2aWV3bW9kZWxfZm92Ijo2MDAuMCwidmlld21vZGVsX2tuaWZlaGFuZCI6ZmFsc2UsInZpZXdtb2RlbF94IjotNS4wLCJ2aWV3bW9kZWxfeSI6LTEwLjAsInZpZXdtb2RlbF96IjoxMy4wfV0="
    }, 
    display_name_map = {}, 
    database = db.gingersense_cfgs or {}, 
    persist_data = function(v74, v75, v76)
        if not v76 or type(v75) ~= "string" then
            return false;
        else
            v74.database = v76;
            return true;
        end;
    end, 
    save_database = function(v77)
        db.gingersense_cfgs = v77.database;
    end, 
    retrieve_data = function(v78, _)
        return v78.database or {};
    end, 
    select_current_config = function(v80)
        local v81 = v80.ui.menu.cfg.list();
        local v82 = 1;
        for v83 in pairs(v80.default_configs) do
            if v81 == v82 or v81 == 0 then
                return v80.ui.menu.cfg.name(v83);
            else
                v82 = v82 + 1;
            end;
        end;
        if next(v80.storage) ~= nil then
            if v81 == v82 then
                return nil;
            else
                v82 = v82 + 1;
            end;
        end;
        for v84 in pairs(v80.storage) do
            if v81 == v82 then
                return v80.ui.menu.cfg.name(v84);
            else
                v82 = v82 + 1;
            end;
        end;
        return nil;
    end, 
    refresh_ui = function(v85)
        local v86 = {};
        v85.display_name_map = {};
        for v87 in pairs(v85.default_configs) do
            local v88 = "\a" .. ui.get_style()["Link Active"]:to_hex() .. "\226\128\162  \aDEFAULT" .. v87;
            table.insert(v86, v88);
            v85.display_name_map[v88] = v87;
        end;
        if next(v85.storage) ~= nil then
            table.insert(v86, "---------------------");
        end;
        for v89 in pairs(v85.storage) do
            table.insert(v86, v89);
            v85.display_name_map[v89] = v89;
        end;
        for _, _ in next, v85.database do

        end;
        v85.ui.menu.cfg.list:update(v86);
        v85:persist_data(v85.config_file, v85.storage);
        v85:select_current_config();
        return v85;
    end, 
    initialize = function(v92)
        v92.storage = v92:retrieve_data(v92.config_file) or {};
        v92:refresh_ui();
        return v92;
    end, 
    encode = function(_, v94)
        -- upvalues: l_base64_0 (ref)
        return l_base64_0.encode(json.stringify(v94));
    end, 
    decode = function(_, v96)
        -- upvalues: l_base64_0 (ref)
        return json.parse(l_base64_0.decode(v96));
    end, 
    export_config = function(v97)
        -- upvalues: l_pui_0 (ref)
        return v97:encode((l_pui_0.setup({
            [1] = v97.ui.menu.global, 
            [2] = v97.ui.menu.aa, 
            [3] = v97.ui.menu.misc, 
            [4] = v97.ui.menu.vis
        }, true):save()));
    end, 
    export = function(v98, v99, ...)
        local v100 = "export_" .. v99;
        if not v98[v100] then
            v98.helpers:add_notification("\aff9494ff" .. ui.get_icon("xmark") .. "\affffffff | Invalid export type");
            return nil, "Invalid export type";
        else
            local l_status_0, l_result_0 = pcall(v98[v100], v98, ...);
            if not l_status_0 then
                v98.helpers:add_notification("\aff9494ff" .. ui.get_icon("xmark") .. "\affffffff | Export error");
                print("Export error:", l_result_0);
                return nil;
            else
                v98.helpers:add_notification("\a7583e0ff" .. ui.get_icon("floppy-disk") .. "\affffffff | Config successfully exported");
                return "{gingersense:" .. v99 .. "}:" .. l_result_0;
            end;
        end;
    end, 
    import_config = function(v103, v104)
        -- upvalues: l_pui_0 (ref)
        local v105 = v103:decode(v104);
        l_pui_0.setup({
            [1] = v103.ui.menu.global, 
            [2] = v103.ui.menu.aa, 
            [3] = v103.ui.menu.misc, 
            [4] = v103.ui.menu.vis
        }, true):load(v105);
    end, 
    validate_import = function(_, v107, v108)
        local v109 = v107:match("{gingersense:(.+)}");
        return v109 and v109 == v108;
    end, 
    import = function(v110, v111, v112, ...)
        if not v110:validate_import(v111, v112) then
            v110.helpers:add_notification("\aff9494ff" .. ui.get_icon("xmark") .. "\affffffff | This is not valid gingersense data. 1");
            return error("This is not valid gingersense data. 1");
        else
            local v113 = v111:gsub("{gingersense:" .. v112 .. "}:", "");
            local v114 = "import_" .. v112;
            local l_status_1, l_result_1 = pcall(v110[v114], v110, v113, ...);
            if not l_status_1 then
                print(l_result_1);
                v110.helpers:add_notification("\aff9494ff" .. ui.get_icon("xmark") .. "\affffffff | This is not valid gingersense data. 2");
                return error("This is not valid gingersense data. 2");
            else
                v110.helpers:add_notification("\a7583e0ff" .. ui.get_icon("floppy-disk") .. "\affffffff | Config successfully imported");
                return true;
            end;
        end;
    end, 
    save = function(v117)
        local v118 = v117.ui.menu.cfg.name();
        if not v118:match("%w") then
            v117.helpers:add_notification("\aff9494ff" .. ui.get_icon("xmark") .. "\affffffff | Invalid config name");
            return print("Invalid config name");
        elseif v117.default_configs[v118] then
            v117.helpers:add_notification("\aff9494ff" .. ui.get_icon("xmark") .. "\affffffff | Cannot overwrite default configs");
            return print("Cannot overwrite default config: " .. v118);
        else
            local v119 = v117:export("config");
            v117.storage[v118] = v119;
            v117.database[v118] = v119;
            v117:save_database();
            v117:refresh_ui();
            v117.helpers:add_notification("\a7583e0ff" .. ui.get_icon("floppy-disk") .. "\affffffff | Config successfully saved");
            return true;
        end;
    end, 
    load = function(v120)
        local v121 = v120.ui.menu.cfg.name();
        local v122 = v120.storage[v121] or v120.default_configs[v121];
        if not v122 then
            v120.helpers:add_notification("\aff9494ff" .. ui.get_icon("xmark") .. "\affffffff | Invalid config name");
            return print("Invalid config name");
        else
            return v120:import(v122, "config");
        end;
    end, 
    delete = function(v123)
        local v124 = v123.ui.menu.cfg.name();
        if v123.default_configs[v124] then
            v123.helpers:add_notification("\aff9494ff" .. ui.get_icon("xmark") .. "\affffffff | Cannot delete default configs");
            return print("Cannot delete default config: " .. v124);
        elseif not v123.storage[v124] then
            v123.helpers:add_notification("\aff9494ff" .. ui.get_icon("xmark") .. "\affffffff | Invalid config name");
            return print("Invalid config name");
        else
            v123.helpers:add_notification("\a7583e0ff" .. ui.get_icon("xmark") .. "\affffffff | Config successfully removed");
            v123.storage[v124] = nil;
            v123:refresh_ui();
            return true;
        end;
    end
}):struct("helpers")({
    distance = 0, 
    tick_work = 0, 
    last_message_time = 0, 
    active_messages = {}, 
    contains = function(_, v126, v127)
        for _, v129 in pairs(v126) do
            if v129 == v127 then
                return true;
            end;
        end;
        return false;
    end, 
    easeInOut = function(_, v131)
        return v131 > 0.5 and 4 * (v131 - 1) ^ 3 + 1 or 4 * v131 ^ 3;
    end, 
    clamp = function(_, v133, v134, v135)
        if v135 < v134 then
            local l_v135_0 = v135;
            v135 = v134;
            v134 = l_v135_0;
        end;
        return math.max(v134, math.min(v135, v133));
    end, 
    in_air = function(_, v138)
        return bit.band(v138.m_fFlags, 1) == 0;
    end, 
    in_duck = function(_, v140)
        return bit.band(v140.m_fFlags, 4) == 4;
    end, 
    get_team = function(_)
        return entity.get_local_player().m_iTeamNum == 2 and "terrorist" or "counter-terrorist";
    end, 
    get_state = function(v142)
        local v143 = entity.get_local_player();
        local _ = v143.m_fFlags;
        local v145 = v143.m_vecVelocity:length2d();
        local v146 = v142:in_duck(v143) or v142.ref.rage.fd:get();
        if v142:in_air(v143) or v142.antiaim.state.air then
            return v146 and "duck jump" or "jump";
        elseif v145 > 3 and v146 then
            return "duck move";
        elseif v142.ref.antiaim.slowwalk:get() then
            return "slow walk";
        elseif v146 then
            return "duck";
        else
            return v145 > 1.5 and "run" or "stand";
        end;
    end, 
    u8 = function(_, v148)
        local v149 = {};
        local v150 = 0;
        for v151 in string.gmatch(v148, ".[\128-\191]*") do
            v150 = v150 + 1;
            v149[v150] = v151;
        end;
        return v149, v150;
    end, 
    gradienttext = function(v152, _, v154, v155, v156, v157, v158, v159, v160, v161, v162, v163)
        local v164 = "";
        local v165 = globals.realtime * v163 % 2 - 1;
        local v166, v167 = v152:u8(v154);
        for v168 = 1, v167 do
            local v169 = v166[v168];
            local v170 = (v168 - 1) / v167;
            local l_v155_0 = v155;
            local l_v156_0 = v156;
            local l_v157_0 = v157;
            local l_v158_0 = v158;
            local v175 = v170 - v165;
            if v175 >= 0 and v175 <= 1.4 then
                if v175 > 0.7 then
                    v175 = 1.4 - v175;
                end;
                local v176 = v159 - v155;
                local v177 = v160 - v156;
                local v178 = v161 - v157;
                local v179 = v162 - v158;
                l_v155_0 = l_v155_0 + v176 * v175 / 0.8;
                l_v156_0 = l_v156_0 + v177 * v175 / 0.8;
                l_v157_0 = l_v157_0 + v178 * v175 / 0.8;
                l_v158_0 = l_v158_0 + v179 * v175 / 0.8;
            end;
            v164 = v164 .. "\a" .. color(l_v155_0, l_v156_0, l_v157_0, l_v158_0):to_hex() .. v169;
        end;
        return v164;
    end, 
    get_charge = function(_)
        local v181 = entity.get_local_player();
        return globals.tickcount - v181.m_flSimulationTime / globals.tickinterval;
    end, 
    normalize = function(_, v183)
        v183 = (v183 % 360 + 360) % 360;
        return v183 > 180 and v183 - 360 or v183;
    end, 
    vec_closest_point_on_ray = function(_, v185, v186, v187)
        local v188 = v185 - v186;
        local v189 = v187 - v186;
        local v190 = #v189;
        v189.x = v189.x / v190;
        v189.y = v189.y / v190;
        v189.z = v189.z / v190;
        local v191 = v189.x * v188.x + v189.y * v188.y + v189.z * v188.z;
        if v191 < 0 then
            return v186;
        elseif v190 < v191 then
            return v187;
        else
            return vector(v186.x + v189.x * v191, v186.y + v189.y * v191, v186.z + v189.z * v191);
        end;
    end, 
    bullet_impact = function(v192, v193, v194, v195)
        v192.distance = v192:vec_closest_point_on_ray(v193, v194, v195):dist(v193);
        if v192.distance > 55 then
            return;
        else
            v192.tick_work = globals.tickcount;
            return;
        end;
    end, 
    add_notification = function(v196, v197)
        if #v196.active_messages >= 5 then
            table.remove(v196.active_messages, 1);
        end;
        table.insert(v196.active_messages, {
            text = v197, 
            start_time = globals.realtime, 
            expire_time = globals.realtime + 5
        });
        v196.last_message_time = globals.realtime;
    end, 
    extract_hex_colors = function(_, v199)
        local v200 = {};
        local v201 = 1;
        local v202 = "FFFFFF";
        for v203, v204, v205 in v199:gmatch("()%\a([A-Fa-f0-9]+)()") do
            if v204:upper() ~= "FFFFFFFF" then
                if v201 < v203 then
                    table.insert(v200, {
                        color = v202, 
                        text = v199:sub(v201, v203 - 1)
                    });
                end;
                v202 = v204;
                v201 = v205;
            end;
        end;
        if v201 <= #v199 then
            table.insert(v200, {
                color = v202, 
                text = v199:sub(v201)
            });
        end;
        return v200;
    end, 
    render_notifications = function(v206)
        if not globals.is_in_game or #v206.active_messages == 0 then
            return;
        else
            local l_realtime_0 = globals.realtime;
            local v208 = render.screen_size();
            local v209 = v208.x / 2;
            local v210 = v208.y / 1.2 - #v206.active_messages * 10;
            for v211 = #v206.active_messages, 1, -1 do
                if v206.active_messages[v211].expire_time < l_realtime_0 then
                    table.remove(v206.active_messages, v211);
                end;
            end;
            for v212, v213 in ipairs(v206.active_messages) do
                local v214 = 0.5;
                local v215 = 1;
                local v216 = l_realtime_0 - v213.start_time;
                local v217 = v213.expire_time - l_realtime_0;
                local l_text_0 = v213.text;
                local l_x_0 = render.measure_text(1, "c", l_text_0).x;
                local l_l_x_0_0 = l_x_0;
                local v221 = 255;
                local v222 = 0;
                if v216 < v214 then
                    local v223 = v216 / v214;
                    local v224 = 1 - (1 - v223) * (1 - v223);
                    v221 = math.floor(255 * v224);
                    v222 = (1 - v224) * 10;
                elseif v217 < v215 then
                    local v225 = v217 / v215;
                    local v226 = v225 * v225;
                    v221 = math.floor(255 * v226);
                    v222 = (1 - v226) * 10;
                end;
                if v216 < v214 then
                    local v227 = v216 / v214;
                    l_l_x_0_0 = l_x_0 * (1 - (1 - v227) * (1 - v227));
                elseif v217 < v215 then
                    local v228 = v217 / v215;
                    l_l_x_0_0 = l_x_0 * (v228 * v228);
                end;
                local v229 = v210 + (v212 - 1) * 34 + v222;
                local v230 = v209 - l_l_x_0_0 / 2 - 6;
                local v231 = v209 + l_l_x_0_0 / 2 + 6;
                local v232 = v206:extract_hex_colors(v213.text);
                local v233 = 6;
                local v234 = color(v232[1].color);
                local v235 = color(v234.r, v234.g, v234.b, v234.a * (v221 / 255));
                local v236 = 1;
                render.rect(vector(v230, v229 - 10), vector(v231 - 1, v229 + 13), color(29, 22, 41, 250 * (v221 / 255)), 6, true);
                render.line(vector(v230, v229 - 7), vector(v230, v229 + 9), v235);
                render.line(vector(v231 - 1, v229 - 7), vector(v231 - 1, v229 + 9), v235);
                render.circle_outline(vector(v230 + v233, v229 - 11 + v233), v235, v233, 180, 0.25, v236);
                render.circle_outline(vector(v231 - v233, v229 - 11 + v233), v235, v233, 270, 0.25, v236);
                render.circle_outline(vector(v231 - v233, v229 + 14 - v233), v235, v233, 0, 0.25, v236);
                render.circle_outline(vector(v230 + v233, v229 + 14 - v233), v235, v233, 90, 0.25, v236);
                local v237 = 1;
                if v216 < v214 then
                    local v238 = v216 / v214;
                    v237 = 1 - (1 - v238) * (1 - v238 * 0.95);
                elseif v217 < v215 then
                    local v239 = v217 / v215;
                    v237 = v239 * v239;
                end;
                local v240 = l_x_0 * v237;
                local v241 = v209 - v240 / 2;
                local v242 = v209 + v240 / 2;
                local v243 = v229 - 12;
                local v244 = v229 + 16;
                render.push_clip_rect(vector(v241, v243), vector(v242, v244));
                render.text(1, vector(v209, v229 + 1), color(255, 255, 255, v221), "c", l_text_0);
                render.pop_clip_rect();
            end;
            return;
        end;
    end
}):struct("antiaim")({
    constants = {
        states = {
            [1] = "global", 
            [2] = "stand", 
            [3] = "move", 
            [4] = "slow", 
            [5] = "air", 
            [6] = "duck", 
            [7] = "duck move", 
            [8] = "duck jump"
        }, 
        yaw_options = {
            Spin = 4, 
            Center = 2, 
            Gingerbomber = 5, 
            Random = 3, 
            Offset = 1
        }, 
        body_yaw_options = {
            Experimental = 5, 
            Tick = 4, 
            Jitter = 2, 
            Off = 1, 
            Random = 3
        }, 
        manual_options = {
            Left = 1, 
            Forward = 3, 
            Right = 2
        }, 
        random_buffer = {}, 
        sin_cache = {}
    }, 
    state = {
        body_yaw_false_ticks = 0, 
        defensive_switch = false, 
        body_yaw_switch = false, 
        body_yaw_side = 0, 
        side = 0, 
        body_yaw_switch_delay = 0, 
        modifier_switch_delay = 0, 
        hold_delay = 0, 
        hold_time = 0, 
        switch_delay = 0, 
        air = false, 
        defensive_after = 0, 
        teleported = false, 
        defensive_state = false, 
        activation_delay = 0, 
        current_safe_yaw = 0, 
        yaw_hold_ticks = 0, 
        current_slider = 1, 
        counter = 0, 
        round_ended = false, 
        last_rand = 0, 
        inverter_override_ticks = 0, 
        ab = {
            bruted_last_time = 0, 
            should_swap = {}, 
            time = {}, 
            jitteralgo = {}, 
            fakelimit = {}, 
            delay = {}
        }
    }, 
    init = function(v245)
        for v246 = 0, 3600 do
            v245.constants.sin_cache[v246] = math.sin(v246 * 0.1);
        end;
        for v247 = 1, 100 do
            v245.constants.random_buffer[v247] = math.random(-60, 60);
        end;
        return v245;
    end, 
    run = function(v248, v249)
        v248:apply_anti_aim(v249, (v248:get_aa_settings()));
    end, 
    get_aa_settings = function(v250)
        return v250:parse_settings(v250.ui.menu.aa.states);
    end, 
    reset_antibruteforce = function(v251)
        v251.state.ab.bruted_last_time = 0;
        v251.state.ab.time = {};
        v251.state.ab.jitteralgo = {};
        v251.state.ab.delay = {};
        v251.state.ab.fakelimit = {};
        v251.state.ab.should_swap = {};
    end, 
    shot_detection = function(v252, v253)
        if tick_work == globals.tickcount then
            return;
        elseif not globals.is_connected then
            return;
        elseif not entity.get_local_player():is_alive() then
            return;
        elseif not entity.get(v253.userid, true) then
            return;
        elseif not v253.userid then
            return;
        elseif entity.get(v253.userid, true):is_alive() == false then
            return;
        elseif entity.get(v253.userid, true):is_dormant() then
            return;
        elseif not entity.get(v253.userid, true):is_enemy() then
            return;
        else
            if math.abs(v252.state.ab.bruted_last_time - globals.curtime) > 0.25 then
                local v254 = vector(v253.x, v253.y, v253.z);
                local v255 = entity.get(v253.userid, true):get_eye_position();
                local v256 = entity.get_local_player():get_eye_position();
                local _ = v252.helpers:bullet_impact(v256, v255, v254);
                local v258 = entity.get(v253.userid, true);
                if v252.helpers.distance < 70 then
                    v252.state.ab.bruted_last_time = globals.curtime;
                    v252.state.ab.time[v258] = globals.curtime + 5;
                    v252.state.ab.jitteralgo[v258] = math.random(-12, 14);
                    v252.state.ab.delay[v258] = math.random(-2, 4);
                    v252.state.ab.fakelimit[v258] = math.random(10, 60);
                    v252.state.ab.should_swap[v258] = true;
                    if v252.helpers:contains(v252.ui.menu.misc.extra_notification_options:get(), "Anti-Bruteforce") then
                        v252.helpers:add_notification("\a7583e0ff" .. ui.get_icon("head-side-cough") .. "\affffffff | Anti-Bruteforce updated by ['\a7583e0ff" .. v258:get_name() .. "\affffffff's] shot [\a7583e0ff" .. v252.state.ab.jitteralgo[v258] .. "\affffffff;\a7583e0ff" .. v252.state.ab.fakelimit[v258] .. "\affffffff\194\176;\a7583e0ff" .. v252.state.ab.delay[v258] .. "\afffffffft]");
                    end;
                end;
            end;
            return;
        end;
    end, 
    parse_settings = function(v259, v260)
        local v261 = v259.helpers:get_state();
        local v262 = v259.helpers:get_team();
        local v263 = v259.settings_cache or {};
        v259.settings_cache = v263;
        if type(v260) == "string" then
            return json.parse(v260)[v262][v261];
        else
            for v264 in pairs(v263) do
                v263[v264] = nil;
            end;
            for v265, v266 in pairs(v260[v262][v261]) do
                v263[v265] = v266:get();
            end;
            return v263;
        end;
    end, 
    apply_anti_aim = function(v267, v268, v269)
        local v270 = entity.get_local_player();
        if not v270:is_alive() or not globals.is_in_game then
            v267.state.defensive_after = 0;
            return;
        else
            v267.state.air = v268.in_jump;
            if v267:handle_special_modes(v269) then
                return;
            else
                v267:handle_side_switching(v268, v269);
                local v271, v272 = v267:calculate_offsets(v269);
                local v273, v274, v275 = v267:handle_head_protection(v269, v270, v271, v272);
                if not v275 then
                    v267:apply_basic_settings();
                    v267.ref.antiaim.leftfake:override(v274);
                    v267.ref.antiaim.rightfake:override(v274);
                end;
                local v276 = v267.constants.body_yaw_options[v269.body_yaw] or 1;
                if v276 == 1 then
                    v267.ref.antiaim.inverter:override(v267.state.side == 0);
                    v267.ref.antiaim.body_yaw:override(false);
                elseif v276 == 2 then
                    rage.antiaim:inverter(v267.state.side == 0);
                    v267.ref.antiaim.body_yaw:override(true);
                elseif v276 == 4 then
                    v267.ref.antiaim.inverter:override(v267.state.side == 0);
                    v267.ref.antiaim.body_yaw:override(v267.state.body_yaw_false_ticks % v269.body_yaw_ticks ~= 1);
                elseif v276 == 5 then
                    local v277 = v267.state.side == 0;
                    if v267.state.counter % math.random(6, 8) == 0 then
                        v277 = not v277;
                    end;
                    v267.ref.antiaim.inverter:override(v277);
                    v267.ref.antiaim.body_yaw:override(true);
                else
                    rage.antiaim:inverter(v268.command_number % math.random(3, 7) == 0);
                    v267.ref.antiaim.body_yaw:override(true);
                end;
                if v269.antibruteforce_enable and math.abs(v267.state.ab.bruted_last_time - globals.curtime) > 0.25 then
                    for v278, v279 in next, v267.state.ab.should_swap do
                        if v279 and v267.state.ab.time[v278] - globals.curtime >= 0 then
                            if v267.helpers:contains(v269.antibruteforce_modifiers, "Modifier") then
                                v273 = v273 + v267.state.ab.jitteralgo[v278];
                            end;
                            if v267.helpers:contains(v269.antibruteforce_modifiers, "Fake limit") then
                                v274 = v267.state.ab.fakelimit[v278];
                                break;
                            else
                                break;
                            end;
                        end;
                    end;
                end;
                v267.ref.antiaim.body_yaw_options:override({});
                v267.ref.antiaim.yaw_offset:override(v273);
                v267.ref.antiaim.leftfake:override(v274);
                v267.ref.antiaim.rightfake:override(v274);
                v267:handle_fluctuate_fakelag();
                v267:handle_freestanding();
                v267:handle_manual_aa();
                local v280 = v270:get_player_weapon();
                local v281 = "";
                if v280 ~= nil then
                    v281 = v280:get_classname();
                end;
                if v267.helpers:contains(v269.defensive_activation_options, "Weapon switch") and not v267.ref.rage.fd:get() and v267.ref.rage.dt:get() and v270.m_flNextAttack > globals.curtime then
                    v267.ref.rage.dtlag:override("always on");
                end;
                if v267.helpers:contains(v269.defensive_activation_options, "Weapon reload") and not v267.ref.rage.fd:get() and v267.ref.rage.dt:get() and v280:get_weapon_reload() ~= -1 then
                    v267.ref.rage.dtlag:override("always on");
                end;
                if v267.helpers:contains(v269.defensive_activation_options, "Always") and not v267.ref.rage.fd:get() and v267.ref.rage.dt:get() then
                    local v282 = v270:get_player_weapon();
                    if math.max(v282.m_flNextPrimaryAttack, v270.m_flNextAttack) - globals.tickinterval - globals.curtime < 0 then
                        if not v269.defensive_disable_option or not v267.ref.rage.quickpeek:get() then
                            v267.ref.rage.dtlag:override("always on");
                        end;
                    else
                        v267.ref.rage.dtlag:override("disabled");
                    end;
                end;
                return;
            end;
        end;
    end, 
    handle_side_switching = function(v283, _, v285)
        local v286 = 0;
        if globals.choked_commands ~= 0 then
            return;
        elseif v285.delay ~= true then
            v283.state.side = 1 - v283.state.side;
            return;
        elseif v285.delay_interaction_type == "Net_update" and globals.choked_commands ~= math.random(0, 1) then
            return;
        else
            v283.state.switch_delay = v283.state.switch_delay + 1;
            if v283.helpers:contains(v285.antibruteforce_modifiers, "Delay") and v285.antibruteforce_enable and math.abs(v283.state.ab.bruted_last_time - globals.curtime) > 0.25 then
                for v287, v288 in next, v283.state.ab.should_swap do
                    if v288 and v283.state.ab.time[v287] - globals.curtime >= 0 then
                        v286 = v283.state.ab.delay[v287];
                        break;
                    end;
                end;
                if v285.switch_delay <= 2 then
                    v286 = math.abs(v286);
                end;
            end;
            if v285.delay_method == "Random" then
                if v283.state.switch_delay >= math.random(v285.random_delay_value_1, v285.random_delay_value_2) + v286 then
                    v283.state.switch_delay = 0;
                    v283.state.side = 1 - v283.state.side;
                end;
            elseif v285.delay_method == "Custom" then
                if not v283.current_slider then
                    v283.current_slider = 1;
                end;
                local v289 = tonumber(v285["switch_delay_sliders" .. tostring(v283.current_slider)]) or 1;
                v289 = math.max(v289, 1);
                if v283.state.switch_delay >= v289 + v286 then
                    v283.state.switch_delay = 0;
                    v283.state.side = v283.state.side == 1 and 0 or 1;
                    v283.current_slider = v283.current_slider + 1;
                    if v283.current_slider > v285.delay_sliders then
                        v283.current_slider = 1;
                    end;
                end;
            elseif v283.state.switch_delay >= v285.switch_delay + v286 then
                v283.state.switch_delay = 0;
                v283.state.side = 1 - v283.state.side;
            end;
            return;
        end;
    end, 
    calculate_offsets = function(v290, v291)
        local v292 = 0;
        local v293 = 0;
        local v294 = v290.constants.yaw_options[v291.yaw_jitter] or 0;
        local l_yaw_jitter_add_0 = v291.yaw_jitter_add;
        if v291.yaw_jitter_mode == "Custom" and v294 ~= 5 then
            if globals.choked_commands == 0 then
                v290.state.modifier_switch_delay = v290.state.modifier_switch_delay + 1;
            end;
            if not v290.current_slider then
                v290.current_slider = 1;
            end;
            local v296 = tonumber(v291["yaw_jitter_slider" .. tostring(v290.current_slider)]) or 1;
            if math.max(v296, 1) <= v290.state.modifier_switch_delay then
                v290.current_slider = v290.current_slider + 1;
                if v290.current_slider > v291.yaw_sliders then
                    v290.current_slider = 1;
                end;
            end;
            l_yaw_jitter_add_0 = v291["yaw_jitter_slider" .. v290.current_slider];
        end;
        local v297 = utils.random_int(0, v291.randomization);
        v292 = v292 + (v290.state.side == 0 and v291.yaw_add + v297 or v291.yaw_add_r + v297);
        if v294 == 1 then
            v290.ref.antiaim.yaw_modifier:override("disabled");
            v290.ref.antiaim.yaw_modifieramount:override(0);
            local v298;
            if v290.state.side ~= 1 or not l_yaw_jitter_add_0 then
                v298 = 0;
            else
                v298 = l_yaw_jitter_add_0;
            end;
            v292 = v292 + v298;
        elseif v294 == 2 then
            v290.ref.antiaim.yaw_modifier:override("disabled");
            v290.ref.antiaim.yaw_modifieramount:override(0);
            v292 = v292 + (v290.state.side == 1 and l_yaw_jitter_add_0 / 2 or -l_yaw_jitter_add_0 / 2);
        elseif v294 == 3 then
            v290.ref.antiaim.yaw_modifier:override("disabled");
            v290.ref.antiaim.yaw_modifieramount:override(0);
            local v299 = math.random(0, l_yaw_jitter_add_0) - l_yaw_jitter_add_0 / 1.5;
            v292 = v292 + v299;
            v290.state.last_rand = v299;
        elseif v294 == 4 then
            v290.ref.antiaim.yaw_modifier:override("spin");
            v290.ref.antiaim.yaw_modifieramount:override(l_yaw_jitter_add_0);
        elseif v294 == 5 then
            local l_yaw_modifier_0 = v290.ref.antiaim.yaw_modifier;
            local l_l_yaw_modifier_0_0 = l_yaw_modifier_0;
            l_yaw_modifier_0 = l_yaw_modifier_0.override;
            local v302;
            if v290.state.counter % math.random(v291.switch_value - 1, v291.switch_value) == 0 then
                v302 = math.random(0, 6) == 0 and "5-way" or "random";
            else
                v302 = "3-way";
            end;
            l_yaw_modifier_0(l_l_yaw_modifier_0_0, v302);
            v290.ref.antiaim.yaw_modifieramount:override(utils.random_int(v291.yaw_jitter_own1, v291.yaw_jitter_own2));
        else
            v290.ref.antiaim.yaw_modifier:override("disabled");
            v290.ref.antiaim.yaw_modifieramount:override(0);
        end;
        if v291.fakelimit_options == "Default" then
            v293 = v290.state.side == 0 and v291.fakelimit_l or v291.fakelimit_r;
        elseif v291.fakelimit_options == "Min-Max" then
            v293 = math.min(60, v291.fakelimit_l2 + globals.tickcount * v291.fakelimit_speed ^ v290.ui.menu.aa.troll_aa_speed:get() % v291.fakelimit_r2);
        elseif v291.fakelimit_options == "Random" then
            v293 = math.random(v291.fakelimit_l2, v291.fakelimit_r2);
        end;
        if v290.defensive.defensive > 0 then
            v290.state.defensive_state = true;
        end;
        if v290.state.defensive_state and v290.defensive.defensive < 1 and entity.get_threat(true) ~= nil then
            local v303 = globals.tickcount % 7 + 11;
            v290.state.defensive_after = globals.tickcount + v303;
        end;
        if v290.state.defensive_after >= globals.tickcount and v291.cleanrecords then
            local v304 = math.random(-9, 12);
            if v291.cleanrecords_random_flick then
                v304 = globals.tickcount % math.random(15, 16) == 1 and math.random(60, 72) or math.random(-9, 12);
            end;
            v292 = v292 + v304;
            local v305 = entity.get_local_player():get_player_weapon();
            if v291.cleanrecords_usefakelag and v305.m_flNextPrimaryAttack <= globals.curtime then
                v290.ref.rage.dt_fakelag:override(math.random(1, 2));
            end;
            v290.state.defensive_state = false;
        end;
        if globals.choked_commands == 0 then
            v290.state.counter = v290.state.counter + 1;
            v290.state.body_yaw_false_ticks = v290.state.body_yaw_false_ticks + 1;
        end;
        return v292, v293;
    end, 
    apply_basic_settings = function(v306)
        v306.ref.antiaim.enable:override(true);
        v306.ref.antiaim.pitch:override("down");
        v306.ref.antiaim.yaw_target:override("At Target");
        v306.ref.antiaim.yaw:override("Backward");
        v306.ref.antiaim.avoid_backstab:override(v306.helpers:contains(v306.ui.menu.aa.options:get(), "Avoid Backstab"));
    end, 
    handle_head_protection = function(v307, v308, v309, v310, v311)
        if not v308.yaw_headbehindchest or globals.choked_commands >= 3 then
            return v310, v311, false;
        else
            if not v307.state.yaw_hold_ticks then
                v307.state.yaw_hold_ticks = 0;
                v307.state.current_safe_yaw = 0;
                v307.state.activation_delay = 6 + globals.tickcount % 3;
            end;
            local v312 = entity.get_threat(true);
            local v313 = v312 ~= nil;
            local v314 = false;
            if v312 then
                local v315 = v312:get_player_weapon();
                if v315 then
                    v314 = (v315.m_flNextPrimaryAttack or 0) <= globals.curtime + 0.2;
                end;
            end;
            local v316 = (v309.m_flNextAttack or 0) <= globals.curtime;
            local v317 = false;
            if v307.state.activation_delay <= 0 and (v313 or v314) and v316 then
                v317 = true;
                if v307.state.yaw_hold_ticks > 0 then
                    v310 = v307.state.current_safe_yaw;
                    v307.state.yaw_hold_ticks = v307.state.yaw_hold_ticks - 1;
                else
                    local v318 = v309.m_vecVelocity:length2d();
                    local v319 = globals.tickcount % 100 + 1;
                    local v320 = v307.constants.random_buffer[v319] % 11 - 4;
                    v310 = v318 > 5 and v320 or 3 + globals.tickcount % 3;
                    v307.state.current_safe_yaw = v310;
                    v307.state.yaw_hold_ticks = 1 + globals.tickcount % 2;
                    v311 = math.max(v318, 60);
                    v307.ref.antiaim.inverter:override(true);
                    v307.ref.antiaim.body_yaw:override(globals.tickcount % 2 == 0);
                    v307.ref.antiaim.yaw_modifier:override("off");
                    v307.ref.antiaim.yaw_modifieramount:override(0);
                    v307.state.activation_delay = 6 + math.random(1, 9);
                end;
            else
                v307.state.activation_delay = v307.state.activation_delay - 1;
            end;
            return v310, v311, v317;
        end;
    end, 
    handle_special_modes = function(v321, _)
        local v323 = entity.get_local_player();
        if not v323 then
            return;
        else
            if v321.helpers:contains(v321.ui.menu.aa.options:get(), "Warmup AA") then
                local v324 = entity.get_game_rules();
                if v324 and v324.m_bWarmupPeriod then
                    v321.ref.antiaim.pitch:override("Disabled");
                    local _ = 0;
                    local v326 = 0;
                    if v321.ui.menu.aa.troll_aa_options:get() == "Half Spin" then
                        v326 = math.sin(globals.tickcount * (v321.ui.menu.aa.troll_aa_speed:get() / 10)) * 135;
                    else
                        v326 = globals.tickcount * 2 ^ v321.ui.menu.aa.troll_aa_speed:get() % 360;
                    end;
                    v321.ref.antiaim.yaw_offset:override(v326);
                    v321.ref.antiaim.leftfake:override(0);
                    v321.ref.antiaim.rightfake:override(0);
                    v321.ref.antiaim.body_yaw:override(false);
                    v321.ref.antiaim.inverter:override(false);
                    v321.ref.antiaim.hidden:override(false);
                    v321.ref.antiaim.yaw_modifier:override("Offset");
                    v321.ref.antiaim.yaw_modifieramount:override(0);
                    return true;
                end;
            end;
            if v321.state.round_ended and not entity.get_threat(true) and v321.helpers:contains(v321.ui.menu.aa.options:get(), "Round end AA") then
                v321.ref.antiaim.pitch:override("Disabled");
                local _ = 0;
                local v328 = 0;
                if v321.ui.menu.aa.troll_aa_options:get() == "Half Spin" then
                    v328 = math.sin(globals.tickcount * (v321.ui.menu.aa.troll_aa_speed:get() / 10)) * 135;
                else
                    v328 = globals.tickcount * 2 ^ v321.ui.menu.aa.troll_aa_speed:get() % 360;
                end;
                v321.ref.antiaim.yaw_offset:override(v328);
                v321.ref.antiaim.leftfake:override(0);
                v321.ref.antiaim.rightfake:override(0);
                v321.ref.antiaim.inverter:override(false);
                v321.ref.antiaim.hidden:override(false);
                v321.ref.antiaim.body_yaw:override(false);
                v321.ref.antiaim.yaw_modifier:override("Offset");
                v321.ref.antiaim.yaw_modifieramount:override(0);
                return true;
            else
                if v321.helpers:contains(v321.ui.menu.aa.options:get(), "Hide Head") then
                    local v329 = v321.helpers:get_state();
                    local v330 = v323:get_player_weapon();
                    local v331 = v330 and v330:get_classname() or "";
                    local v332 = entity.get_threat();
                    local v333 = v323:get_origin() or {};
                    local v334 = false;
                    local v335 = false;
                    if v332 then
                        local v336 = v332:get_origin();
                        v334 = v336.z - v333.z < -60;
                        v335 = v336.x - v333.x < -1500;
                    end;
                    local v337 = v321.ui.menu.aa.hidehead_options:get();
                    local _ = v321.helpers.contains;
                    local v339;
                    if v321.helpers:contains(v337, "Standing") then
                        v339 = string.find(v329, "stand");
                        if v339 then
                            goto label0;
                        end;
                    end;
                    if (not v321.helpers:contains(v337, "Crouch") or v329 ~= "duck") and (not v321.helpers:contains(v337, "Air Crouch Knife") or v329 ~= "duck jump" or v331 ~= "CKnife") and (not v321.helpers:contains(v337, "Taser In Air") or not string.find(v329, "jump") or v331 ~= "CWeaponTaser") then
                        if not v321.helpers:contains(v337, "Height Advantage") or not v334 then
                            v339 = v321.helpers:contains(v337, "Distance") and v335;
                        else
                            v339 = v334;
                        end;
                    else
                        v339 = true;
                    end;
                    ::label0::;
                    if v339 then
                        v321.ref.antiaim.yaw_offset:override(5);
                        v321.ref.antiaim.yaw_modifier:override("Offset");
                        v321.ref.antiaim.yaw_modifieramount:override(0);
                        v321.ref.antiaim.leftfake:override(0);
                        v321.ref.antiaim.rightfake:override(0);
                        v321.ref.antiaim.inverter:override(false);
                        v321.ref.antiaim.hidden:override(false);
                        return true;
                    end;
                end;
                return false;
            end;
        end;
    end, 
    handle_freestanding = function(v340)
        local v341 = v340.helpers:get_state();
        if v340.ui.menu.aa.freestanding:get() and not v340.helpers:contains(v340.ui.menu.aa.freestanding_disablers:get(), v341) then
            v340.ref.antiaim.freestanding:override(true);
            if v340.helpers:contains(v340.ui.menu.aa.yawmodifier:get(), "Force static") then
                v340.ref.antiaim.yaw_offset:override(5);
                v340.ref.antiaim.yaw_modifier:override("Offset");
                v340.ref.antiaim.yaw_modifieramount:override(0);
                v340.ref.antiaim.leftfake:override(0);
                v340.ref.antiaim.rightfake:override(0);
                v340.ref.antiaim.inverter:override(false);
                v340.ref.antiaim.hidden:override(false);
            end;
        else
            v340.ref.antiaim.freestanding:override(false);
        end;
    end, 
    handle_manual_aa = function(v342)
        local v343 = v342.ui.menu.aa.manual_aa:get();
        local v344 = v342.constants.manual_options[v343] or 0;
        if v344 == 1 then
            v342.ref.antiaim.yaw_offset:override(-90);
            v342.ref.antiaim.freestanding:override(false);
            v342.ref.antiaim.yaw_target:override(v342.ui.menu.aa.manual_target:get());
            if v342.ui.menu.aa.static_manual:get() then
                v342.ref.antiaim.yaw_modifier:override("Offset");
                v342.ref.antiaim.yaw_modifieramount:override(0);
                v342.ref.antiaim.leftfake:override(0);
                v342.ref.antiaim.rightfake:override(0);
                v342.ref.antiaim.inverter:override(false);
                v342.ref.antiaim.hidden:override(false);
            end;
        elseif v344 == 2 then
            v342.ref.antiaim.yaw_offset:override(90);
            v342.ref.antiaim.freestanding:override(false);
            v342.ref.antiaim.yaw_target:override(v342.ui.menu.aa.manual_target:get());
            if v342.ui.menu.aa.static_manual:get() then
                v342.ref.antiaim.yaw_modifier:override("Offset");
                v342.ref.antiaim.yaw_modifieramount:override(0);
                v342.ref.antiaim.leftfake:override(0);
                v342.ref.antiaim.rightfake:override(0);
                v342.ref.antiaim.inverter:override(false);
                v342.ref.antiaim.hidden:override(false);
            end;
        elseif v344 == 3 then
            v342.ref.antiaim.yaw_offset:override(180);
            v342.ref.antiaim.freestanding:override(false);
            v342.ref.antiaim.yaw_target:override(v342.ui.menu.aa.manual_target:get());
            if v342.ui.menu.aa.static_manual:get() then
                v342.ref.antiaim.yaw_modifier:override("Offset");
                v342.ref.antiaim.yaw_modifieramount:override(0);
                v342.ref.antiaim.leftfake:override(0);
                v342.ref.antiaim.rightfake:override(0);
                v342.ref.antiaim.inverter:override(false);
                v342.ref.antiaim.hidden:override(false);
            end;
        end;
    end, 
    handle_fluctuate_fakelag = function(v345)
        if v345.helpers:contains(v345.ui.menu.aa.options:get(), "Fluctuate Fakelag") and not v345.ref.rage.fd:get() then
            local v346 = 5 + globals.tickcount % 11;
            v345.ref.rage.fakelag:override(globals.tickcount % v346 == 0 and 1 or 14);
        else
            v345.ref.rage.fakelag:override();
        end;
    end, 
    handle_airlag = function(v347, v348)
        if v347.ui.menu.aa.airlag:get() then
            v348.force_defensive = true;
            if v347.state.counter % 6 == 0 then
                rage.exploit:force_teleport();
            end;
            rage.exploit:force_charge();
        end;
    end
}):struct("defensive")({
    cmd = 0, 
    max_tickbase = 0, 
    defensive = 0, 
    on_createmove = function(v349, _)
        local l_m_nTickBase_0 = entity.get_local_player().m_nTickBase;
        if math.abs(l_m_nTickBase_0 - v349.max_tickbase) > 64 then
            v349.max_tickbase = 0;
        end;
        local v352 = 0;
        if v349.max_tickbase < l_m_nTickBase_0 then
            v349.max_tickbase = l_m_nTickBase_0;
        elseif l_m_nTickBase_0 < v349.max_tickbase then
            v352 = math.min(14, math.max(0, v349.max_tickbase - l_m_nTickBase_0 - 1));
        end;
        v349.defensive = v352;
    end
}):struct("mindmg")({
    windows = {
        mouse = {
            down = false, 
            clicked = false, 
            down_duration = 0, 
            pos = vector(), 
            pos_prev = vector(), 
            delta = vector(), 
            clicked_pos = vector()
        }, 
        damage_window = {
            dragging = false, 
            alpha = 0, 
            pos = vector(render.screen_size().x / 2 + 30, render.screen_size().y / 2 - 40), 
            size = vector(), 
            padding = vector(4, 4)
        }
    }, 
    update_mouse = function(v353)
        local l_frametime_0 = globals.frametime;
        local v355 = ui.get_mouse_position();
        local v356 = common.is_button_down(1);
        local l_mouse_0 = v353.windows.mouse;
        l_mouse_0.pos_prev = l_mouse_0.pos;
        l_mouse_0.pos = v355;
        l_mouse_0.delta = l_mouse_0.pos - l_mouse_0.pos_prev;
        l_mouse_0.down = v356;
        l_mouse_0.clicked = v356 and l_mouse_0.down_duration < 0;
        local v358;
        if v356 then
            if l_mouse_0.down_duration < 0 then
                v358 = 0;
                goto label1 --[[  true, true  ]];
            else
                v358 = l_mouse_0.down_duration + l_frametime_0;
                if v358 then
                    goto label1;
                end;
            end;
        end;
        v358 = -1;
        ::label1::;
        l_mouse_0.down_duration = v358;
        if l_mouse_0.clicked then
            l_mouse_0.clicked_pos = l_mouse_0.pos;
        end;
    end, 
    update_dragging = function(v359)
        local l_damage_window_0 = v359.windows.damage_window;
        local l_mouse_1 = v359.windows.mouse;
        if ui.get_alpha() > 0 then
            v359:update_mouse();
            local v362 = l_mouse_1.pos.x >= l_damage_window_0.pos.x and l_mouse_1.pos.x <= l_damage_window_0.pos.x + l_damage_window_0.size.x and l_mouse_1.pos.y >= l_damage_window_0.pos.y and l_mouse_1.pos.y <= l_damage_window_0.pos.y + l_damage_window_0.size.y;
            if l_mouse_1.clicked and v362 then
                l_damage_window_0.dragging = true;
                v359.drag_offset = l_mouse_1.pos - l_damage_window_0.pos;
            end;
            if l_mouse_1.down and l_damage_window_0.dragging then
                l_damage_window_0.pos = l_mouse_1.pos - v359.drag_offset;
                local v363 = render.screen_size();
                l_damage_window_0.pos.x = math.clamp(l_damage_window_0.pos.x, 0, v363.x - l_damage_window_0.size.x);
                l_damage_window_0.pos.y = math.clamp(l_damage_window_0.pos.y, 0, v363.y - l_damage_window_0.size.y);
            end;
            if not l_mouse_1.down then
                l_damage_window_0.dragging = false;
            end;
        end;
        if not l_damage_window_0.dragging then
            v359:save_damage_window_position();
        end;
    end, 
    render_damage_indicator = function(v364)
        local v365 = entity.get_local_player();
        if not v365 or not v365:is_alive() then
            return;
        elseif not v364.ui.menu.vis.dmgindicator:get() then
            return;
        else
            local l_font_0 = font;
            local v367 = l_font_0 == "Small" and 2 or l_font_0 == "Bold" and 4 or 1;
            local v368 = tostring(v364.ref.rage.dmg:get());
            local v369 = render.measure_text(v367, "s", v368) + v364.windows.damage_window.padding * 2 + vector(1, 0);
            v364.windows.damage_window.size = v369;
            if ui.get_alpha() > 0 then
                v364:update_dragging();
            end;
            local v370;
            if ui.get_alpha() > 0 then
                v370 = v364.windows.damage_window.dragging and 0.5 or 1;
            else
                v370 = 0;
            end;
            v364.windows.damage_window.alpha = utility_lerp(v364.windows.damage_window.alpha, v370, 0.05);
            local l_pos_0 = v364.windows.damage_window.pos;
            local v372 = l_pos_0 + v369 * 0.5 + vector(1, 0);
            local v373 = color(200, 200, 200, 228 * v364.windows.damage_window.alpha);
            render.rect_outline(l_pos_0, l_pos_0 + v369, v373, 1, 4);
            local v374 = v364.skeetinds:get(v364.ref.rage.dmg);
            if v364.ui.menu.vis.dmgindicator_show:get() and v374 ~= nil and v374.active or ui.get_alpha() > 0 then
                local v375 = v364.ui.menu.vis.dmg_color:get_color();
                render.text(v367, v372, v375, "cs", v368);
            elseif not v364.ui.menu.vis.dmgindicator_show:get() or v374 ~= nil and v374.active then
                local v376 = color(200, 200, 200, 228);
                render.text(v367, v372, v376, "cs", v368);
            end;
            return;
        end;
    end, 
    save_damage_window_position = function(v377)
        local l_damage_window_1 = v377.windows.damage_window;
        db.gingersense_pos = {
            x = l_damage_window_1.pos.x, 
            y = l_damage_window_1.pos.y
        };
    end, 
    load_damage_window_position = function(v379)
        local l_gingersense_pos_0 = db.gingersense_pos;
        local l_l_gingersense_pos_0_0 = l_gingersense_pos_0;
        if type(l_gingersense_pos_0) == "string" then
            local l_status_2, l_result_2 = pcall(json.parse, l_gingersense_pos_0);
            if l_status_2 and type(l_result_2) == "table" then
                l_l_gingersense_pos_0_0 = l_result_2;
                db.gingersense_pos = l_l_gingersense_pos_0_0;
            else
                l_l_gingersense_pos_0_0 = {};
            end;
        end;
        if type(l_l_gingersense_pos_0_0) == "table" and l_l_gingersense_pos_0_0.x and l_l_gingersense_pos_0_0.y then
            v379.windows.damage_window.pos = vector(l_l_gingersense_pos_0_0.x, l_l_gingersense_pos_0_0.y);
        end;
    end, 
    setup = function(v384)
        v384:load_damage_window_position();
        v384.configs = db.gingersense or {};
        events.shutdown:set(function()
            -- upvalues: v384 (ref)
            v384:save_damage_window_position();
            db.gingersense = v384.configs;
        end);
    end
}):struct("visuals")({
    has_knife = false, 
    avg_fps = 0, 
    variance = 0, 
    frametimes_index = 0, 
    alpha_smoother = l_smoothy_0.new(0), 
    frametimes = {}, 
    font2 = render.load_font("museo500", 24, "ad"), 
    font = render.load_font("C:\\Windows\\Fonts\\calibrib.ttf", vector(25, 23.5, 0), "a"), 
    render_indicator = function(v385, v386, v387, v388, v389)
        local v390 = v386.x / v386.x + 10;
        local v391 = v386.y / 2 + v389 * 35;
        local v392 = render.measure_text(v385.font, "c", v388);
        local v393 = v392.x + 10;
        local v394 = v392.y + 10;
        local v395 = vector(v390, v391);
        local _ = vector(v390 + v393, v391 * 1.01);
        local _ = vector(v390 + v393 * 0.9, v391);
        local _ = vector(v390, v391 + v394);
        local v399 = vector(v390 + v393, v391 + v394);
        local _ = vector(v390 + v393 * 0.6, v391);
        render.gradient(v395, v399, color(0, 0, 0, 0), color(0, 0, 0, 0), color(0, 0, 0, 30), color(0, 0, 0, 30));
        local v401 = v390 + 6 + v392.x;
        local v402 = v391 + (v394 - v392.y) / 1.9;
        render.text(v385.font, vector(v401, v402), v387, "r", v388);
    end, 
    scope_overlay = function(v403)
        if v403.ui.menu.vis.scope_overlay:get() then
            local v404 = v403.ui.menu.vis.scope_overlay_color:get_color();
            local v405 = entity.get_local_player();
            if not v405 or not v405:is_alive() then
                return;
            elseif not v405.m_bIsScoped then
                return;
            else
                local v406 = v403.alpha_smoother(0.05, v405.m_bIsScoped);
                if v406 == 0 then
                    return;
                else
                    local v407 = v403.ui.menu.vis.scope_overlay_gap:get();
                    if v403.ui.menu.vis.scope_overlay_rotate:get() then
                        v407 = math.max(v407, 20);
                    end;
                    local v408 = v403.ui.menu.vis.scope_overlay_line:get() * 5;
                    local l_v407_0 = v407;
                    local v410 = render.screen_size();
                    local v411 = v410 * 0.5;
                    local v412 = math.floor(v408 * v410.y / 1080);
                    local v413 = math.floor(l_v407_0 * v410.y / 1080);
                    local v414 = v404:clone();
                    local v415 = v404:clone();
                    v414.a = v414.a * v406;
                    v415.a = 0;
                    if v403.ui.menu.vis.scope_overlay_rotate:get() then
                        render.push_rotation(45);
                    end;
                    render.gradient(vector(v411.x, v411.y - v413 + 1), vector(v411.x + 1, v411.y - (v412 - v413)), v414, v414, v415, v415);
                    render.gradient(vector(v411.x, v411.y + v413), vector(v411.x + 1, v411.y + (v412 - v413)), v414, v414, v415, v415);
                    render.gradient(vector(v411.x - v413 + 1, v411.y), vector(v411.x - (v412 - v413), v411.y + 1), v414, v415, v414, v415);
                    render.gradient(vector(v411.x + v413, v411.y), vector(v411.x + (v412 - v413), v411.y + 1), v414, v415, v414, v415);
                    if v403.ui.menu.vis.scope_overlay_rotate:get() then
                        render.pop_rotation();
                    end;
                end;
            end;
        end;
    end, 
    aspectratio_viewmodel = function(v416)
        cvar.sv_competitive_minspec:int(0);
        cvar.viewmodel_fov:float(v416.ui.menu.vis.viewmodel_fov:get() * 0.1);
        cvar.viewmodel_offset_x:float(v416.ui.menu.vis.viewmodel_x:get() * 0.1);
        cvar.viewmodel_offset_y:float(v416.ui.menu.vis.viewmodel_y:get() * 0.1);
        cvar.viewmodel_offset_z:float(v416.ui.menu.vis.viewmodel_z:get() * 0.1);
        if v416.ui.menu.vis.aspect_ratio_enable:get() then
            cvar.r_aspectratio:float(v416.ui.menu.vis.aspectratio:get() * 0.01);
        else
            cvar.r_aspectratio:float(0);
        end;
        if v416.ui.menu.misc.disable_cvars:get() then
            cvar.cl_disable_ragdolls:int(1, true);
            cvar.dsp_slow_cpu:int(1, true);
            cvar.mat_disable_bloom:int(1, true);
            cvar.r_drawparticles:int(1, true);
            cvar.func_break_max_pieces:int(0, true);
            cvar.mat_queue_mode:int(2, true);
            cvar.muzzleflash_light:int(0, true);
            cvar.mat_hdr_enabled:int(0, true);
            cvar.r_eyemove:int(0, true);
            cvar.r_eyegloss:int(0, true);
            cvar.r_shadows:float(0, true);
            cvar.cl_foot_contact_shadows:int(0);
        end;
        if v416.ui.menu.vis.viewmodel_knifehand:get() then
            local v417 = entity.get_local_player();
            if v417 == nil then
                return;
            else
                local v418 = v417:get_player_weapon();
                if v418 == nil then
                    return;
                else
                    local v419 = v418:get_weapon_info();
                    if v419 == nil then
                        return;
                    elseif v419.weapon_type == 0 then
                        if not v416.has_knife then
                            v416.original_hand_value = cvar.cl_righthand:int();
                            cvar.cl_righthand:int(1 - v416.original_hand_value);
                            v416.has_knife = true;
                        end;
                    elseif v416.has_knife then
                        if v416.original_hand_value ~= nil then
                            cvar.cl_righthand:int(v416.original_hand_value);
                        end;
                        v416.has_knife = false;
                        v416.original_hand_value = nil;
                    end;
                end;
            end;
        end;
    end, 
    net_graph = function(v420)
        local v421 = render.screen_size();
        if v420.ui.menu.vis.manual_arrows:get() then
            local v422 = v420.ui.menu.vis.manual_arrows:get_color();
            if v420.ui.menu.aa.manual_aa:get() == "Left" then
                render.text(v420.font2, vector(v421.x / 2 - 40, v421.y / 2 - 13), color(v422.r, v422.g, v422.b, v422.a * math.abs(math.cos(globals.curtime * 2))), "r", "\226\174\156");
            elseif v420.ui.menu.aa.manual_aa:get() == "Right" then
                render.text(v420.font2, vector(v421.x / 2 + 40, v421.y / 2 - 13), color(v422.r, v422.g, v422.b, v422.a * math.abs(math.cos(globals.curtime * 2))), "l", "\226\174\158");
            end;
        end;
        if globals.is_in_game and v420.ui.menu.vis.netgraph_enable:get() then
            local v423 = 64;
            local v424 = 0.5;
            local l_deviation_0 = utils.net_channel():get_server_info().deviation;
            local l_frame_time_0 = utils.net_channel():get_server_info().frame_time;
            local l_absoluteframetime_0 = globals.absoluteframetime;
            if l_absoluteframetime_0 > 0 then
                v420.frametimes[v420.frametimes_index] = l_absoluteframetime_0;
                v420.frametimes_index = v420.frametimes_index + 1;
                if v423 <= v420.frametimes_index then
                    v420.frametimes_index = 0;
                end;
            end;
            local v428 = 0;
            local v429 = 0;
            local l_frametimes_index_0 = v420.frametimes_index;
            local v431 = nil;
            variance = 0;
            for _ = 0, v423 - 1 do
                l_frametimes_index_0 = l_frametimes_index_0 - 1;
                if l_frametimes_index_0 < 0 then
                    l_frametimes_index_0 = v423 - 1;
                end;
                l_absoluteframetime_0 = v420.frametimes[l_frametimes_index_0] or 0;
                if l_absoluteframetime_0 ~= 0 then
                    v428 = v428 + l_absoluteframetime_0;
                    v429 = v429 + 1;
                    if v431 then
                        variance = math.max(variance, math.abs(l_absoluteframetime_0 - v431));
                    end;
                    v431 = l_absoluteframetime_0;
                    if v424 <= v428 then
                        break;
                    end;
                else
                    break;
                end;
            end;
            if v429 == 0 then
                return 0;
            else
                v428 = v428 / v429;
                local v433 = math.floor(1 / v428) + 0.5;
                if math.abs(v433 - v420.avg_fps) > 5 then
                    v420.avg_fps = v433;
                else
                    v433 = v420.avg_fps;
                end;
                local l_v433_0 = v433;
                local v435 = math.floor(math.min(1000, utils.net_channel().latency[1] * 1000));
                local v436 = v420.ui.menu.vis.netgraph_enable:get_color();
                render.text(1, vector(v421.x / 2 * 1.4, v421.y / 2 * 1.83), v436, "l", string.format("fps:  %d", l_v433_0));
                render.text(1, vector(v421.x / 2 * 1.4 + 60, v421.y / 2 * 1.83), v436, "l", string.format("var:  %.1f", l_deviation_0));
                render.text(1, vector(v421.x / 2 * 1.4 + 120, v421.y / 2 * 1.83), v436, "l", string.format("ping:  %d ms", v435));
                render.text(1, vector(v421.x / 2 * 1.4, v421.y / 2 * 1.83 + 15), v436, "l", "loss:  " .. utils.net_channel().loss[1] .. "%");
                render.text(1, vector(v421.x / 2 * 1.4 + 60, v421.y / 2 * 1.83 + 15), v436, "l", "choke:  " .. math.floor(utils.net_channel().choke[1]) .. "%");
                render.text(1, vector(v421.x / 2 * 1.369, v421.y / 2 * 1.83) + 30, v436, "l", string.format("sv: %.2f +- %.2fms    var: %.3f ms", l_frame_time_0, l_deviation_0, l_deviation_0));
            end;
        end;
    end
}):struct("watermark")({
    windows = {
        watermark = {
            dragging = false, 
            snap_threshold = 30, 
            alpha = 0, 
            pos = vector(render.screen_size().x / 2, render.screen_size().y * 0.98), 
            size = vector(), 
            padding = vector(4, 4)
        }, 
        mouse = {
            down = false, 
            clicked = false, 
            down_duration = 0, 
            pos = vector(), 
            pos_prev = vector(), 
            delta = vector(), 
            clicked_pos = vector()
        }
    }, 
    update_mouse = function(v437)
        local l_frametime_1 = globals.frametime;
        local v439 = ui.get_mouse_position();
        local v440 = common.is_button_down(1);
        local l_mouse_2 = v437.windows.mouse;
        l_mouse_2.pos_prev = l_mouse_2.pos;
        l_mouse_2.pos = v439;
        l_mouse_2.delta = l_mouse_2.pos - l_mouse_2.pos_prev;
        l_mouse_2.down = v440;
        l_mouse_2.clicked = v440 and l_mouse_2.down_duration < 0;
        local v442;
        if v440 then
            if l_mouse_2.down_duration < 0 then
                v442 = 0;
                goto label2 --[[  true, true  ]];
            else
                v442 = l_mouse_2.down_duration + l_frametime_1;
                if v442 then
                    goto label2;
                end;
            end;
        end;
        v442 = -1;
        ::label2::;
        l_mouse_2.down_duration = v442;
        if l_mouse_2.clicked then
            l_mouse_2.clicked_pos = l_mouse_2.pos;
        end;
    end, 
    update_watermark_dragging = function(v443)
        local l_watermark_0 = v443.windows.watermark;
        local l_mouse_3 = v443.windows.mouse;
        local v446 = render.screen_size();
        if ui.get_alpha() > 0 then
            v443:update_mouse();
            local v447 = v443.ui.menu.global.watermark_text:get();
            l_watermark_0.size = render.measure_text(v443.ui.menu.global.watermark_font:get(), nil, v447) + l_watermark_0.padding * 2;
            local v448 = l_mouse_3.pos.x >= l_watermark_0.pos.x - l_watermark_0.size.x / 2 and l_mouse_3.pos.x <= l_watermark_0.pos.x + l_watermark_0.size.x / 2 and l_mouse_3.pos.y >= l_watermark_0.pos.y - l_watermark_0.size.y / 2 and l_mouse_3.pos.y <= l_watermark_0.pos.y + l_watermark_0.size.y / 2;
            if l_mouse_3.clicked and v448 then
                l_watermark_0.dragging = true;
                v443.drag_offset = l_mouse_3.pos - l_watermark_0.pos;
            end;
            if l_mouse_3.down and l_watermark_0.dragging then
                l_watermark_0.pos = l_mouse_3.pos - v443.drag_offset;
                local v449 = {
                    center = vector(v446.x / 2, v446.y * 0.98), 
                    left = vector(10 + l_watermark_0.size.x / 2, v446.y / 2), 
                    right = vector(v446.x - 10 - l_watermark_0.size.x / 2, v446.y / 2)
                };
                local v450 = nil;
                local l_snap_threshold_0 = l_watermark_0.snap_threshold;
                for _, v453 in pairs(v449) do
                    local v454 = (l_watermark_0.pos - v453):length();
                    if v454 < l_snap_threshold_0 then
                        l_snap_threshold_0 = v454;
                        v450 = v453;
                    end;
                end;
                if v450 then
                    l_watermark_0.pos = v450;
                else
                    l_watermark_0.pos.x = math.clamp(l_watermark_0.pos.x, l_watermark_0.size.x / 2, v446.x - l_watermark_0.size.x / 2);
                    l_watermark_0.pos.y = math.clamp(l_watermark_0.pos.y, l_watermark_0.size.y / 2, v446.y - l_watermark_0.size.y / 2);
                end;
            end;
            if not l_mouse_3.down then
                l_watermark_0.dragging = false;
                v443:save_watermark_position();
            end;
        end;
    end, 
    save_watermark_position = function(v455)
        local l_watermark_1 = v455.windows.watermark;
        local v457 = render.screen_size();
        local v458 = {
            center = vector(v457.x / 2, v457.y * 0.98), 
            left = vector(10 + l_watermark_1.size.x / 2, v457.y / 2), 
            right = vector(v457.x - 10 - l_watermark_1.size.x / 2, v457.y / 2)
        };
        local v459 = nil;
        local l_huge_0 = math.huge;
        for v461, v462 in pairs(v458) do
            local v463 = (l_watermark_1.pos - v462):length();
            if v463 < l_huge_0 then
                l_huge_0 = v463;
                v459 = v461;
            end;
        end;
        if l_huge_0 < l_watermark_1.snap_threshold then
            db.watermark_pos = {
                preset = v459
            };
        else
            db.watermark_pos = {
                x = l_watermark_1.pos.x, 
                y = l_watermark_1.pos.y
            };
        end;
    end, 
    get_watermark_size = function(v464)
        local v465 = v464.ui.menu.global.watermark_text:get();
        local v466 = v464.ui.menu.global.watermark_font:get();
        return render.measure_text(v466, nil, v465) + v464.windows.watermark.padding * 2;
    end, 
    load_watermark_position = function(v467)
        local v468 = db.watermark_pos or {};
        local v469 = render.screen_size();
        local l_watermark_2 = v467.windows.watermark;
        l_watermark_2.size = v467:get_watermark_size();
        if v468.preset then
            if v468.preset == "center" then
                l_watermark_2.pos = vector(v469.x / 2, v469.y * 0.98);
            elseif v468.preset == "left" then
                l_watermark_2.pos = vector(10 + l_watermark_2.size.x / 2, v469.y / 2);
            elseif v468.preset == "right" then
                l_watermark_2.pos = vector(v469.x - 10 - l_watermark_2.size.x / 2, v469.y / 2);
            end;
        elseif v468.x and v468.y then
            l_watermark_2.pos = vector(v468.x, v468.y);
        end;
    end, 
    render_watermark = function(v471)
        if not v471.ui.menu.global.watermark:get() then
            return;
        else
            if ui.get_alpha() > 0 then
                v471:update_watermark_dragging();
            end;
            local l_watermark_3 = v471.windows.watermark;
            local v473 = render.screen_size();
            local v474;
            if ui.get_alpha() > 0 then
                v474 = l_watermark_3.dragging and 0.5 or 1;
            else
                v474 = 1;
            end;
            l_watermark_3.alpha = utility_lerp(l_watermark_3.alpha, v474, 0.05);
            local v475 = v471.ui.menu.global.watermark_text:get();
            l_watermark_3.size = render.measure_text(v471.ui.menu.global.watermark_font:get(), nil, v475) + l_watermark_3.padding * 2;
            local v476 = "c";
            local v477 = {
                center = vector(v473.x / 2, v473.y * 0.98), 
                left = vector(10 + l_watermark_3.size.x / 2, v473.y / 2), 
                right = vector(v473.x - 10 - l_watermark_3.size.x / 2, v473.y / 2)
            };
            local v478 = nil;
            local l_snap_threshold_1 = l_watermark_3.snap_threshold;
            for v480, v481 in pairs(v477) do
                local v482 = (l_watermark_3.pos - v481):length();
                if v482 < l_snap_threshold_1 then
                    l_snap_threshold_1 = v482;
                    v478 = v480;
                end;
            end;
            local v483 = v471.ui.menu.global.watermark_color:get_color();
            local l_r_1 = v483.r;
            local l_g_1 = v483.g;
            local l_b_1 = v483.b;
            local l_a_1 = v483.a;
            if v471.ui.menu.global.watermark_style:get() == "Custom" then
                if v471.ui.menu.global.watermark_gradient:get() == 2 then
                    render.text(v471.ui.menu.global.watermark_font:get(), l_watermark_3.pos, color(255, 255, 255, 255 * l_watermark_3.alpha), v476, v471.helpers:gradienttext(globals.curtime, v475, l_r_1, l_g_1, l_b_1, l_a_1, 255, 255, 255, 255, v471.ui.menu.global.watermark_speed:get()));
                else
                    render.text(v471.ui.menu.global.watermark_font:get(), l_watermark_3.pos, color(l_r_1, l_g_1, l_b_1, l_a_1 * l_watermark_3.alpha), v476, v475);
                end;
            elseif v471.ui.menu.global.watermark_style:get() == "Gingersense" then
                render.text(1, l_watermark_3.pos, color(222, 107, 62, 205 * l_watermark_3.alpha), v476, "G I N G E R " .. v471.helpers:gradienttext(globals.curtime, "S E N S E", l_r_1, l_g_1, l_b_1, l_a_1, 112, 112, 112, 205, 1) .. " \ac44545ff[LIVE]");
            else
                render.text(3, l_watermark_3.pos, color(l_r_1, l_g_1, l_b_1, l_a_1 * l_watermark_3.alpha), v476, "GINGER" .. v471.helpers:gradienttext(globals.curtime, "SENSE", 205, 205, 205, 205, 112, 112, 112, 205, 1) .. " \ac44545ff[LIVE]");
            end;
            if l_watermark_3.dragging or ui.get_alpha() > 0 then
                render.rect_outline(l_watermark_3.pos - vector(l_watermark_3.size.x / 2, l_watermark_3.size.y / 2), l_watermark_3.pos + vector(l_watermark_3.size.x / 2, l_watermark_3.size.y / 2), color(200, 200, 200, 100 * l_watermark_3.alpha), 1, 4);
                if l_watermark_3.dragging then
                    for _, v489 in pairs(v477) do
                        local v490 = (l_watermark_3.pos - v489):length() < l_watermark_3.snap_threshold and color(100, 255, 100, 150) or color(200, 200, 200, 50);
                        render.rect_outline(v489 - vector(l_watermark_3.size.x / 2, l_watermark_3.size.y / 2), v489 + vector(l_watermark_3.size.x / 2, l_watermark_3.size.y / 2), v490, 1, 4);
                    end;
                end;
            end;
            return;
        end;
    end, 
    setup = function(v491)
        v491.windows.watermark.size = v491:get_watermark_size();
        v491:load_watermark_position();
    end
}):struct("hitmarker")({
    duration = 0, 
    draw = function(v492)
        if not globals.is_in_game or v492.duration <= 0 or v492.ui.menu.vis.hit_marker:get() == false then
            return;
        else
            local v493 = 1;
            if v492.duration < 0.25 then
                v493 = v492.duration * 4;
            end;
            local v494 = v492.ui.menu.vis.hit_marker:get_color();
            local v495 = render.screen_size() * 0.5;
            local v496 = 10;
            local v497 = 5;
            render.line(vector(v495.x - v496, v495.y - v496), vector(v495.x - v497, v495.y - v497), color(v494.r, v494.g, v494.b, v494.a * v493));
            render.line(vector(v495.x + v496, v495.y - v496), vector(v495.x + v497, v495.y - v497), color(v494.r, v494.g, v494.b, v494.a * v493));
            render.line(vector(v495.x + v496, v495.y + v496), vector(v495.x + v497, v495.y + v497), color(v494.r, v494.g, v494.b, v494.a * v493));
            render.line(vector(v495.x - v496, v495.y + v496), vector(v495.x - v497, v495.y + v497), color(v494.r, v494.g, v494.b, v494.a * v493));
            v492.duration = math.max(v492.duration - globals.frametime, 0);
            return;
        end;
    end, 
    process_hurt_event = function(v498, v499)
        local v500 = entity.get_local_player();
        local v501 = entity.get(v499.userid, true);
        local v502 = entity.get(v499.attacker, true);
        if v501 == v500 or v502 ~= v500 then
            return;
        else
            v498.duration = 0.5;
            return;
        end;
    end
}):struct("misc")({
    ladder_status = false, 
    current_tick = 0, 
    freezetime_fakeduck = function(v503, v504)
        local l_m_bFreezePeriod_0 = entity.get_game_rules().m_bFreezePeriod;
        if entity.get_local_player() == nil then
            return;
        else
            if l_m_bFreezePeriod_0 and v503.ref.rage.fd:get() and v503.ui.menu.misc.freezetime_fakeduck:get() then
                if v503.ref.rage.dt:get() then
                    v503.ref.rage.dt:override(false);
                else
                    v503.ref.rage.dt:override();
                end;
                if v503.ref.rage.hs:get() then
                    v503.ref.rage.hs:override(false);
                else
                    v503.ref.rage.hs:override();
                end;
                if globals.choked_commands >= 7 then
                    v504.send_packet = false;
                    v504.in_duck = true;
                else
                    v504.send_packet = false;
                    v504.in_duck = false;
                end;
            else
                v503.ref.rage.hs:override();
                v503.ref.rage.dt:override();
            end;
            return;
        end;
    end, 
    trace_fall = function(_, v507, v508)
        local v509 = math.pi * 2;
        local v510 = v509 / 8;
        if entity.get_local_player() ~= nil then
            local v511 = entity.get_local_player():get_origin();
            for v512 = 0, v509, v510 do
                local v513 = math.sin(v512);
                local v514 = math.cos(v512);
                local v515 = v511.x + v514 * 10;
                local v516 = v511.y + v513 * 10;
                local v517 = vector(v515, v516, v511.z);
                local v518 = v517:clone();
                v518.z = v518.z - v508;
                if utils.trace_line(v517, v518, v507).fraction ~= 1 then
                    return true;
                end;
            end;
        end;
        return false;
    end, 
    no_fall_damage = function(v519, v520)
        local v521 = entity.get_local_player();
        if v519.ui.menu.misc.no_fall:get() then
            if v521 == nil then
                return;
            elseif v521.m_vecVelocity.z >= -500 then
                state = false;
                return;
            else
                if v519:trace_fall(v521, 15) then
                    state = false;
                elseif v519:trace_fall(v521, 75) then
                    state = true;
                end;
                v520.in_duck = state;
            end;
        end;
    end, 
    unlock_fakeduck_speed = function(v522, v523)
        if not v522.ui.menu.misc.unlock_fakeduck_speed:get() then
            return;
        elseif v522.ref.rage.fd:get() == false then
            return;
        else
            local v524 = entity.get_local_player();
            if v524 == nil then
                return;
            else
                local v525 = vector(v523.forwardmove, v523.sidemove);
                v525:normalize();
                if math.abs(v524.m_vecVelocity.y) > 10 then
                    local v526 = 150;
                    v523.forwardmove = v525.x * v526;
                    v523.sidemove = v525.y * v526;
                end;
                return;
            end;
        end;
    end, 
    animations = function(v527)
        -- upvalues: l_lambotruck_0 (ref)
        local v528 = entity.get_local_player();
        if v528 == nil then
            return;
        else
            v528.m_flPoseParameter[6] = v527.ui.menu.vis.animations_fall_amount:get() / 100;
            v528.m_flPoseParameter[0] = v527.ui.menu.vis.animations_slide_amount:get() / 40;
            if v527.ui.menu.vis.jitter_legs:get() then
                v528.m_flPoseParameter[0] = globals.tickcount % math.random(4, 16) >= 2 and v527.ui.menu.vis.jitter_legs_from:get() or v527.ui.menu.vis.jitter_legs_to:get() * 3 / (globals.tickcount % 8 >= 1 and 400 or 100);
                v527.ref.antiaim.legs:override(math.random(0, 7) == 0 and "walking" or "sliding");
            else
                v527.ref.antiaim.legs:override();
            end;
            l_lambotruck_0.animation.overlay(v528[0], 12).m_flWeight = v527.ui.menu.vis.animations_lean_amount:get() / 100;
            return;
        end;
    end, 
    fake_latency = function(v529, _)
        local v531 = entity.get_local_player();
        local l_sv_maxunlag_0 = cvar.sv_maxunlag;
        local l_ping_0 = v529.ref.rage.ping;
        local v534 = v529.ui.menu.misc.extended_ping_amount:get();
        if v534 > 100 then
            if v531 == nil then
                return;
            else
                l_ping_0:override(v534);
                l_sv_maxunlag_0:float(0.4, true);
            end;
        else
            l_ping_0:override(v534);
            l_sv_maxunlag_0:float(0.2, true);
        end;
    end, 
    fast_ladder = function(v535, v536)
        local v537 = entity.get_local_player();
        if (v537.m_MoveType == 9 and common.is_button_down(87) or v535.misc.ladder_status) and v535.ui.menu.misc.fast_ladder:get() then
            v536.view_angles.y = math.floor(v536.view_angles.y + 0.5);
            v536.roll = 0;
            if v536.view_angles.x < 45 then
                v536.view_angles.x = 89;
                v536.in_moveright = 1;
                v536.in_moveleft = 0;
                v536.in_forward = 0;
                v536.in_back = 1;
                if v536.sidemove == 0 then
                    v536.view_angles.y = v536.view_angles.y + 90;
                elseif v536.sidemove < 0 then
                    v536.view_angles.y = v536.view_angles.y + 150;
                elseif v536.sidemove > 0 then
                    v536.view_angles.y = v536.view_angles.y + 30;
                end;
            end;
        elseif (v537.m_MoveType == 9 and common.is_button_down(83) or v535.misc.ladder_status) and v535.ui.menu.misc.fast_ladder:get() then
            v536.view_angles.y = math.floor(v536.view_angles.y + 0.5);
            v536.roll = 0;
            if v536.view_angles.x < 45 then
                v536.view_angles.x = 89;
                v536.in_moveright = 0;
                v536.in_moveleft = 1;
                v536.in_forward = 1;
                v536.in_back = 0;
                if v536.sidemove == 0 then
                    v536.view_angles.y = v536.view_angles.y + 90;
                elseif v536.sidemove < 0 then
                    v536.view_angles.y = v536.view_angles.y + 150;
                elseif v536.sidemove > 0 then
                    v536.view_angles.y = v536.view_angles.y + 30;
                end;
            end;
        end;
    end
}):struct("killsay")({
    words = {
        [1] = "I have got only lucky twice or something but you was so fucking fat and lucky", 
        [2] = "What is blud yapping about", 
        [3] = "shut up random", 
        [4] = "U are my weak parvo puppy do not speak up", 
        [5] = "dont speka", 
        [6] = "YOU ARE AN BOT DONT FORGET", 
        [7] = "ben1m you have an ego for absolutely nothing its so funny", 
        [8] = "u all guys are so bed pls no talk", 
        [9] = "you talk like youre the best player its hilarious", 
        [10] = "What kind of ego do you have to try to even speak to thy Swedish goddess kind sir", 
        [11] = "wypierdalaj", 
        [12] = "vanino x xalegioner", 
        [13] = "im 80 and i cant do nothink on boiler", 
        [14] = "@what. that\226\128\153s ur girls fucking nolifer", 
        [15] = "Idc I\226\128\153m Russian in god and I\226\128\153m king \240\159\145\145 and I\226\128\153m imperator and alah bless me@", 
        [16] = "We all know that youre a faggot with a virgin mustache like a cockroach", 
        [17] = "10 cent and I say you", 
        [18] = "Why say my name? Little fanboy with dick in ass", 
        [19] = "u think i record against 20 wr bots?", 
        [20] = "boring talk w loser", 
        [21] = "ur mother pornostar", 
        [22] = "only slime betwen legs my gf", 
        [23] = "stop talking vicos undercover", 
        [24] = "and we still remember about ur dick size", 
        [25] = "you forgot how kacperek made u on hvh", 
        [26] = "I win you 192838373 time on bank 1v1 2v2 and u win once when I troll or play W lay", 
        [27] = "Even vanino better than you", 
        [28] = "But this polish faggot don\226\128\153t know how play ice", 
        [29] = "Random off.", 
        [30] = "Better go mute this yapper", 
        [31] = "My tmt wasnt on map and you won 3 rounds t site", 
        [32] = "I never lost vs tony some disabled 10wr retard", 
        [33] = "RIGHT NOW RANDOMS CRYING TO KING GG", 
        [34] = "u buy a maybach gls600 w ur dads pension and flex it online for a year ofc", 
        [35] = "Can u send neon some dickpics? Hes afraid to ask", 
        [36] = "wisper shortdust is my home stop calling my phone", 
        [37] = "nubbers can u buy my knonfnig", 
        [38] = "ur grinding 1v1s im not even playing thjem", 
        [39] = "u aint ready to finger anyone go practice on your dog a lil bit more", 
        [40] = "U okay ahh dog \240\159\152\173\240\159\146\128", 
        [41] = "WHAT IS THIS RANDY DOING?", 
        [42] = "anybody knows the new fraud method w paypal aged accs?", 
        [43] = "ye u guys will see in 1 month ill be winning 1v1 tourneys", 
        [44] = "add turkish server or i fuck ur family", 
        [45] = "can u do the skibidi dop dop dop dance on stream", 
        [46] = "30wr you realise you would never win me if i didnt play with laen right", 
        [47] = "i move like prime krejz w this fig", 
        [48] = "i would smash you in to the ground considering ur a faggot aswell", 
        [49] = "i hit u in the head with a rock u peasant", 
        [50] = "swear to god if i would come to finland i would take the charge and kidnap you and crack ur skull open", 
        [51] = "rip he took 5 dicks in the ass at once", 
        [52] = "your mom makes no more than 500$ a month", 
        [53] = "you're proving again that ure 20iq romanian pig"
    }, 
    death_words = {
        [1] = "HOW I MISS SO MUCH????", 
        [2] = "20wr retard vs me", 
        [3] = "wp 30wr ape", 
        [4] = "stop going maps that u dont know 30wr", 
        [5] = "wp pooron", 
        [6] = "ur gonna be 30wr forever", 
        [7] = "stop queueing 20wr whore", 
        [8] = "20wr forever", 
        [9] = "try to get in a tourney challenge", 
        [10] = "ugly 20wr sniping me", 
        [11] = "20wr ape get more lucky", 
        [12] = "wp luckbased ape", 
        [13] = "ugly 30wr ape", 
        [14] = "bro you are 20wr", 
        [15] = "20wr ape go leave hvh", 
        [16] = "retarded pooron stop playing this game", 
        [17] = "fucking 20wr slave gtfo", 
        [18] = "chill out buddy u are 30wr", 
        [19] = "0iq ape kys", 
        [20] = "wp 1000-1 for me", 
        [21] = "\195\177!r8", 
        [22] = "\195\167!deagle", 
        [23] = "\196\177/deagle", 
        [24] = "\197\159!deagle"
    }, 
    trashtalk = function(v538, v539)
        local v540 = entity.get_local_player();
        if v538.helpers:contains(v538.ui.menu.misc.trashtalk_states:get(), "Kill") then
            if v539.userid == v539.attacker then
                return;
            elseif v540 == entity.get(v539.attacker, true) then
                utils.execute_after(math.random(0, 0), function()
                    -- upvalues: v538 (ref)
                    utils.console_exec("say \"" .. v538.words[math.random(1, #v538.words)] .. "\"");
                end);
            end;
        end;
    end, 
    death_say = function(v541, v542)
        local v543 = entity.get_local_player();
        if v541.helpers:contains(v541.ui.menu.misc.trashtalk_states:get(), "Death") and entity.get(v542.userid, true) == v543 then
            utils.execute_after(math.random(0, 0), function()
                -- upvalues: v541 (ref)
                utils.console_exec("say \"" .. v541.death_words[math.random(1, #v541.death_words)] .. "\"");
            end);
        end;
    end
}):struct("hitlogs")({
    hitgroup_str = {
        [0] = "generic", 
        [1] = "head", 
        [2] = "chest", 
        [3] = "stomach", 
        [4] = "left arm", 
        [5] = "right arm", 
        [6] = "left leg", 
        [7] = "right leg", 
        [8] = "neck", 
        [9] = "generic", 
        [10] = "gear"
    }, 
    main = function(v544, v545)
        local _ = entity.get_local_player();
        local v547 = entity.get(v545.target);
        local l_damage_0 = v545.damage;
        local l_wanted_damage_0 = v545.wanted_damage;
        local v550 = v544.hitgroup_str[v545.wanted_hitgroup];
        local l_hitchance_0 = v545.hitchance;
        local l_state_0 = v545.state;
        local l_backtrack_0 = v545.backtrack;
        local v554 = v545.spread or 0;
        if not v547 then
            return;
        else
            local l_m_iHealth_0 = v547.m_iHealth;
            local v556 = v544.hitgroup_str[v545.hitgroup];
            local v557 = v544.ui.menu.misc.hitlog_color:get_color():to_hex();
            local v558 = "d65151ff";
            if v544.helpers:contains(v544.ui.menu.misc.hitlog_options:get(), "Shots") then
                if l_state_0 == nil then
                    local v559 = string.format("\a9994ffff" .. ui.get_icon("crosshairs") .. "\affffffff | Hit \a9994ffff%s\affffffff in the \a9994ffff%s\affffffff for \a9994ffff%d\affffffff(%.f) damage (hp: \a9994ffff%d\affffffff) (bt: \a9994ffff%s\affffffff)", v547:get_name(), v556, l_damage_0, l_wanted_damage_0, l_m_iHealth_0, l_backtrack_0);
                    if v544.helpers:contains(v544.ui.menu.misc.hitlogs:get(), "On screen") then
                        print_dev(("\affffffff\a" .. v557 .. v544.ui.menu.global.log_prefix:get() .. "\affffffff Hit \a" .. v557 .. "%s\affffffff's \a" .. v557 .. "%s\affffffff for \a" .. v557 .. "%d\affffffff(%.f) damage (hp: %d) (bt: \a" .. v557 .. "%s\affffffff) (spread: \a" .. v557 .. "%.2f\194\176\affffffff)"):format(v547:get_name(), v556, l_damage_0, l_wanted_damage_0, l_m_iHealth_0, l_backtrack_0, v554));
                    end;
                    if v544.helpers:contains(v544.ui.menu.misc.hitlogs:get(), "Console") then
                        print_raw(("\affffffff\a" .. v557 .. v544.ui.menu.global.log_prefix:get() .. "\affffffff Hit \a" .. v557 .. "%s\affffffff's \a" .. v557 .. "%s\affffffff for \a" .. v557 .. "%d\affffffff(%.f) damage (hp: %d) (bt: \a" .. v557 .. "%s\affffffff) (spread: \a" .. v557 .. "%.2f\194\176\affffffff)"):format(v547:get_name(), v556, l_damage_0, l_wanted_damage_0, l_m_iHealth_0, l_backtrack_0, v554));
                    end;
                    if v544.helpers:contains(v544.ui.menu.misc.hitlogs:get(), "Center screen") then
                        v544.helpers:add_notification(v559);
                    end;
                else
                    local v560 = string.format("\aff9494ff" .. ui.get_icon("circle-xmark") .. "\affffffff | Missed \aff9494ff%s\affffffff in the \aff9494ff%s\affffffff due to \aff9494ff%s\affffffff (hc: \aff9494ff%.f\affffffff) (damage: \aff9494ff%.f\affffffff) (bt: \aff9494ff%.f\affffffff)", v547:get_name(), v550, l_state_0, l_hitchance_0, l_wanted_damage_0, l_backtrack_0);
                    if v544.helpers:contains(v544.ui.menu.misc.hitlogs:get(), "On screen") then
                        print_dev(("\affffffff\a" .. v558 .. v544.ui.menu.global.log_prefix:get() .. "\affffffff Missed \a" .. v558 .. "%s\affffffff's \a" .. v558 .. "%s\affffffff due to \a" .. v558 .. "%s\affffffff (hc: \a" .. v558 .. "%.f\affffffff) (damage: \a" .. v558 .. "%.f\affffffff) (bt: \a" .. v558 .. "%.f\affffffff) (spread: \a" .. v558 .. "%.2f\194\176\affffffff)"):format(v547:get_name(), v550, l_state_0, l_hitchance_0, l_wanted_damage_0, l_backtrack_0, v554));
                    end;
                    if v544.helpers:contains(v544.ui.menu.misc.hitlogs:get(), "Console") then
                        print_raw(("\affffffff\a" .. v558 .. v544.ui.menu.global.log_prefix:get() .. "\affffffff Missed \a" .. v558 .. "%s\affffffff's \a" .. v558 .. "%s\affffffff due to \a" .. v558 .. "%s\affffffff (hc: \a" .. v558 .. "%.f\affffffff) (damage: \a" .. v558 .. "%.f\affffffff) (bt: \a" .. v558 .. "%.f\affffffff) (spread: \a" .. v558 .. "%.2f\194\176\affffffff)"):format(v547:get_name(), v550, l_state_0, l_hitchance_0, l_wanted_damage_0, l_backtrack_0, v554));
                    end;
                    if v544.helpers:contains(v544.ui.menu.misc.hitlogs:get(), "Center screen") then
                        v544.helpers:add_notification(v560);
                    end;
                end;
            end;
            return;
        end;
    end, 
    on_grenades = function(v561, v562)
        local v563 = entity.get(v562.userid, true);
        local v564 = entity.get_local_player();
        if v564 == nil then
            return;
        elseif not v563:is_enemy() then
            return;
        else
            local v565 = entity.get(v562.attacker, true);
            local v566 = v561.ui.menu.misc.hitlog_color:get_color():to_hex();
            if v561.helpers:contains(v561.ui.menu.misc.hitlog_options:get(), "Nades") and v565 == v564 then
                if v562.weapon == "hegrenade" then
                    if v561.helpers:contains(v561.ui.menu.misc.hitlogs:get(), "On screen") then
                        print_dev(("\affffffff\a" .. v566 .. v561.ui.menu.global.log_prefix:get() .. "\affffffff Naded \a" .. v566 .. "%s\affffffff (hp: \a" .. v566 .. "%d\affffffff)\a" .. v566 .. "\affffffff for damage\a" .. v566 .. " %s"):format(v563:get_name(), v562.health, v562.dmg_health));
                    end;
                    if v561.helpers:contains(v561.ui.menu.misc.hitlogs:get(), "Console") then
                        print_raw(("\affffffff\a" .. v566 .. v561.ui.menu.global.log_prefix:get() .. "\affffffff Naded \a" .. v566 .. "%s\affffffff (hp: \a" .. v566 .. "%d\affffffff)\a" .. v566 .. "\affffffff for damage\a" .. v566 .. " %s"):format(v563:get_name(), v562.health, v562.dmg_health));
                    end;
                elseif v562.weapon == "inferno" then
                    if v561.helpers:contains(v561.ui.menu.misc.hitlogs:get(), "On screen") then
                        print_dev(("\affffffff\a" .. v566 .. v561.ui.menu.global.log_prefix:get() .. "\affffffff Burned \a" .. v566 .. "%s\affffffff (hp: \a" .. v566 .. "%d\affffffff)\a" .. v566 .. "\affffffff for damage\a" .. v566 .. " %s"):format(v563:get_name(), v562.health, v562.dmg_health));
                    end;
                    if v561.helpers:contains(v561.ui.menu.misc.hitlogs:get(), "Console") then
                        print_raw(("\affffffff\a" .. v566 .. v561.ui.menu.global.log_prefix:get() .. "\affffffff Burned \a" .. v566 .. "%s\affffffff (hp: \a" .. v566 .. "%d\affffffff)\a" .. v566 .. "\affffffff for damage\a" .. v566 .. " %s"):format(v563:get_name(), v562.health, v562.dmg_health));
                    end;
                end;
            end;
            return;
        end;
    end, 
}):struct("cross_marker")({
    markers = {}, 
    draw_marker = function(_, v574, v575, v576, v577, v578)
        local v579 = render.world_to_screen(v574);
        if not v579 then
            return;
        else
            local v580 = v577 * 0.5;
            local v581 = v576 + v580;
            local v582 = vector(v579.x - v580, v579.y - v581);
            local v583 = vector(v579.x + v580, v579.y + v581);
            local v584 = vector(v579.x - v581, v579.y - v580);
            local v585 = vector(v579.x + v581, v579.y + v580);
            local v586 = v575.Vertical:clone();
            local v587 = v575.Horizontal:clone();
            v586.a = v586.a * v578;
            v587.a = v587.a * v578;
            render.rect(v582, v583, v586);
            render.rect(v584, v585, v587);
            return;
        end;
    end, 
    update_markers = function(v588)
        local l_realtime_1 = globals.realtime;
        for v590 = #v588.markers, 1, -1 do
            if v588.markers[v590].expire_time < l_realtime_1 then
                table.remove(v588.markers, v590);
            end;
        end;
    end, 
    render = function(v591)
        if not globals.is_in_game or not v591.ui.menu.vis.kibit_marker:get() then
            return;
        else
            local v592 = {
                thickness = 2, 
                size = 4, 
                colors = {
                    Vertical = color(0, 255, 0, 255), 
                    Horizontal = color(0, 255, 255, 255)
                }
            };
            v591:update_markers();
            for _, v594 in ipairs(v591.markers) do
                local v595 = v594.expire_time - globals.realtime;
                local v596 = v595 < 0.7 and v595 / 0.7 or 1;
                v591:draw_marker(v594.position, v592.colors, v592.size, v592.thickness, v596);
            end;
            return;
        end;
    end, 
    add_marker = function(v597, v598)
        table.insert(v597.markers, {
            position = v598.aim, 
            expire_time = globals.realtime + 3
        });
    end, 
    clear_markers = function(v599)
        v599.markers = {};
    end
}):struct("skeetinds")({
    lookup = {}, 
    update = function(v600)
        local v601 = ui.get_binds();
        for v602 in pairs(v600.lookup) do
            v600.lookup[v602] = nil;
        end;
        for v603 = 1, #v601 do
            local v604 = v601[v603];
            local v605 = v604.reference:id();
            v600.lookup[v605] = v604;
        end;
    end, 
    get = function(v606, v607)
        if v607 == nil then
            return nil;
        else
            return v606.lookup[v607:id()];
        end;
    end, 
    setup = function(v608)
        v608.font = render.load_font("C:\\Windows\\Fonts\\calibrib.ttf", vector(25, 23.5, 0), "a");
        v608.bomb_icon = render.load_image_from_file("materials\\panorama\\images\\icons\\ui\\bomb_c4.svg", vector(32, 32));
        v608.draw_queue = {};
    end, 
    clear_queue = function(v609)
        for v610 = 1, #v609.draw_queue do
            v609.draw_queue[v610] = nil;
        end;
    end, 
    add_indicator = function(v611, v612, v613, v614, v615)
        local v616 = render.measure_text(v611.font, nil, v613);
        local v617 = render.screen_size();
        v616.y = v616.y + 8;
        local v618 = next(v611.draw_queue) == nil and v617.y - (v617.y - 380) / 2 or v611.draw_queue[#v611.draw_queue].offset - 8 - v616.y;
        table.insert(v611.draw_queue, {
            text = v613, 
            color = v612, 
            offset = v618, 
            text_size = v616, 
            progress = v614, 
            icon = v615
        });
    end, 
    draw_shadow = function(_, v620, v621)
        local v622 = (v620 + v621) / 2;
        local v623 = color(0, 0, 0, 0);
        local v624 = color(0, 0, 0, 50);
        render.gradient(v620, vector(v622.x, v621.y), v623, v624, v623, v624);
        render.gradient(v621, vector(v622.x, v620.y), v623, v624, v623, v624);
    end, 
    draw_indicators = function(v625)
        for v626 = 1, #v625.draw_queue do
            local v627 = v625.draw_queue[v626];
            local v628 = vector(3, v627.offset);
            local v629 = v628 + vector(24, 4);
            v625:draw_shadow(v628, v628 + v627.text_size + vector(50, 0));
            if v627.icon then
                render.texture(v625.bomb_icon, v628 + vector(24, (v627.text_size.y - 29) / 2), vector(32, 29), v627.color);
                v629.x = v629.x + 37;
            end;
            render.text(v625.font, v629, v627.color, nil, v627.text);
            if v627.progress then
                local v630 = v629 + vector(v627.text_size.x + 15, v627.text_size.y / 2 - 5);
                render.circle_outline(v630, color(0, 0, 0, 255), 10, 0, 1, 5);
                render.circle_outline(v630, color(255, 255, 255, 200), 10, 0, v627.progress, 3);
            end;
        end;
    end, 
    update_indicators = function(v631, _)
        local v633 = entity.get_local_player();
        if not v633 or not v633:is_alive() then
            return;
        else
            local v634 = v631:get(v631.ref.rage.dmg);
            local v635 = v631:get(v631.ref.rage.hitchance);
            if v631.ref.rage.dt:get() and not v631.ref.rage.fd:get() then
                v631:add_indicator(rage.exploit:get() == 1 and color(255, 255, 255, 200) or color(255, 0, 50, 200), "DT");
            end;
            if v631.ref.rage.dormant_aimbot:get_override() or v631.ref.rage.dormant_aimbot:get() then
                v631:add_indicator(color(255, 255, 255, 200), "DA");
            end;
            if v631.ref.rage.fd:get() then
                v631:add_indicator(color(255, 255, 255, 200), "DUCK");
            end;
            if v631.ref.rage.safe_point:get() == "Force" then
                v631:add_indicator(color(255, 255, 255, 200), "SAFE");
            end;
            if v631.ref.rage.fb:get() == "Force" then
                v631:add_indicator(color(255, 255, 255, 200), "BAIM");
            end;
            if v634 ~= nil and v634.active then
                v631:add_indicator(color(255, 255, 255, 200), "DMG");
            end;
            if v635 ~= nil and v635.active then
                v631:add_indicator(color(255, 255, 255, 200), "H1TCHANCE");
            end;
            if v631.ref.rage.hs:get() and not v631.ref.rage.fd:get() and not v631.ref.rage.dt:get() then
                v631:add_indicator(color(255, 255, 255, 200), "OSAA");
            end;
            if v631.ref.antiaim.freestanding:get() or v631.ref.antiaim.freestanding:get_override() then
                v631:add_indicator(color(255, 255, 255, 200), "FS");
            end;
            if v631.ref.rage.ping:get() > 0 or v631.ref.rage.ping:get_override() then
                local v636 = utils.net_channel();
                if v636 then
                    local v637 = math.clamp(v636.latency[0] + v636.latency[1], 0.001, 0.2);
                    local v638 = math.clamp(v631.ref.rage.ping:get() * 0.001 + v636.avg_latency[1], 0.001, 0.2);
                    local v639 = math.clamp(v637 / v638, 0, 1);
                    v631:add_indicator(v639 < 0.5 and color(250, 234, 232):lerp(color(213, 197, 84), v639 * 2) or color(213, 197, 84):lerp(color(143, 194, 21), (v639 - 0.5) * 2), "PING");
                end;
            end;
            local v640 = entity.get_game_rules();
            if v640 and v640.m_bBombPlanted then
                local v641 = entity.get_entities("CPlantedC4")[1];
                if v641 and v641.m_bBombTicking and not v641.m_bBombDefused then
                    local v642 = v641.m_flC4Blow - globals.curtime;
                    if v642 > 0 then
                        v631:add_indicator(color(255, 255, 255, 200), string.format("%s - %.1fs", v641.m_nBombSite == 1 and "B" or "A", v642), nil, true);
                    end;
                end;
            end;
            return;
        end;
    end, 
    on_paint = function(v643, v644)
        if not globals.is_in_game or not v643.ui.menu.vis.gingerindicators:get() then
            return;
        else
            v643:clear_queue();
            v643:update_indicators(v644);
            v643:draw_indicators();
            return;
        end;
    end
}):struct("lagcomp")({
    max_tickbase = 0, 
    defensive_ticks = 0, 
    sv_gravity = cvar.sv_gravity, 
    sv_jump_impulse = cvar.sv_jump_impulse, 
    sim_ticks = {}, 
    net_data = {}, 
    esp_data = {}, 
    backtrack_data = {}, 
    last_valid_positions = {}, 
    extrapolate = function(v645, v646, v647, v648)
        local l_tickinterval_0 = globals.tickinterval;
        local v650 = v645.sv_gravity:float() * l_tickinterval_0;
        local v651 = v645.sv_jump_impulse:float() * l_tickinterval_0;
        local l_v647_0 = v647;
        local l_v647_1 = v647;
        local l_m_vecVelocity_0 = v646.m_vecVelocity;
        local v655 = l_m_vecVelocity_0.z > 0 and -v650 or v651;
        for _ = 1, v648 do
            l_v647_1 = l_v647_0;
            l_v647_0 = vector(l_v647_0.x + l_m_vecVelocity_0.x * l_tickinterval_0, l_v647_0.y + l_m_vecVelocity_0.y * l_tickinterval_0, l_v647_0.z + (l_m_vecVelocity_0.z + v655) * l_tickinterval_0);
            if utils.trace_line(l_v647_1, l_v647_0).fraction <= 0.99 then
                return l_v647_1;
            end;
        end;
        return l_v647_0;
    end, 
    get_players = function(_, v658)
        local l_m_iObserverMode_0 = v658.m_iObserverMode;
        if l_m_iObserverMode_0 == 0 or l_m_iObserverMode_0 == 1 or l_m_iObserverMode_0 == 2 or l_m_iObserverMode_0 == 6 then
            return entity.get_players(true, true);
        else
            local v660 = {};
            if l_m_iObserverMode_0 == 4 or l_m_iObserverMode_0 == 5 then
                local l_m_iTeamNum_0 = v658.m_hObserverTarget.m_iTeamNum;
                for _, v663 in pairs(entity.get_player(false, true)) do
                    if v663 ~= v658 and v663.m_iTeamNum ~= l_m_iTeamNum_0 then
                        table.insert(v660, v663);
                    end;
                end;
            end;
            return v660;
        end;
    end, 
    update_tickbase = function(v664, _)
        local v666 = entity.get_local_player();
        if not v666 then
            return;
        else
            local l_m_nTickBase_1 = v666.m_nTickBase;
            if math.abs(l_m_nTickBase_1 - v664.max_tickbase) > 64 then
                v664.max_tickbase = 0;
            end;
            if v664.max_tickbase < l_m_nTickBase_1 then
                v664.max_tickbase = l_m_nTickBase_1;
                v664.defensive_ticks = 0;
            elseif l_m_nTickBase_1 < v664.max_tickbase then
                v664.defensive_ticks = math.min(14, math.max(0, v664.max_tickbase - l_m_nTickBase_1 - 1));
            end;
            return;
        end;
    end, 
    draw = function(v668)
        local v669 = color(64, 139, 237, 200);
        local v670 = color(255, 40, 0, 200);
        local v671 = entity.get_local_player();
        if not v671 or not v671:is_alive() then
            return;
        elseif #v668:get_players(v671) == 0 then
            return;
        else
            for v672, v673 in pairs(v668.net_data) do
                local v674 = entity.get(v672);
                if v674 and v674:is_alive() and v674:is_enemy() then
                    if v673.lagcomp or v673.tickbase then
                        local l_predicted_origin_0 = v673.predicted_origin;
                        if v673.tickbase and v668.last_valid_positions[v672] then
                            l_predicted_origin_0 = v668.last_valid_positions[v672];
                        end;
                        local v676 = l_predicted_origin_0 + v674.m_vecMins;
                        local v677 = l_predicted_origin_0 + v674.m_vecMaxs;
                        local v678 = {
                            vector(v676.x, v676.y, v676.z), 
                            vector(v676.x, v677.y, v676.z), 
                            vector(v677.x, v677.y, v676.z), 
                            vector(v677.x, v676.y, v676.z), 
                            vector(v676.x, v676.y, v677.z), 
                            vector(v676.x, v677.y, v677.z), 
                            vector(v677.x, v677.y, v677.z), 
                            vector(v677.x, v676.y, v677.z)
                        };
                        local v679 = {
                            [1] = {
                                [1] = 0, 
                                [2] = 1
                            }, 
                            [2] = {
                                [1] = 1, 
                                [2] = 2
                            }, 
                            [3] = {
                                [1] = 2, 
                                [2] = 3
                            }, 
                            [4] = {
                                [1] = 3, 
                                [2] = 0
                            }, 
                            [5] = {
                                [1] = 5, 
                                [2] = 6
                            }, 
                            [6] = {
                                [1] = 6, 
                                [2] = 7
                            }, 
                            [7] = {
                                [1] = 1, 
                                [2] = 4
                            }, 
                            [8] = {
                                [1] = 4, 
                                [2] = 8
                            }, 
                            [9] = {
                                [1] = 0, 
                                [2] = 4
                            }, 
                            [10] = {
                                [1] = 1, 
                                [2] = 5
                            }, 
                            [11] = {
                                [1] = 2, 
                                [2] = 6
                            }, 
                            [12] = {
                                [1] = 3, 
                                [2] = 7
                            }, 
                            [13] = {
                                [1] = 5, 
                                [2] = 8
                            }, 
                            [14] = {
                                [1] = 7, 
                                [2] = 8
                            }, 
                            [15] = {
                                [1] = 3, 
                                [2] = 4
                            }
                        };
                        for v680, v681 in ipairs(v679) do
                            if v680 == 1 then
                                local v682 = v674:get_origin();
                                local v683 = render.world_to_screen(v676);
                                local v684 = render.world_to_screen(v682);
                                if v683 and v684 then
                                    render.line(v683, v684, v669);
                                end;
                            end;
                            local v685 = v678[v681[1]];
                            local v686 = v678[v681[2]];
                            if v685 and v686 then
                                local v687 = render.world_to_screen(v685);
                                local v688 = render.world_to_screen(v686);
                                if v687 and v688 then
                                    render.line(v687, v688, v669);
                                end;
                            end;
                        end;
                    end;
                    local v689 = v674:get_bbox();
                    if v689 and v689.pos1 and v689.pos2 and v689.alpha then
                        local v690 = 0;
                        if v668.esp_data[v672] > 0 then
                            v668.esp_data[v672] = v668.esp_data[v672] - globals.frametime * 2;
                            v668.esp_data[v672] = v668.esp_data[v672] < 0 and 0 or v668.esp_data[v672];
                            v690 = v668.esp_data[v672];
                        end;
                        local v691 = v673.tickbase or v668.esp_data[v672] > 0;
                        local l_lagcomp_0 = v673.lagcomp;
                        if not v691 or v673.lagcomp then
                            v690 = v689.alpha;
                        end;
                        local v693 = {
                            [0] = "", 
                            [1] = "LAGCOMP BREAKER", 
                            [2] = ui.get_icon("triangle-exclamation") .. " DEFENSIVE"
                        };
                        if v689.alpha > 0 then
                            local v694 = v674:get_name() == "" and -8 or 0;
                            local v695 = v689.pos2.x - v689.pos1.x;
                            local v696 = vector(v689.pos1.x + v695 / 2, v689.pos1.y - 18 + v694);
                            local v697 = v670:clone();
                            v697.a = v697.a * v690;
                            local v698 = v693[v691 and 2 or l_lagcomp_0 and 1 or 0];
                            render.text(1, v696, v697, "c", v698);
                        end;
                    end;
                end;
            end;
            return;
        end;
    end, 
    net_update = function(v699)
        if not entity.get_local_player() then
            return;
        else
            local v700 = entity.get_players(true, true);
            for _, v702 in ipairs(v700) do
                local v703 = v702:get_index();
                local v704 = v699.sim_ticks[v703];
                if v702:is_dormant() or not v702:is_alive() then
                    v699.sim_ticks[v703] = nil;
                    v699.net_data[v703] = nil;
                    v699.esp_data[v703] = nil;
                    v699.backtrack_data[v703] = nil;
                    v699.last_valid_positions[v703] = nil;
                else
                    local l_m_vecOrigin_0 = v702.m_vecOrigin;
                    local v706 = to_ticks(v702.m_flSimulationTime);
                    if not v699.backtrack_data[v703] then
                        v699.backtrack_data[v703] = {};
                    end;
                    table.insert(v699.backtrack_data[v703], 1, {
                        tick = v706, 
                        origin = l_m_vecOrigin_0
                    });
                    if #v699.backtrack_data[v703] > 14 then
                        table.remove(v699.backtrack_data[v703]);
                    end;
                    if v699.defensive_ticks <= 0 then
                        v699.last_valid_positions[v703] = l_m_vecOrigin_0;
                    end;
                    if v704 then
                        local v707 = v706 - v704.tick;
                        if v707 < 0 or v707 > 0 and v707 <= 64 then
                            local v708 = (l_m_vecOrigin_0 - v704.origin):length2dsqr();
                            local v709 = v699.defensive_ticks > 0 and v707 < 0;
                            local l_l_m_vecOrigin_0_0 = l_m_vecOrigin_0;
                            if v709 and v699.last_valid_positions[v703] then
                                l_l_m_vecOrigin_0_0 = v699.last_valid_positions[v703];
                            elseif v707 > 0 then
                                l_l_m_vecOrigin_0_0 = v699:extrapolate(v702, l_m_vecOrigin_0, v707 - 1);
                            end;
                            if v709 then
                                v699.esp_data[v703] = 1;
                            end;
                            v699.net_data[v703] = {
                                tick = v707 - 1, 
                                origin = l_m_vecOrigin_0, 
                                predicted_origin = l_l_m_vecOrigin_0_0, 
                                tickbase = v709, 
                                lagcomp = v708 > 4096
                            };
                        end;
                    end;
                    if not v699.esp_data[v703] then
                        v699.esp_data[v703] = 0;
                    end;
                    v699.sim_ticks[v703] = {
                        tick = v706, 
                        origin = l_m_vecOrigin_0
                    };
                end;
            end;
            return;
        end;
    end
}):struct("console_color")({
    ConsoleIsVisible = utils.get_vfunc("engine.dll", "VEngineClient014", 11, "bool(__thiscall*)(void*)"), 
    material_list = {
        materials.get_materials("vgui_white")[1], 
        materials.get("vgui/hud/800corner1"), 
        materials.get("vgui/hud/800corner2"), 
        materials.get("vgui/hud/800corner3"), 
        materials.get("vgui/hud/800corner4")
    }, 
    update_color = function(v711, v712)
        local v713 = v712.a / 255;
        for v714 = 1, #v711.material_list do
            local v715 = v711.material_list[v714];
            v715:alpha_modulate(v713);
            v715:color_modulate(v712);
        end;
    end, 
    shutdown = function(v716)
        v716:update_color(color(255, 255, 255, 255));
    end, 
    pre_render = function(v717)
        local l_console_color_0 = v717.ui.menu.vis.console_color;
        if not v717.ConsoleIsVisible() then
            v717:update_color(color(255, 255, 255, 255));
        else
            v717:update_color(l_console_color_0:get_color());
        end;
    end, 
    setup = function(v719)
        local l_console_color_1 = v719.ui.menu.vis.console_color;
        local function v721()
            -- upvalues: v719 (ref)
            v719:shutdown();
        end;
        local function v722()
            -- upvalues: v719 (ref)
            v719:pre_render();
        end;
        local _ = nil;
        l_console_color_1:set_callback(function(v724)
            -- upvalues: v719 (ref), v721 (ref), v722 (ref)
            local v725 = v724:get();
            if not v725 then
                v719:update_color(color(255, 255, 255, 255));
            end;
            events.shutdown(v721, v725);
            events.pre_render(v722, v725);
        end, true);
    end
});
for _, v740 in ipairs({
    [1] = {
        [1] = "load", 
        [2] = function()
            -- upvalues: v726 (ref)
            v726.ui:execute();
            v726.config:initialize();
            v726.antiaim:init();
            v726.mindmg:setup();
            v726.console_color:setup();
            v726.skeetinds:setup();
            v726.watermark:setup();
            v726.helpers:add_notification("\ac96826ff\240\159\141\148 \affffffff| Welcome ['\ac96826ff" .. common.get_username() .. "\affffffff'] build \ac96826fflive");
            if v726.ui.menu.global.watermark_text:get() == "" then
                v726.ui.menu.global.watermark_text:set("gingersense");
            end;
            if v726.ui.menu.global.sidebar_text:get() == "" then
                v726.ui.menu.global.sidebar_text:set("gingersense");
            end;
            if v726.ui.menu.global.log_prefix:get() == "" then
                v726.ui.menu.global.log_prefix:set("gingersense");
            end;
        end
    }, 
    [2] = {
        [1] = "post_update_clientside_animation", 
        [2] = function()
            -- upvalues: v726 (ref)
            v726.misc:animations();
        end
    }, 
    [3] = {
        [1] = "aim_ack", 
        [2] = function(v728)
            -- upvalues: v726 (ref)
            v726.hitlogs:main(v728);
            v726.cross_marker:add_marker(v728);
        end
    }, 
    [4] = {
        [1] = "render", 
        [2] = function()
            -- upvalues: v726 (ref)
            v726.skeetinds:update();
            v726.visuals:scope_overlay();
            v726.visuals:aspectratio_viewmodel();
            v726.visuals:net_graph();
            if v726.ui.menu.vis.lagcomp_debug:get() then
                v726.lagcomp:draw();
            end;
            v726.watermark:render_watermark();
            v726.mindmg:render_damage_indicator();
            v726.helpers:render_notifications();
            v726.hitmarker:draw();
            v726.cross_marker:render();
            v726.skeetinds:on_paint();
            if ui.get_alpha() > 0 then
                v726.ui:sidebarname();
            end;
        end
    }, 
    [5] = {
        [1] = "player_death", 
        [2] = function(v729)
            -- upvalues: v726 (ref)
            v726.killsay:trashtalk(v729);
            v726.killsay:death_say(v729);
        end
    }, 
    [6] = {
        [1] = "player_hurt", 
        [2] = function(v730)
            -- upvalues: v726 (ref)
            v726.hitlogs:on_grenades(v730);
            v726.hitmarker:process_hurt_event(v730);
        end
    }, 
    [7] = {
        [1] = "level_init", 
        [2] = function()
            -- upvalues: v726 (ref)
            v726.antiaim.state.defensive_after = false;
            v726.antiaim.state.defensive_after = 0;
            v726.antiaim.state.round_ended = false;
            if v726.helpers:contains(v726.ui.menu.misc.extra_notification_options:get(), "Anti-Bruteforce") then
                v726.helpers:add_notification("\a7583e0ff" .. ui.get_icon("power-off") .. "\affffffff | Anti-Bruteforce resetted due to ['\a7583e0fflevel init\affffffff']");
            end;
            v726.antiaim:reset_antibruteforce();
        end
    }, 
    [8] = {
        [1] = "draw_model", 
        [2] = function(v731)
            -- upvalues: v726 (ref)
            local v732 = entity.get_local_player();
            if not v732 or not v732:is_alive() or not v726.ui.menu.vis.disable_sleeves:get() then
                return;
            else
                return not v731.name:find("sleeve");
            end;
        end
    }, 
    [9] = {
        [1] = "bullet_impact", 
        [2] = function(v733)
            -- upvalues: v726 (ref)
            v726.antiaim:shot_detection(v733);
        end
    }, 
    [10] = {
        [1] = "createmove", 
        [2] = function(v734)
            -- upvalues: v726 (ref)
            v726.ref.rage.dt:override();
            v726.ref.rage.hs:override();
            v726.ref.rage.dt_fakelag:override();
            v726.ref.rage.dtlag:override();
            v726.defensive:on_createmove(v734);
            v726.antiaim:handle_airlag(v734);
            v726.antiaim:run(v734);
            if v726.ui.menu.vis.lagcomp_debug:get() then
                v726.lagcomp:update_tickbase(v734);
            end;
            v726.misc:no_fall_damage(v734);
            v726.misc:freezetime_fakeduck(v734);
            v726.misc:fake_latency(v734);
            v726.misc:fast_ladder(v734);
        end
    }, 
    [11] = {
        [1] = "localplayer_transparency", 
        [2] = function(_)
            -- upvalues: v726 (ref)
            local v736 = entity.get_local_player();
            if not v726.ui.menu.misc.keep_model_transparency:get() then
                return;
            elseif v736 == nil then
                return;
            elseif v736.m_bIsScoped or v736.m_bResumeZoom then
                return 59;
            else
                return;
            end;
        end
    }, 
    [12] = {
        [1] = "createmove_run", 
        [2] = function(v737)
            -- upvalues: v726 (ref)
            v726.misc:unlock_fakeduck_speed(v737);
            local v738 = entity.get_local_player();
            if v738:is_alive() then
                if v738.m_MoveType == 9 and common.is_button_down(87) then
                    v726.misc.ladder_status = true;
                else
                    v726.misc.ladder_status = false;
                end;
            else
                v726.misc.ladder_status = false;
            end;
        end
    }, 
    [13] = {
        [1] = "round_end", 
        [2] = function()
            -- upvalues: v726 (ref)
            v726.antiaim.state.round_ended = true;
            v726.antiaim.state.defensive_after = 0;
            if v726.helpers:contains(v726.ui.menu.misc.extra_notification_options:get(), "Anti-Bruteforce") then
                v726.helpers:add_notification("\a7583e0ff" .. ui.get_icon("power-off") .. "\affffffff | Anti-Bruteforce resetted due to ['\a7583e0ffround end\affffffff']");
            end;
            v726.antiaim:reset_antibruteforce();
        end
    }, 
    [14] = {
        [1] = "net_update_end", 
        [2] = function()
            -- upvalues: v726 (ref)
            if v726.ui.menu.vis.lagcomp_debug:get() then
                v726.lagcomp:net_update();
            end;
        end
    }, 
    [15] = {
        [1] = "round_start", 
        [2] = function()
            -- upvalues: v726 (ref)
            v726.antiaim.state.round_ended = false;
            v726.antiaim.state.defensive_after = 0;
            v726.antiaim:reset_antibruteforce();
        end
    }
}) do
    if v740[1] == "load" then
        v740[2]();
    else
        events[v740[1]]:set(v740[2]);
    end;
end;
common.add_notify("dumped and fixed by zadyma.", "fuck trapsody $$")