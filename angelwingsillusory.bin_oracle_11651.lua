local l_base64_0 = require("neverlose/base64");
local l_clipboard_0 = require("neverlose/clipboard");
local l_get_0 = l_clipboard_0.get;
do
    local l_l_get_0_0 = l_get_0;
    l_clipboard_0.get = function(...)
        -- upvalues: l_l_get_0_0 (ref)
        local v4 = l_l_get_0_0(...);
        local v5 = v4:find("\000");
        if v5 ~= nil then
            return v4:sub(1, v5 - 1);
        else
            return v4;
        end;
    end;
end;
l_get_0 = "\226\128\138";
local function v9(v6, v7)
    for v8 = 1, #v6 do
        if v6[v8] == v7 then
            return v8;
        end;
    end;
    return nil;
end;
local function v12(...)
    local v10 = "";
    for v11 = 1, select("#", ...) do
        v10 = v10 .. select(v11, ...);
    end;
    return v10;
end;
local function v14(v13)
    return math.floor(v13 + 0.5);
end;
local v15 = {};
local v16 = "zadyma."
v15.name = "angelwings";
v15.user = v16;
v15.build = "illusory";
v16 = nil;
v16 = {
    lerp = function(v17, v18, v19)
        return v17 + v19 * (v18 - v17);
    end, 
    closest_ray_point = function(v20, v21, v22, v23)
        local v24 = v22 - v20;
        local v25 = v21 - v20;
        local v26 = v25.x * v25.x + v25.y * v25.y;
        local v27 = (v24.x * v25.x + v24.y * v25.y) / v26;
        if v23 then
            if v27 <= 0 then
                return v20;
            elseif v27 >= 1 then
                return v21;
            end;
        end;
        return v20 + v27 * v25;
    end
};
local v28 = nil;
v28 = {
    antiaim = {
        angles = {
            enabled = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
            pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
            yaw = {
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden")
            }, 
            yaw_modifier = {
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset")
            }, 
            body_yaw = {
                ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding")
            }, 
            freestanding = {
                ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding")
            }, 
            extended_angles = {
                ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Pitch"), 
                ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Roll")
            }
        }, 
        misc = {
            fake_duck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
            slow_walk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
            leg_movement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement")
        }
    }, 
    ragebot = {
        main = {
            hide_shots = {
                ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
                ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options")
            }, 
            double_tap = {
                ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
                ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
                ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"), 
                ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Immediate Teleport"), 
                ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Quick-Switch")
            }
        }, 
        selection = {
            min_damage = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage")
        }
    }
};
local v29 = nil;
v29 = {};
local v30 = {};
v30.__index = v30;
v30.new = function(v31)
    return setmetatable({
        count = 0, 
        list = {}
    }, v31);
end;
v30.__len = function(v32)
    return v32.count;
end;
v30.__call = function(v33, v34, v35)
    if v35 == false then
        return v33:unset(v34);
    else
        return v33:set(v34);
    end;
end;
v30.unset = function(v36, v37)
    -- upvalues: v9 (ref)
    local v38 = v9(v36.list, v37);
    if v38 ~= nil then
        v36.count = v36.count - 1;
        table.remove(v36.list, v38);
    end;
    return v36;
end;
v30.set = function(v39, v40, v41)
    -- upvalues: v9 (ref)
    if v41 == false then
        return v39:unset(v40);
    else
        if not v9(v39.list, v40) then
            v39.count = v39.count + 1;
            table.insert(v39.list, v40);
        end;
        return v39;
    end;
end;
v30.fire = function(v42, ...)
    local l_list_0 = v42.list;
    for v44 = 1, #l_list_0 do
        l_list_0[v44](...);
    end;
    return v42;
end;
local v45 = {};
do
    local l_v30_0, l_v45_0 = v30, v45;
    local function v51(v48, v49)
        -- upvalues: l_v30_0 (ref)
        local v50 = rawget(v48, v49);
        if v50 == nil then
            v50 = l_v30_0:new();
            rawset(v48, v49, v50);
        end;
        return v50;
    end;
    do
        local l_v51_0 = v51;
        l_v45_0.new = function(_)
            -- upvalues: l_v51_0 (ref)
            return setmetatable({}, {
                __index = l_v51_0
            });
        end;
    end;
    v29.new = function(_)
        -- upvalues: l_v45_0 (ref)
        return l_v45_0:new();
    end;
end;
v30 = nil;
v30 = {};
v45 = bit.lshift(1, 0);
local v55 = {};
v55.__index = v55;
v55.__newindex = function(v56, v57, v58)
    v56[0][v57] = v58;
end;
do
    local l_v45_1, l_v55_0 = v45, v55;
    l_v55_0.__index = function(v61, v62)
        -- upvalues: l_v55_0 (ref), l_v45_1 (ref)
        local v63 = rawget(l_v55_0, v62);
        if v63 ~= nil then
            return v63;
        else
            local v64 = rawget(v61, v62);
            if v64 ~= nil then
                return v64;
            else
                local v65 = v61[0][v62];
                if v65 == nil then
                    return nil;
                elseif type(v65) == "function" then
                    local function v69(...)
                        -- upvalues: v61 (ref), l_v45_1 (ref), v65 (ref)
                        local v66 = {};
                        local v67 = select("#", ...);
                        for v68 = 1, v67 do
                            v66[v68] = select(v68, ...);
                        end;
                        if bit.band(v61.flags, l_v45_1) ~= 0 then
                            v61:fire_callbacks(v66, v67);
                        end;
                        if v66[1] == v61 then
                            v66[1] = v61[0];
                        end;
                        return v65(unpack(v66, 1, v67));
                    end;
                    rawset(v61, v62, v69);
                    return v69;
                else
                    return v65;
                end;
            end;
        end;
    end;
    l_v55_0.new = function(v70, v71)
        -- upvalues: l_v45_1 (ref)
        local v72 = {
            flags = 0, 
            [0] = v71, 
            callbacks = {}
        };
        v72.flags = bit.bor(v72.flags, l_v45_1);
        return setmetatable(v72, v70);
    end;
    l_v55_0.fire_callbacks = function(v73, ...)
        local v74 = rawget(v73, "callbacks");
        for v75 = 1, #v74 do
            v74[v75](...);
        end;
        return v73;
    end;
    l_v55_0.get_flag = function(v76, v77)
        return bit.band(v76.flags, v77) ~= 0;
    end;
    l_v55_0.set_flag = function(v78, v79, v80)
        if v80 then
            v78.flags = bit.bor(v78.flags, v79);
        else
            v78.flags = bit.band(v78.flags, bit.bnot(v79));
        end;
        return v78;
    end;
    l_v55_0.set_callback = function(v81, v82)
        -- upvalues: v9 (ref)
        local v83 = rawget(v81, "callbacks");
        if v9(v83, v82) == nil then
            table.insert(v83, v82);
        end;
        return v81;
    end;
    l_v55_0.unset_callback = function(v84, v85)
        -- upvalues: v9 (ref)
        local v86 = rawget(v84, "callbacks");
        local v87 = v9(v86, v85);
        if v87 ~= nil then
            table.remove(v86, v87);
        end;
        return v84;
    end;
    v30.group_flags = {
        callbacks = l_v45_1
    };
    v30.cast = function(v88)
        -- upvalues: l_v55_0 (ref)
        return l_v55_0:new(v88);
    end;
    v30.create = function(...)
        -- upvalues: l_v55_0 (ref)
        return l_v55_0:new(ui.create(...));
    end;
end;
v45 = nil;
v45 = {};
v55 = "ui\\beepclear.wav";
local v89 = "resource\\warning.wav";
local l_play_0 = cvar.play;
local function v95(v91, v92)
    -- upvalues: v15 (ref)
    local v93 = " \194\183 ";
    local v94 = string.format("\a%s[%s]\aDEFAULT", v91:to_hex(), v15.name);
    print_raw(v94 .. v93 .. v92);
end;
do
    local l_v55_1, l_v89_0, l_l_play_0_0, l_v95_0 = v55, v89, l_play_0, v95;
    v45.log = function(v100)
        -- upvalues: l_v95_0 (ref)
        l_v95_0(color(255, 255, 255, 200), v100);
    end;
    v45.success = function(v101)
        -- upvalues: l_v95_0 (ref), l_l_play_0_0 (ref), l_v55_1 (ref)
        l_v95_0(color(250, 137, 250, 255), v101);
        l_l_play_0_0:call(l_v55_1);
    end;
    v45.error = function(v102)
        -- upvalues: l_v95_0 (ref), l_l_play_0_0 (ref), l_v89_0 (ref)
        l_v95_0(color(250, 0, 50, 255), v102);
        l_l_play_0_0:call(l_v89_0);
    end;
end;
v55 = nil;
v55 = {};
v89 = {};
do
    local l_v89_1 = v89;
    v55.get = function()
        -- upvalues: l_v89_1 (ref)
        return l_v89_1;
    end;
    v55.add = function(v104, v105, v106)
        -- upvalues: l_v89_1 (ref)
        l_v89_1[v104] = {
            [1] = v105, 
            [2] = v106
        };
    end;
end;
v89 = nil;
v89 = {};
l_play_0 = function(v107, v108, v109, v110)
    return v109 * v107 / v110 + v108;
end;
v95 = function()
    return globals.frametime;
end;
local function v117(v111, v112, v113, v114, v115)
    if v114 <= 0 then
        return v113;
    elseif v115 <= v114 then
        return v113;
    else
        v112 = v111(v114, v112, v113 - v112, v115);
        if type(v112) == "number" then
            if math.abs(v113 - v112) < 0.001 then
                return v113;
            else
                local v116 = v112 % 1;
                if v116 < 0.001 then
                    return math.floor(v112);
                elseif v116 > 0.999 then
                    return math.ceil(v112);
                end;
            end;
        end;
        return v112;
    end;
end;
do
    local l_l_play_0_1, l_v95_1, l_v117_0 = l_play_0, v95, v117;
    v89.interp = function(v121, v122, v123, v124)
        -- upvalues: l_l_play_0_1 (ref), l_v117_0 (ref), l_v95_1 (ref)
        if not v124 then
            v124 = l_l_play_0_1;
        end;
        if type(v122) == "boolean" then
            v122 = v122 and 1 or 0;
        end;
        return l_v117_0(v124, v121, v122, l_v95_1(), v123);
    end;
end;
l_play_0 = nil;
v95 = _G.render;
v117 = math.floor;
local v125 = color(0, 0, 0, 0);
local v126 = 1;
local v127 = "s";
do
    local l_v95_2, l_v125_0, l_v126_0 = v95, v125, v126;
    local function v132(v131)
        -- upvalues: l_v126_0 (ref)
        if l_v126_0 == 1 then
            return v131;
        else
            return v131 * l_v126_0;
        end;
    end;
    local v133 = 1;
    local v134 = {};
    local l_alpha_modulate_0 = color().alpha_modulate;
    local function v138(v136, v137)
        -- upvalues: v133 (ref), l_v125_0 (ref), l_alpha_modulate_0 (ref)
        if v133 == 1 then
            return v136;
        elseif not v137 and v133 == 0 then
            return l_v125_0;
        else
            return l_alpha_modulate_0(v136, v133, true);
        end;
    end;
    l_play_0 = setmetatable({
        cheap = false, 
        dpi = l_v95_2.get_scale(2), 
        push_alpha = function(v139)
            -- upvalues: v134 (ref), v133 (ref)
            local v140 = #v134;
            if v140 > 255 then
                error("alpha stack exceeded 255 objects, report to developers");
            end;
            v134[v140 + 1] = v139;
            v133 = v133 * v134[v140 + 1] * (v134[v140] or 1);
        end, 
        pop_alpha = function()
            -- upvalues: v134 (ref), v133 (ref)
            local v141 = #v134;
            local l_v134_0 = v134;
            local l_v141_0 = v141;
            local v144 = nil;
            v141 = v141 - 1;
            l_v134_0[l_v141_0] = v144;
            v133 = v141 == 0 and 1 or v134[v141] * (v134[v141 - 1] or 1);
        end, 
        get_alpha = function(v145)
            -- upvalues: v134 (ref), v133 (ref)
            if v145 then
                return v134[v145];
            else
                return v133, #v134;
            end;
        end, 
        screen_size = function(v146)
            -- upvalues: l_v95_2 (ref), l_v126_0 (ref)
            return l_v95_2.screen_size() / (v146 and 1 or l_v126_0);
        end, 
        measure_text = function(v147, ...)
            -- upvalues: l_v95_2 (ref), l_v126_0 (ref)
            return l_v95_2.measure_text(v147, ...) / l_v126_0;
        end, 
        load_font = function(v148, v149, v150)
            -- upvalues: l_v95_2 (ref)
            return l_v95_2.load_font(v148, v149, v150 or "");
        end, 
        text = function(v151, v152, v153, v154, ...)
            -- upvalues: l_v95_2 (ref), v132 (ref), v138 (ref), l_play_0 (ref)
            l_v95_2.text(v151, v132(v152), v138(v153), v154, ...);
            if measure == true then
                return l_play_0.measure_text(v151, v154, ...);
            else
                return;
            end;
        end, 
        blur = function(v155, v156, v157, v158, v159)
            -- upvalues: l_play_0 (ref), v132 (ref), v133 (ref), l_v95_2 (ref)
            if l_play_0.cheap then
                return;
            else
                if type(v159) == "table" then
                    for v160 = 1, 4 do
                        v159[v160] = v132(v159[v160] or 0);
                    end;
                else
                    v159 = v132(v159 or 0);
                end;
                local v161 = (v158 or 1) * v133;
                v157 = v132(v157 or 2);
                v158 = v161;
                if v158 > 0 and v157 > 0 then
                    l_v95_2.blur(v132(v155), v132(v156), v157, v158, v159);
                end;
                return;
            end;
        end, 
        shadow = function(v162, v163, v164, v165, v166, v167)
            -- upvalues: l_play_0 (ref), l_v95_2 (ref), v132 (ref), v138 (ref)
            if l_play_0.cheap then
                return;
            else
                l_v95_2.shadow(v132(v162), v132(v163), v138(v164), v132(v165 or 16), v132(v166 or 0), v132(v167 or 0));
                return;
            end;
        end, 
        line = function(v168, v169, v170)
            -- upvalues: l_v95_2 (ref), v132 (ref), v138 (ref)
            l_v95_2.line(v132(v168), v132(v169), v138(v170));
        end, 
        rect = function(v171, v172, v173, v174, v175)
            -- upvalues: v132 (ref), l_v95_2 (ref), v138 (ref)
            if type(v174) == "table" then
                for v176 = 1, 4 do
                    v174[v176] = v132(v174[v176] or 0);
                end;
            else
                v174 = v132(v174 or 0);
            end;
            l_v95_2.rect(v132(v171), v132(v172), v138(v173), v174, v175 or false);
        end, 
        rect_outline = function(v177, v178, v179, v180, v181, v182)
            -- upvalues: v132 (ref), l_v95_2 (ref), v138 (ref)
            if type(v181) == "table" then
                for v183 = 1, 4 do
                    v181[v183] = v132(v181[v183] or 0);
                end;
            else
                v181 = v132(v181 or 0);
            end;
            l_v95_2.rect_outline(v132(v177), v132(v178), v138(v179), v132(v180 or 0), v181, v182 or false);
        end, 
        gradient = function(v184, v185, v186, v187, v188, v189, v190)
            -- upvalues: l_v95_2 (ref), v132 (ref), v138 (ref)
            local v191 = v188 or v186;
            if not v189 then
                v189 = v187;
            end;
            l_v95_2.gradient(v132(v184), v132(v185), v138(v186, true), v138(v187, true), v138(v191, true), v138(v189, true), v190 or 0);
        end, 
        circle = function(v192, v193, v194, v195, v196)
            -- upvalues: l_v95_2 (ref), v132 (ref), v138 (ref)
            l_v95_2.circle(v132(v192), v138(v193), v132(v194), v195 or 0, v196 or 1);
        end, 
        circle_outline = function(v197, v198, v199, v200, v201, v202)
            -- upvalues: l_v95_2 (ref), v132 (ref), v138 (ref)
            l_v95_2.circle_outline(v132(v197), v138(v198), v132(v199), v200 or 0, v201 or 1, v132(v202 or 1));
        end, 
        circle_3d = function(v203, v204, v205, v206, v207)
            -- upvalues: l_v95_2 (ref), v138 (ref)
            l_v95_2.circle_3d(v203, v138(v204), v205, v206 or 0, v207 or 1, false);
        end, 
        circle_3d_outline = function(v208, v209, v210, v211, v212, v213)
            -- upvalues: l_v95_2 (ref), v138 (ref), v132 (ref)
            l_v95_2.circle_3d_outline(v208, v138(v209), v210, v211 or 0, v212 or 1, v132(v213 or 1));
        end, 
        circle_3d_gradient = function(v214, v215, v216, v217, v218, v219, v220)
            -- upvalues: l_v95_2 (ref), v138 (ref), v132 (ref)
            l_v95_2.circle_3d_gradient(v214, v138(v215), v138(v216), v217, v218 or 0, v219 or 1, v132(v220 or 1));
        end, 
        texture = function(v221, v222, v223, v224, v225, v226)
            -- upvalues: l_v95_2 (ref), v132 (ref), v138 (ref)
            if not v221 then
                return;
            else
                if not v224 then
                    v224 = color();
                end;
                l_v95_2.texture(v221, v132(v222), v132(v223 or vector(v221.width, v221.height)), v138(v224), v225 or "", v226 or 0);
                return;
            end;
        end, 
        push_clip_rect = function(v227, v228, v229)
            -- upvalues: l_v95_2 (ref), v132 (ref)
            l_v95_2.push_clip_rect(v132(v227), v132(v228), v229 or false);
        end
    }, {
        __index = l_v95_2
    });
end;
v95 = nil;
v117 = {};
v125 = nil;
v126 = color(255, 255, 255, 255);
v127 = function(v230, v231, v232)
    return v230.x >= v231.x and v230.x <= v232.x and v230.y >= v231.y and v230.y <= v232.y;
end;
local v233 = v30.create("##DRAG");
v233:visibility(false);
local v234 = l_play_0.screen_size();
do
    local l_v125_1, l_v126_1, l_v127_0, l_v233_0, l_v234_0 = v125, v126, v127, v233, v234;
    v95 = {
        data = v117, 
        in_bounds = l_v127_0, 
        new = function(v240, v241)
            -- upvalues: v95 (ref), l_v233_0 (ref), l_v234_0 (ref), v14 (ref)
            if type(v241) ~= "table" then
                v241 = {};
            end;
            v95[v240.id] = {
                x = l_v233_0:slider(v240.id .. "::x", 0, 10000, v240.pos.x / l_v234_0.x * 10000), 
                y = l_v233_0:slider(v240.id .. "::y", 0, 10000, v240.pos.y / l_v234_0.y * 10000)
            };
            v95[v240.id].x:set_callback(function(v242)
                -- upvalues: v240 (ref), v14 (ref), l_v234_0 (ref)
                v240.pos.x = v14(v242:get() * 1.0E-4 * l_v234_0.x);
            end, true);
            v95[v240.id].y:set_callback(function(v243)
                -- upvalues: v240 (ref), v14 (ref), l_v234_0 (ref)
                v240.pos.y = v14(v243:get() * 1.0E-4 * l_v234_0.y);
            end, true);
            v240.__drag = {
                active = false, 
                locked = false, 
                point = vector(), 
                progress = {
                    [1] = 0, 
                    [2] = 0, 
                    [3] = 0, 
                    [4] = 0
                }, 
                border = v241.border or {
                    [1] = vector(), 
                    [2] = oscreen
                }, 
                rulers = v241.rulers or {}, 
                on_release = v241.on_release, 
                on_held = v241.on_held, 
                on_active = v241.on_active, 
                config = v95[v240.id]
            };
            events.mouse_input:set(function()
                -- upvalues: v240 (ref)
                if ui.get_alpha() > 0 and (v240.__drag.hovered or v240.__drag.active) then
                    return false;
                else
                    return;
                end;
            end);
            events.dpi_change:set(function(_, _, _)
                -- upvalues: v95 (ref), v240 (ref)
                v95[v240.id].x:set(v95[v240.id].x.value);
                v95[v240.id].y:set(v95[v240.id].y.value);
            end);
        end, 
        process = function(v247)
            -- upvalues: l_play_0 (ref), l_v127_0 (ref), l_v125_1 (ref), v89 (ref), l_v126_1 (ref), l_v234_0 (ref)
            local l___drag_0 = v247.__drag;
            if l___drag_0.locked or ui.get_alpha() == 0 then
                return;
            else
                local v249 = ui.get_mouse_position() / l_play_0.dpi;
                local v250 = ui.get_position();
                local v251 = ui.get_size();
                local v252 = ui.get_alpha() > 0 and common.is_button_down(1);
                local v253 = l_v127_0(v249, v247.pos, v247.pos + v247.size) and not l_v127_0(v249, v250 / l_play_0.dpi, (v250 + v251) / l_play_0.dpi);
                if v252 and l___drag_0.ready == nil then
                    local l_v253_0 = v253;
                    local v255 = v247.pos - v249;
                    l___drag_0.init = v247.pos:clone();
                    l___drag_0.point = v255;
                    l___drag_0.ready = l_v253_0;
                end;
                if v252 and l___drag_0.ready then
                    if l_v125_1 == nil and l___drag_0.on_held then
                        l___drag_0.on_held(v247, l___drag_0);
                    end;
                    l_v125_1 = l___drag_0.ready and l_v125_1 == nil and v247.id or l_v125_1;
                    l___drag_0.active = l_v125_1 == v247.id;
                elseif not v252 then
                    if l___drag_0.active and l___drag_0.on_release then
                        l___drag_0.on_release(v247, l___drag_0);
                    end;
                    l___drag_0.active = false;
                    local v256 = nil;
                    local v257 = nil;
                    local v258 = nil;
                    local v259 = nil;
                    l_v125_1 = nil;
                    l___drag_0.aligning = v259;
                    l___drag_0.init = v258;
                    l___drag_0.point = v257;
                    l___drag_0.ready = v256;
                end;
                local v260 = v247.pos * l_play_0.dpi;
                local v261 = v247.size * l_play_0.dpi;
                l___drag_0.hovered = v253 or l___drag_0.active;
                local v262 = {};
                local v263 = v260 + v261 * 0.5;
                local v264 = l___drag_0.point and (l___drag_0.point + v249) * l_play_0.dpi or v260;
                l___drag_0.progress[1] = v89.interp(l___drag_0.progress[1], l___drag_0.active, 0.1);
                l___drag_0.progress[2] = v89.interp(l___drag_0.progress[2], l___drag_0.active or l___drag_0.hovered, 0.1);
                local v265 = l___drag_0.progress[1];
                local v266 = l___drag_0.progress[2];
                l_play_0.push_alpha(ui.get_alpha());
                l_play_0.rect(v247.pos - 4, v247.pos + v247.size + 4, l_v126_1:alpha_modulate(0.1 * (v266 * 0.65 + 0.35), true), 6);
                l_play_0.rect_outline(v247.pos - 5, v247.pos + v247.size + 5, l_v126_1:alpha_modulate(0.3 * v265, true), 1, 7);
                l_play_0.push_alpha(v265);
                if v265 > 0 and not common.is_button_down(162) then
                    local v267 = (v264 + v261 * 0.5) / l_play_0.dpi;
                    for _, v269 in ipairs(l___drag_0.rulers) do
                        v269[4] = v269[4] or {
                            [1] = 0
                        };
                        local v270 = v269[2] / l_play_0.dpi;
                        local v271 = math.abs(v269[1] and v267.x - v270.x or v267.y - v270.y) < 10 * l_play_0.dpi;
                        local l_v270_0 = v270;
                        local v273 = v269[1] and vector(v270.x + 1, v269[3] / l_play_0.dpi) or vector(v269[3] / l_play_0.dpi, v270.y + 1);
                        local v274 = v269[1] and 1 or 2;
                        if not v262[v274] then
                            v262[v274] = v271 and (v269[1] and v270.x - v247.size.x * 0.5 or v270.y - v247.size.y * 0.5) or nil;
                        end;
                        local v275 = math.abs(v269[1] and v263.x - v270.x or v263.y - v270.y);
                        l___drag_0.progress[4] = v89.interp(l___drag_0.progress[4], v271 or v275 < 10 * l_play_0.dpi, 0.1);
                        local v276 = l___drag_0.progress[4] * 0.35 + 0.1;
                        l_play_0.rect(l_v270_0, v273, l_v126_1:alpha_modulate(v276, true));
                    end;
                    if l___drag_0.border[3] then
                        local v277 = utilities.in_bounds(v247.pos, l___drag_0.border[1], l___drag_0.border[2] - v247.size * 0.5 - 1);
                        l___drag_0.progress[3] = v89.interp(l___drag_0.progress[3], not v277, 0.1);
                        local v278 = l___drag_0.progress[3];
                        l_play_0.rect_outline(l___drag_0.border[1] / l_play_0.dpi, l___drag_0.border[2] / l_play_0.dpi, l_v126_1:alpha_modulate(v278 * 0.75 + 0.25, true), 1, 4);
                    end;
                end;
                l_play_0.pop_alpha();
                l_play_0.pop_alpha();
                if l___drag_0.active then
                    local v279 = v264 / l_play_0.dpi;
                    if common.is_button_down(160) then
                        local v280 = l___drag_0.init:to(v279);
                        local v281 = math.abs(v280.y);
                        local v282 = math.abs(v280.x);
                        if l___drag_0.aligning == nil then
                            if v281 > 0.9 then
                                l___drag_0.aligning = 0;
                            elseif v282 > 0.9 then
                                l___drag_0.aligning = 1;
                            end;
                        end;
                        if l___drag_0.aligning == 0 then
                            v279.x = l___drag_0.init.x;
                            l_play_0.rect(vector(v279.x + v247.size.x * 0.5, 0), vector(v279.x + v247.size.x * 0.5 + 1, l_v234_0.y), color(255, 64));
                        elseif l___drag_0.aligning == 1 then
                            v279.y = l___drag_0.init.y;
                            l_play_0.rect(vector(0, v279.y + v247.size.y * 0.5), vector(l_v234_0.x, v279.y + v247.size.y * 0.5 + 1), color(255, 64));
                        end;
                    end;
                    local v283 = v262[1] or v279.x;
                    v279.y = v262[2] or v279.y;
                    v279.x = v283;
                    v283 = (l___drag_0.border[1] - v261 * 0.5) / l_play_0.dpi;
                    local v284 = (l___drag_0.border[2] - v261 * 0.5) / l_play_0.dpi;
                    v247:set_position(math.clamp(v279.x, v283.x, math.min(v284.x, l_v234_0.x - v247.size.x)), (math.clamp(v279.y, v283.y, math.min(v284.y, l_v234_0.y - v247.size.y))));
                    if l___drag_0.on_active then
                        l___drag_0.on_active(v247, l___drag_0, v279);
                    end;
                end;
                return;
            end;
        end
    };
end;
v117 = nil;
v125 = nil;
do
    local l_v125_2 = v125;
    l_v125_2 = {
        update = function(_)
            return 1;
        end, 
        paint = function(_, _, _)

        end, 
        set_position = function(v290, v291, v292)
            -- upvalues: l_play_0 (ref)
            local v293 = nil;
            local v294 = nil;
            if type(v291) == "userdata" then
                local l_x_0 = v291.x;
                v294 = v291.y;
                v293 = l_x_0;
            else
                local l_v291_0 = v291;
                v294 = v292;
                v293 = l_v291_0;
            end;
            local v297 = l_play_0.screen_size();
            if v290.__drag then
                if v293 then
                    v290.__drag.config.x:set(v293 / v297.x * 10000);
                end;
                if v294 then
                    v290.__drag.config.y:set(v294 / v297.y * 10000);
                end;
            else
                local l_pos_0 = v290.pos;
                local l_pos_1 = v290.pos;
                local v300;
                if not v293 then
                    v300 = v290.pos.x;
                else
                    v300 = v293;
                end;
                local v301;
                if not v294 then
                    v301 = v290.pos.y;
                else
                    v301 = v294;
                end;
                l_pos_1.y = v301;
                l_pos_0.x = v300;
            end;
        end, 
        get_drag_position = function(v302)
            -- upvalues: l_play_0 (ref)
            local v303 = v302.__drag and v302.__drag.config;
            if not v303 then
                return v302.pos;
            else
                local v304 = l_play_0.screen_size();
                local v305 = v303.x:get();
                local v306 = v303.y:get();
                return vector(v305 * 1.0E-4 * v304.x, v306 * 1.0E-4 * v304.y);
            end;
        end, 
        get_drag_size = function(v307)
            return v307.size:clone();
        end, 
        __call = function(v308)
            -- upvalues: l_play_0 (ref), v95 (ref), l_v125_2 (ref)
            local l___list_0 = v308.__list;
            local l___drag_1 = v308.__drag;
            if l___list_0 then
                local v311 = l___list_0.collect();
                l___list_0.active = 0;
                l___list_0.items = v311;
                for v312 = 1, #l___list_0.items do
                    if l___list_0.items[v312].active then
                        l___list_0.active = l___list_0.active + 1;
                    end;
                end;
            end;
            v308.alpha = v308:update();
            l_play_0.push_alpha(v308.alpha);
            if v308.alpha > 0 then
                if l___drag_1 then
                    v95.process(v308);
                end;
                if l___list_0 then
                    l_v125_2.traverse(v308);
                end;
                v308:paint(v308.pos, v308.pos + v308.size);
            end;
            l_play_0.pop_alpha();
        end, 
        enlist = function(v313, v314, v315, v316)
            v313.__list = {
                active = 0, 
                longest = 0, 
                items = {}, 
                progress = setmetatable({}, {
                    __mode = "k"
                }), 
                minwidth = v313.size.x, 
                collect = v314, 
                paint = v315, 
                rev = v316
            };
        end, 
        traverse = function(v317)
            -- upvalues: l_play_0 (ref)
            local l___list_1 = v317.__list;
            local v319 = 0;
            local v320 = vector();
            local v321 = 0;
            l___list_1.longest = 0;
            l___list_1.active = v321;
            for v322 = 1, #l___list_1.items do
                local v323 = l___list_1.items[v322];
                local v324 = v323.name or v322;
                l___list_1.progress[v324] = l___list_1.progress[v324] or {
                    [1] = 0
                };
                local v325 = anima.condition(l___list_1.progress[v324], v323.active, 6, {
                    [1] = {
                        [1] = 1, 
                        [2] = 3
                    }, 
                    [2] = {
                        [1] = 2, 
                        [2] = 3
                    }
                });
                if v325 > 0 then
                    l_play_0.push_alpha(v325);
                    v320 = l___list_1.paint(v317, v323, v319, v325);
                    l_play_0.pop_alpha();
                    local v326 = l___list_1.active + 1;
                    v319 = v319 + v320.y * v325;
                    l___list_1.active = v326;
                    l___list_1.longest = math.max(l___list_1.longest, v320.x);
                end;
            end;
            v317.size.x = anima.lerp(v317.size.x, math.max(l___list_1.longest, l___list_1.minwidth), 10, 0.5);
        end, 
        lock = function(v327, v328)
            if not v327.__drag then
                return;
            else
                v327.__drag.locked = v328 and true or false;
                return;
            end;
        end
    };
    l_v125_2.__index = l_v125_2;
    v117 = {
        new = function(v329, v330, v331, v332)
            -- upvalues: v95 (ref), l_v125_2 (ref)
            local v333 = {
                alpha = 1, 
                id = v329, 
                pos = v330, 
                size = v331, 
                progress = {
                    [1] = 0
                }
            };
            if v332 then
                v95.new(v333, type(v332) == "table" and v332 or nil);
            end;
            return setmetatable(v333, l_v125_2);
        end
    };
end;
v125 = nil;
v125 = {};
v126 = function(v334)
    local v335 = {};
    local v336 = 0;
    for v337 in string.gmatch(v334, ".[\128-\191]*") do
        v336 = v336 + 1;
        v335[v336] = v337;
    end;
    return v335, v336;
end;
do
    local l_v126_2 = v126;
    v125.gradient = function(v339, v340, v341, v342)
        -- upvalues: l_v126_2 (ref)
        local v343 = {};
        local v344, v345 = l_v126_2(v339);
        local v346 = 1 / (v345 - 1);
        local v347 = v342.r - v341.r;
        local v348 = v342.g - v341.g;
        local v349 = v342.b - v341.b;
        local v350 = v342.a - v341.a;
        for v351 = 1, v345 do
            local v352 = v344[v351];
            local v353 = v340 % 2;
            if v353 > 1 then
                v353 = 2 - v353;
            end;
            local v354 = v341.r + v353 * v347;
            local v355 = v341.g + v353 * v348;
            local v356 = v341.b + v353 * v349;
            local v357 = v341.a + v353 * v350;
            local v358 = string.format("%02x%02x%02x%02x", v354, v355, v356, v357);
            table.insert(v343, "\a");
            table.insert(v343, v358);
            table.insert(v343, v352);
            v340 = v340 + v346;
        end;
        return table.concat(v343);
    end;
end;
v126 = nil;
v126 = {
    recorder = {}
};
v127 = nil;
v127 = {
    aimtools = {
        [1] = "Pistols", 
        [2] = "AutoSnipers", 
        [3] = "AWP", 
        [4] = "SSG-08", 
        [5] = "Desert Eagle", 
        [6] = "R8 Revolver"
    }, 
    states = {
        [0] = "Shared", 
        [1] = "Standing", 
        [2] = "Running", 
        [3] = "Slow motion", 
        [4] = "Crouching", 
        [5] = "Move & Crouching", 
        [6] = "Air", 
        [7] = "Air & Crouching", 
        [8] = "On use", 
        [9] = "Fakelag", 
        [10] = "Freestanding", 
        [11] = "Safe Head", 
        [12] = "Manual Yaw"
    }
};
v233 = nil;
v233 = {};
v234 = ".\\" .. v15.name;
local function v360(v359)
    return type(v359.type) == "string" and type(v359.link) == "string" and type(v359.width) == "number" and type(v359.height) == "number";
end;
do
    local l_v234_1, l_v360_0 = v234, v360;
    local function v369(v363)
        -- upvalues: l_v360_0 (ref), l_v234_1 (ref), v233 (ref), l_play_0 (ref)
        return function(v364)
            -- upvalues: l_v360_0 (ref), l_v234_1 (ref), v363 (ref), v233 (ref), l_play_0 (ref)
            if not l_v360_0(v364) then
                return false;
            else
                files.create_folder(l_v234_1);
                local v365 = string.format("%s/%s.%s", l_v234_1, v363, v364.type);
                local v366 = files.read(v365, true);
                if v366 ~= nil then
                    v233[v363] = l_play_0.load_image(v366, vector(v364.width, v364.height));
                else
                    network.get(v364.link, {}, function(v367)
                        -- upvalues: v233 (ref), v363 (ref), l_play_0 (ref), v364 (ref), v365 (ref)
                        if v367 == nil then
                            return;
                        else
                            local l_v367_0 = v367;
                            v233[v363] = l_play_0.load_image(l_v367_0, vector(v364.width, v364.height));
                            files.write(v365, l_v367_0, true);
                            return;
                        end;
                    end);
                end;
                return true;
            end;
        end;
    end;
    v369("eva_small")({
        width = 35, 
        type = "png", 
        link = "https://cdn.hysteria.one/angelwings/angelwings_eva_img.png", 
        height = 35
    });
    v369("billy")({
        width = 131, 
        type = "png", 
        link = "https://cdn.hysteria.one/angelwings/billy.png", 
        height = 185
    });
    v369("tulen")({
        width = 401, 
        type = "png", 
        link = "https://cdn.hysteria.one/angelwings/tulen.png", 
        height = 401
    });
end;
v234 = nil;
v234 = {};
local v370 = ({
    exclusive = 1, 
    illusory = 0, 
    live = 2, 
    debug = -1
})[v15.build:lower()];
local v371 = {};
local function v374(v372, v373)
    v372:set(unpack(v373));
    v372:disabled(true);
end;
do
    local l_v370_0, l_v371_0, l_v374_0 = v370, v371, v374;
    local function v380()
        -- upvalues: l_v371_0 (ref), l_v374_0 (ref)
        for v378 = 1, #l_v371_0 do
            local v379 = l_v371_0[v378];
            l_v374_0(v379.item, v379.value);
        end;
    end;
    v234.is_locked = function(v381)
        -- upvalues: l_v370_0 (ref)
        if l_v370_0 == -1 then
            return false;
        elseif v381 == -1 then
            return true;
        else
            return v381 <= l_v370_0;
        end;
    end;
    v234.push = function(v382, v383, ...)
        -- upvalues: v234 (ref), l_v371_0 (ref), l_v374_0 (ref)
        if not v234.is_locked(v382) then
            return v383;
        else
            local v384 = {
                ...
            };
            if select("#", ...) == 0 then
                v384 = {
                    [1] = false
                };
            end;
            table.insert(l_v371_0, {
                item = v383, 
                value = v384
            });
            v383:set_callback(function(v385)
                -- upvalues: l_v374_0 (ref), v384 (ref)
                l_v374_0(v385, v384);
            end, true);
            return v383;
        end;
    end;
    v234.update = function()
        -- upvalues: v380 (ref)
        v380();
    end;
    local function v387(v386)
        -- upvalues: v380 (ref)
        if v386 == "pre_save" then
            v380();
        end;
    end;
    utils.execute_after(0, v380);
    events.config_state(v387);
end;
v360 = nil;
v360 = {};
v370 = 1;
v371 = 2;
v374 = function(v388)
    return (string.gsub(v388, "${(.-)}", "\a{Link Active}%1\aDEFAULT"));
end;
local function v390(v389)
    -- upvalues: l_get_0 (ref)
    return string.rep(l_get_0, v389);
end;
local function v394(v391, v392)
    -- upvalues: l_get_0 (ref)
    local v393 = string.rep(l_get_0, v392);
    return v393 .. v391 .. v393;
end;
do
    local l_v374_1, l_v390_0 = v374, v390;
    local function v402(v397, v398, v399, v400, v401)
        -- upvalues: l_v390_0 (ref)
        return l_v390_0(v400) .. "\a" .. v397 .. ui.get_icon(v398) .. l_v390_0(v401) .. "\aDEFAULT" .. v399;
    end;
    local function v407(v403, v404, v405, v406)
        -- upvalues: v402 (ref)
        return v402("{Link Active}", v403, v404, v405, v406);
    end;
    local function v414(v408, v409, v410, v411)
        -- upvalues: l_v390_0 (ref)
        local v412 = l_v390_0(v411);
        local v413 = l_v390_0(3);
        return v412 .. "\a" .. v408 .. ui.get_icon(v409) .. v413 .. "\aDEFAULT" .. v410 .. v412;
    end;
    local function v418(v415, v416, v417)
        -- upvalues: v414 (ref)
        return v414("{Link Active}", v415, v416, v417);
    end;
    local function v423(v419, v420, v421)
        -- upvalues: l_v390_0 (ref)
        local v422 = l_v390_0(v421);
        return v422 .. "\a" .. v419 .. ui.get_icon(v420) .. v422;
    end;
    local function v426(v424, v425)
        -- upvalues: v423 (ref)
        return v423("{Link Active}", v424, v425);
    end;
    local function v434(v427, v428)
        local v429 = v427:get();
        if #v429 == 0 then
            if v428 == nil then
                local v430 = v427:type();
                local v431 = v427:list();
                if v430 == "selectable" then
                    v428 = v431;
                elseif v430 == "listable" then
                    v428 = {};
                    for v432 = 1, #v431 do
                        v428[v432] = v432;
                    end;
                end;
            end;
            v429 = v428;
            v427:set(v428);
        end;
        v427:set_callback(function()
            -- upvalues: v427 (ref), v429 (ref)
            local v433 = v427:get();
            if #v433 > 0 then
                v429 = v433;
            else
                v427:set(v429);
            end;
        end);
    end;
    local v435 = {
        category = v30.create("~", "##CATEGORY", v370), 
        info = v30.create("~", "##INFO", v370), 
        antiaim = {
            main = v30.create("~", "##AA_MAIN", v370), 
            state = v30.create("~", "##AA_STATE", v371), 
            recorder = v30.create("~", "##AA_RECORDER", v371), 
            settings = v30.create("~", "##AA_SETTINGS", v371), 
            presets = v30.create("~", "##AA_PRESETS", v371)
        }, 
        ragebot = v30.create("~", "##RAGEBOT", v371), 
        visuals = v30.create("~", "##VISUALS", v371), 
        misc = v30.create("~", "##MISC", v371)
    };
    local _ = nil;
    local function v442()
        -- upvalues: v125 (ref), v15 (ref)
        local v437 = ui.get_style();
        local v438 = color(40, 40, 40, 255);
        local v439 = v437["Link Active"];
        local v440 = -globals.realtime * 0.8;
        local v441 = v125.gradient(v15.name, v440, v439, v438);
        ui.sidebar(v441, "sparkles");
    end;
    events.render(v442);
    v442 = nil;
    v442 = v435.category:list("##CATEGORY", {
        [1] = "Anti-Aim", 
        [2] = "Ragebot", 
        [3] = "Visuals", 
        [4] = "Misc"
    });
    v360.category = v442;
    local v443 = {};
    local v444 = string.lower(v15.build);
    v443.welcome_text = v435.info:label(v407("user", l_v374_1(string.format("Welcome back, ${%s}", v15.user)), 1, 7));
    v443.welcome_text = v435.info:label(v407("code-branch", l_v374_1(string.format("Your build is ${%s}", v444)), 1, 7));
    v360.info = v443;
    v360.links = {
        label = v435.info:label(v12("\a{Link Active}", "Links")), 
        discord = v435.info:button(v426("discord", 10), nil, true), 
        youtube = v435.info:button(v426("youtube", 10), nil, true), 
        config = v435.info:button(v426("file", 10), nil, true)
    };
    v360.configs = {
        label = v435.info:label(v12("\a{Link Active}", "Config")), 
        export = v435.info:button(v418("copy", "Export", 7), nil, true), 
        import = v435.info:button(v418("paste", "Import", 7), nil, true), 
    };
    local v445 = {};
    local l_main_0 = v435.antiaim.main;
    local l_state_0 = v435.antiaim.state;
    local l_settings_0 = v435.antiaim.settings;
    local l_presets_0 = v435.antiaim.presets;
    local l_recorder_0 = v435.antiaim.recorder;
    v55.add("##ANTIAIM_MAIN", l_main_0, "AA");
    v55.add("##ANTIAIM_STATE", l_state_0, "AA");
    v55.add("##ANTIAIM_SETTINGS", l_settings_0, "AA");
    v445.enabled = l_main_0:switch("Enabled");
    v445.mode = l_main_0:list("##MODE", {
        [1] = "Main", 
        [2] = "Settings", 
        [3] = "Presets"
    });
    local v451 = {};
    local v452 = {
        unpack(v127.states, 0)
    };
    local v453 = {};
    v451.state = l_state_0:combo("State", v452);
    local v454 = nil;
    local function v456(v455)
        -- upvalues: v435 (ref)
        v435.info:visibility(v455);
    end;
    do
        local l_l_settings_0_0, l_l_presets_0_0, l_l_recorder_0_0, l_v451_0 = l_settings_0, l_presets_0, l_recorder_0, v451;
        do
            local l_v452_0, l_v453_0 = v452, v453;
            local function v474(v463)
                -- upvalues: l_v451_0 (ref), l_v452_0 (ref), l_v453_0 (ref), l_l_recorder_0_0 (ref)
                local v464 = l_v451_0.state:get();
                l_v451_0.state:visibility(v463);
                local v465 = false;
                for v466 = 1, #l_v452_0 do
                    local v467 = l_v452_0[v466];
                    local v468 = l_v451_0[v467];
                    local v469 = l_v453_0[v467];
                    local v470 = v463 and v467 == v464;
                    if v468 ~= nil and v468.enabled ~= nil then
                        v468.enabled:visibility(v470);
                        if v470 then
                            v470 = v468.enabled:get();
                        end;
                    end;
                    if v468.bomb_e_fix ~= nil then
                        v468.bomb_e_fix:visibility(v470);
                    end;
                    local v471 = v468.mode:get();
                    v468.mode:visibility(v470);
                    local v472 = v471 == "Builder";
                    local v473 = v471 == "Recorder";
                    if v469 ~= nil then
                        if v469.angles ~= nil then
                            v469.angles:visibility(v472 and v470);
                        end;
                        if v469.defensive ~= nil then
                            v469.defensive:visibility(v472 and v470);
                        end;
                        if v469.recorder ~= nil then
                            v469.recorder:visibility(v473 and v470);
                        end;
                    end;
                    if v473 and v470 then
                        v465 = true;
                    end;
                end;
                l_l_recorder_0_0:visibility(v465);
            end;
            local function v476(v475)
                -- upvalues: l_l_presets_0_0 (ref)
                l_l_presets_0_0:visibility(v475);
            end;
            local function v478(v477)
                -- upvalues: l_l_settings_0_0 (ref)
                l_l_settings_0_0:visibility(v477);
            end;
            do
                local l_v456_0, l_v474_0, l_v476_0, l_v478_0 = v456, v474, v476, v478;
                local function v489(v483)
                    -- upvalues: v445 (ref), l_v456_0 (ref), l_v474_0 (ref), l_v478_0 (ref), l_v476_0 (ref)
                    local v484 = v445.mode:get();
                    local v485 = v445.enabled:get();
                    local v486 = v484 == 1;
                    local v487 = v484 == 2;
                    local v488 = v484 == 3;
                    v445.enabled:visibility(v483);
                    v445.mode:visibility(v483 and v485);
                    l_v456_0(not v483 or not v485);
                    l_v474_0(v483 and v485 and v486);
                    l_v478_0(v483 and v485 and v487);
                    l_v476_0(v483 and v485 and v488);
                end;
                v454 = function()
                    -- upvalues: v442 (ref), v489 (ref)
                    local v490 = v442:get();
                    v489(v490 == 1);
                end;
            end;
            v456 = function(v491, v492, v493)
                -- upvalues: l_v374_1 (ref)
                local v494 = {
                    [1] = "Off", 
                    [2] = "Offset", 
                    [3] = "Center", 
                    [4] = "Skitter", 
                    [5] = "Custom Ways", 
                    [6] = "Spin", 
                    [7] = "Random", 
                    [8] = "Angelic"
                };
                local v495 = {
                    [1] = "Off", 
                    [2] = "Left", 
                    [3] = "Right", 
                    [4] = "Jitter", 
                    [5] = "Random"
                };
                local v496 = {
                    [1] = "Left", 
                    [2] = "Right", 
                    [3] = "Forward", 
                    [4] = "Forward-Left", 
                    [5] = "Forward-Right", 
                    [6] = "Backward", 
                    [7] = "Backward-Left", 
                    [8] = "Backward-Right"
                };
                local function v498(v497)
                    return v497 > 0 and v497 .. "%" or "Off";
                end;
                local function _(v499)
                    return v499 > 1 and v499 .. "t" or "Off";
                end;
                local function v502(v501)
                    return v501 > 0 and v501 .. "t" or "Off";
                end;
                if v491 == "Move & Crouching" then
                    v493.direction = v492:combo(l_v374_1("Direction"), {
                        "General", 
                        unpack(v496)
                    });
                end;
                v493.yaw_offset = v492:slider("Offset", -90, 90, 0, nil, "\194\176");
                v493.add_yaw = v492:switch("Add Yaw");
                v493.yaw_left = v492:slider(l_v374_1("${~}   Left##YAW"), -90, 90, 0, nil, "\194\176");
                v493.yaw_right = v492:slider(l_v374_1("${~}   Right##YAW"), -90, 90, 0, nil, "\194\176");
                if v491 == "Move & Crouching" then
                    for v503 = 1, #v496 do
                        local v504 = v496[v503];
                        v493[v504] = {
                            enabled = v492:switch(l_v374_1("${~}   Enabled##YAW_") .. v504), 
                            yaw_offset = v492:slider(l_v374_1("${~}   Offset##YAW_") .. v504, -90, 90, 0, nil, "\194\176"), 
                            yaw_left = v492:slider(l_v374_1("${~}   Left##YAW_") .. v504, -90, 90, 0, nil, "\194\176"), 
                            yaw_right = v492:slider(l_v374_1("${~}   Right##YAW_") .. v504, -90, 90, 0, nil, "\194\176")
                        };
                    end;
                end;
                local v505 = nil;
                local function v516()
                    -- upvalues: v493 (ref), v496 (ref)
                    local v506 = v493.add_yaw:get();
                    local v507 = "General";
                    if v493.direction ~= nil then
                        v507 = v493.direction:get();
                    end;
                    local v508 = v507 == "General";
                    v493.yaw_offset:visibility(v508);
                    v493.yaw_left:visibility(v508 and v506);
                    v493.yaw_right:visibility(v508 and v506);
                    for v509 = 1, #v496 do
                        local v510 = v496[v509];
                        local v511 = v493[v510];
                        if v511 ~= nil then
                            local v512 = v507 == v510;
                            v511.enabled:visibility(v512);
                            if not v511.enabled:get() then
                                v512 = false;
                            end;
                            v511.yaw_offset:visibility(v512);
                            local l_yaw_left_0 = v511.yaw_left;
                            local l_l_yaw_left_0_0 = l_yaw_left_0;
                            l_yaw_left_0 = l_yaw_left_0.visibility;
                            local v515;
                            if v512 then
                                v515 = v506;
                            else
                                v515 = v512;
                            end;
                            l_yaw_left_0(l_l_yaw_left_0_0, v515);
                            l_yaw_left_0 = v511.yaw_right;
                            l_l_yaw_left_0_0 = l_yaw_left_0;
                            l_yaw_left_0 = l_yaw_left_0.visibility;
                            if v512 then
                                v515 = v506;
                            else
                                v515 = v512;
                            end;
                            l_yaw_left_0(l_l_yaw_left_0_0, v515);
                        end;
                    end;
                end;
                v493.add_yaw:set_callback(v516);
                if v493.direction ~= nil then
                    v493.direction:set_callback(v516);
                    for v517 = 1, #v496 do
                        local v518 = v493[v496[v517]];
                        if v518 ~= nil then
                            v518.enabled:set_callback(v516);
                        end;
                    end;
                end;
                v516();
                v493.yaw_jitter = v492:combo("Jitter", v494);
                v505 = v493.yaw_jitter:create();
                v493.jitter_offset = v492:slider(l_v374_1("${~}   Degree"), -90, 90, 0, nil, "\194\176");
                v493.way_count = v505:slider("Count", 3, 5, 3);
                v493.way_values = {};
                for v519 = 1, 5 do
                    v493.way_values[v519] = v505:slider("Way " .. v519, -90, 90, 0, nil, "\194\176");
                end;
                v516 = nil;
                local function v523(v520)
                    -- upvalues: v493 (ref)
                    local v521 = v520:get();
                    for v522 = 1, #v493.way_values do
                        v493.way_values[v522]:visibility(v522 <= v521);
                    end;
                end;
                do
                    local l_v523_0 = v523;
                    local function v531(v525)
                        -- upvalues: v493 (ref), l_v523_0 (ref)
                        local v526 = v525:get();
                        local v527 = v526 == "Off";
                        local v528 = not v527 and v526 ~= "Custom Ways";
                        local v529 = not v527 and v526 == "Custom Ways";
                        v493.jitter_offset:visibility(v528);
                        v493.way_count:visibility(v529);
                        if v529 then
                            v493.way_count:set_callback(l_v523_0, true);
                        else
                            v493.way_count:unset_callback(l_v523_0);
                        end;
                        if not v529 then
                            for v530 = 1, #v493.way_values do
                                v493.way_values[v530]:visibility(false);
                            end;
                        end;
                    end;
                    v493.yaw_jitter:set_callback(v531, true);
                end;
                v493.body_yaw = v492:combo("Body Yaw", v495);
                v505 = v493.body_yaw:create();
                v493.invert_chance = v505:slider("Invert Chance", 1, 100, 100, nil, "%");
                v493.avoid_overlap = v505:switch("Avoid overlap");
                v493.freestanding_body_yaw = v505:combo("Freestanding", {
                    [1] = "Off", 
                    [2] = "Peek Fake", 
                    [3] = "Peek Real"
                });
                v493.left_limit = v492:slider(l_v374_1("${~}   Left##BODY_YAW"), 0, 60, 60, nil, "\194\176");
                v493.right_limit = v492:slider(l_v374_1("${~}   Right##BODY_YAW"), 0, 60, 60, nil, "\194\176");
                v516 = nil;
                v523 = function(v532)
                    -- upvalues: v493 (ref)
                    local v533 = v532:get();
                    local v534 = v533 == "Left";
                    local v535 = v533 == "Right";
                    local v536 = v533 == "Jitter";
                    local v537 = v533 == "Random";
                    v493.invert_chance:visibility(v536);
                    v493.left_limit:visibility(v534 or v536 or v537);
                    v493.right_limit:visibility(v535 or v536 or v537);
                end;
                v493.body_yaw:set_callback(v523, true);
                v493.random = v492:slider("Randomization", 0, 100, 0, nil, v498);
                v493.delay = v492:switch("Delay");
                v505 = v493.delay:create();
                v493.delay_mode = v505:combo("Mode", {
                    [1] = "Default", 
                    [2] = "Custom"
                });
                v493.delay_value = v505:slider("Ticks", 2, 14, 1, nil, "t");
                v493.delay_random = v505:slider("Random ticks", 0, 14, 0, nil, v502);
                v493.delay_count = v505:slider("Count", 2, 8, 2);
                v493.delay_values = {};
                for v538 = 1, 8 do
                    v493.delay_values[v538] = v505:slider("Slider " .. v538, 1, 14, 1, nil, "t");
                end;
                v516 = nil;
                v523 = function(v539)
                    -- upvalues: v493 (ref)
                    local v540 = v539:get();
                    for v541 = 1, 8 do
                        v493.delay_values[v541]:visibility(v541 <= v540);
                    end;
                end;
                do
                    local l_v523_1 = v523;
                    local function v548(v543)
                        -- upvalues: v493 (ref), l_v523_1 (ref)
                        local v544 = v543:get();
                        local v545 = v544 == "Default";
                        local v546 = v544 == "Custom";
                        v493.delay_value:visibility(v545);
                        v493.delay_random:visibility(v545);
                        v493.delay_count:visibility(v546);
                        if v546 then
                            v493.delay_count:set_callback(l_v523_1, true);
                        else
                            v493.delay_count:unset_callback(l_v523_1);
                        end;
                        if not v546 then
                            for v547 = 1, 8 do
                                v493.delay_values[v547]:visibility(false);
                            end;
                        end;
                    end;
                    v493.delay_mode:set_callback(v548, true);
                end;
                return v493;
            end;
            v474 = function(_, v550, v551)
                -- upvalues: l_v374_1 (ref)
                local v552 = {
                    [1] = "Off", 
                    [2] = "Static", 
                    [3] = "Jitter", 
                    [4] = "Spin", 
                    [5] = "Random", 
                    [6] = "Angelic"
                };
                local v553 = {
                    [1] = "Off", 
                    [2] = "Static", 
                    [3] = "Spin", 
                    [4] = "Random", 
                    [5] = "Left/Right", 
                    [6] = "Side-Based"
                };
                local v554 = {
                    [1] = "Off", 
                    [2] = "Offset", 
                    [3] = "Center", 
                    [4] = "Skitter"
                };
                local function v556(v555)
                    return v555 > 0 and v555 .. "t" or "Off";
                end;
                v551.force_break_lc = v550:switch("Force Break LC");
                local v557 = v551.force_break_lc:create();
                v551.tickbase = v557:combo("Tickbase", {
                    [1] = "Default", 
                    [2] = "Ticks", 
                    [3] = "Random"
                });
                v551.tickbase_ticks = v557:slider("Ticks", 2, 22, 15, nil, "t");
                v551.tickbase_min = v557:slider("Min. Ticks", 2, 22, 15, nil, "t");
                v551.tickbase_max = v557:slider("Max. Ticks", 2, 22, 15, nil, "t");
                local v558 = nil;
                local function v563(v559)
                    -- upvalues: v551 (ref)
                    local v560 = v559:get();
                    local v561 = v560 == "Ticks";
                    local v562 = v560 == "Random";
                    v551.tickbase_ticks:visibility(v561);
                    v551.tickbase_min:visibility(v562);
                    v551.tickbase_max:visibility(v562);
                end;
                v551.tickbase:set_callback(v563, true);
                v551.enabled = v550:switch("Defensive AA");
                v551.pitch = v550:combo("Pitch", v552);
                v551.pitch_offset_1 = v550:slider(l_v374_1("${~}   Angle 1##PITCH"), -89, 89, 0, nil, "\194\176");
                v551.pitch_offset_2 = v550:slider(l_v374_1("${~}   Angle 2##PITCH"), -89, 89, 0, nil, "\194\176");
                v551.pitch_speed = v550:slider(l_v374_1("${~}   Speed##PITCH"), -50, 50, 20, 0.1);
                v551.yaw = v550:combo("Yaw", v553);
                v551.yaw_left = v550:slider(l_v374_1("${~}   Yaw Left##YAW"), -180, 180, 0, nil, "\194\176");
                v551.yaw_right = v550:slider(l_v374_1("${~}   Yaw Right##YAW"), -180, 180, 0, nil, "\194\176");
                v551.yaw_offset = v550:slider(l_v374_1("${~}   Yaw Offset##YAW"), 0, 360, 0, nil, "\194\176");
                v551.yaw_speed = v550:slider(l_v374_1("${~}   Yaw Speed##YAW"), -50, 50, 20, 0.1);
                v551.yaw_modifier = v550:combo(l_v374_1("${~}   Modifier##MOD"), v554);
                v551.modifier_offset = v550:slider(l_v374_1("${~}   Degree##MOD"), -180, 180, 0, nil, "\194\176");
                v551.delay = v550:switch(l_v374_1("${~}   Delay##MOD"));
                v557 = v551.delay:create();
                v551.delay_mode = v557:combo("Mode", {
                    [1] = "Default", 
                    [2] = "Custom"
                });
                v551.delay_value = v557:slider("Ticks", 2, 14, 1, nil, "t");
                v551.delay_random = v557:slider("Random ticks", 0, 14, 0, nil, v556);
                v551.delay_count = v557:slider("Count", 2, 8, 2);
                v551.delay_values = {};
                for v564 = 1, 8 do
                    v551.delay_values[v564] = v557:slider("Slider " .. v564, 1, 14, 1, nil, "t");
                end;
                v558 = nil;
                v563 = function(v565)
                    -- upvalues: v551 (ref)
                    local v566 = v565:get();
                    for v567 = 1, 8 do
                        v551.delay_values[v567]:visibility(v567 <= v566);
                    end;
                end;
                do
                    local l_v563_0 = v563;
                    local function v574(v569)
                        -- upvalues: v551 (ref), l_v563_0 (ref)
                        local v570 = v569:get();
                        local v571 = v570 == "Default";
                        local v572 = v570 == "Custom";
                        v551.delay_value:visibility(v571);
                        v551.delay_random:visibility(v571);
                        v551.delay_count:visibility(v572);
                        if v572 then
                            v551.delay_count:set_callback(l_v563_0, true);
                        else
                            v551.delay_count:unset_callback(l_v563_0);
                        end;
                        if not v572 then
                            for v573 = 1, 8 do
                                v551.delay_values[v573]:visibility(false);
                            end;
                        end;
                    end;
                    v551.delay_mode:set_callback(v574, true);
                end;
                v551.force_target_yaw = v550:switch("Force Target Yaw");
                v557 = nil;
                v558 = function(v575)
                    -- upvalues: v551 (ref)
                    local v576 = v575:get();
                    local v577 = v576 == "Off";
                    local v578 = v576 == "Static";
                    local _ = v576 == "Jitter";
                    local _ = v576 == "Random";
                    local v581 = v576 == "Spin";
                    local v582 = v576 == "Angelic";
                    local v583 = not v577;
                    local v584 = not v577 and not v578;
                    local l_v581_0 = v581;
                    if v582 then
                        v583 = false;
                        v584 = false;
                        l_v581_0 = false;
                    end;
                    v551.pitch_offset_1:visibility(v583);
                    v551.pitch_offset_2:visibility(v584);
                    v551.pitch_speed:visibility(l_v581_0);
                end;
                v563 = function(v586)
                    -- upvalues: v551 (ref)
                    local v587 = v586:get() ~= "Off";
                    v551.modifier_offset:visibility(v587);
                    v551.delay:visibility(v587);
                end;
                do
                    local l_v558_0, l_v563_1 = v558, v563;
                    local function v599(v590)
                        -- upvalues: v551 (ref), l_v563_1 (ref)
                        local v591 = v590:get();
                        local v592 = v591 == "Off";
                        local v593 = v591 == "Spin";
                        local v594 = v591 == "Left/Right";
                        local v595 = v591 == "Side-Based";
                        local v596 = v593 or v595;
                        local l_v593_0 = v593;
                        local l_v594_0 = v594;
                        v551.yaw_left:visibility(l_v594_0);
                        v551.yaw_right:visibility(l_v594_0);
                        v551.yaw_offset:visibility(v596);
                        v551.yaw_speed:visibility(l_v593_0);
                        v551.yaw_modifier:visibility(not v592);
                        if not v592 then
                            v551.yaw_modifier:set_callback(l_v563_1, true);
                        else
                            v551.yaw_modifier:unset_callback(l_v563_1);
                        end;
                        if v592 then
                            v551.modifier_offset:visibility(false);
                            v551.delay:visibility(false);
                        end;
                    end;
                    local function v602(v600)
                        -- upvalues: v551 (ref), l_v558_0 (ref), v599 (ref), l_v563_1 (ref)
                        local v601 = v600:get();
                        if not v601 then
                            v551.pitch_offset_1:visibility(false);
                            v551.pitch_offset_2:visibility(false);
                            v551.pitch_speed:visibility(false);
                            v551.yaw_left:visibility(false);
                            v551.yaw_right:visibility(false);
                            v551.yaw_offset:visibility(false);
                            v551.yaw_speed:visibility(false);
                            v551.yaw_modifier:visibility(false);
                            v551.modifier_offset:visibility(false);
                            v551.delay:visibility(false);
                        end;
                        if v601 then
                            v551.pitch:set_callback(l_v558_0, true);
                            v551.yaw:set_callback(v599, true);
                        else
                            v551.pitch:unset_callback(l_v558_0);
                            v551.yaw:unset_callback(v599);
                            v551.yaw_modifier:unset_callback(l_v563_1);
                        end;
                        v551.pitch:visibility(v601);
                        v551.yaw:visibility(v601);
                        v551.force_target_yaw:visibility(v601);
                    end;
                    v551.enabled:set_callback(v602, true);
                end;
                v551.flick_enabled = v550:switch("Defensive Flick");
                v551.flick_mode = v550:combo("Mode", {
                    [1] = "Default", 
                    [2] = "Silent"
                });
                v551.flick_pitch = v550:slider("Pitch", -89, 89, 0);
                v551.flick_yaw = v550:slider("Yaw", 0, 180, 120);
                v551.flick_yaw_random = v551.flick_yaw:create():slider("Yaw Random", 0, 180, 0);
                v551.flick_limit = v550:slider("Limit", 0, 60, 60);
                v551.flick_speed = v550:slider("Speed", 2, 10, 7);
                v551.flick_speed_random = v551.flick_speed:create():slider("Speed Random", 0, 8, 0);
                v557 = nil;
                v558 = function(v603)
                    -- upvalues: v551 (ref)
                    local v604 = v603:get();
                    v551.flick_mode:visibility(v604);
                    v551.flick_pitch:visibility(v604);
                    v551.flick_yaw:visibility(v604);
                    v551.flick_limit:visibility(v604);
                    v551.flick_speed:visibility(v604);
                end;
                v551.flick_enabled:set_callback(v558, true);
                return v551;
            end;
            v476 = function(_, v606, v607)
                v607.record = v606:value("record", "[]");
                v607.inverse_inverter = v606:switch("Inverse Inverter");
                return v607;
            end;
            for v608 = 1, #l_v452_0 do
                local v609 = l_v452_0[v608];
                local v610 = string.format("##ANGLES_%s", v609);
                local v611 = string.format("##DEFENSIVE_%s", v609);
                local v612 = string.format("##RECORDER_%s", v609);
                local v613 = v30.create("~", v610, v371);
                local v614 = v30.create("~", v611, v371);
                local v615 = v30.create("~", v612, v371);
                do
                    local l_v609_0 = v609;
                    local function v621(v617)
                        -- upvalues: l_v609_0 (ref)
                        local v618 = string.format("##%s", l_v609_0);
                        local _, v620 = string.find(v617[2], "##");
                        if v620 ~= nil then
                            v618 = v618 .. string.sub(v617[2], v620 + 1);
                        end;
                        v617[2] = v617[2] .. v618;
                    end;
                    local v622 = {};
                    l_state_0:set_callback(v621);
                    v613:set_callback(v621);
                    v614:set_callback(v621);
                    v615:set_callback(v621);
                    v622.mode = l_state_0:combo("Mode", {
                        [1] = "Builder", 
                        [2] = "Recorder"
                    });
                    v622.mode:set_callback(v454);
                    if l_v609_0 ~= "Shared" then
                        l_state_0:set_flag(v30.group_flags.callbacks, false);
                        v622.enabled = l_state_0:switch(string.format("\a{Link Active}Allow %s", l_v609_0:lower()));
                        l_state_0:set_flag(v30.group_flags.callbacks, true);
                        v622.enabled:set_callback(v454);
                    end;
                    if l_v609_0 == "On use" then
                        v622.bomb_e_fix = l_state_0:switch("Bomb E Fix");
                    end;
                    v622.angles = v456(l_v609_0, v613, {});
                    if l_v609_0 ~= "Fakelag" then
                        v622.defensive = v474(l_v609_0, v614, {});
                    end;
                    v622.recorder = v476(l_v609_0, v615, {});
                    l_state_0:unset_callback(v621);
                    v613:unset_callback(v621);
                    v614:unset_callback(v621);
                    v615:unset_callback(v621);
                    l_v451_0[l_v609_0] = v622;
                    l_v453_0[l_v609_0] = {
                        angles = v613, 
                        defensive = v614, 
                        recorder = v615
                    };
                    v55.add(v610, v613, "AA");
                    v55.add(v611, v614, "AA");
                    v55.add(v612, v615, "AA");
                end;
            end;
            v478 = nil;
            v442:set_callback(v454);
            v445.enabled:set_callback(v454);
            v445.mode:set_callback(v454);
            l_v451_0.state:set_callback(v454);
            v454();
            v445.builder = l_v451_0;
        end;
        v445.recorder = {
            sequence_list = l_l_recorder_0_0:list("##SEQUENCE_LIST", {}), 
            set_start_button = l_l_recorder_0_0:button(v394("Set Start", 52), nil, true), 
            set_end_button = l_l_recorder_0_0:button(v394("Set End", 53), nil, true), 
            save_button = l_l_recorder_0_0:button(v394("Save", 57), nil, true), 
            import_button = l_l_recorder_0_0:button(v394("Import", 53), nil, true)
        };
        v445.presets = {
            list = l_l_presets_0_0:list("##PRESET_LIST", {
                [1] = "Empty"
            }), 
            name = l_l_presets_0_0:input("##PRESET_NAME", ""), 
            load = l_l_presets_0_0:button(v394("\a{Link Active}Load", 12), nil, true), 
            save = l_l_presets_0_0:button(v394("Save", 12), nil, true), 
            delete = l_l_presets_0_0:button(v394("\aCD6060FFDelete", 8), nil, true), 
            import = l_l_presets_0_0:button(v394("Import", 19), nil, true), 
            export = l_l_presets_0_0:button(v394("Export", 20), nil, true)
        };
        v454 = {};
        v456 = {
            enabled = l_l_settings_0_0:switch("Anti-Bruteforce")
        };
        local v623 = v456.enabled:create();
        v456.refresh_modifier = v623:combo("Refresh Modifier", {
            [1] = "Off", 
            [2] = "Adaptive", 
            [3] = "Increase", 
            [4] = "Decrease"
        });
        v456.refresh_offset = v623:switch("Refresh Offset");
        v456.enforce_delay = v623:switch("Enforce Delay Period");
        v456.duration = v623:slider("Duration", 0, 100, 0, 0.1, function(v624)
            return v624 == 0 and "Inf." or v624 * 0.1 .. "s";
        end);
        v234.push(2, v456.enabled);
        v454.antibrute = v456;
        v623 = {};
        local v625 = {
            [1] = "With Knife", 
            [2] = "With Taser"
        };
        if not v234.is_locked(1) then
            table.insert(v625, "Above Enemy");
            table.insert(v625, "Far from Enemy");
        end;
        v623.select = l_l_settings_0_0:selectable("Safe Head", v625);
        v234.push(2, v623.select, {});
        v454.safe_head = v623;
        v625 = {
            select = l_l_settings_0_0:combo("Manual Yaw", {
                [1] = "Off", 
                [2] = "Left", 
                [3] = "Right", 
                [4] = "Backward", 
                [5] = "Forward"
            })
        };
        local v626 = v625.select:create();
        v625.disable_yaw_modifiers = v626:switch("Disable Yaw Modifiers");
        v625.body_freestanding = v626:switch("Body Freestanding");
        v454.manual_yaw = v625;
        v454.disablers = {
            select = l_l_settings_0_0:selectable("Disablers", {
                [1] = "On Warmup", 
                [2] = "Enemies Dead"
            })
        };
        local v627 = {
            enabled = l_l_settings_0_0:switch("Freestanding")
        };
        local v628 = v627.enabled:create();
        v627.disablers = v628:selectable("Disablers", {
            [1] = "Standing", 
            [2] = "Running", 
            [3] = "Slow motion", 
            [4] = "Crouching", 
            [5] = "Air"
        });
        v627.disable_yaw_modifiers = v628:switch("Disable Yaw Modifiers");
        v627.body_freestanding = v628:switch("Body Freestanding");
        v454.freestanding = v627;
        v454.edge_yaw = {
            enabled = l_l_settings_0_0:switch("Edge Yaw")
        };
        v454.invert_flick = {
            enabled = l_l_settings_0_0:switch("Invert Flick")
        };
        local v629 = {
            value = l_l_settings_0_0:slider("Roll", -45, 45, 0, nil, "\194\176")
        };
        local v630 = v629.value:create();
        v629.change_on_fakelag = v630:switch("Change on Fakelag");
        v629.fakelag_value = v630:slider("Fakelag Roll", -45, 45, 0, nil, "\194\176");
        local _ = nil;
        do
            local l_v629_0 = v629;
            local function v634(v633)
                -- upvalues: l_v629_0 (ref)
                l_v629_0.fakelag_value:visibility(v633:get());
            end;
            l_v629_0.change_on_fakelag:set_callback(v634, true);
            v234.push(2, l_v629_0.value, 0);
            v454.roll = l_v629_0;
            v445.settings = v454;
        end;
        v360.antiaim = v445;
    end;
    l_main_0 = {};
    l_state_0 = v435.ragebot;
    v55.add("##RAGEBOT", l_state_0, "AA");
    l_settings_0 = {};
    l_presets_0 = {
        [1] = "Higher than you", 
        [2] = "Lower than you", 
        [3] = "Lethal", 
        [4] = "After X misses", 
        [5] = "HP lower than X"
    };
    l_settings_0.enabled = l_state_0:switch("Aimtools");
    l_recorder_0 = v30.cast(l_settings_0.enabled:create());
    l_settings_0.flag = l_recorder_0:switch("Draw Flags");
    l_settings_0.weapon = l_recorder_0:combo("Weapon", v127.aimtools);
    v451 = nil;
    v452 = function(v635, v636)
        v635.conditions:visibility(v636);
        v635.max_misses:visibility(v636 and v635.conditions:get("After X misses"));
        v635.lower_hp:visibility(v636 and v635.conditions:get("HP lower than X"));
    end;
    do
        local l_l_state_0_0, l_l_settings_0_1, l_l_recorder_0_1 = l_state_0, l_settings_0, l_recorder_0;
        do
            local l_l_presets_0_1 = l_presets_0;
            v453 = function(v641, v642)
                -- upvalues: l_l_presets_0_1 (ref)
                local v643 = v641.conditions:get();
                v641.conditions:visibility(v642);
                for v644 = 1, #l_l_presets_0_1 do
                    local v645 = l_l_presets_0_1[v644];
                    local v646 = v641[v645];
                    if v646 ~= nil then
                        local v647 = v642 and v643 == v645;
                        v646.enabled:visibility(v647);
                        if not v646.enabled:get() then
                            v647 = false;
                        end;
                        if v646.max_misses ~= nil then
                            v646.max_misses:visibility(v647);
                        end;
                        if v646.lower_hp ~= nil then
                            v646.lower_hp:visibility(v647);
                        end;
                        if v646.value ~= nil then
                            v646.value:visibility(v647);
                        end;
                    end;
                end;
            end;
            do
                local l_v452_1, l_v453_1, l_v454_0, l_v456_1 = v452, v453, v454, v456;
                l_v454_0 = function(v652, v653)
                    -- upvalues: l_v452_1 (ref), l_v453_1 (ref)
                    l_v452_1(v652.prefer_body, v653);
                    l_v452_1(v652.force_safe, v653);
                    l_v453_1(v652.hit_chance, v653);
                    l_v453_1(v652.multipoints, v653);
                end;
                l_v456_1 = function(v654, v655)
                    -- upvalues: l_l_settings_0_1 (ref), l_v454_0 (ref)
                    local v656 = v655:get();
                    for v657 = 1, #v654 do
                        local v658 = v654[v657];
                        local v659 = l_l_settings_0_1[v658];
                        local v660 = v658 == v656;
                        l_v454_0(v659, v660);
                    end;
                end;
                v451 = function()
                    -- upvalues: l_v456_1 (ref), v127 (ref), l_l_settings_0_1 (ref)
                    l_v456_1(v127.aimtools, l_l_settings_0_1.weapon);
                end;
            end;
            do
                local l_l_l_recorder_0_1_0, l_v451_1, l_v452_2, l_v453_2 = l_l_recorder_0_1, v451, v452, v453;
                l_v452_2 = function(v665)
                    -- upvalues: l_l_l_recorder_0_1_0 (ref), l_l_presets_0_1 (ref), l_v451_1 (ref)
                    local v666 = {};
                    local function v668(v667)
                        -- upvalues: v665 (ref)
                        v667[2] = v667[2] .. string.format("##%s", v665);
                    end;
                    l_l_l_recorder_0_1_0:set_callback(v668);
                    v666.conditions = l_l_l_recorder_0_1_0:selectable(v665, l_l_presets_0_1);
                    v666.max_misses = l_l_l_recorder_0_1_0:slider("\tMax Misses", 1, 10, 2);
                    v666.lower_hp = l_l_l_recorder_0_1_0:slider("\tLower HP", 0, 100, 80);
                    v666.conditions:set_callback(l_v451_1);
                    l_l_l_recorder_0_1_0:unset_callback(v668);
                    return v666;
                end;
                l_v453_2 = function(v669, v670, v671, v672)
                    -- upvalues: l_l_l_recorder_0_1_0 (ref), l_l_presets_0_1 (ref), l_v451_1 (ref)
                    local v673 = {};
                    local function v675(v674)
                        -- upvalues: v669 (ref)
                        v674[2] = v674[2] .. string.format("##%s", v669);
                    end;
                    l_l_l_recorder_0_1_0:set_callback(v675);
                    v673.conditions = l_l_l_recorder_0_1_0:combo(v669, l_l_presets_0_1);
                    for v676 = 1, #l_l_presets_0_1 do
                        local v677 = l_l_presets_0_1[v676];
                        do
                            local l_v677_0 = v677;
                            local function v680(v679)
                                -- upvalues: l_v677_0 (ref)
                                v679[2] = v679[2] .. string.format("##%s", l_v677_0);
                            end;
                            l_l_l_recorder_0_1_0:set_callback(v680);
                            local v681 = {
                                enabled = l_l_l_recorder_0_1_0:switch("\tEnabled")
                            };
                            if l_v677_0 == "After X misses" then
                                v681.max_misses = l_l_l_recorder_0_1_0:slider("\tMax Misses", 1, 10, 2);
                            end;
                            if l_v677_0 == "HP lower than X" then
                                v681.lower_hp = l_l_l_recorder_0_1_0:slider("\tLower HP", 0, 100, 80);
                            end;
                            v681.value = l_l_l_recorder_0_1_0:slider("\tValue", v670, v671, v672);
                            l_l_l_recorder_0_1_0:unset_callback(v680);
                            v681.enabled:set_callback(l_v451_1);
                            v673[l_v677_0] = v681;
                        end;
                    end;
                    l_l_l_recorder_0_1_0:unset_callback(v675);
                    v673.conditions:set_callback(l_v451_1);
                    return v673;
                end;
                v454 = function(_, v683)
                    -- upvalues: l_v452_2 (ref), l_v453_2 (ref)
                    v683.prefer_body = l_v452_2("Prefer Body Aim");
                    v683.force_safe = l_v452_2("Force Safe Point");
                    v683.hit_chance = l_v453_2("Hit Chance", 0, 100, 50);
                    v683.multipoints = l_v453_2("Multipoints", 0, 100, 50);
                    return v683;
                end;
                for v684 = 1, #v127.aimtools do
                    local v685 = v127.aimtools[v684];
                    do
                        local l_v685_0 = v685;
                        local function v691(v687)
                            -- upvalues: l_v685_0 (ref)
                            local v688 = string.format("##%s", l_v685_0);
                            local _, v690 = string.find(v687[2], "##");
                            if v690 ~= nil then
                                v688 = v688 .. string.sub(v687[2], v690 + 1);
                            end;
                            v687[2] = v687[2] .. v688;
                        end;
                        l_l_l_recorder_0_1_0:set_callback(v691);
                        l_l_settings_0_1[l_v685_0] = v454(l_v685_0, {});
                        l_l_l_recorder_0_1_0:unset_callback(v691);
                    end;
                end;
                v234.push(1, l_l_settings_0_1.enabled);
                l_l_settings_0_1.weapon:set_callback(l_v451_1, true);
            end;
            l_main_0.aimtools = l_l_settings_0_1;
        end;
        l_presets_0 = {
            enabled = l_l_state_0_0:switch("AI Peek")
        };
        l_l_recorder_0_1 = l_presets_0.enabled:create();
        l_presets_0.simulation = l_l_recorder_0_1:slider("Simulation", 25, 35, 28, 0.01, "s");
        l_presets_0.scan_frequency = l_l_recorder_0_1:slider("Scan Frequency", 0, 30, 2, 0.01, "s");
        l_presets_0.hit_chance = l_l_recorder_0_1:slider("Hit Chance", 0, 100, 35, nil, function(v692)
            return v692 == 0 and "Def." or v692 .. "%";
        end);
        l_presets_0.weapons = l_l_recorder_0_1:selectable("Weapons", {
            [1] = "AutoSnipers", 
            [2] = "AWP", 
            [3] = "SSG-08", 
            [4] = "Pistols", 
            [5] = "R8 Revolver", 
            [6] = "Desert Eagle"
        });
        l_presets_0.hitboxes = l_l_recorder_0_1:selectable("Hitboxes", {
            [1] = "Head", 
            [2] = "Chest", 
            [3] = "Stomach", 
            [4] = "Arms", 
            [5] = "Legs"
        });
        l_presets_0.unsafe = l_l_recorder_0_1:switch("Unsafe", false);
        l_presets_0.color = l_l_recorder_0_1:color_picker("Color", color(200, 0, 0, 255));
        v434(l_presets_0.weapons);
        v434(l_presets_0.hitboxes);
        v234.push(1, l_presets_0.enabled);
        l_main_0.ai_peek = l_presets_0;
        l_l_recorder_0_1 = {
            enabled = l_l_state_0_0:switch("Logs")
        };
        v451 = l_l_recorder_0_1.enabled:create();
        l_l_recorder_0_1.output = v451:selectable("Output", {
            [1] = "Events", 
            [2] = "Render", 
            [3] = "Console"
        });
        l_l_recorder_0_1.hit_color = v451:color_picker("Hit Color", color(163, 211, 80, 255));
        l_l_recorder_0_1.miss_color = v451:color_picker("Miss Color", color(240, 191, 86, 255));
        l_l_recorder_0_1.background_color = v451:color_picker("Background Color", color(22, 22, 22, 255));
        l_l_recorder_0_1.logo = v451:combo("Logo", {
            [1] = "Off", 
            [2] = "!", 
            [3] = "Icon", 
            [4] = "Text"
        });
        l_l_recorder_0_1.glow = v451:slider("Glow", 0, 150, 100, nil, "%");
        l_l_recorder_0_1.offset = v451:slider("Offset", 1, 144, 60, 5, "px");
        l_l_recorder_0_1.duration = v451:slider("Duration", 1, 8, 5, nil, "s.");
        v452 = nil;
        v453 = function(v693)
            -- upvalues: l_l_recorder_0_1 (ref)
            local v694 = v693:get("Render");
            l_l_recorder_0_1.background_color:visibility(v694);
            l_l_recorder_0_1.logo:visibility(v694);
            l_l_recorder_0_1.glow:visibility(v694);
            l_l_recorder_0_1.offset:visibility(v694);
            l_l_recorder_0_1.duration:visibility(v694);
        end;
        l_l_recorder_0_1.output:set_callback(v453, true);
        l_main_0.logs = l_l_recorder_0_1;
        v451 = {
            enabled = l_l_state_0_0:switch("Dormant Aimbot")
        };
        v452 = v451.enabled:create();
        v451.hitboxes = v452:selectable("Hitboxes", {
            [1] = "Head", 
            [2] = "Chest", 
            [3] = "Stomach", 
            [4] = "Legs"
        });
        v451.alpha_modifier = v452:slider("Alpha Modifier", 0, 90, 80, nil, "%");
        v451.minimum_damage = v452:slider("Minimum Damage", 0, 130, 0, nil, function(v695)
            if v695 == 0 then
                return "Def.";
            elseif v695 > 100 then
                return "+" .. v695 - 100;
            else
                return;
            end;
        end);
        v434(v451.hitboxes);
        v234.push(1, v451.enabled);
        l_main_0.dormant_aimbot = v451;
        v452 = nil;
        v442:set_callback(function(v696)
            -- upvalues: l_l_state_0_0 (ref)
            local v697 = v696:get() == 2;
            l_l_state_0_0:visibility(v697);
        end, true);
        v360.ragebot = l_main_0;
    end;
    l_state_0 = {};
    l_settings_0 = v435.visuals;
    v55.add("##VISUALS", l_settings_0, "VISUALS");
    l_presets_0 = {};
    l_recorder_0 = {
        [1] = "5:4", 
        [2] = "4:3", 
        [3] = "16:9", 
        [4] = "16:10"
    };
    v451 = {
        ["4:3"] = 133, 
        ["5:4"] = 125, 
        ["16:10"] = 160, 
        ["16:9"] = 177
    };
    v452 = {};
    for v698 = 1, #l_recorder_0 do
        local v699 = l_recorder_0[v698];
        v452[v451[v699]] = v699;
    end;
    l_presets_0.enabled = l_settings_0:switch("Aspect Ratio");
    v453 = l_presets_0.enabled:create();
    do
        local l_l_settings_0_2, l_l_presets_0_2, l_v451_2, l_v452_3, l_v453_3, l_v454_1 = l_settings_0, l_presets_0, v451, v452, v453, v454;
        do
            local l_l_v452_3_0 = l_v452_3;
            l_l_presets_0_2.value = l_v453_3:slider("##VALUE", 1, 200, 177, 0.01, function(v707)
                -- upvalues: l_l_v452_3_0 (ref)
                return l_l_v452_3_0[v707] or nil;
            end);
            for v708 = 1, #l_recorder_0 do
                local v709 = l_recorder_0[v708];
                local v710 = l_v451_2[v709];
                do
                    local l_v710_0 = v710;
                    local function v712()
                        -- upvalues: l_l_presets_0_2 (ref), l_v710_0 (ref)
                        l_l_presets_0_2.value:set(l_v710_0);
                    end;
                    l_v453_3:button(v394(v709, (math.ceil(#v709 * 1.34))), v712, true);
                end;
            end;
            l_state_0.aspect_ratio = l_l_presets_0_2;
        end;
        l_recorder_0 = {
            enabled = l_l_settings_0_2:switch("Viewmodel")
        };
        l_v451_2 = l_recorder_0.enabled:create();
        l_recorder_0.fov = l_v451_2:slider("FOV", 2000, 17000, 6800, 0.01);
        l_recorder_0.offset_x = l_v451_2:slider("X", -2000, 2000, 0, 0.01);
        l_recorder_0.offset_y = l_v451_2:slider("Y", -2000, 2000, 0, 0.01);
        l_recorder_0.offset_z = l_v451_2:slider("Z", -2000, 2000, 0, 0.01);
        l_recorder_0.opposite_knife_hand = l_v451_2:switch("Opposite Knife Hand");
        l_state_0.viewmodel = l_recorder_0;
        l_v451_2 = {
            enabled = l_l_settings_0_2:switch("Indicators")
        };
        l_v452_3 = l_v451_2.enabled:create();
        l_v451_2.style = l_v452_3:list("Style", {
            [1] = "Stars", 
            [2] = "Pixel"
        });
        l_v451_2.offset = l_v452_3:slider("Offset", 0, 200, 32, nil, "px");
        l_v451_2.accent_color = l_v452_3:color_picker("Accent", color(172, 167, 209, 255));
        l_v451_2.secondary_color = l_v452_3:color_picker("Secondary", color(255, 255, 255, 255));
        l_state_0.indicators = l_v451_2;
        l_v452_3 = {
            enabled = l_l_settings_0_2:switch("Solus UI")
        };
        l_v453_3 = l_v452_3.enabled:create();
        l_v452_3.color = l_v453_3:color_picker("Color", color(172, 167, 209, 50));
        l_v452_3.select = l_v453_3:listable("##SELECT", {
            [1] = "Watermark", 
            [2] = "Spectators", 
            [3] = "Hotkey List", 
            [4] = "Anti-aimbot indication", 
            [5] = "Frequency update information"
        });
        l_v452_3.only_key_state = l_v453_3:switch("Only Key State", false);
        v434(l_v452_3.select);
        l_v454_1 = nil;
        v456 = function(v713)
            -- upvalues: l_v452_3 (ref)
            l_v452_3.only_key_state:visibility(v713:get("Hotkey List"));
        end;
        l_v452_3.select:set_callback(v456, true);
        l_state_0.solus_ui = l_v452_3;
        l_v453_3 = {
            enabled = l_l_settings_0_2:switch("Watermark")
        };
        l_v454_1 = l_v453_3.enabled:create();
        l_v453_3.style = l_v454_1:listable("Style", {
            [1] = "Branded", 
            [2] = "Corner"
        });
        l_v453_3.color = l_v454_1:color_picker("Color", color(172, 167, 209, 255));
        v434(l_v453_3.style, {
            [1] = "Branded"
        });
        l_state_0.watermark = l_v453_3;
        l_v454_1 = {
            enabled = l_l_settings_0_2:switch("Manual Arrows")
        };
        v456 = l_v454_1.enabled:create();
        l_v454_1.style = v456:list("Style", {
            [1] = "Invictus", 
            [2] = "Teamskeet", 
            [3] = "Modern", 
            [4] = "Ambani"
        });
        l_v454_1.animate_scope = v456:switch("Animate Scope", true);
        l_v454_1.dynamic_mode = v456:switch("Dynamic Mode", true);
        l_v454_1.offset = v456:slider("Offset", 5, 150, 40, nil, "px");
        l_v454_1.accent_color = v456:color_picker("Accent", color(172, 167, 209, 255));
        l_v454_1.secondary_color = v456:color_picker("Secondary", color(255, 255, 255, 255));
        local v714 = nil;
        local function v717(v715)
            -- upvalues: l_v454_1 (ref)
            local v716 = v715:get();
            l_v454_1.animate_scope:visibility(v716 == 3);
            l_v454_1.dynamic_mode:visibility(v716 == 1 or v716 == 4);
        end;
        l_v454_1.style:set_callback(v717, true);
        l_state_0.manual_arrows = l_v454_1;
        v456 = {
            enabled = l_l_settings_0_2:switch("Custom Scope")
        };
        v714 = v456.enabled:create();
        v456.offset = v714:slider("Offset", 0, 500, 10, nil, "px");
        v456.position = v714:slider("Position", 0, 500, 105, nil, "px");
        v456.thickness = v714:slider("Thickness", 1, 10, 1, nil, "px");
        v456.accent_color = v714:color_picker("Accent", color(255, 255, 255, 255));
        v456.secondary_color = v714:color_picker("Secondary", color(255, 255, 255, 0));
        v456.extra_options = v714:selectable("Extra Options", {
            [1] = "Rotate Angle", 
            [2] = "Dynamic Offset"
        });
        v456.exclude_lines = v714:selectable("Exclude Lines", {
            [1] = "Left", 
            [2] = "Top", 
            [3] = "Right", 
            [4] = "Bottom"
        });
        l_state_0.custom_scope = v456;
        v714 = {
            enabled = l_l_settings_0_2:switch("Damage Indicator")
        };
        v717 = v714.enabled:create();
        v714.if_override = v717:switch("If override");
        v714.font = v717:combo("Font", {
            [1] = "Default", 
            [2] = "Alternative"
        });
        v714.offset = v717:slider("Offset", 2, 8, 2, nil, "px");
        v714.active_color = v717:color_picker("Active Color", color(172, 167, 209, 255));
        v714.inactive_color = v717:color_picker("Inactive Color", color(255, 255, 255, 100));
        local v718 = nil;
        local function v720(v719)
            -- upvalues: v714 (ref)
            v714.inactive_color:visibility(not v719:get());
        end;
        v714.if_override:set_callback(v720, true);
        l_state_0.damage_indicator = v714;
        v717 = {
            enabled = l_l_settings_0_2:switch("Break LC Indicator")
        };
        v234.push(1, v717.enabled);
        l_state_0.break_lc_indicator = v717;
        v718 = {
            enabled = l_l_settings_0_2:switch("Velocity Warning")
        };
        v720 = v718.enabled:create();
        v718.color_accent = v720:color_picker("Accent Color", color(255, 255, 255, 200));
        v718.color_secondary = v720:color_picker("Secondary Color", color(150, 150, 150, 255));
        l_state_0.velocity_warning = v718;
        v720 = {
            enabled = l_l_settings_0_2:switch("Gamesense Indicators")
        };
        local v721 = v720.enabled:create();
        v720.spectator_list = v721:switch("Spectator List", true);
        v720.feature_list = v721:listable("Indicators", {
            [1] = "Hit/Miss", 
            [2] = "Dormant Aimbot", 
            [3] = "Damage Override", 
            [4] = "Hitchance Override", 
            [5] = "Lag Compensation", 
            [6] = "Hitbox Override", 
            [7] = "Fake Latency", 
            [8] = "Fake Angles", 
            [9] = "Fake Duck", 
            [10] = "Body Aim", 
            [11] = "Safe Points", 
            [12] = "Freestanding", 
            [13] = "Bomb Info", 
            [14] = "Hide Shots", 
            [15] = "Double Tap"
        });
        v434(v720.feature_list, {
            [1] = "Damage Override", 
            [2] = "Fake Latency", 
            [3] = "Fake Duck", 
            [4] = "Body Aim", 
            [5] = "Safe Points", 
            [6] = "Freestanding", 
            [7] = "Bomb Info", 
            [8] = "Hide Shots", 
            [9] = "Double Tap"
        });
        l_state_0.gamesense_indicators = v720;
        v721 = {
            enabled = l_l_settings_0_2:switch("Grenade Radius")
        };
        local v722 = v721.enabled:create();
        v721.molotov = v722:switch("Molotov", true);
        v721.molotov_color = v721.molotov:color_picker(color(245, 90, 90, 255));
        v721.smoke = v722:switch("Smoke", true);
        v721.smoke_color = v721.smoke:color_picker(color(130, 130, 255, 255));
        v234.push(1, v721.enabled);
        local v723 = nil;
        local function v725(v724)
            -- upvalues: v721 (ref)
            if not v724:get() and not v721.smoke:get() then
                v721.smoke:set(true);
            end;
        end;
        local function v727(v726)
            -- upvalues: v721 (ref)
            if not v726:get() and not v721.molotov:get() then
                v721.molotov:set(true);
            end;
        end;
        v721.molotov:set_callback(v725);
        v721.smoke:set_callback(v727);
        l_state_0.grenade_radius = v721;
        v722 = {
            label = l_l_settings_0_2:label("Static Watermark")
        };
        v723 = v722.label:create();
        v722.style = v723:list("Style", {
            [1] = "Classic", 
            [2] = "Modern"
        });
        v722.position = v723:combo("Position", {
            [1] = "Bottom", 
            [2] = "Left", 
            [3] = "Right"
        });
        v722.remove_spaces = v723:switch("Remove Spaces");
        v722.color = v723:color_picker("Color", color(142, 165, 229, 255));
        v723 = nil;
        v725 = function()
            -- upvalues: l_v453_3 (ref), l_v451_2 (ref), l_v452_3 (ref), v722 (ref)
            local v728 = l_v453_3.enabled:get() or l_v451_2.enabled:get();
            local v729 = l_v452_3.enabled:get() and l_v452_3.select:get("Watermark");
            v722.label:disabled(v728 or v729);
        end;
        l_v453_3.enabled:set_callback(v725);
        l_v451_2.enabled:set_callback(v725);
        l_v452_3.enabled:set_callback(v725);
        l_v452_3.select:set_callback(v725);
        v725();
        l_state_0.static_watermark = v722;
        v723 = nil;
        v442:set_callback(function(v730)
            -- upvalues: l_l_settings_0_2 (ref)
            local v731 = v730:get() == 3;
            l_l_settings_0_2:visibility(v731);
        end, true);
        v360.visuals = l_state_0;
    end;
    l_settings_0 = {};
    l_presets_0 = v435.misc;
    v55.add("##MISC", l_presets_0, "MISC");
    l_settings_0.clantag = {
        enabled = l_presets_0:switch("Clantag")
    };
    l_settings_0.trashtalk = {
        enabled = l_presets_0:switch("Trashtalk")
    };
    v452 = {
        enabled = l_presets_0:switch("Fast Ladder")
    };
    v234.push(2, v452.enabled);
    l_settings_0.fast_ladder = v452;
    v453 = {
        enabled = l_presets_0:switch("Edge Stop")
    };
    v234.push(1, v453.enabled);
    l_settings_0.edge_stop = v453;
    v454 = {
        enabled = l_presets_0:switch("Collision Air Duck")
    };
    v234.push(1, v454.enabled);
    l_settings_0.collision_air_duck = v454;
    v456 = {
        enabled = l_presets_0:switch("No Fall Damage")
    };
    v234.push(2, v456.enabled);
    l_settings_0.no_fall_damage = v456;
    local v732 = {
        enabled = l_presets_0:switch("Super Toss")
    };
    v234.push(2, v732.enabled);
    l_settings_0.super_toss = v732;
    local v733 = {
        enabled = l_presets_0:switch("Grenade Release")
    };
    v733.damage = v733.enabled:create():slider("Damage", 1, 50, 35, nil, "hp");
    v234.push(2, v733.enabled);
    l_settings_0.grenade_release = v733;
    local v734 = {
        enabled = l_presets_0:switch("Fps Optimize")
    };
    local v735 = v734.enabled:create();
    v734.always_on = v735:switch("Always on");
    v734.detections = v735:selectable("Detections", {
        [1] = "Peeking", 
        [2] = "Hit Flag"
    });
    v734.select = v735:selectable("Optimizations", {
        [1] = "Fog", 
        [2] = "Blood", 
        [3] = "Bloom", 
        [4] = "Decals", 
        [5] = "Shadows", 
        [6] = "Sprites", 
        [7] = "Particles", 
        [8] = "Ropes", 
        [9] = "Dynamic lights", 
        [10] = "Map details", 
        [11] = "Weapon effects", 
        [12] = "Teammates"
    });
    v434(v734.detections);
    v434(v734.select, {
        [1] = "Blood", 
        [2] = "Decals", 
        [3] = "Sprites", 
        [4] = "Ropes", 
        [5] = "Dynamic lights", 
        [6] = "Weapon effects"
    });
    local v736 = nil;
    do
        local l_l_presets_0_3, l_v734_0, l_v736_0 = l_presets_0, v734, v736;
        local function v741(v740)
            -- upvalues: l_v734_0 (ref)
            l_v734_0.detections:visibility(not v740:get());
        end;
        l_v734_0.always_on:set_callback(v741, true);
        l_settings_0.fps_optimize = l_v734_0;
        v735 = {
            enabled = l_l_presets_0_3:switch("Ping Unlocker")
        };
        v735.value = v735.enabled:create():slider("Latency", 0, 200, 0, nil, "ms");
        v234.push(2, v735.enabled);
        l_settings_0.ping_unlocker = v735;
        l_v736_0 = {
            enabled = l_l_presets_0_3:switch("Animation Breaker")
        };
        v741 = l_v736_0.enabled:create();
        l_v736_0.air_legs = v741:combo("Air Legs", {
            [1] = "Disabled", 
            [2] = "Static", 
            [3] = "Haram"
        });
        l_v736_0.ground_legs = v741:combo("Ground Legs", {
            [1] = "Default", 
            [2] = "Static", 
            [3] = "Jitter", 
            [4] = "Allah", 
            [5] = "Kangaroo"
        });
        l_v736_0.legs_offset_1 = v741:slider("Offset 1", 0, 100, 100);
        l_v736_0.legs_offset_2 = v741:slider("Offset 2", 0, 100, 100);
        l_v736_0.body_lean = v741:slider("Body Lean", -1, 100, -1, nil, function(v742)
            return v742 == -1 and "Off" or v742 .. "%";
        end);
        l_v736_0.pitch_on_land = v741:switch("Pitch on Land", true);
        v234.push(2, l_v736_0.enabled);
        local v743 = nil;
        local function v746(v744)
            -- upvalues: l_v736_0 (ref)
            local v745 = v744:get() == "Jitter";
            l_v736_0.legs_offset_1:visibility(v745);
            l_v736_0.legs_offset_2:visibility(v745);
        end;
        l_v736_0.ground_legs:set_callback(v746, true);
        l_settings_0.animation_breaker = l_v736_0;
        v741 = {
            label = l_l_presets_0_3:label("Fake Duck")
        };
        v741.options = v741.label:create():selectable("Options", {
            [1] = "Unlock Speed", 
            [2] = "On Freezetime"
        });
        v234.push(2, v741.label);
        v234.push(2, v741.options, {});
        l_settings_0.fake_duck = v741;
        v743 = {
            label = l_l_presets_0_3:label("Nickname Generator")
        };
        v746 = v743.label:create();
        v743.input = v746:input("##INPUT");
        v743.set_button = v746:button(v394("Set", 11), nil, false);
        v743.generate_button = v746:button(v394("Generate", 5), nil, true);
        v743.reset_button = v746:button(v394("Reset", 8), nil, true);
        l_settings_0.nickname_generator = v743;
        v746 = nil;
        v442:set_callback(function(v747)
            -- upvalues: l_l_presets_0_3 (ref)
            local v748 = v747:get() == 4;
            l_l_presets_0_3:visibility(v748);
        end, true);
        v360.misc = l_settings_0;
    end;
    l_presets_0 = nil;
    l_recorder_0 = ui.get_icon("sparkles");
    l_presets_0 = v30.create("~", "##COPYRIGHT", v371):label(v12("\a{Link Active}", l_recorder_0, l_v390_0(4), v15.name, "\aDEFAULT", " \226\128\148 2025"));
end;
v370 = nil;
v370 = {};
v371 = 0;
v374 = 0;
v370.is_onground = false;
v370.is_moving = false;
v370.is_crouched = false;
v370.is_peeking = false;
v370.is_vulnerable = false;
v370.velocity2d = 0;
v370.duck_amount = 0;
v370.team_num = 0;
v370.sent_packets = 0;
v370.forwardmove = 0;
v370.sidemove = 0;
v390 = function(v749, v750, v751)
    return v749 + v750 * (v751 * globals.tickinterval);
end;
do
    local l_v371_1, l_v374_2, l_v390_1, l_v394_0 = v371, v374, v390, v394;
    l_v394_0 = function(v756)
        -- upvalues: l_v390_1 (ref)
        local v757 = false;
        local v758 = false;
        local l_m_vecVelocity_0 = v756.m_vecVelocity;
        local v760 = v756:get_eye_position();
        local v761 = l_v390_1(v760, l_m_vecVelocity_0, 14);
        local v762 = entity.get_players(true);
        local v763 = entity.get_threat(true);
        for v764 = 1, #v762 do
            local v765 = v762[v764];
            if v765:is_alive() then
                if v765 == v763 then
                    v758 = true;
                else
                    local v766 = v765:get_hitbox_position(0);
                    local v767 = l_v390_1(v766, l_m_vecVelocity_0, 4);
                    local v768 = utils.trace_bullet(v756, v761, v767);
                    if v768 ~= nil and v768 > 0 then
                        v757 = true;
                        break;
                    end;
                end;
            end;
        end;
        return v757, v758;
    end;
    local function v773(v769)
        -- upvalues: l_v394_0 (ref), l_v371_1 (ref), v370 (ref)
        local v770 = entity.get_local_player();
        if v770 == nil then
            return;
        else
            local v771, v772 = l_v394_0(v770);
            l_v371_1 = v770.m_fFlags;
            v370.velocity2d = v770.m_vecVelocity:length2d();
            v370.is_peeking = v771;
            v370.is_vulnerable = v772;
            if v769.choked_commands == 0 then
                v370.duck_amount = v770.m_flDuckAmount;
                v370.sent_packets = v370.sent_packets + 1;
            end;
            v370.is_moving = v370.velocity2d > 3.63;
            v370.is_crouched = v370.duck_amount > 0;
            v370.team_num = v770.m_iTeamNum;
            v370.forwardmove = v769.forwardmove;
            v370.sidemove = v769.sidemove;
            return;
        end;
    end;
    local function v776(_)
        -- upvalues: l_v374_2 (ref), v370 (ref), l_v371_1 (ref)
        local v775 = entity.get_local_player();
        if v775 == nil then
            return;
        else
            l_v374_2 = v775.m_fFlags;
            v370.is_onground = bit.band(l_v371_1, 1) == 1 and bit.band(l_v374_2, 1) == 1;
            return;
        end;
    end;
    events.createmove(v773);
    events.createmove_run(v776);
end;
v371 = nil;
v371 = {};
v374 = nil;
v390 = 0;
v371.max_defensive_ticks = 0;
v371.defensive_ticks = 0;
v371.teleport_units_sqr = 0;
do
    local l_v374_3, l_v390_2, l_v394_1 = v374, v390, v394;
    l_v394_1 = function(v780)
        -- upvalues: l_v390_2 (ref), v371 (ref)
        local l_m_nTickBase_0 = v780.m_nTickBase;
        if math.abs(l_m_nTickBase_0 - l_v390_2) > 64 then
            l_v390_2 = 0;
        end;
        local v782 = 0;
        if l_v390_2 < l_m_nTickBase_0 then
            l_v390_2 = l_m_nTickBase_0;
        elseif l_m_nTickBase_0 < l_v390_2 then
            v782 = math.min(14, math.max(0, l_v390_2 - l_m_nTickBase_0 - 1));
        end;
        if v782 > 0 then
            if v371.max_defensive_ticks == 0 then
                v371.max_defensive_ticks = v782;
            end;
            v371.defensive_ticks = v782;
        else
            v371.defensive_ticks = 0;
            v371.max_defensive_ticks = 0;
        end;
    end;
    local function v785(v783, v784)
        -- upvalues: v371 (ref)
        v371.teleport_units_sqr = (v784 - v783):lengthsqr();
    end;
    local function v790(v786)
        -- upvalues: l_v374_3 (ref), v785 (ref)
        local v787 = v786:get_simulation_time();
        if v787 == nil then
            return;
        else
            local l_m_vecOrigin_0 = v786.m_vecOrigin;
            if l_v374_3 ~= nil then
                local v789 = to_ticks(v787.current - v787.old);
                if v789 < 0 or v789 > 0 and v789 <= 64 then
                    v785(l_v374_3, l_m_vecOrigin_0);
                end;
            end;
            l_v374_3 = l_m_vecOrigin_0;
            return;
        end;
    end;
    local function v792()
        -- upvalues: l_v394_1 (ref)
        local v791 = entity.get_local_player();
        if v791 == nil then
            return;
        else
            l_v394_1(v791);
            return;
        end;
    end;
    local function v794()
        -- upvalues: v790 (ref)
        local v793 = entity.get_local_player();
        if v793 == nil then
            return;
        else
            v790(v793);
            return;
        end;
    end;
    events.createmove(v792);
    events.net_update_start(v794);
end;
v374 = nil;
v374 = {};
v390 = nil;
v394 = function()
    -- upvalues: v370 (ref), v28 (ref)
    if v370.is_onground then
        if v28.antiaim.misc.slow_walk:get() then
            return "Slow motion";
        elseif not v370.is_moving then
            if v370.is_crouched then
                return "Crouching";
            else
                return "Standing";
            end;
        elseif v370.is_crouched then
            return "Move & Crouching";
        else
            return "Running";
        end;
    else
        return v370.is_crouched and "Air & Crouching" or "Air";
    end;
end;
do
    local l_v390_3, l_v394_2 = v390, v394;
    local function v797()
        -- upvalues: l_v390_3 (ref), l_v394_2 (ref)
        l_v390_3 = l_v394_2();
    end;
    v374.get = function()
        -- upvalues: l_v390_3 (ref)
        return l_v390_3;
    end;
    events.createmove(v797);
end;
v390 = nil;
v390 = {};
v394 = v29:new();
local v798 = {};
local function v802(v799)
    local l_tickcount_0 = globals.tickcount;
    local v801 = v799:get_eye_position();
    return {
        tick = l_tickcount_0, 
        player = v799, 
        eye_pos = v801, 
        impacts = {}
    };
end;
do
    local l_v394_3, l_v798_0, l_v802_0 = v394, v798, v802;
    local function v808(v806)
        -- upvalues: l_v798_0 (ref), l_v802_0 (ref)
        local v807 = entity.get(v806.userid, true);
        if v807 == nil then
            return;
        else
            table.insert(l_v798_0, l_v802_0(v807));
            return;
        end;
    end;
    local function v814(v809)
        -- upvalues: l_v798_0 (ref)
        local v810 = entity.get(v809.userid, true);
        local v811 = entity.get(v809.attacker, true);
        if v810 == nil or v811 == nil then
            return;
        else
            for v812 = #l_v798_0, 1, -1 do
                local v813 = l_v798_0[v812];
                if v813.player == v811 then
                    v813.victim = v810;
                    v813.damage = v809.dmg_health;
                    v813.hitgroup = v809.hitgroup;
                    break;
                end;
            end;
            return;
        end;
    end;
    local function v820(v815)
        -- upvalues: l_v798_0 (ref)
        local v816 = entity.get(v815.userid, true);
        if v816 == nil then
            return;
        else
            for v817 = #l_v798_0, 1, -1 do
                local v818 = l_v798_0[v817];
                if v818.player == v816 then
                    local v819 = vector(v815.x, v815.y, v815.z);
                    table.insert(v818.impacts, v819);
                    break;
                end;
            end;
            return;
        end;
    end;
    local function v832()
        -- upvalues: l_v798_0 (ref), l_v394_3 (ref), v16 (ref)
        local v821 = entity.get_local_player();
        if v821 == nil then
            return;
        else
            local v822 = nil;
            if v821:is_alive() then
                v822 = v821:get_hitbox_position(0);
            end;
            for v823 = 1, #l_v798_0 do
                local v824 = l_v798_0[v823];
                local v825 = #v824.impacts;
                if v825 ~= 0 then
                    local l_eye_pos_0 = v824.eye_pos;
                    local v827 = v824.impacts[v825];
                    l_v394_3.player_shot:fire({
                        tick = v824.tick, 
                        player = v824.player, 
                        victim = v824.victim, 
                        eye_pos = l_eye_pos_0, 
                        end_pos = v827, 
                        damage = v824.damage, 
                        hitgroup = v824.hitgroup
                    });
                    if v822 ~= nil and v824.player ~= nil and v824.player:is_enemy() then
                        local v828 = v16.closest_ray_point(l_eye_pos_0, v827, v822, true);
                        local v829 = v822.distsqr(v822, v828);
                        if v829 <= 6400 then
                            local v830 = math.sqrt(v829);
                            l_v394_3.enemy_shot:fire({
                                tick = v824.tick, 
                                distance = v830, 
                                player = v824.player, 
                                victim = v824.victim, 
                                eye_pos = l_eye_pos_0, 
                                end_pos = v827, 
                                damage = v824.damage, 
                                hitgroup = v824.hitgroup
                            });
                        end;
                    end;
                end;
            end;
            for v831 = 1, #l_v798_0 do
                l_v798_0[v831] = nil;
            end;
            return;
        end;
    end;
    v390.get_event_bus = function()
        -- upvalues: l_v394_3 (ref)
        return l_v394_3;
    end;
    events.weapon_fire(v808);
    events.player_hurt(v814);
    events.bullet_impact(v820);
    events.net_update_start(v832);
end;
v394 = nil;
v394 = {};
v798 = "lTZA7O1VkC3wj2YacHuBdMPRE8mtQXpnJKe5Ux9L4SIvNirWohDygszf60FbqG+/=";
v802 = ".\\" .. v15.name;
local v833 = v802 .. "\\db.dat";
local v834 = {};
do
    local l_v798_1, l_v802_1, l_v833_0, l_v834_0 = v798, v802, v833, v834;
    local function v839()
        -- upvalues: l_v833_0 (ref)
        return files.read(l_v833_0);
    end;
    local function v842(v840, v841)
        -- upvalues: l_v833_0 (ref)
        if v841 == nil then
            v841 = false;
        end;
        return files.write(l_v833_0, v840, v841);
    end;
    local function v848(v843)
        -- upvalues: l_base64_0 (ref), l_v798_1 (ref)
        local l_status_0, l_result_0 = pcall(json.stringify, v843);
        if not l_status_0 then
            return false, l_result_0;
        else
            local l_status_1, l_result_1 = pcall(l_base64_0.encode, l_result_0, l_v798_1);
            l_result_0 = l_result_1;
            if not l_status_1 then
                return false, l_result_0;
            else
                return true, l_result_0;
            end;
        end;
    end;
    local function v854(v849)
        -- upvalues: l_base64_0 (ref), l_v798_1 (ref)
        local l_status_2, l_result_2 = pcall(l_base64_0.decode, v849, l_v798_1);
        if not l_status_2 then
            return false, l_result_2;
        else
            local l_status_3, l_result_3 = pcall(json.parse, l_result_2);
            l_result_2 = l_result_3;
            if not l_status_3 then
                return false, l_result_2;
            else
                return true, l_result_2;
            end;
        end;
    end;
    local function v858(v855)
        -- upvalues: l_v802_1 (ref), v848 (ref), v45 (ref), v842 (ref)
        files.create_folder(l_v802_1);
        local v856, v857 = v848(v855);
        if not v856 then
            v45.error("Unable to encode data");
            return false;
        elseif not v842(v857) then
            v45.error("Unable to write db");
            return false;
        else
            return true;
        end;
    end;
    local function v862()
        -- upvalues: l_v802_1 (ref), v839 (ref), v858 (ref), v45 (ref), v854 (ref)
        files.create_folder(l_v802_1);
        local v859 = v839();
        if v859 == nil then
            if not v858({}) then
                v45.log("Unable to create db");
            end;
            return {};
        else
            local v860, v861 = v854(v859);
            if not v860 then
                v45.error("Unable to decode db");
                v45.log("Trying to flush db");
                if not v858({}) then
                    v45.error("Unable to flush db");
                end;
                return {};
            else
                return v861;
            end;
        end;
    end;
    local v868 = {
        __index = function(_, v864)
            -- upvalues: l_v834_0 (ref)
            return l_v834_0[v864];
        end, 
        __newindex = function(_, v866, v867)
            -- upvalues: l_v834_0 (ref), v858 (ref)
            l_v834_0[v866] = v867;
            v858(l_v834_0);
        end
    };
    l_v834_0 = v862();
    setmetatable(v394, v868);
end;
v798 = nil;
v798 = {};
v802 = {};
do
    local l_v802_2 = v802;
    v833 = function()
        -- upvalues: l_v802_2 (ref)
        local v870 = ui.get_binds();
        for v871 in pairs(l_v802_2) do
            l_v802_2[v871] = nil;
        end;
        for v872 = 1, #v870 do
            local v873 = v870[v872];
            l_v802_2[v873.reference:id()] = v873;
        end;
    end;
    v798.get = function(v874)
        -- upvalues: l_v802_2 (ref)
        if v874 == nil then
            return nil;
        else
            return l_v802_2[v874:id()];
        end;
    end;
    events.render(v833);
end;
v802 = nil;
v833 = v360.links;
v834 = nil;
local function v875()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/T6TderHP9D");
end;
local function v876()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://www.youtube.com/channel/UCW4y8iJYvrVVvcMrVbPnn_g");
end;
local function v877()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://anonteam.net/");
end;
v833.discord:set_callback(v875);
v833.youtube:set_callback(v876);
v833.config:set_callback(v877);
v833 = nil;
v833 = {};
v834 = v360.configs;
v875 = "MNVaEeiPfvJ4BgzWUmtsRZFS8OXc9kqhy3dobp5IDwuTAG6Kl2Cr7HnY10jxLQ+/=";
v876 = "qCfof7ezm72eRHQNXSfdzdvxSVf2Ba9CBaMlgrN9fowxSVfCgr9nzsyrgrN9foD2BY7ASVf2gsEnBo90goECSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsRHgaEHBaMHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsb7gsRlBrb1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2goUrgsy7BoEYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2grUYgof1Ba8HSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBrE2grBrBofCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaRngaMCzsR1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBsbnBobnBak9fowxSVfCgr9nzsyrgrN9foDHgY7ASVfrBoblBs82Bav9fowxSVfCgr9nzsyrgrN9foDr4eldgaMHBaU1BoEHBeldzIG9fofHgo82goRrgrZ9fowxSVfCgr9nzsyrgrN9foDlht29fo8lBa81go87BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBrbHgoECBoR1gpldzIG9fofYgr80zaBYBeldzoR1ht29foU2zaM2gaRHBrO9fowxSVfCgr9nzsyrgrN9foDrBP7ASVfYgoE1gs9ngrk9fowxSVfCgr9nzsyrgrN9foDGBoeQ4eldzaf2go92go9lSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQhS7d4Vfof7ezm72eRHQNXSfyvdNa95QH8n3wc59dzdvxSVfCBayYgsRYzs8nSVfjqHldBo9Ygob1Br9lSVfjBC29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29fofCga9HBrU2zsN9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCgaBrBsflBsf0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsMlBsB0grM2SVfjqHldBo9Ygob1Br9lSVfj4sfnht29foBlzaE2ga80BoN9fowxSVfCgr9nzsyrgrN9foDrgY7ASVfrBo9YgoRYBsUCSVfjqHldBo9Ygob1Br9lSVfjBS7ASVfrBr8ngsRCzaB7SVfjqHldBo9Ygob1Br9lSVfjgspQ4eldBrR2gs8HBoE2BeldzIG9fofYgr80zaBYBeldzoNQ4eldBr8ngrBrzsMrzeldzIG9fofYgr80zaBYBeldzofASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrzsfCBs9CBoe9fowxSVfCgr9nzsyrgrN9foDlht29foR2zsy7goM1zZldzIG9fofYgr80zaBYBeldzImCkFZQ4eldgobCgrRngsylSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf0Bs8YgrynBpldzIG9fofYgr80zaBYBeldzoNQ4eldzsbHBabYBse9fowxSVfCgr9nzsyrgrN9foDHzPHQfdldfCgNsbkBmZghUYvKkFgDXF0IfoDdqHldBsU0zsMCBa80BZldzIG9fofYgr80zaBYBeldzd7rBS7ASVf2gsB2gafCBr81SVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs8lBrB2Bo81geldzIG9fofYgr80zaBYBeldzoNQ4eldBoU2Bry0gsU1geldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCzabnBoRYzsO9fowxSVfCgr9nzsyrgrN9foDlht29fof0gaflzaflgsN9fowxSVfCgr9nzsyrgrN9foDlht29foB2zsM1zaRHgag9fowxSVfCgr9nzsyrgrN9fow79IZpht29foBCzsUnzsylgo39fowxSVfCgr9nzsyrgrN9foDlht29foBHBoBCgs8ngre9fowxSVfCgr9nzsyrgrN9foDlht29foBYBrUYBsfYgap9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfrgr8rBrBYgs92SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Bay0gaR1gsUlSVfjqHldBo9Ygob1Br9lSVfjBC29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foyrBoE0zaB7BpldzIG9fofYgr80zaBYBeldzoUHht29foy7zsyrBaR7BeldzIG9fofYgr80zaBYBeldzoNQhtfAfdBoUR0PsEZsS7O3XnZA8F9dzdvxSVf2BrErgof7goy1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsBHzsU0gaBCgZldzIG9fofYgr80zaBYBeldzoNQ4eldBs8Cgob0BsB1BZldzIG9fofYgr80zaBYBeldzoNQ4eldBs87zaE7grB0gHldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBrfHzsfHzsb0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaBHgr8CzsRHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsMCBr90Bs9YSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoblBrRngaBrBpldzIG9fofYgr80zaBYBeldzoNQ4eldBobYBsBngs9lzZldzIG9fofYgr80zaBYBeldzoNQ4eldBrBHgaM2BrBlBpldzIG9fofYgr80zaBYBeldzo8lht29foBnBoM0BrB1gsg9fowxSVfCgr9nzsyrgrN9foDlht29foBngaU1Ba97gom9fowxSVfCgr9nzsyrgrN9foDlht29foUlgsR7zsyYgae9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9fofHgo82goRrgrZ9fowxSVfCgr9nzsyrgrN9foDlht29fo8lBa81go87BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldgrBYBsf7BrU1SVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgNsbkBmZghmIvpOSg78F0bXF0IfoDdqHldBsB0zaBYgsb0zZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foEHBsRHgsfYgsp9fowxSVfCgr9nzsyrgrN9foDlht29fofCgob2gsyrBrN9fowxSVfCgr9nzsyrgrN9foDlht29fofrgrfHBofHgre9fowxSVfCgr9nzsyrgrN9foDlht29fofYBoB1gsB1zsg9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCzablBs9lBsv9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrErzaElBoE1BeldzIG9fofYgr80zaBYBeldzoNQ4eldBrUHBobCgs9HgpldzIG9fofYgr80zaBYBeldzoNQ4eldBryHBoMrgrynBeldzIG9fofYgr80zaBYBeldzofASVf7BaRlgayCBsRlSVfjqHldBoRngoEngsBYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMlgoyngoU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVf7BaMrBsM0gav9fowxSVfCgr9nzsyrgrN9foDlht29foUlgr97grB0zsO9fowxSVfCgr9nzsyrgrN9foDlht29fo92BrRHzaB0gZldzIG9fofYgr80zaBYBeldzoNQ4eldgrf7BsfYBoBnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfYzsbHBrBngsO9fowxSVfCgr9nzsyrgrN9foDnBPHQfdldfCgNsbkBmZghsFe6kFeAfep3kCfjfIG9foECBoBngsM7grk9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf2BoBngobrzaZ9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsRHBay1zs97gHldzIG9fofYgr80zaBYBeldzoNQ4eldBs9lgsR1gsf0gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoM1BsE0Ba91geldzIG9fofYgr80zaBYBeldzoNQ4eldBoBYBoyHBaE1zeldzIG9fofYgr80zaBYBeldzoNQ4eldBrMrgrf2Br92BHldzIG9fofYgr80zaBYBeldzoNQ4eldBrUCBaBHBay1BZldzIG9fofYgr80zaBYBeldzoNQ4eldBrUrzsflzaMHgHldzIG9fofYgr80zaBYBeldzoNQ4eldBr9rzsRnza90SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrza9YgoUCgoy2SVfjqHldBo9Ygob1Br9lSVfjBd29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foUCzabHBaU1gsv9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7zsErBr91gZldzIG9fofYgr80zaBYBeldzoNQ4eldzsEYgry0BaE1SVfjqHldBo9Ygob1Br9lSVfjgoNQhtfAfdBoUR0PsEZsS7HKk5RyvdNa95QH8n3wc59dzdvxSVfCBr9lgoy2BoR2SVfjqHldBo9Ygob1Br9lSVfjBsOQ4eldBoU1za8rBsyrgpldzIG9fofYgr80zaBYBeldzovQ4eldBoRrBaU7zaBHBHldzIG9fofYgr80zaBYBeldzoNQ4eldBo81BsyCza9rSVfjqHldBo9Ygob1Br9lSVfjBd29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof0BrR1BoE0BHldzIG9fofYgr80zaBYBeldzoNQ4eldBr82gaBlgr80BeldzIG9fofYgr80zaBYBeldzo8lht29foBYgrRlzs90gsO9fowxSVfCgr9nzsyrgrN9fow79IZpht29foB1gsf7gay1gae9fowxSVfCgr9nzsyrgrN9foDGgsmQ4eldBryHzaB2Bo8lzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrbnzsb1BoB7gZldzIG9fofYgr80zaBYBeldzoBASVf7BaRlgayCBsRlSVfjqHldBoRngoEngsBYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMlgoyngoU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVf7BaRCgsU1BrU0SVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgoR0Bo8rBsUHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnzsf7BsMrBoN9fowxSVfCgr9nzsyrgrN9foDGzP7ASVf1zsECBabHgok9fowxSVfCgr9nzsyrgrN9foDlhS7d4Vfof7ezm72eRHQWcdNH9nRdzdvxSVf2BafngrUHBoE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2Ba8HgoR7Br9CSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foErzaRYBr81Bo39fowxSVfCgr9nzsyrgrN9foDlht29foEnga8YgoErBsp9fowxSVfCgr9nzsyrgrN9foDlht29foE0goUrBrRlBop9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCgrbHgoR7BsfrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgs9YBaECgo39fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9fofHgo82goRrgrZ9fowxSVfCgr9nzsyrgrN9foDlht29fo8lBa81go87BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBr87Bo8lgsbnBeldzIG9fofYgr80zaBYBeldzo8lht29foBngr90BaE2zs39fowxSVfCgr9nzsyrgrN9foDlht29foUlgay0grbrgrZ9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7BaRlBr80Br87SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BsUCgoMngoN9fowxSVfCgr9nzsyrgrN9foDlht29foUHgab0zsfYgpldzIG9fofYgr80zaBYBeldzoNQ4eldzaU2BrU2go97SVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgNsbkBmZghRIZ6c5p6OCfjfIG9foElzaE1Ba90Bag9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf2BoErgrEngsEYSVfjqHldBo9Ygob1Br9lSVfjBsOQ4eldBsRrBrU7BoMCzeldzIG9fofYgr80zaBYBeldzo8lht29foE0gaMlzsRnBsk9fowxSVfCgr9nzsyrgrN9foDlht29foflBa91zs80zsm9fowxSVfCgr9nzsyrgrN9foDlht29foflgrRnzsyrgre9fowxSVfCgr9nzsyrgrN9foDlht29fofYBoRCgo8HBsZ9fowxSVfCgr9nzsyrgrN9foDlht29fofYgab2gaM2BoO9fowxSVfCgr9nzsyrgrN9foDCht29foB2gsb1BrE7Bag9fowxSVfCgr9nzsyrgrN9foDr4eldgaMHBaU1BoEHBeldzIG9fofHgo82goRrgrZ9fowxSVfCgr9nzsyrgrN9foDlht29fo8lBa81go87BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBrb2zsy1BoEnBpldzIG9fofYgr80zaBYBeldzd7CBP7ASVf7Bs90gs9rgsN9fowxSVfCgr9nzsyrgrN9fow79IZpht29foUnBryCgob1gHldzIG9fofYgr80zaBYBeldzd77gS7ASVfYBrErBoUlgag9fowxSVfCgr9nzsyrgrN9foDlht29fo9HBoU1BaMHzZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgNsbkBmZghRne5OtNfOFebfoDdqHldBsMngaf2go8nzeldzIG9fofYgr80zaBYBeldzo8lht29foECBsUlBsE2BsZ9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBs97BoE0gr81BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsb0BsMlBsEYgeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflgsbCzaE7Bop9fowxSVfCgr9nzsyrgrN9foDlht29foflzsU1BsBnzsp9fowxSVfCgr9nzsyrgrN9foDGBsNQ4eldBoBCBrBYBoBlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoRnBrUHBrflBpldzIG9fofYgr80zaBYBeldzoNQ4eldBo9CgoElBr9YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy1zsRYgaEYBZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBoRngoEngsBYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMlgoyngoU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfrBsRHzabrgsyrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrB1ga9lza9CBHldzIG9fofYgr80zaBYBeldzoNQ4eldBrb7gab2BrUngHldzIG9fofYgr80zaBYBeldzoNQ4eldgaMrgaf1BrEHSVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgNsbkBmZghRn3395ZbfoDdqHldBsf2grU2BoR0BHldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2gsB7go9rgo39fowxSVfCgr9nzsyrgrN9foDlht29foEHBr97zsRlgap9fowxSVfCgr9nzsyrgrN9foDlht29foEYzsyHBsbHgaN9fowxSVfCgr9nzsyrgrN9foDlht29fof1BaUnBoBrgsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof0ga97Bsfrgam9fowxSVfCgr9nzsyrgrN9foDlht29foBlgoE1gsy1zav9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf7BoMlgrBYgsbnSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaflBoECgrR1gZldzIG9fofYgr80zaBYBeldzoNQ4eldgaUHBs8CgsEYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgsM0gaR0gay0SVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foRngoM2zay1BZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMngrRYgabYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf0zsBlzsb1zsZ9fowxSVfCgr9nzsyrgrN9foDlhS7d4Vfof7ezm72eRHQsciQYfiHKkipKcdfjfIG9foErgoU1gaR0Bsv9fowxSVfCgr9nzsyrgrN9foDlht29foEHgoBCBrU7gZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2gs9CgoBlgaErSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaE7BaMHgrRYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zab0gaMrzam9fowxSVfCgr9nzsyrgrN9fow79IZpht29foE0zsEnBsR0gae9fowxSVfCgr9nzsyrgrN9foDlht29foflBr97zs8CBog9fowxSVfCgr9nzsyrgrN9foD7BI7ASVfCBsb7zsEYBof2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrRYgs82Bo8lSVfjqHldBo9Ygob1Br9lSVfj4sB1ht29fofrzsRHga87zZldzIG9fofYgr80zaBYBeldzo8lht29foBlBrElBoyrzsN9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfrgr91BrRYzsfHSVfjqHldBo9Ygob1Br9lSVfjBC29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foU2BoM1gaB7gse9fowxSVfCgr9nzsyrgrN9foDlht29foy2zsb7BabHgpldzIG9fofYgr80zaBYBeldzoNQhtfAfdBoUR0PsEZsSHg78F0bXF0IfoDdqHldBsfCgsBnBo82BeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2gsyCBsMHzsU1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gr82zs9lBr8lSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zsMCzaMnBoE1SVfjqHldBo9Ygob1Br9lSVfjBrgQ4eldBsb7Bsy0Brb7gpldzIG9fofYgr80zaBYBeldzoNQ4eldBo80Ba8rgsB1BZldzIG9fofYgr80zaBYBeldzoeQ4eldBoy0grUHzafnSVfjqHldBo9Ygob1Br9lSVfj4s80ht29fof0ga8lzabngok9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfrBa92BaEHBsM2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrBHzaR7gs8rgeldzIG9fofYgr80zaBYBeldzoBASVf7BaRlgayCBsRlSVfjqHldBoRngoEngsBYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMlgoyngoU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfrzsb0gaEHzaM2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfHBo9CBsUlzav9fowxSVfCgr9nzsyrgrN9foDlht29fo80BsfHzsM2gHldzIG9fofYgr80zaBYBeldzoNQ4eldzsfYBa8HgaBlSVfjqHldBo9Ygob1Br9lSVfjgoNQhtfAfdBoUR0RtRevsZQgURpzfoDdqHldBsR7goEHgr97geldzIG9fofYgr80zaBYBeldzoeQ4eldBrUlBrUrgoUlBeldzIG9fofYgr80zaBYBeldzImCkFZQhtfAfdBoUR0RtRevsZQsmZmRtR0PRCfjfIG9foflzabHgaU0zsN9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foEYBob1zsyCgsp9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCzsy1BrB2zay2SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fofHgo82goRrgrZ9fowxSVfCgsUCgoblgrk9fowcqHldBsUCgryHgsyrgpldz5O3cPgp4eldBs9rgs9lgoE1Bpldz5O3cPgp4eldBsbCzafCzs82SVfjkPvHOt29foE0BrU0gobYgeldzo8ASVfCBablgsEHBaE1SVfjBt29fofrzsb7gaM0BaZ9foDl4eldBrBlgrMnzaBnBHldz5O3cPgphZ7ASVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BoM1BsU0gsMCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgay2ga8nBry2SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCzafrgoE7zabCSVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQht29foBlzsb2goE0zsp9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9foflzsMCBrMYgog9fowxSVfCgr9nzsyrgrN9foD7BP7ASVfCBs9rBa81zaR0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoRCBaR2Brb7gZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHgsMngaE1gsp9fowxSVfCgr9nzsyrgrN9foD2hSHQ4eldBrRnBob1grb2BeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHgrRngo9lzsm9fowxSVfCgr9nzsyrgrN9foD2ht29fo97zablgsBngeldzIG9fofHgafnzsMYgHldzpGxSVf2gafYzaRHzaBnSVfjO5eA9nRASVf2grBHgrMnBsyCSVfjBV29foE0BoyCBobnBZldzoEASVf2zsB7zs80grm9foD0BV29foflzsMHBsRlBs39foDl4eldBoB0zsU7BablgZldzoMASVfrBrMYBa81Br8rSVfjO5eA9nZQ4PG9foE7Bo91gsR1BrO9fow58F2rOt29foEYBrRYBa82zav9foDl4eldBsbCzafCzs82SVfjBd29foE0BrU0gobYgeldzoy14eldBoM0BaR2gsM2zeldzoMASVfCBrb0gaUlzsMHSVfjBV29foBrBa9lgoyrgog9fow58F2rOSHk4eldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVfCgay2ga8nBry2SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCzafrgoE7zabCSVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQht29foyHBaM0zsRnBHldzIG9fofYgr80zaBYBeldz5O3cPgphS7d4Vfof7ezZEpNtRHhRHmNZERdzdvxSVf2BsM0BrB1BaBnSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2BsbrgryYgoRnSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2gaUrBob0gs91SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2gabYBafHBafHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsR1zsU0gaMnzZldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBs8YBrRrzsErgHldzIG9fofYgr80zaBYBeldzoNQ4eldBs8YBr9CgrU7BHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBs9CgrU7zaUYgZldzIG9fofYgr80zaBYBeldzoNQ4eldBs91goE2ga8rSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaE2gobHBaRCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zab1BrUlgablSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsb1BoblgsMnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrB1zs8nzsEnSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoBngoErBrMngHldzIG9fofYgr80zaBYBeldzoNQ4eldBoBnza82zsfnSVfjqHldBo9Ygob1Br9lSVfjBseQ4eldBoUlBrE0BofCBHldzIG9fofYgr80zaBYBeldzoNQ4eldBoR7grRYBafHgHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBo8CzaU0gsBHgHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBo81gsBCgav9fowxSVfCgr9nzsyrgrN9foDlht29fof1grB7BoBHBaO9fowxSVfCgr9nzsyrgrN9foDlht29foBlzs9lgrU1grZ9fowxSVfCgr9nzsyrgrN9fow79IZpht29foB2BablgrMHzaN9fowxSVfCgr9nzsyrgrN9foDlht29foBrBoM2goMCBrp9fowxSVfCgr9nzsyrgrN9foDlht29foB7BobCzs9YBre9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrzaUCBob1Bsy7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfHzaU1zsE0Bo39fowxSVfCgr9nzsyrgrN9fow79IZpht29foyrBs91BsErgHldzIG9fofYgr80zaBYBeldzoNQhtfAfdBomEZimR0stZOeS7ew9dfjfIG9foElBry1Bsf1BrO9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf2BsU7Br97grbrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2BrMrzs9Yzse9fowxSVfCgr9nzsyrgrN9foD2ht29foE7gaU0BsU2gsv9fowxSVfCgr9nzsyrgrN9foDGgaZQ4eldBsUHgoR0BofnzeldzIG9fofYgr80zaBYBeldzoNQ4eldBsRrgr9Ygr82geldzIG9fofYgr80zaBYBeldzoNQ4eldBsylgoBlBaElBpldzIG9fofYgr80zaBYBeldzo8lht29foE1BsEnzsRlgsv9fowxSVfCgr9nzsyrgrN9foDlht29fof7BaR2zsU2gap9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCgrUCzsRHzaRHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgryrBsy1goB7SVfjqHldBo9Ygob1Br9lSVfjBsylht29foBHBayYzaRnBap9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsElBa91gaE7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrR1Bsb7ga97gpldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBrR0Ba80goe9fowxSVfCgr9nzsyrgrN9foD0BP7ASVfrgryrzs9HBrflSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzsfrgrblBsR0SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foU2BoRlgobngoZ9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf7Bof1zs8rzsbCSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fo8ngs87zaMCSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfYgo87BoRCBsm9fowxSVfCgr9nzsyrgrN9foDGzsNQhtfAfdBomEZimR0stZOeS7ew9dM5fEgCcYZoXip6OCfjfIG9foECgs8lBry2gsg9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf2BoylgaEHSVfjqHldBo9Ygob1Br9lSVfjBsfl4eldgaMHBaU1BoEHBeldzIG9foU2grBHBrE2gsp9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsR1zayHBrMlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsbCzsB7za8nSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2gofCgrU7BaUnSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs91gayYBobHBeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE1goy2gryrgoe9fowxSVfCgr9nzsyrgrN9foDlht29foE0Bsy2gaB7zsZ9fowxSVfCgr9nzsyrgrN9foD2ht29fof2Brf1zafngoO9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgaf1goE0zak9fowxSVfCgr9nzsyrgrN9foDlht29fof7zsy2ga9rgam9fowxSVfCgr9nzsyrgrN9foDlht29fof1goBrzaBlgr39fowxSVfCgr9nzsyrgrN9foDlht29fof0BoBnBr9rBsm9fowxSVfCgr9nzsyrgrN9foD2zaNQ4eldBob1gaylBo8rgpldzIG9fofYgr80zaBYBeldzoflht29foBlBrfYzs9nBrv9fowxSVfCgr9nzsyrgrN9foDY4eldgaMHBaU1BoEHBeldzIG9foB7BrU1zsMHBsp9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrElzsMYBaR1BeldzIG9fofYgr80zaBYBeldzoNQ4eldBrE0Br8HgoR2BpldzIG9fofYgr80zaBYBeldzoeQ4eldBrBHzaRnBs91BHldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf7grMnBsbYgoe9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfYzaM2gaUHgoe9fowxSVfCgr9nzsyrgrN9foDlht29fobrgoylBrB2zZldzIG9fofYgr80zaBYBeldzoNQhtfAfdBomEZimR0stZOeS7gCcYZoXip6OCfjfIG9foElBaEYBsb0gsm9fowxSVfCgr9nzsyrgrN9foDlht29foElgrR1BoMHgsO9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf2zaB2ga80grEYSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foE1Br9rzaf7zsm9fowxSVfCgr9nzsyrgrN9foD2ht29foE0gsRlgoEngre9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfCBsR7BrE0gr8YSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrbCBsR7zs9nSVfjqHldBo9Ygob1Br9lSVfjBsylht29fofngaB0goblBrv9fowxSVfCgr9nzsyrgrN9fow79IZpht29fof1grB7BoBHBaO9fowxSVfCgr9nzsyrgrN9foDlht29fof0zsU7BofHBsv9fowxSVfCgr9nzsyrgrN9fow79IZpht29foBHgsb1goMlgaO9fowxSVfCgr9nzsyrgrN9foDlht29foBnBsf7BoBYBaN9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrzaRHza97BsUCSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foB1zsBHgrylzaZ9fowxSVfCgr9nzsyrgrN9foD2ht29foUCBsf0gaf0zsk9fowxSVfCgr9nzsyrgrN9foDlht29fo8Hza8lBs9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfngoBCgrf7gsZ9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfngoRlgsylgHldzIG9fofYgr80zaBYBeldz5O3cPgpht29fo9nzsM7gsfCgpldzIG9fofYgr80zaBYBeldzoflht29foy1zaBrBoBHgpldzIG9fofYgr80zaBYBeldzoNQ4eldzay0gaflgoR7SVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgEmROespgvZbZhm5eTOF23OCfjf50Hcild4Vfof7membZzR7pFmZQi95Zp9Ym3c5mwc59dzdvxSVf2Ba8rzsB2BoynSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gaUYzaU7ga82SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foE1goR7grE2BsO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2zabHgofrBrE1SVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foE0grRnzay1goe9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2zsyCzsMHBaO9fowxSVfCgr9nzsyrgrN9foDlht29foflBrfngoRHgrO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgsU0grBCzaEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgoU1grE0goM1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgoy1gsUYgoR1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsM7gaylzaB7SVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBobrga9ngr9CgZldzIG9fofYgr80zaBYBeldzoNQ4eldBrECgrB7BrRCgpldzIG9fofYgr80zaBYBeldzoNQ4eldBrB7za92BafrgpldzIG9fofYgr80zaBYBeldzoNQ4eldBrU7Bs9HgabCSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrUHgaM7goUrzZldzIG9fofYgr80zaBYBeldzoNQ4eldBry0BryCBo80gZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foB0ga9HBoUngop9fowxSVfCgr9nzsyrgrN9foDlht29fo8rBaMngo81zeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foy7gsE0BrMCBHldzIG9fofYgr80zaBYBeldzoflht29fobCBablgo9ngZldzIG9fofYgr80zaBYBeldzoNQhtfAfdBomEZimR0stZOeS7H3cIZ3cVNO8S9dzdvxSVf2BaflBrb7zaU0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsEngaB7zab0gHldzIG9fofYgr80zaBYBeldzoNQ4eldBsU7go92gr8ngpldzIG9fofYgr80zaBYBeldzoNQ4eldBsU1zsyHBsE2gHldzIG9fofYgr80zaBYBeldzoNQ4eldBsRlgaflBrbYgHldzIG9fofYgr80zaBYBeldzoECBV29foUlgsM7zaf2gsN9fowxSVf7Bs9rgsB2BsR0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foEngrR2Ba9HgeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2grM1gsR7zs8CSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBsM2BsbCBsfHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBofrBsfCBry2BpldzIG9fofYgr80zaBYBeldzoNQ4eldBoUlBrE0BofCBHldzIG9fofYgr80zaBYBeldzoNQ4eldBoRYBrRYgrE0gZldzIG9fofYgr80zaBYBeldzoNQ4eldBo87zaM2gsB1zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoyHBaRrzs87gHldzIG9fofYgr80zaBYBeldzoNQ4eldBrf2BsyrgrM2gHldzIG9fofYgr80zaBYBeldzo8lht29foB7BaBrBsfCBap9fowxSVfCgr9nzsyrgrN9foDlht29foB7BoE2Bob2grg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgr82zaM7BoEHSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldgaMHgs9lgrU2zZldzIG9fofYgr80zaBYBeldzoNQ4eldgafngaE1za8nzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foUngaBCgay7BHldzIG9fofYgr80zaBYBeldzo9ASVf7BaRlgayCBsRlSVfjqHldBrUrgay0BaR2zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfHgo92gsRrBsO9fowxSVfCgr9nzsyrgrN9foDCBPHQfdldfCgEmROespgvZbZhsFQnOtM5fEgCcYZoXip6OCfjfIG9foE2grMYBrM2gap9fowxSVfCgr9nzsyrgrN9fow79IZpht29foE7go91BrEHgap9fowxSVfCgr9nzsyrgrN9foDrgoNQ4eldBsR2goMCgayYBHldzIG9fofYgr80zaBYBeldzo8lht29foEngsRrgrBrBsk9fowxSVfCgr9nzsyrgrN9foDlht29foE1Bs8HBoynzsp9fowxSVfCgr9nzsyrgrN9foDCht29foflgry1grR2zaN9fowxSVfCgr9nzsyrgrN9foDlht29fof2gsMnBob2Brv9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgs92BrE2gaM0SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCgo97Bo9CBab1SVfjqHldBo9Ygob1Br9lSVfjBS7ASVfCzsBHzaU2BsB1SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof0Bryrzsf2gre9fowxSVfCgr9nzsyrgrN9foDGgaZQ4eldBrfYBofrBsR7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBrflBs8lBoB0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgaynBoyYBs9HSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBr9rgoEHgsb1BZldzIG9fofYgr80zaBYBeldzoECBV29foUlgsM7zaf2gsN9fowxSVf7Bs9rgsB2BsR0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBYgrU7Bablgsk9fowxSVfCgr9nzsyrgrN9foDlht29foUCgs9rBoBlBHldzIG9fofYgr80zaBYBeldzoNQ4eldgsBCBrf2zsBrSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfnBaB7zsUHBrv9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf1BaB2gsf0gsZ9fowxSVfCgr9nzsyrgrN9foDY4eldgaMHBaU1BoEHBeldzIG9foB7BrU1zsMHBsp9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldzsbYgaf7ga81SVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgEmROespgvZbZhsn1ykSgpfoDdqHldBsMnBsMrza8YzZldzIG9fofYgr80zaBYBeldzoNQ4eldBsR2BoR7BoBrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBs8YBoflBofrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaM1Bob2gsMrSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBsbnBsRngsErBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoB2BoRCgs9ngpldzIG9fofYgr80zaBYBeldzoNQ4eldBoRCgsMnzsBnBpldzIG9fofYgr80zaBYBeldzoflht29fofngoElBoE0zae9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCgoyHBrf7BpldzIG9fofYgr80zaBYBeldzoNQ4eldBoyCgr9nBsRlBZldzIG9fofYgr80zaBYBeldzoNQ4eldBrMlgaBYBoEYBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrB7gaUHgrfYgpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBYBa92zay7Bov9fowxSVfCgr9nzsyrgrN9foDY4eldgaMHBaU1BoEHBeldzIG9foB7BrU1zsMHBsp9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBr92grMrBa9lzeldzIG9fofYgr80zaBYBeldzo8lht29foB0BrR2gsE1geldzIG9fofYgr80zaBYBeldz5O3cPgpht29foB0zs8CBaM0Bs39fowxSVfCgr9nzsyrgrN9foDlht29foU2BobHgoUCgak9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7BsbrBoR0za80SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foUrgaR2zaEnzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foy2gsUnzs8YBpldzIG9fofYgr80zaBYBeldzoNQ4eldzaUYBsM7zaErSVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgEmROespgvZbZhRIZ6c5p6OCfjfIG9foElgaElza97grO9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsf7Bo9Hgo8YBZldzIG9fofYgr80zaBYBeldzoNQ4eldBsBCgsBnBsBrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBsB0zsyCBsylgHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE7grUCgrU2grm9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2zaf7zs92gsbrSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBoMCBr9Hgr91zZldzIG9fofYgr80zaBYBeldzo9ASVf7BaRlgayCBsRlSVfjqHldBrUrgay0BaR2zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBsBlBo90BoM7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrU1gsRrBofYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBo9YBs9CBsblgZldzIG9fofYgr80zaBYBeldzoNQ4eldBoyrBrRnBo9lBZldzIG9fofYgr80zaBYBeldzoNQ4eldBobrzaRrBsyHzZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBlgr9Cgsy2BoO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBof7Boy2gsy1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBoU7gsBlBrbYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgafCBrB7gsU1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgoUnzsbnBaB1SVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldgaM0BoM2BsyYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7gof7zabrBoO9fowxSVfCgr9nzsyrgrN9foDlht29foUngrfrBrBHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldzaB2gry2BsBYSVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgEmROespgvZbZhRne5OtNfOFebfoDdqHldBsE7gsMHza91zeldzIG9fofYgr80zaBYBeldzoNQ4eldBsU7gaM1ga8nBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE7gaylgrBrgae9fowxSVfCgr9nzsyrgrN9foDlht29foEngrBHBrb2Brk9fowxSVfCgr9nzsyrgrN9foDlht29foEYzsUHBry2gag9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2zsbnBsf1BrErSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBoE2gsU2gsU7BHldzIG9fofYgr80zaBYBeldzoNQ4eldBofCzaylBrM7BZldzIG9fofYgr80zaBYBeldzoNQ4eldBoU2BoRrzsBrBZldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofHBsBYBsUrgs39fowxSVfCgr9nzsyrgrN9foDCBP7ASVfCgsRlza87zs9lSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgoRHzsy0gr9rSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fofnzsBnzsBYBsO9fowxSVfCgr9nzsyrgrN9foDlht29foBlgsyHgsf1Bam9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrEnBsR1za9rgeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBrzaE7Baf1gsm9fowxSVfCgr9nzsyrgrN9foDlht29foBnBsbCBrylgog9fowxSVfCgr9nzsyrgrN9foDlht29foU2grM0BaB7zag9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfnBoUHBsf1gov9fowxSVfCgr9nzsyrgrN9foDlht29fo8rgrU0zaECgZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgoMHBrbHSVfjqHldBo9Ygob1Br9lSVfjBsfl4eldgaMHBaU1BoEHBeldzIG9foU2grBHBrE2gsp9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBomEZimR0stZOeSHgD8SvpOVfjfIG9foElzayCza9Czap9fowxSVfCgr9nzsyrgrN9foDlht29foEngsEYzsEHBsp9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf2grynBsE7gog9fowxSVfCgr9nzsyrgrN9foDlht29foE0gsU7zaBngs39fowxSVfCgr9nzsyrgrN9foDlht29fof2zaU7BafrBak9fowxSVfCgr9nzsyrgrN9foDlht29fof7goUCzaB0zak9fowxSVfCgr9nzsyrgrN9foDlht29foB2Bsf1gofngeldzIG9fofYgr80zaBYBeldzoNQ4eldBrB2zsb1BoMCgpldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgabnBoEHgabYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrR7gaflgrBngeldzIG9fofYgr80zaBYBeldzoNQ4eldBrR1zablzs8YgpldzIG9fofYgr80zaBYBeldzoNQ4eldBryHzab7go87BHldzIG9fofYgr80zaBYBeldzo9ASVf7BaRlgayCBsRlSVfjqHldBrUrgay0BaR2zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrza81gry1zsf0SVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrblBsMnzsMrgZldzIG9fofYgr80zaBYBeldzoECBV29foUlgsM7zaf2gsN9fowxSVf7Bs9rgsB2BsR0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foUCBr92gsb2BoZ9fowxSVfCgr9nzsyrgrN9foDlht29foUCzaErBof7go39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7Bob2ga8lBsy1SVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldgsUHBo9rgaMHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgsynBo9nBry0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgoB0Bo87gayYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf0zsy1goBlBrm9fowxSVfCgr9nzsyrgrN9foDlhS7d4Vfof7membZzR7pFmZQsciQYfiHKkipKcdfjfIG9foEHzsyrBsUlgap9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2goE1gsbHzaEnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2go80goblBs9nSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBsbYgo8YBrbnBHldzIG9fofYgr80zaBYBeldzoNQ4eldBsb1BrfCzs8rgZldzIG9fofYgr80zaBYBeldzoflht29fofrBof2gaBrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBr8nBsBrBa8YSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaM1BaE1zs8YSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof1zsR2zay1gaO9fowxSVfCgr9nzsyrgrN9foDlht29fof0go8lBo9nBrk9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrBaErgoyrzay1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBaBYzabHBrfHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBoy2goMYgabrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrBnzsB1goR1zeldzIG9fofYgr80zaBYBeldzoNQ4eldBr8rBsMrBr92BeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgoU0ga9rgoM1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBr80Brynzsy7gHldzIG9fofYgr80zaBYBeldzoNQ4eldBrbYzaUHzsb1BZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foyCgr90BoR1BHldzIG9fofYgr80zaBYBeldzoNQ4eldzsEYzsB0zsB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf0zsMlgoU7BoZ9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgEmROespgvZbZhRYm3c5mwc59dzdvxSVf2BaMYgsb0BrN9fowxSVfCgr9nzsyrgrN9foDlht29foE2Bsf1BaB1Bsm9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2gaMrgsBrza82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gaRYBaylBoMlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaMYBsy1zse9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsyHza87gsE7BeldzIG9fofYgr80zaBYBeldzoNQ4eldBofYzaR7grUlSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fofrBrbHgaB0Ba39fowxSVfCgr9nzsyrgrN9foDlht29fofrgs82gobnBav9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCgsUlgaB2BaBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgrynza80grO9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrgaErBaUlBoRrSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBrRlgofYzs91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRlgo87gryHBZldzIG9fofYgr80zaBYBeldzoNQ4eldBr8ngrMlgo91geldzIG9fofYgr80zaBYBeldzoECBV29foUlgsM7zaf2gsN9fowxSVf7Bs9rgsB2BsR0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBYBaR2zsU7zsm9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgrUrBa82gaBHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrzaUCBob1Bsy7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBrBnBo97zsg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf1Baf0BaB1Brm9fowxSVfCgr9nzsyrgrN9foDlht29fobYBsU2gr82BHldzIG9fofYgr80zaBYBeldzoNQhtfAfdBosRpsUCfjfIG9foE7BrUnzsfngov9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfrBr8YgoR0zsfHSVfjqHldBo9Ygob1Br9lSVfjBoMlhSHQ4eldBs92zaf7gr9YgHldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBa92BaM2BHldzIG9fofYgr80zaBYBeldzoElBP7ASVf2BaMYBsMlBsm9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBoBrBaBngrfCgZldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofHgobYgs9lgag9fowxSVfCgr9nzsyrgrN9foDGBS7ASVfrzsfnzaMlBsv9fowxSVfCgr9nzsyrgrN9foD2ht29foylgoblgoBngHldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2zaMngoy1BaBHSVfjqHldgaMHBaU1BoEHBeldzIG9foBHBrUCgrfnBoZ9fowxSVfCgr9nzsyrgrN9foDChSHQ4eldBof1Brf1go9CBeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofrBsBCBsM0Bap9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofngo8HBoBnBrZ9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofYgsBYgoMCzak9fowxSVfCgr9nzsyrgrN9fow79IZpht29foBlgrB1goRnzsO9fowxSVfCgr9nzsyrgrN9fow79IZpht29foBHBr81BoEYza39fowxSVfCgsUCgoblgrk9fowcqHldBsUCgryHgsyrgpldz5O3cPgp4eldBs9rgs9lgoE1Bpldz5O3cPgp4eldBsbCzafCzs82SVfjkPvHOt29foE0BrU0gobYgeldzoEASVfCBablgsEHBaE1SVfjBt29fofrzsb7gaM0BaZ9foDl4eldBrBlgrMnzaBnBHldz5O3cPgphZ7ASVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfCzsECBrfrgsy1SVfjqHldBo9Ygob1Br9lSVfjBokQhS7ASVfHBryrBo91gre9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9fofCgabCBaUCgsZ9fowxSVfCgr9nzsyrgrN9foDCBaUYht29fofHgrRrgsM7zak9fowxSVfCgr9nzsyrgrN9foDrht29foB1Brb1BsB1grZ9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29fo8HgrfYzaBCBpldzIG9foUlgsM7zaf2gsN9fowxSVf2gsB0grR1BaRnSVfjcIZAcV29foB2goU2BrM7zZldz50HcilASVfrgr9rgrb0BrRHSVfjqHldBo9Ygob1Br9lSVfjSVv9fI7ASVfnBrUrBr9rBoN9fow6kF2AhS7ASVfngsbHBaBYzsO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfYgafngobHBag9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgtURkeUbQRfoDdqHldBsMlgo91BobrBpldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foEnBo9YgaUlga39fowxSVfCgr9nzsyrgrN9foDCht29foE1zsMlgaE0gom9fowxSVfCgr9nzsyrgrN9foDrgS7ASVfCBs9YBsbrBrv9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1l4eldBs9Ygo9nSVfjBV1l4eldBs9YgoyYSVfjBV1YzaUrBsBYzs90gsMYgaUnhZHQht29foflzsMHBsRlBs39foDlhS7ASVfCBrRlBa80BrN9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfCgsfnzaRYgaE0SVfjqHldBo9Ygob1Br9lSVfjBreQ4eldBo81BrRrBoMCzeldzIG9fofYgr80zaBYBeldzofHht29fof0grbngaElgoZ9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgafHgrRCgsv9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgoflgsUYzsm9fowxSVfCgr9nzsyrgrN9foDCzP7ASVfHBoyrgaUCBoO9fowxSVfCgr9nzsyrgrN9foDYhSHQ4eldBoM1zsBCzsf2BeldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBoM1zsE7goRCgpldzIG9fofYgr80zaBYBeldzoElBP7ASVfCBay0Brf0BoMnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBablBoBlgr8rSVfjqHldBo9Ygob1Br9lSVfjgS7ASVfrBrU1gsElgsM1SVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrBngo90zs9lBpldzIG9fofYgr80zaBYBeldzoZQ4eldBrU7BsUHBsflzZldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVflSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oB2Br9CgsRlBsf0zablgaUASVf2gr9ngrO9foDl4oyCgrUHBsMHBaf1BsRCga9ASVf2gr9nzak9foDl4o8rzsf2gs9lgr9YzabrBakQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29foB7zs9lBoR1goN9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1lza8CgrUHBsf2Bsf2gaMngd29foEYgr8YgpldzoM6BaynBo97gsECBsECBsUlgo8ASVf2gr9nzak9foDl4oM1gofYgaR2BoE2BoE7Ba8nhZHQht29foflzsMHBsRlBs39foDlhS7ASVf0goU1BoErgrO9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1rBr9CgsU0BsEngoE2gaylgC29foEYgr8YgpldzoM6grU0BaE0gofCzaMCgrB7gV29foEYgr81gHldzoM6zsU2Bs9ngsBrgob0BaBHgIHkhS7ASVfCBablgsEHBaE1SVfjBPHQhS7ASVfCzaR1gsfCBsB7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBoRCgoyHgrU2zZldzIG9fofYgr80zaBYBeldzoEHht29fofYgoBrgaE7Brm9fowxSVfCgr9nzsyrgrN9foD1BP7ASVf7BoMHzab7goy1SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof0gry1zsfnBZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBs8lzabYBoO9fowxSVfCgr9nzsyrgrN9foDlht29foElgay0grR1Brk9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2Ba9Cgry7grR7SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBsE2BoECzaflgpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE2BrflBrUlgrv9fowxSVfCgr9nzsyrgrN9foD1BP7ASVf2BsRCgs87gr9lSVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Bs9nBrRlBr97SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBsflBab2goECBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foECgoRlzsRrgr39fowxSVfCgr9nzsyrgrN9foD1BP7ASVf2BoyCBob1BsbYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsf0goUrBoR2gZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foErBs92BoU1BZldzIG9fofYgr80zaBYBeldzoylht29foErBo8ngrMrgrv9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2BrUlzaM7goblSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsU2BafCgaBrBpldzIG9fofYgr80zaBYBeldzoylht29foE7Bry7grMHBsp9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2gaUngr9lzaylSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsU7zaE0gsElBeldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoU1zsMYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foEHBrf1BsU2gam9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2gsBngaMHBoyrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsUlgs9CgrbYSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsR1Ba81gay0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2goE2BrfHzsRCSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBs82BoE1BaMlBpldzIG9fofYgr80zaBYBeldzovQ4eldBs8CBsRYzabrBeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foEngrM1gsBHBrk9fowxSVfCgr9nzsyrgrN9foDlht29foEngryYBsy1gsN9fowxSVfCgr9nzsyrgrN9foDlht29foEnzsElgsE7gov9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2gob1gaMYga8YSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBs9lBa8YgayCBHldzIG9fofYgr80zaBYBeldzoRlht29foEYBsB0Bofnzav9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2grEHBr9HgpldzIG9fofYgr80zaBYBeldzovQ4eldBs9rzsbrzaE2BpldzIG9fofYgr80zaBYBeldzoRlht29foEYgaBrgaRCgoO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2zaf2BrRYzsU2SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBsyCzsfCgoyrBpldzIG9fofYgr80zaBYBeldzoRlht29foE1gaE7Brf2zsp9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2zaU0BayYgryCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaU0Br91Bay7SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsyHBo9nBa8lgpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE1gofHzaf2gZldzIG9fofYgr80zaBYBeldzoNQ4eldBsyngoy0gabCgeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE1zaUHzsM2Brv9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2zabnBrRrBobnSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsb2BaU1gr82geldzIG9fofYgr80zaBYBeldzoRlht29foE0BsyrgrUrgo39fowxSVfCgr9nzsyrgrN9foDlht29foE0Bo9ngoM7Bo39fowxSVfCgr9nzsyrgrN9foD1BP7ASVf2zs92grUHBsBCSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsbYzs8HzsBrgHldzIG9fofYgr80zaBYBeldzovQ4eldBsb1goElBr80BHldzIG9fofYgr80zaBYBeldzoRlht29foflBafCgrM2zsg9fowxSVfCgr9nzsyrgrN9foDCht29foflBobrzsbYBrO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBaUrgsB7BaR7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoM7grf2BoUnBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflgo81zsR1ga39fowxSVfCgr9nzsyrgrN9foDCht29fof2BaB0BrU1gr39fowxSVfCgr9nzsyrgrN9foDlht29fof2BaUYBsUnBsp9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBsE1zaU1zsBYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoEngrfHzab7zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoEYgoy0Bs81zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoE0BaMlgaUCgHldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofCBsBCBofCBsm9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCBoBHBrE1gab7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBoB0gaM0grMnSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBof1BrMlBoB0gpldzIG9fofYgr80zaBYBeldzoRlht29fofCzs91goUHgaO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCBrUngoyHgrZ9fowxSVfCgr9nzsyrgrN9foDCht29fofrgsUlgsE0Bsk9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgaMlBobCBZldzIG9fofYgr80zaBYBeldzoylht29fof7gof7BsbnBs39fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCgab7goU0gov9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgsR0zayHzs80SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBo8lBaf7go90zeldzIG9fofYgr80zaBYBeldzovQ4eldBo8lBrB1BsbHgZldzIG9fofYgr80zaBYBeldzoRlht29fofnBsUYBayngZldzIG9fofYgr80zaBYBeldzoRlht29fofnBrE7zsUnzag9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCgo8lzs82zaBHSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCgrf1zaR7grE7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBo9rgsBnBsf0gZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7BoUCgrfCzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof1gsMYBo9Hzap9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCza87za82zsMYSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBoyYBab7grRrSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBoyYgsE2gay1gZldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof1zsy1Bof2zae9fowxSVfCgr9nzsyrgrN9foDCht29fof0BaEYzabrgav9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCzsEngoflzsbCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsE1gaR0BsN9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCzsfngaMngofHSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBobrBr87gsR0gpldzIG9fofYgr80zaBYBeldzovQ4eldBobrgo9YBayHBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof0gsUCBsMYgr39fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrBaR0zaMCBo39fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrBayCgr8CgryYSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrElBob2gaMrzZldzIG9fofYgr80zaBYBeldzoRlht29foB2BaR7gsBCzsZ9fowxSVfCgr9nzsyrgrN9foDlht29foB2Bs91grbrzse9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBsfHBrElBrRnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrBsUYBrM2zs9HSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrE7zsfYBaB7geldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHBaR2goflgZldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHBoU1BsUHBpldzIG9fofYgr80zaBYBeldzoRlht29foB2goEYzaElgrN9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfrBs9rBrM2BsE7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrBsyCzaRngabYSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrfrgs8lgrU0gpldzIG9fofYgr80zaBYBeldzoRlht29foBCgaylga8ngrO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBo87BrRnBaErSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrBoylzsfnBrErSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrf0Bay0goBlBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBrBaRlgo8HBo39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBrfCBoEHBsE1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrB7grU2BsRnzZldzIG9fofYgr80zaBYBeldzoRlht29foBrgoMHga91Bsp9fowxSVfCgr9nzsyrgrN9foDCht29foBrgoR1zaEYgag9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfrgaMlBs8Cgs81SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrUrBrBYzsU1zZldzIG9fofYgr80zaBYBeldzoylht29foB7Bry7gsbngsk9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfrgaU7gaf0gofYSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBrU7gsbnzsM0SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrUHBsEnzsEYBpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foB7goflBrUCzaO9fowxSVfCgr9nzsyrgrN9foDCht29foB7zaU2BoyCBrg9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrgayngr9lBsblSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRYBaBnBay0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRYgoE2zsMnBZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHzafHgsyrgok9fowxSVfCgr9nzsyrgrN9foDCht29foBHza9rBsfCgHldzIG9fofYgr80zaBYBeldzoRlht29foBnBa9Hza91grv9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgoECgsBlgo8rSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrgoEYBs91zsfrSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBr87gsyrBobrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBr8nBafCgsElBHldzIG9fofYgr80zaBYBeldzoNQ4eldBr8YzaR7BoflgZldzIG9fofYgr80zaBYBeldzovQ4eldBr81BrR2goflgHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBYBaE1BoECgsZ9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrgrEHzsRHgs9rSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBr9ngry0BsMYgpldzIG9fofYgr80zaBYBeldzovQ4eldBr91zaB1BobnBpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBYzsBCgsy0zZldzIG9fofYgr80zaBYBeldzoNQ4eldBry7gry7gry2BHldzIG9fofYgr80zaBYBeldzoRlht29foB1gay7go80zsg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrza8rzaBrBrMnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrzabCBaR0goyrSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrblBaBlgrf1BZldzIG9fofYgr80zaBYBeldzoNQ4eldBrblgoB7BaRCBpldzIG9fofYgr80zaBYBeldzoylht29foB0BsU1BofHgpldzIG9fofYgr80zaBYBeldzoylht29foB0Bo9ngo9ngrZ9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfrzs9HBo9HBoBrSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrzsy0Bs9YBayYSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgaMlgrBrza8ngeldzIG9fofYgr80zaBYBeldzoRlht29foUlBsf7Baf1zaZ9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf7BaR7za9rBeldzIG9fofYgr80zaBYBeldzoylht29foUlzsM7Ba92gr39fowxSVfCgr9nzsyrgrN9foDHBP7ASVf7BsB0Ba92za9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BsRHBrfHBobYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaEYBrBlza91geldzIG9fofYgr80zaBYBeldz5O3cPgpht29foU2za9lBoUCgsp9fowxSVfCgr9nzsyrgrN9foD1BP7ASVf7BoEYgoylzsR0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaf1zsRHBrBCBHldzIG9fofYgr80zaBYBeldzoylht29foUCzabngs8lSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaB2BoM7gsB2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaU7za92gsECSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaUHBrB1zaU0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaU1zaMrzabYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldga97zaRnzaMHSVfjqHldBo9Ygob1Br9lSVfjBI7ASVf7zsfrzs8Hzak9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfHBaUYzsUrgsk9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfHBsE0go81BrO9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfHBrUnza9YBoN9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfHBrRYBaRrzav9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfHzsB2Bs9ngaO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfHzsyYBoR1BrO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfnBsBrgsy0gop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfnBoR7gaBlBok9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfnBrElgsU2grk9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfngafrBsyHBoO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfngs80gsEngsp9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfnzaBCBsfHzsm9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfnzaRrBoBnzZldzIG9fofYgr80zaBYBeldz5O3cPgpht29fo81zsfCBa9HgHldzIG9fofYgr80zaBYBeldz5O3cPgpht29fo9lBa9Hgrb2BeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fo9CzsBHzsUCgeldzIG9fofYgr80zaBYBeldzoNQ4eldgr82BablzsBCSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgry0zsb1Bab0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldza8HBrECzsyCSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldza9CgoyYBrZ9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf0BrE0grU7BrO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf0ga9YgaRYgaO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf0gsB0zsy2gav9fowxSVfCgr9nzsyrgrN9foDCht29fobHgoyrgrfCgpldzIG9fofYgr80zaBYBeldzoRlht29fobYBabYBsR7geldzIG9fofYgr80zaBYBeldzoRlht29fob1zsUYBsBlBeldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgtmRgWRbmeRpQNXSfdzdvxSVf2zay1BrRlzaB7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoRCzs9Yza80geldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldhS7d4VfofHveU7QtmEZtS7ew9dM5fEgCcYZoXip6OCfjfIG9foE0Baf7BsM0BaO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgry7gaflzsElSVfjqHldBo9Ygob1Br9lSVfjSVv9SeldFHH9SeldSVvQhtfAfdBoRbZasHvEmZvhUYvKkFgDXF0IfoDdqHldBrb1zaR7BsR2gpldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldht29foR0zaU2BsE0BpldzIG9fofYgr80zaBYBeldz5O3cPgphS7d4VfofHveU7QtmEZtS7O3XnZA8F9dzdvxSVfCBsR2BrMngs82SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrfnBo8YBsMnBZldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldhS7d4VfofHveU7QtmEZtS7OCOFZrkie6Oip6OCfjfIG9foflgryCBay0gam9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBsU0BrU7BsbnSVfjqHldBo9Ygob1Br9lSVfjSVv9SeldFHH9SeldSVvQhtfAfdBoRbZasHvEmZvhsFe6kFeAfep3kCfjfIG9foB7BofCzsy0BHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foR7grB1Bay1zZldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldhS7d4VfofHveU7QtmEZtS7HKk5RyvdNa95QH8n3wc59dzdvxSVf2BsbngoRHgrf2SVfjqHldBo9Ygob1Br9lSVfjSVv9SeldFHH9SeldSVvQ4eldBoEHgsM0go8nBZldzIG9fofYgr80zaBYBeldz5O3cPgphS7d4VfofHveU7QtmEZtS7Q6fPZrOtfjfIG9foEnBrR2zaE7Bo39fowxSVfCgr9nzsyrgrN9fow9fp29SVvcSZ29SVv9fI7ASVf2grB2goR7BoUlSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhtfAfdBoRbZasHvEmZvhRIZ6c5p6OCfjfIG9foECgsRnBrbCBog9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBr8YBaMrgrfrSVfjqHldBo9Ygob1Br9lSVfjSVv9SeldFHH9SeldSVvQhtfAfdBoRbZasHvEmZvhRne5OtNfOFebfoDdqHldBo91za8HgrE7gHldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldht29foBnzsB7zsU2Bsp9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgtmRgWRbmeRpQsXieCOFUdzdvxSVf2grynzsB0goU0SVfjqHldBo9Ygob1Br9lSVfjSVv9SeldFHH9SeldSVvQ4eldBsy1BrU2BoUnBZldzIG9fofYgr80zaBYBeldz5O3cPgphS7d4VfofHveU7QtmEZtSHgAcY9ycFQ7XFQ6foDdqHldBsfHBrblBsE1zZldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldht29foBlgrB1gsf0Bsg9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgtmRgWRbmeRpQskie6Oip6OCfjfIG9fof0goRlBrR0grN9fowxSVfCgr9nzsyrgrN9fow9fp29SVvcSZ29SVv9fI7ASVfngabYgaR1Br39fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgFtZgZUR2sfoDdqHldBsM2gr8rBs9YBeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElzaf0gsU2Bov9fowxSVfCgr9nzsyrgrN9foDlht29foflBoUngo8rzap9fowxSVfCgr9nzsyrgrN9foDlht29fofYzs80BrU7zag9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBt1l4eldBs9Ygo9nSVfjBt1l4eldBs9YgoyYSVfjBt1lhZHQht29foflzsMHBsRlBs39foDlhS7ASVfCzaMCzaUHgr9YSVfjqHldBo9Ygob1Br9lSVfjBS7ASVfrBsRnBs81gry2SVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foN9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoM6BV29foEYgr8YBZldzoE6BV29foEYgr8YgpldzoE6BV29foEYgr81gHldzoE6BPHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBrBlBaE1grylBpldzIG9fofYgr80zaBYBeldzoElgS7ASVfrBrU1gsElgsM1SVfjqHldBo9Ygob1Br9lSVfjBsNQhS7ASVf2BaRlzsElBrblSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2zsb0gayCzabYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBs9Ygo82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gr9ngov9fowxSVfCgr9nzsyrgrN9foDlht29foEYgr8nBHldzIG9fofYgr80zaBYBeldzoNQ4eldBsbrgaRHzsflSVfjqHldBo9Ygob1Br9lSVfjgoylBP7ASVfrgsErBo80Bay1SVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQht29foflga8ngoU1BoZ9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfCBs9YBsbrBrv9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBV12zs8lgry7gab7za9nza82gd29foEYgr8YBZldzoM6zaE0goMYzsErgab7BsElBt29foEYgr8YgpldzoM6goR7zsM2zsy2BrRrgrR0zV29foEYgr81gHldzoM6go97gsM0zafrBrfCBobnBSHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBoyHgr9YBrRCBZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBnBsy7goECBHldzIG9fofYgr80zaBYBeldzoEChSHQ4eldBofYzaUHgrbrSVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2gaB0zayrBsR2SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBr81za9Yzs39fowxSVfCgr9nzsyrgrN9foDlht29fofYzs80BrU7zag9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV11BsbnBa90BsB7zsU2BsM24eldBs9Ygo9nSVfjBV1ngsU0BaE0zaErgsBYgsb14eldBs9YgoyYSVfjBV1ngrUHBab1BoBrBofCzs82hZHQht29foflzsMHBsRlBs39foDlhS7ASVfrBsRnBs81gry2SVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foN9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoE6BV29foEYgr8YgpldzoE6BV29foEYgr81gHldzoE6BPHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBrB7zaR2BaRlzeldzIG9fofYgr80zaBYBeldzoUlht29foB0BaB2gsylgr39fowxSVfCgr9nzsyrgrN9fow79IZphSHQ4eldBoR2BaU0grUCBZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foErgoB1gsUngr39fowxSVfCgr9nzsyrgrN9fow79IZpht29foy1Bsy2Boy1gZldzIG9fofYgr80zaBYBeldzoBCgoB1hSHQ4eldBrfHBsR1gayngZldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsR7gsyCBoylgHldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVflSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foDl4oB0BoEHgoy0zabYgsBYBoBASVf2gr9ngre9foD24oMASVf2gr9ngrO9foD24oMASVf2gr9nzak9foD24oNQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29foflzab2BsB1BoN9fowxSVfCgr9nzsyrgrN9foDlht29fofrBsE0gry2gam9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBt1l4eldBs9Ygo9nSVfjBt1l4eldBs9YgoyYSVfjBt1lhZHQht29foflzsMHBsRlBs39foDlhS7ASVfrBrU1gsElgsM1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf7Bo81BobCgaBnSVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQht29foB7BrUHgofnBrm9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9fof7grblgof7gsN9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBV1YzaUrBsBYzs90gsMYgaUn4eldBs9Ygo92SVfjBt1l4eldBs9Ygo9nSVfjBt1l4eldBs9YgoyYSVfjBt1lhZHQht29foflzsMHBsRlBs39foDlhS7ASVfrBoUCBsyrgrf7SVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foN9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6gsy1BoBHBrE1go8lgrBnBt29foEYgr8YgpldzoM6gsy1BoBHBrE1go8lgrBnBt29foEYgr81gHldzoM6gsy1BoBHBrE1go8lgrBnBSHkhS7ASVfCBablgsEHBaE1SVfjBPHQhS7ASVfrgof7gsECzsp9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfCBr8nBoRrBsO9fowxSVfCgsRngoy1Bam9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBt1l4eldBs9Ygo9nSVfjBV1HBab1BaB0gsMYza8HzsMn4eldBs9YgoyYSVfjBV1HBab1BaB0gsMYza8HzsMnhZHQht29foflzsMHBsRlBs39foDlhS7ASVfCgr9nzsyrgrN9fow79IZpht29foblBobrgsMCzZldzIG9fofHgs8nzaylgeldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVflSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oBHBob7BsE1gsfrgsbYgrfASVf2gr9ngrO9foDl4oBHBob7BsE1gsfrgsbYgrfASVf2gr9nzak9foDl4obnBa91gaBYgs8ngrRYBIHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBo9Ygob1Br9lSVfjkPvHOSHQht29foB1BafCBr8lzag9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9fof2gr92zsBrBpldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVflSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oy2zs8lgrb2BrU0gaE2BaEASVf2gr9ngrO9foDl4o8HgablBsb1BsBHBr9HzsyASVf2gr9nzak9foDl4o8YgaRlzsyCBrBCBof0goeQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29fofrgoy1gr90zeldzIG9fofYgr80zaBYBeldzoeQhS7ASVf7Bs8HgrfHgr87SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsMngry1BsElBHldz50HcilASVfCga87BsylBoMYSVfjcIZAcV29foB7gaf7BsMHgpldz50HcilASVfrgry1grU7gr9nSVfjqHldBo9Ygob1Br9lSVfjBs8lht29foUrzsbYBa92zeldz50Hci2Qht29foy7Brb2gry2zZldzIG9foUlgsM7zaf2gsN9fowxSVfCBs9YBsbrBrv9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV11zsylBrbCzaErgoyCgsRn4eldBs9Ygo9nSVfjBV1nga9lgsy1gaUHgo8rgaRC4eldBs9YgoyYSVfjBV1Hgs81gofYgrEHBsElgr90hZHQht29foflzsMHBsRlBs39foDlhS7ASVfCBr81za9Yzs39fowxSVfCgr9nzsyrgrN9foDlht29foBrBaM2za91Bav9fowxSVfCgr9nzsyrgrN9foDlht29foUYgr8lgoR1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVf1zaE1Bsf1zaZ9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9fofrgoy1gr90zeldzIG9fofYgr80zaBYBeldzoeQ4eldBo90gobrgaU1BHldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVflSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oy2zs8lgrb2BrU0gaE2BaEASVf2gr9ngrO9foDl4o8HgablBsb1BsBHBr9HzsyASVf2gr9nzak9foDl4o8YgaRlzsyCBrBCBof0goeQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29foB2gs82goyYzae9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBt1l4eldBs9Ygo9nSVfjBt1l4eldBs9YgoyYSVfjBt1lhZHQht29foflzsMHBsRlBs39foDlhS7ASVfrBrU1gsElgsM1SVfjqHldBo9Ygob1Br9lSVfjBrvQhSHQfI7=";
do
    local l_v875_0, l_v876_0, l_v877_0 = v875, v876, v877;
    l_v877_0 = function(v881)
        -- upvalues: l_base64_0 (ref), l_v875_0 (ref)
        local l_status_4, l_result_4 = pcall(json.stringify, v881);
        if not l_status_4 then
            return false, l_result_4;
        else
            local l_status_5, l_result_5 = pcall(l_base64_0.encode, l_result_4, l_v875_0);
            l_result_4 = l_result_5;
            l_status_4 = l_status_5;
            if not l_status_4 then
                return false, l_result_4;
            else
                return l_status_4, l_result_4;
            end;
        end;
    end;
    local function v891(v886)
        -- upvalues: l_base64_0 (ref), l_v875_0 (ref)
        local l_status_6, l_result_6 = pcall(l_base64_0.decode, v886, l_v875_0);
        if not l_status_6 then
            return false, l_result_6;
        else
            local l_status_7, l_result_7 = pcall(json.parse, l_result_6);
            l_result_6 = l_result_7;
            if not l_status_7 then
                return false, l_result_6;
            else
                return true, l_result_6;
            end;
        end;
    end;
    local function v896()
        -- upvalues: v55 (ref)
        local v892 = {};
        local v893 = v55.get();
        for v894, v895 in pairs(v893) do
            v892[v894] = v895[1]:export();
        end;
        return v892;
    end;
    local function v903(v897)
        -- upvalues: v55 (ref), v234 (ref)
        local v898 = v55.get();
        for v899, v900 in pairs(v897) do
            local v901 = v898[v899];
            if v901 ~= nil then
                local v902 = v901[1];
                pcall(v902.import, v902, v900);
            end;
        end;
        v234.update();
    end;
    v833.encode = function(_, v905)
        -- upvalues: l_v877_0 (ref)
        return l_v877_0(v905);
    end;
    v833.decode = function(_, v907)
        -- upvalues: v891 (ref)
        return v891(v907);
    end;
    local _ = nil;
    local function v911()
        -- upvalues: l_v877_0 (ref), v896 (ref), l_clipboard_0 (ref), v45 (ref)
        local v909, v910 = l_v877_0(v896());
        if not v909 then
            return;
        else
            l_clipboard_0.set(v910);
            v45.success("exported config");
            return;
        end;
    end;
    local function v914(v912)
        local v913 = string.find(v912, "\000");
        if v913 == nil then
            return v912;
        else
            return v912:sub(1, v913 - 1);
        end;
    end;
    do
        local l_v914_0 = v914;
        local function v919()
            -- upvalues: l_clipboard_0 (ref), l_v914_0 (ref), v891 (ref), v903 (ref), v45 (ref)
            local v916 = l_clipboard_0.get();
            v916 = l_v914_0(v916);
            local v917, v918 = v891(v916);
            if not v917 then
                return;
            else
                v903(v918);
                v45.success("imported config");
                return;
            end;
        end;
        local function v922()
            -- upvalues: v891 (ref), l_v876_0 (ref), v903 (ref), v45 (ref)
            local v920, v921 = v891(l_v876_0);
            if not v920 then
                return;
            else
                v903(v921);
                v45.success("imported default config");
                return;
            end;
        end;
        v834.export:set_callback(v911);
        v834.import:set_callback(v919);
    end;
end;
v834 = nil;
v875 = v360.antiaim.presets;
v876 = "MNVaEeiPfvJ4BgzWUmtsRZFS8OXc9kqhy3dobp5IDwuTAG6Kl2Cr7HnY10jxLQ+/=";
v877 = "presets";
local v923 = {};
local v924 = v394[v877] or v923;
local v925 = {};
local v926 = {};
local v927 = nil;
local l_match_0 = string.match;
do
    local l_l_match_0_0 = l_match_0;
    v927 = function(v930)
        -- upvalues: l_l_match_0_0 (ref)
        return l_l_match_0_0(v930, "^()%s*$") and "" or l_l_match_0_0(v930, "^%s*(.*%S)");
    end;
end;
do
    local l_v875_1, l_v877_1, l_v924_0, l_v925_0, l_v926_0, l_v927_0, l_l_match_0_1 = v875, v877, v924, v925, v926, v927, l_match_0;
    l_l_match_0_1 = function()
        -- upvalues: v394 (ref), l_v877_1 (ref), l_v924_0 (ref)
        v394[l_v877_1] = l_v924_0;
    end;
    local function v943()
        -- upvalues: v55 (ref)
        local v938 = {};
        local v939 = v55.get();
        for v940, v941 in pairs(v939) do
            local v942 = v941[1];
            if v941[2] == "AA" then
                v938[v940] = v942:export();
            end;
        end;
        return v938;
    end;
    local function v950(v944)
        -- upvalues: v55 (ref)
        local v945 = v55.get();
        for v946, v947 in pairs(v944) do
            local v948 = v945[v946];
            if v948 ~= nil then
                local v949 = v948[1];
                if v948[2] == "AA" then
                    v949:import(v947);
                end;
            end;
        end;
    end;
    local function v955(v951, v952, v953, v954)
        return {
            name = v952, 
            author = v951, 
            content = v954, 
            created_at = v953, 
            updated_at = v953
        };
    end;
    local function v958(v956)
        -- upvalues: v943 (ref), v955 (ref)
        local v957 = v943();
        if v957 == nil then
            return nil;
        else
            return v955(common.get_username(), v956, common.get_unixtime(), v957);
        end;
    end;
    local function v962(v959)
        -- upvalues: v833 (ref), l_v925_0 (ref)
        if type(v959.content) == "string" then
            local v960, v961 = v833:decode(v959.content);
            if not v960 then
                return;
            else
                v959.content = v961;
            end;
        end;
        table.insert(l_v925_0, v959);
    end;
    local function v966(v963)
        -- upvalues: l_v926_0 (ref)
        for v964 = #l_v926_0, 1, -1 do
            local v965 = l_v926_0[v964];
            if v965.name == v963 then
                return v965, v964;
            end;
        end;
        return nil, -1;
    end;
    local function v968(v967)
        -- upvalues: l_v926_0 (ref)
        return l_v926_0[v967];
    end;
    local function v971(v969)
        -- upvalues: v966 (ref), l_v927_0 (ref), v950 (ref)
        local v970 = v966(l_v927_0(v969));
        if v970 == nil or v970.content == nil then
            return false, "Preset is not valid";
        else
            v950(v970.content);
            events.update_records:call();
            return true, v970;
        end;
    end;
    local function v978(v972)
        -- upvalues: l_v927_0 (ref), v966 (ref), v958 (ref), l_v924_0 (ref), l_l_match_0_1 (ref), l_v925_0 (ref), v943 (ref)
        v972 = l_v927_0(v972);
        local v973, v974 = v966(v972);
        if v973 == nil then
            local v975 = v958(v972);
            if v975 == nil then
                return false, "Unable to create preset";
            else
                table.insert(l_v924_0, v975);
                l_l_match_0_1();
                return true, v975;
            end;
        elseif v974 ~= -1 and v974 <= #l_v925_0 then
            return false, "Can't modify script preset";
        else
            local v976 = v943();
            if v976 == nil then
                return false, "Unable to export config";
            else
                local v977 = common.get_unixtime();
                v973.content = v976;
                v973.updated_at = v977;
                l_l_match_0_1();
                return true, v973;
            end;
        end;
    end;
    local function v983(v979)
        -- upvalues: v966 (ref), l_v927_0 (ref), l_v925_0 (ref), l_v924_0 (ref)
        local v980, v981 = v966(l_v927_0(v979));
        if v981 ~= -1 and v981 <= #l_v925_0 then
            return false, "Can't delete script preset";
        else
            local v982 = v981 - #l_v925_0;
            table.remove(l_v924_0, v982);
            return true, v980;
        end;
    end;
    local function v988()
        -- upvalues: l_v926_0 (ref), l_v925_0 (ref)
        local v984 = #l_v926_0;
        if v984 == 0 then
            return {
                [1] = "Empty"
            };
        else
            local v985 = {};
            for v986 = 1, v984 do
                local l_name_0 = l_v926_0[v986].name;
                if v986 <= #l_v925_0 then
                    l_name_0 = string.format("%s\a{Link Active}*", l_name_0);
                end;
                v985[v986] = l_name_0;
            end;
            return v985;
        end;
    end;
    local function v993()
        -- upvalues: l_v926_0 (ref), l_v925_0 (ref), l_v924_0 (ref)
        l_v926_0 = {};
        for v989 = 1, #l_v925_0 do
            table.insert(l_v926_0, l_v925_0[v989]);
        end;
        table.sort(l_v924_0, function(v990, v991)
            return v990.name < v991.name;
        end);
        for v992 = 1, #l_v924_0 do
            table.insert(l_v926_0, l_v924_0[v992]);
        end;
    end;
    local _ = nil;
    local function v998(v995)
        -- upvalues: v968 (ref), l_v875_1 (ref)
        local v996 = v995:get();
        if v996 == nil or v996 <= 0 then
            return;
        else
            local v997 = v968(v996);
            if v997 == nil then
                return;
            else
                l_v875_1.name:set(v997.name);
                return;
            end;
        end;
    end;
    local function v1001()
        -- upvalues: v971 (ref), l_v875_1 (ref), v45 (ref)
        local v999, v1000 = v971(l_v875_1.name:get());
        if not v999 then
            v45.error(v1000);
            return;
        else
            events.update_records:call();
            v45.success(string.format("preset %s loaded", v1000.name));
            return;
        end;
    end;
    local function v1004()
        -- upvalues: v978 (ref), l_v875_1 (ref), v45 (ref), v993 (ref), v988 (ref)
        local v1002, v1003 = v978(l_v875_1.name:get());
        if not v1002 then
            v45.error(v1003);
            return;
        else
            v993();
            l_v875_1.list:update(v988());
            v45.success(string.format("preset %s saved", v1003.name));
            return;
        end;
    end;
    local function v1007()
        -- upvalues: v983 (ref), l_v875_1 (ref), v45 (ref), v993 (ref), v988 (ref)
        local v1005, v1006 = v983(l_v875_1.name:get());
        if not v1005 then
            v45.error(v1006);
            return;
        else
            v993();
            l_v875_1.list:update(v988());
            if v1006 ~= nil then
                v45.success(string.format("preset %s deleted", v1006.name));
            end;
            return;
        end;
    end;
    local function v1011()
        -- upvalues: v943 (ref), v833 (ref), v45 (ref), l_clipboard_0 (ref)
        local v1008 = v943();
        if v1008 == nil then
            return;
        else
            local v1009, v1010 = v833:encode(v1008);
            if not v1009 then
                v45.error("can't encode data");
                return;
            else
                l_clipboard_0.set(v1010);
                v45.success("preset exported");
                return;
            end;
        end;
    end;
    local function v1015()
        -- upvalues: l_clipboard_0 (ref), v833 (ref), v45 (ref), v950 (ref)
        local v1012 = l_clipboard_0.get();
        local v1013, v1014 = v833:decode(v1012);
        if not v1013 then
            v45.error("can't decode data");
            return;
        else
            v950(v1014);
            events.update_records:call();
            v45.success("preset imported");
            return;
        end;
    end;
    l_v875_1.list:set_callback(v998);
    l_v875_1.load:set_callback(v1001);
    l_v875_1.save:set_callback(v1004);
    l_v875_1.delete:set_callback(v1007);
    l_v875_1.export:set_callback(v1011);
    l_v875_1.import:set_callback(v1015);
    v962(v955("isabel", "Default", -1, "qCfof7ezm72eRHQNXSfdzdvxSVf2Ba9CBaMlgrN9fowxSVfCgr9nzsyrgrN9foD2BY7ASVf2gsEnBo90goECSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsRHgaEHBaMHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsb7gsRlBrb1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2goUrgsy7BoEYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2grUYgof1Ba8HSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBrE2grBrBofCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaRngaMCzsR1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBsbnBobnBak9fowxSVfCgr9nzsyrgrN9foDHgY7ASVfrBoblBs82Bav9fowxSVfCgr9nzsyrgrN9foDr4eldgaMHBaU1BoEHBeldzIG9fofHgo82goRrgrZ9fowxSVfCgr9nzsyrgrN9foDlht29fo8lBa81go87BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBrbHgoECBoR1gpldzIG9fofYgr80zaBYBeldzoR1ht29foU2zaM2gaRHBrO9fowxSVfCgr9nzsyrgrN9foDrBP7ASVfYgoE1gs9ngrk9fowxSVfCgr9nzsyrgrN9foDGBoeQ4eldzaf2go92go9lSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQhS7d4Vfof7ezm72eRHQNXSfyvdNa95QH8n3wc59dzdvxSVfCBayYgsRYzs8nSVfjqHldBo9Ygob1Br9lSVfjBC29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29fofCga9HBrU2zsN9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCgaBrBsflBsf0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsMlBsB0grM2SVfjqHldBo9Ygob1Br9lSVfj4sfnht29foBlzaE2ga80BoN9fowxSVfCgr9nzsyrgrN9foDrgY7ASVfrBo9YgoRYBsUCSVfjqHldBo9Ygob1Br9lSVfjBS7ASVfrBr8ngsRCzaB7SVfjqHldBo9Ygob1Br9lSVfjgspQ4eldBrR2gs8HBoE2BeldzIG9fofYgr80zaBYBeldzoNQ4eldBr8ngrBrzsMrzeldzIG9fofYgr80zaBYBeldzofASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrzsfCBs9CBoe9fowxSVfCgr9nzsyrgrN9foDlht29foR2zsy7goM1zZldzIG9fofYgr80zaBYBeldzImCkFZQ4eldgobCgrRngsylSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf0Bs8YgrynBpldzIG9fofYgr80zaBYBeldzoNQ4eldzsbHBabYBse9fowxSVfCgr9nzsyrgrN9foDHzPHQfdldfCgNsbkBmZghUYvKkFgDXF0IfoDdqHldBsU0zsMCBa80BZldzIG9fofYgr80zaBYBeldzd7rBS7ASVf2gsB2gafCBr81SVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs8lBrB2Bo81geldzIG9fofYgr80zaBYBeldzoNQ4eldBoU2Bry0gsU1geldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCzabnBoRYzsO9fowxSVfCgr9nzsyrgrN9foDlht29fof0gaflzaflgsN9fowxSVfCgr9nzsyrgrN9foDlht29foB2zsM1zaRHgag9fowxSVfCgr9nzsyrgrN9fow79IZpht29foBCzsUnzsylgo39fowxSVfCgr9nzsyrgrN9foDlht29foBHBoBCgs8ngre9fowxSVfCgr9nzsyrgrN9foDlht29foBYBrUYBsfYgap9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfrgr8rBrBYgs92SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Bay0gaR1gsUlSVfjqHldBo9Ygob1Br9lSVfjBC29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foyrBoE0zaB7BpldzIG9fofYgr80zaBYBeldzoUHht29foy7zsyrBaR7BeldzIG9fofYgr80zaBYBeldzoNQhtfAfdBoUR0PsEZsS7O3XnZA8F9dzdvxSVf2BrErgof7goy1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsBHzsU0gaBCgZldzIG9fofYgr80zaBYBeldzoNQ4eldBs8Cgob0BsB1BZldzIG9fofYgr80zaBYBeldzoNQ4eldBs87zaE7grB0gHldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBrfHzsfHzsb0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaBHgr8CzsRHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsMCBr90Bs9YSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoblBrRngaBrBpldzIG9fofYgr80zaBYBeldzoNQ4eldBobYBsBngs9lzZldzIG9fofYgr80zaBYBeldzoNQ4eldBrBHgaM2BrBlBpldzIG9fofYgr80zaBYBeldzo8lht29foBnBoM0BrB1gsg9fowxSVfCgr9nzsyrgrN9foDlht29foBngaU1Ba97gom9fowxSVfCgr9nzsyrgrN9foDlht29foUlgsR7zsyYgae9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9fofHgo82goRrgrZ9fowxSVfCgr9nzsyrgrN9foDlht29fo8lBa81go87BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldgrBYBsf7BrU1SVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgNsbkBmZghmIvpOSg78F0bXF0IfoDdqHldBsB0zaBYgsb0zZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foEHBsRHgsfYgsp9fowxSVfCgr9nzsyrgrN9foDlht29fofCgob2gsyrBrN9fowxSVfCgr9nzsyrgrN9foDlht29fofrgrfHBofHgre9fowxSVfCgr9nzsyrgrN9foDlht29fofYBoB1gsB1zsg9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCzablBs9lBsv9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrErzaElBoE1BeldzIG9fofYgr80zaBYBeldzoNQ4eldBrUHBobCgs9HgpldzIG9fofYgr80zaBYBeldzoNQ4eldBryHBoMrgrynBeldzIG9fofYgr80zaBYBeldzofASVf7BaRlgayCBsRlSVfjqHldBoRngoEngsBYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMlgoyngoU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVf7BaMrBsM0gav9fowxSVfCgr9nzsyrgrN9foDlht29foUlgr97grB0zsO9fowxSVfCgr9nzsyrgrN9foDlht29fo92BrRHzaB0gZldzIG9fofYgr80zaBYBeldzoNQ4eldgrf7BsfYBoBnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfYzsbHBrBngsO9fowxSVfCgr9nzsyrgrN9foDnBPHQfdldfCgNsbkBmZghsFe6kFeAfep3kCfjfIG9foECBoBngsM7grk9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf2BoBngobrzaZ9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsRHBay1zs97gHldzIG9fofYgr80zaBYBeldzoNQ4eldBs9lgsR1gsf0gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoM1BsE0Ba91geldzIG9fofYgr80zaBYBeldzoNQ4eldBoBYBoyHBaE1zeldzIG9fofYgr80zaBYBeldzoNQ4eldBrMrgrf2Br92BHldzIG9fofYgr80zaBYBeldzoNQ4eldBrUCBaBHBay1BZldzIG9fofYgr80zaBYBeldzoNQ4eldBrUrzsflzaMHgHldzIG9fofYgr80zaBYBeldzoNQ4eldBr9rzsRnza90SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrza9YgoUCgoy2SVfjqHldBo9Ygob1Br9lSVfjBd29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foUCzabHBaU1gsv9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7zsErBr91gZldzIG9fofYgr80zaBYBeldzoNQ4eldzsEYgry0BaE1SVfjqHldBo9Ygob1Br9lSVfjgoNQhtfAfdBoUR0PsEZsS7HKk5RyvdNa95QH8n3wc59dzdvxSVfCBr9lgoy2BoR2SVfjqHldBo9Ygob1Br9lSVfjBsOQ4eldBoU1za8rBsyrgpldzIG9fofYgr80zaBYBeldzovQ4eldBoRrBaU7zaBHBHldzIG9fofYgr80zaBYBeldzoNQ4eldBo81BsyCza9rSVfjqHldBo9Ygob1Br9lSVfjBd29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof0BrR1BoE0BHldzIG9fofYgr80zaBYBeldzoNQ4eldBr82gaBlgr80BeldzIG9fofYgr80zaBYBeldzo8lht29foBYgrRlzs90gsO9fowxSVfCgr9nzsyrgrN9fow79IZpht29foB1gsf7gay1gae9fowxSVfCgr9nzsyrgrN9foDGgsmQ4eldBryHzaB2Bo8lzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrbnzsb1BoB7gZldzIG9fofYgr80zaBYBeldzoBASVf7BaRlgayCBsRlSVfjqHldBoRngoEngsBYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMlgoyngoU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVf7BaRCgsU1BrU0SVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgoR0Bo8rBsUHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnzsf7BsMrBoN9fowxSVfCgr9nzsyrgrN9foDGzP7ASVf1zsECBabHgok9fowxSVfCgr9nzsyrgrN9foDlhS7d4Vfof7ezm72eRHQWcdNH9nRdzdvxSVf2BafngrUHBoE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2Ba8HgoR7Br9CSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foErzaRYBr81Bo39fowxSVfCgr9nzsyrgrN9foDlht29foEnga8YgoErBsp9fowxSVfCgr9nzsyrgrN9foDlht29foE0goUrBrRlBop9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCgrbHgoR7BsfrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgs9YBaECgo39fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9fofHgo82goRrgrZ9fowxSVfCgr9nzsyrgrN9foDlht29fo8lBa81go87BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBr87Bo8lgsbnBeldzIG9fofYgr80zaBYBeldzo8lht29foBngr90BaE2zs39fowxSVfCgr9nzsyrgrN9foDlht29foUlgay0grbrgrZ9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7BaRlBr80Br87SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BsUCgoMngoN9fowxSVfCgr9nzsyrgrN9foDlht29foUHgab0zsfYgpldzIG9fofYgr80zaBYBeldzoNQ4eldzaU2BrU2go97SVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgNsbkBmZghRIZ6c5p6OCfjfIG9foElzaE1Ba90Bag9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf2BoErgrEngsEYSVfjqHldBo9Ygob1Br9lSVfjBsOQ4eldBsRrBrU7BoMCzeldzIG9fofYgr80zaBYBeldzo8lht29foE0gaMlzsRnBsk9fowxSVfCgr9nzsyrgrN9foDlht29foflBa91zs80zsm9fowxSVfCgr9nzsyrgrN9foDlht29foflgrRnzsyrgre9fowxSVfCgr9nzsyrgrN9foDlht29fofYBoRCgo8HBsZ9fowxSVfCgr9nzsyrgrN9foDlht29fofYgab2gaM2BoO9fowxSVfCgr9nzsyrgrN9foDCht29foB2gsb1BrE7Bag9fowxSVfCgr9nzsyrgrN9foDr4eldgaMHBaU1BoEHBeldzIG9fofHgo82goRrgrZ9fowxSVfCgr9nzsyrgrN9foDlht29fo8lBa81go87BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBrb2zsy1BoEnBpldzIG9fofYgr80zaBYBeldzd7CBP7ASVf7Bs90gs9rgsN9fowxSVfCgr9nzsyrgrN9fow79IZpht29foUnBryCgob1gHldzIG9fofYgr80zaBYBeldzd77gS7ASVfYBrErBoUlgag9fowxSVfCgr9nzsyrgrN9foDlht29fo9HBoU1BaMHzZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgNsbkBmZghRne5OtNfOFebfoDdqHldBsMngaf2go8nzeldzIG9fofYgr80zaBYBeldzo8lht29foECBsUlBsE2BsZ9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBs97BoE0gr81BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsb0BsMlBsEYgeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflgsbCzaE7Bop9fowxSVfCgr9nzsyrgrN9foDlht29foflzsU1BsBnzsp9fowxSVfCgr9nzsyrgrN9foDGBsNQ4eldBoBCBrBYBoBlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoRnBrUHBrflBpldzIG9fofYgr80zaBYBeldzoNQ4eldBo9CgoElBr9YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy1zsRYgaEYBZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBoRngoEngsBYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMlgoyngoU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfrBsRHzabrgsyrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrB1ga9lza9CBHldzIG9fofYgr80zaBYBeldzoNQ4eldBrb7gab2BrUngHldzIG9fofYgr80zaBYBeldzoNQ4eldgaMrgaf1BrEHSVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgNsbkBmZghRn3395ZbfoDdqHldBsf2grU2BoR0BHldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2gsB7go9rgo39fowxSVfCgr9nzsyrgrN9foDlht29foEHBr97zsRlgap9fowxSVfCgr9nzsyrgrN9foDlht29foEYzsyHBsbHgaN9fowxSVfCgr9nzsyrgrN9foDlht29fof1BaUnBoBrgsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof0ga97Bsfrgam9fowxSVfCgr9nzsyrgrN9foDlht29foBlgoE1gsy1zav9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf7BoMlgrBYgsbnSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaflBoECgrR1gZldzIG9fofYgr80zaBYBeldzoNQ4eldgaUHBs8CgsEYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgsM0gaR0gay0SVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foRngoM2zay1BZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMngrRYgabYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf0zsBlzsb1zsZ9fowxSVfCgr9nzsyrgrN9foDlhS7d4Vfof7ezm72eRHQsciQYfiHKkipKcdfjfIG9foErgoU1gaR0Bsv9fowxSVfCgr9nzsyrgrN9foDlht29foEHgoBCBrU7gZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2gs9CgoBlgaErSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaE7BaMHgrRYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zab0gaMrzam9fowxSVfCgr9nzsyrgrN9fow79IZpht29foE0zsEnBsR0gae9fowxSVfCgr9nzsyrgrN9foDlht29foflBr97zs8CBog9fowxSVfCgr9nzsyrgrN9foD7BI7ASVfCBsb7zsEYBof2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrRYgs82Bo8lSVfjqHldBo9Ygob1Br9lSVfj4sB1ht29fofrzsRHga87zZldzIG9fofYgr80zaBYBeldzo8lht29foBlBrElBoyrzsN9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfrgr91BrRYzsfHSVfjqHldBo9Ygob1Br9lSVfjBC29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foU2BoM1gaB7gse9fowxSVfCgr9nzsyrgrN9foDlht29foy2zsb7BabHgpldzIG9fofYgr80zaBYBeldzoNQhtfAfdBoUR0PsEZsSHg78F0bXF0IfoDdqHldBsfCgsBnBo82BeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2gsyCBsMHzsU1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gr82zs9lBr8lSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zsMCzaMnBoE1SVfjqHldBo9Ygob1Br9lSVfjBrgQ4eldBsb7Bsy0Brb7gpldzIG9fofYgr80zaBYBeldzoNQ4eldBo80Ba8rgsB1BZldzIG9fofYgr80zaBYBeldzoeQ4eldBoy0grUHzafnSVfjqHldBo9Ygob1Br9lSVfj4s80ht29fof0ga8lzabngok9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfrBa92BaEHBsM2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrBHzaR7gs8rgeldzIG9fofYgr80zaBYBeldzoBASVf7BaRlgayCBsRlSVfjqHldBoRngoEngsBYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMlgoyngoU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfrzsb0gaEHzaM2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfHBo9CBsUlzav9fowxSVfCgr9nzsyrgrN9foDlht29fo80BsfHzsM2gHldzIG9fofYgr80zaBYBeldzoNQ4eldzsfYBa8HgaBlSVfjqHldBo9Ygob1Br9lSVfjgoNQhtfAfdBoUR0RtRevsZQgURpzfoDdqHldBsR7goEHgr97geldzIG9fofYgr80zaBYBeldzovQ4eldBrUlBrUrgoUlBeldzIG9fofYgr80zaBYBeldzImCkFZQhtfAfdBoUR0RtRevsZQsmZmRtR0PRCfjfIG9foflzabHgaU0zsN9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foEYBob1zsyCgsp9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCzsy1BrB2zay2SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fofHgo82goRrgrZ9fowxSVfCgsUCgoblgrk9fowcqHldBsUCgryHgsyrgpldz5O3cPgp4eldBs9rgs9lgoE1Bpldz5O3cPgp4eldBsbCzafCzs82SVfjkPvHOt29foE0BrU0gobYgeldzo8ASVfCBablgsEHBaE1SVfjBt29fofrzsb7gaM0BaZ9foDl4eldBrBlgrMnzaBnBHldz5O3cPgphZ7ASVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BoM1BsU0gsMCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgay2ga8nBry2SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCzafrgoE7zabCSVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQht29foBlzsb2goE0zsp9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9foflzsMCBrMYgog9fowxSVfCgr9nzsyrgrN9foD7BP7ASVfCBs9rBa81zaR0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoRCBaR2Brb7gZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHgsMngaE1gsp9fowxSVfCgr9nzsyrgrN9foD2hSHQ4eldBrRnBob1grb2BeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHgrRngo9lzsm9fowxSVfCgr9nzsyrgrN9foD2ht29fo97zablgsBngeldzIG9fofHgafnzsMYgHldzpGxSVf2gafYzaRHzaBnSVfjO5eA9nRASVf2grBHgrMnBsyCSVfjBV29foE0BoyCBobnBZldzoEASVf2zsB7zs80grm9foD0BV29foflzsMHBsRlBs39foDl4eldBoB0zsU7BablgZldzoMASVfrBrMYBa81Br8rSVfjO5eA9nZQ4PG9foE7Bo91gsR1BrO9fow58F2rOt29foEYBrRYBa82zav9foDl4eldBsbCzafCzs82SVfjBd29foE0BrU0gobYgeldzoy14eldBoM0BaR2gsM2zeldzoMASVfCBrb0gaUlzsMHSVfjBV29foBrBa9lgoyrgog9fow58F2rOSHk4eldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVfCgay2ga8nBry2SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCzafrgoE7zabCSVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQht29foyHBaM0zsRnBHldzIG9fofYgr80zaBYBeldz5O3cPgphS7d4Vfof7ezZEpNtRHhRHmNZERdzdvxSVf2BsM0BrB1BaBnSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2BsbrgryYgoRnSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2gaUrBob0gs91SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2gabYBafHBafHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsR1zsU0gaMnzZldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBs8YBrRrzsErgHldzIG9fofYgr80zaBYBeldzoNQ4eldBs8YBr9CgrU7BHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBs9CgrU7zaUYgZldzIG9fofYgr80zaBYBeldzoNQ4eldBs91goE2ga8rSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaE2gobHBaRCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zab1BrUlgablSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsb1BoblgsMnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrB1zs8nzsEnSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoBngoErBrMngHldzIG9fofYgr80zaBYBeldzoNQ4eldBoBnza82zsfnSVfjqHldBo9Ygob1Br9lSVfjBseQ4eldBoUlBrE0BofCBHldzIG9fofYgr80zaBYBeldzoNQ4eldBoR7grRYBafHgHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBo8CzaU0gsBHgHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBo81gsBCgav9fowxSVfCgr9nzsyrgrN9foDlht29fof1grB7BoBHBaO9fowxSVfCgr9nzsyrgrN9foDlht29foBlzs9lgrU1grZ9fowxSVfCgr9nzsyrgrN9fow79IZpht29foB2BablgrMHzaN9fowxSVfCgr9nzsyrgrN9foDlht29foBrBoM2goMCBrp9fowxSVfCgr9nzsyrgrN9foDlht29foB7BobCzs9YBre9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrzaUCBob1Bsy7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfHzaU1zsE0Bo39fowxSVfCgr9nzsyrgrN9fow79IZpht29foyrBs91BsErgHldzIG9fofYgr80zaBYBeldzoNQhtfAfdBomEZimR0stZOeS7ew9dfjfIG9foElBry1Bsf1BrO9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf2BsU7Br97grbrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2BrMrzs9Yzse9fowxSVfCgr9nzsyrgrN9foD2ht29foE7gaU0BsU2gsv9fowxSVfCgr9nzsyrgrN9foDGgaZQ4eldBsUHgoR0BofnzeldzIG9fofYgr80zaBYBeldzoNQ4eldBsRrgr9Ygr82geldzIG9fofYgr80zaBYBeldzoNQ4eldBsylgoBlBaElBpldzIG9fofYgr80zaBYBeldzo8lht29foE1BsEnzsRlgsv9fowxSVfCgr9nzsyrgrN9foDlht29fof7BaR2zsU2gap9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCgrUCzsRHzaRHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgryrBsy1goB7SVfjqHldBo9Ygob1Br9lSVfjBsylht29foBHBayYzaRnBap9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsElBa91gaE7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrR1Bsb7ga97gpldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBrR0Ba80goe9fowxSVfCgr9nzsyrgrN9foD0BP7ASVfrgryrzs9HBrflSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzsfrgrblBsR0SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foU2BoRlgobngoZ9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf7Bof1zs8rzsbCSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fo8ngs87zaMCSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfYgo87BoRCBsm9fowxSVfCgr9nzsyrgrN9foDGzsNQhtfAfdBomEZimR0stZOeS7ew9dM5fEgCcYZoXip6OCfjfIG9foECgs8lBry2gsg9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf2BoylgaEHSVfjqHldBo9Ygob1Br9lSVfjBsfl4eldgaMHBaU1BoEHBeldzIG9foU2grBHBrE2gsp9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsR1zayHBrMlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsbCzsB7za8nSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2gofCgrU7BaUnSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs91gayYBobHBeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE1goy2gryrgoe9fowxSVfCgr9nzsyrgrN9foDlht29foE0Bsy2gaB7zsZ9fowxSVfCgr9nzsyrgrN9foD2ht29fof2Brf1zafngoO9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgaf1goE0zak9fowxSVfCgr9nzsyrgrN9foDlht29fof7zsy2ga9rgam9fowxSVfCgr9nzsyrgrN9foDlht29fof1goBrzaBlgr39fowxSVfCgr9nzsyrgrN9foDlht29fof0BoBnBr9rBsm9fowxSVfCgr9nzsyrgrN9foD2zaNQ4eldBob1gaylBo8rgpldzIG9fofYgr80zaBYBeldzoflht29foBlBrfYzs9nBrv9fowxSVfCgr9nzsyrgrN9foDY4eldgaMHBaU1BoEHBeldzIG9foB7BrU1zsMHBsp9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrElzsMYBaR1BeldzIG9fofYgr80zaBYBeldzoNQ4eldBrE0Br8HgoR2BpldzIG9fofYgr80zaBYBeldzoeQ4eldBrBHzaRnBs91BHldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf7grMnBsbYgoe9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfYzaM2gaUHgoe9fowxSVfCgr9nzsyrgrN9foDlht29fobrgoylBrB2zZldzIG9fofYgr80zaBYBeldzoNQhtfAfdBomEZimR0stZOeS7gCcYZoXip6OCfjfIG9foElBaEYBsb0gsm9fowxSVfCgr9nzsyrgrN9foDlht29foElgrR1BoMHgsO9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf2zaB2ga80grEYSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foE1Br9rzaf7zsm9fowxSVfCgr9nzsyrgrN9foD2ht29foE0gsRlgoEngre9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfCBsR7BrE0gr8YSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrbCBsR7zs9nSVfjqHldBo9Ygob1Br9lSVfjBsylht29fofngaB0goblBrv9fowxSVfCgr9nzsyrgrN9fow79IZpht29fof1grB7BoBHBaO9fowxSVfCgr9nzsyrgrN9foDlht29fof0zsU7BofHBsv9fowxSVfCgr9nzsyrgrN9fow79IZpht29foBHgsb1goMlgaO9fowxSVfCgr9nzsyrgrN9foDlht29foBnBsf7BoBYBaN9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrzaRHza97BsUCSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foB1zsBHgrylzaZ9fowxSVfCgr9nzsyrgrN9foD2ht29foUCBsf0gaf0zsk9fowxSVfCgr9nzsyrgrN9foDlht29fo8Hza8lBs9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfngoBCgrf7gsZ9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfngoRlgsylgHldzIG9fofYgr80zaBYBeldz5O3cPgpht29fo9nzsM7gsfCgpldzIG9fofYgr80zaBYBeldzoflht29foy1zaBrBoBHgpldzIG9fofYgr80zaBYBeldzoNQ4eldzay0gaflgoR7SVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgEmROespgvZbZhm5eTOF23OCfjf50Hcild4Vfof7membZzR7pFmZQi95Zp9Ym3c5mwc59dzdvxSVf2Ba8rzsB2BoynSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gaUYzaU7ga82SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foE1goR7grE2BsO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2zabHgofrBrE1SVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foE0grRnzay1goe9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2zsyCzsMHBaO9fowxSVfCgr9nzsyrgrN9foDlht29foflBrfngoRHgrO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgsU0grBCzaEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgoU1grE0goM1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgoy1gsUYgoR1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsM7gaylzaB7SVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBobrga9ngr9CgZldzIG9fofYgr80zaBYBeldzoNQ4eldBrECgrB7BrRCgpldzIG9fofYgr80zaBYBeldzoNQ4eldBrB7za92BafrgpldzIG9fofYgr80zaBYBeldzoNQ4eldBrU7Bs9HgabCSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrUHgaM7goUrzZldzIG9fofYgr80zaBYBeldzoNQ4eldBry0BryCBo80gZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foB0ga9HBoUngop9fowxSVfCgr9nzsyrgrN9foDlht29fo8rBaMngo81zeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foy7gsE0BrMCBHldzIG9fofYgr80zaBYBeldzoflht29fobCBablgo9ngZldzIG9fofYgr80zaBYBeldzoNQhtfAfdBomEZimR0stZOeS7H3cIZ3cVNO8S9dzdvxSVf2BaflBrb7zaU0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsEngaB7zab0gHldzIG9fofYgr80zaBYBeldzoNQ4eldBsU7go92gr8ngpldzIG9fofYgr80zaBYBeldzoNQ4eldBsU1zsyHBsE2gHldzIG9fofYgr80zaBYBeldzoNQ4eldBsRlgaflBrbYgHldzIG9fofYgr80zaBYBeldzoECBV29foUlgsM7zaf2gsN9fowxSVf7Bs9rgsB2BsR0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foEngrR2Ba9HgeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2grM1gsR7zs8CSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBsM2BsbCBsfHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBofrBsfCBry2BpldzIG9fofYgr80zaBYBeldzoNQ4eldBoUlBrE0BofCBHldzIG9fofYgr80zaBYBeldzoNQ4eldBoRYBrRYgrE0gZldzIG9fofYgr80zaBYBeldzoNQ4eldBo87zaM2gsB1zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoyHBaRrzs87gHldzIG9fofYgr80zaBYBeldzoNQ4eldBrf2BsyrgrM2gHldzIG9fofYgr80zaBYBeldzo8lht29foB7BaBrBsfCBap9fowxSVfCgr9nzsyrgrN9foDlht29foB7BoE2Bob2grg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgr82zaM7BoEHSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldgaMHgs9lgrU2zZldzIG9fofYgr80zaBYBeldzoNQ4eldgafngaE1za8nzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foUngaBCgay7BHldzIG9fofYgr80zaBYBeldzo9ASVf7BaRlgayCBsRlSVfjqHldBrUrgay0BaR2zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfHgo92gsRrBsO9fowxSVfCgr9nzsyrgrN9foDCBPHQfdldfCgEmROespgvZbZhsFQnOtM5fEgCcYZoXip6OCfjfIG9foE2grMYBrM2gap9fowxSVfCgr9nzsyrgrN9fow79IZpht29foE7go91BrEHgap9fowxSVfCgr9nzsyrgrN9foDrgoNQ4eldBsR2goMCgayYBHldzIG9fofYgr80zaBYBeldzo8lht29foEngsRrgrBrBsk9fowxSVfCgr9nzsyrgrN9foDlht29foE1Bs8HBoynzsp9fowxSVfCgr9nzsyrgrN9foDCht29foflgry1grR2zaN9fowxSVfCgr9nzsyrgrN9foDlht29fof2gsMnBob2Brv9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgs92BrE2gaM0SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCgo97Bo9CBab1SVfjqHldBo9Ygob1Br9lSVfjBS7ASVfCzsBHzaU2BsB1SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof0Bryrzsf2gre9fowxSVfCgr9nzsyrgrN9foDGgaZQ4eldBrfYBofrBsR7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBrflBs8lBoB0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgaynBoyYBs9HSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBr9rgoEHgsb1BZldzIG9fofYgr80zaBYBeldzoECBV29foUlgsM7zaf2gsN9fowxSVf7Bs9rgsB2BsR0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBYgrU7Bablgsk9fowxSVfCgr9nzsyrgrN9foDlht29foUCgs9rBoBlBHldzIG9fofYgr80zaBYBeldzoNQ4eldgsBCBrf2zsBrSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfnBaB7zsUHBrv9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf1BaB2gsf0gsZ9fowxSVfCgr9nzsyrgrN9foDY4eldgaMHBaU1BoEHBeldzIG9foB7BrU1zsMHBsp9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldzsbYgaf7ga81SVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgEmROespgvZbZhsn1ykSgpfoDdqHldBsMnBsMrza8YzZldzIG9fofYgr80zaBYBeldzoNQ4eldBsR2BoR7BoBrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBs8YBoflBofrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaM1Bob2gsMrSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBsbnBsRngsErBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoB2BoRCgs9ngpldzIG9fofYgr80zaBYBeldzoNQ4eldBoRCgsMnzsBnBpldzIG9fofYgr80zaBYBeldzoflht29fofngoElBoE0zae9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCgoyHBrf7BpldzIG9fofYgr80zaBYBeldzoNQ4eldBoyCgr9nBsRlBZldzIG9fofYgr80zaBYBeldzoNQ4eldBrMlgaBYBoEYBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrB7gaUHgrfYgpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBYBa92zay7Bov9fowxSVfCgr9nzsyrgrN9foDY4eldgaMHBaU1BoEHBeldzIG9foB7BrU1zsMHBsp9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBr92grMrBa9lzeldzIG9fofYgr80zaBYBeldzo8lht29foB0BrR2gsE1geldzIG9fofYgr80zaBYBeldz5O3cPgpht29foB0zs8CBaM0Bs39fowxSVfCgr9nzsyrgrN9foDlht29foU2BobHgoUCgak9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7BsbrBoR0za80SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foUrgaR2zaEnzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foy2gsUnzs8YBpldzIG9fofYgr80zaBYBeldzoNQ4eldzaUYBsM7zaErSVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgEmROespgvZbZhRIZ6c5p6OCfjfIG9foElgaElza97grO9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsf7Bo9Hgo8YBZldzIG9fofYgr80zaBYBeldzoNQ4eldBsBCgsBnBsBrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBsB0zsyCBsylgHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE7grUCgrU2grm9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2zaf7zs92gsbrSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBoMCBr9Hgr91zZldzIG9fofYgr80zaBYBeldzo9ASVf7BaRlgayCBsRlSVfjqHldBrUrgay0BaR2zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBsBlBo90BoM7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrU1gsRrBofYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBo9YBs9CBsblgZldzIG9fofYgr80zaBYBeldzoNQ4eldBoyrBrRnBo9lBZldzIG9fofYgr80zaBYBeldzoNQ4eldBobrzaRrBsyHzZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBlgr9Cgsy2BoO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBof7Boy2gsy1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBoU7gsBlBrbYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgafCBrB7gsU1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgoUnzsbnBaB1SVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldgaM0BoM2BsyYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7gof7zabrBoO9fowxSVfCgr9nzsyrgrN9foDlht29foUngrfrBrBHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldzaB2gry2BsBYSVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgEmROespgvZbZhRne5OtNfOFebfoDdqHldBsE7gsMHza91zeldzIG9fofYgr80zaBYBeldzoNQ4eldBsU7gaM1ga8nBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE7gaylgrBrgae9fowxSVfCgr9nzsyrgrN9foDlht29foEngrBHBrb2Brk9fowxSVfCgr9nzsyrgrN9foDlht29foEYzsUHBry2gag9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2zsbnBsf1BrErSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBoE2gsU2gsU7BHldzIG9fofYgr80zaBYBeldzoNQ4eldBofCzaylBrM7BZldzIG9fofYgr80zaBYBeldzoNQ4eldBoU2BoRrzsBrBZldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofHBsBYBsUrgs39fowxSVfCgr9nzsyrgrN9foDCBP7ASVfCgsRlza87zs9lSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgoRHzsy0gr9rSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fofnzsBnzsBYBsO9fowxSVfCgr9nzsyrgrN9foDlht29foBlgsyHgsf1Bam9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrEnBsR1za9rgeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBrzaE7Baf1gsm9fowxSVfCgr9nzsyrgrN9foDlht29foBnBsbCBrylgog9fowxSVfCgr9nzsyrgrN9foDlht29foU2grM0BaB7zag9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfnBoUHBsf1gov9fowxSVfCgr9nzsyrgrN9foDlht29fo8rgrU0zaECgZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgoMHBrbHSVfjqHldBo9Ygob1Br9lSVfjBsfl4eldgaMHBaU1BoEHBeldzIG9foU2grBHBrE2gsp9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBomEZimR0stZOeSHgD8SvpOVfjfIG9foElzayCza9Czap9fowxSVfCgr9nzsyrgrN9foDlht29foEngsEYzsEHBsp9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf2grynBsE7gog9fowxSVfCgr9nzsyrgrN9foDlht29foE0gsU7zaBngs39fowxSVfCgr9nzsyrgrN9foDlht29fof2zaU7BafrBak9fowxSVfCgr9nzsyrgrN9foDlht29fof7goUCzaB0zak9fowxSVfCgr9nzsyrgrN9foDlht29foB2Bsf1gofngeldzIG9fofYgr80zaBYBeldzoNQ4eldBrB2zsb1BoMCgpldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgabnBoEHgabYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrR7gaflgrBngeldzIG9fofYgr80zaBYBeldzoNQ4eldBrR1zablzs8YgpldzIG9fofYgr80zaBYBeldzoNQ4eldBryHzab7go87BHldzIG9fofYgr80zaBYBeldzo9ASVf7BaRlgayCBsRlSVfjqHldBrUrgay0BaR2zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrza81gry1zsf0SVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrblBsMnzsMrgZldzIG9fofYgr80zaBYBeldzoECBV29foUlgsM7zaf2gsN9fowxSVf7Bs9rgsB2BsR0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foUCBr92gsb2BoZ9fowxSVfCgr9nzsyrgrN9foDlht29foUCzaErBof7go39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7Bob2ga8lBsy1SVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldgsUHBo9rgaMHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgsynBo9nBry0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgoB0Bo87gayYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf0zsy1goBlBrm9fowxSVfCgr9nzsyrgrN9foDlhS7d4Vfof7membZzR7pFmZQsciQYfiHKkipKcdfjfIG9foEHzsyrBsUlgap9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2goE1gsbHzaEnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2go80goblBs9nSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBsbYgo8YBrbnBHldzIG9fofYgr80zaBYBeldzoNQ4eldBsb1BrfCzs8rgZldzIG9fofYgr80zaBYBeldzoflht29fofrBof2gaBrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBr8nBsBrBa8YSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaM1BaE1zs8YSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof1zsR2zay1gaO9fowxSVfCgr9nzsyrgrN9foDlht29fof0go8lBo9nBrk9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrBaErgoyrzay1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBaBYzabHBrfHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBoy2goMYgabrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrBnzsB1goR1zeldzIG9fofYgr80zaBYBeldzoNQ4eldBr8rBsMrBr92BeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgoU0ga9rgoM1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBr80Brynzsy7gHldzIG9fofYgr80zaBYBeldzoNQ4eldBrbYzaUHzsb1BZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foyCgr90BoR1BHldzIG9fofYgr80zaBYBeldzoNQ4eldzsEYzsB0zsB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf0zsMlgoU7BoZ9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgEmROespgvZbZhRYm3c5mwc59dzdvxSVf2BaMYgsb0BrN9fowxSVfCgr9nzsyrgrN9foDlht29foE2Bsf1BaB1Bsm9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2gaMrgsBrza82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gaRYBaylBoMlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaMYBsy1zse9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsyHza87gsE7BeldzIG9fofYgr80zaBYBeldzoNQ4eldBofYzaR7grUlSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fofrBrbHgaB0Ba39fowxSVfCgr9nzsyrgrN9foDlht29fofrgs82gobnBav9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCgsUlgaB2BaBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgrynza80grO9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrgaErBaUlBoRrSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBrRlgofYzs91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRlgo87gryHBZldzIG9fofYgr80zaBYBeldzoNQ4eldBr8ngrMlgo91geldzIG9fofYgr80zaBYBeldzoECBV29foUlgsM7zaf2gsN9fowxSVf7Bs9rgsB2BsR0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBYBaR2zsU7zsm9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgrUrBa82gaBHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrzaUCBob1Bsy7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBrBnBo97zsg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf1Baf0BaB1Brm9fowxSVfCgr9nzsyrgrN9foDlht29fobYBsU2gr82BHldzIG9fofYgr80zaBYBeldzoNQhtfAfdBoRbePmRvWZVfjfIG9foElBa8Yzaf0Brv9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2gofYgrU7BaU1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2zablBaU2zs87SVfjqHldBo9Ygob1Br9lSVfjBrZQ4eldBoEYgrE0BrBCSVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foN9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6BV29foEYgr8YgpldzoM6BV29foEYgr81gHldzoM6gry7BrErgrbYzsRlgrU7gIHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBoBHBaMnzsBlSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBoRCgoyHgrU2zZldzIG9fofYgr80zaBYBeldzoB2ht29fofnzaBHBrflBo39fowxSVfCgr9nzsyrgrN9foDCgS7ASVfCzs90goU2Ba8HSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrUCgs9HBoRCSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBr8CBaR7grb7SVfjqHldBo9Ygob1Br9lSVfjBo3Q4eldgsf1BrU7BofnSVfjqHldBo9Ygob1Br9lSVfjgYHQht29foflzabrBobCBsN9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9foflzab2ga8HBoO9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBoM1zsBCzsflgpldzIG9fofYgr80zaBYBeldzovQ4eldBoM0BafrBa9nBHldzIG9fofYgr80zaBYBeldzoZQ4eldBrB7zaR2BaRlzeldzIG9fofYgr80zaBYBeldzo8lht29foBrgo8YzsbYBav9fowxSVfCgr9nzsyrgrN9foDHht29foB7gaE7gsECBap9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1rBsBYBoRHBaECzsy0BaU74eldBs9Ygo9nSVfjBV11Bo97gsElgsMCzaEHBoUY4eldBs9YgoyYSVfjBV1nBrbCBsRYBa9Ygry0BrMYhZHQht29foflzsMHBsRlBs39foDlhS7ASVfrgabYBafHza8lSVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foN9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6BaynBo97gsECBsECBsUlgo8ASVf2gr9ngrO9foDl4oM1gofYgaR2BoE2BoE7Ba8n4eldBs9YgoyYSVfjBV1lza8CgrUHBsf2Bsf2gaMngIHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldzs87zaf2Br9nSVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foN9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6BrBYBoR7zsE2go82BsU1Ba9ASVf2gr9ngrO9foDl4o97zsM2zs8CBoylBo9rgaUASVf2gr9nzak9foDl4ob7BsEYgoRrBr80zsMrgsOQSSHQ4eldBoM0BaR2gsM2zeldzoNQhSHQ4eldBoyHzaRCBoErgeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9fofHBo81gs97Bsp9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCgr8rBrU2gaB7SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldgaflgsy0ga81zeldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCzs91zabCgoe9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BaEnBay0grfnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2BaU1zs9HzaBYSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsMYBo91ga9HgeldzIG9fofYgr80zaBYBeldzoylht29foE2Bsf2BoyCBaO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2BsBCBaB7Ba9CSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBsEHBoRnga9YBeldzIG9fofYgr80zaBYBeldzovQ4eldBsEYgoBHBaBYgeldzIG9fofYgr80zaBYBeldzoylht29foECBaM0Bs82Bog9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2Bo8HBabHBr91SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBsf1Bof0zaE0gHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foECzs87BrfHBsZ9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2BrEYBsf7zae9fowxSVfCgr9nzsyrgrN9foD1BP7ASVf2Brfngo9lBr9CSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsB7Baylga80BeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE7BsMCBoUrBrv9fowxSVfCgr9nzsyrgrN9foD1BP7ASVf2gaB1ga9lgsE0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsU7go9YBay1BeldzIG9fofYgr80zaBYBeldzoRlht29foE7gay2zsR2BaN9fowxSVfCgr9nzsyrgrN9foDlht29foE7grf7zablgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2gsBCzaE7BsU7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsRrgoUlgsf1BHldzIG9fofYgr80zaBYBeldzoNQ4eldBsR7BaRYBo90gHldzIG9fofYgr80zaBYBeldzoRlht29foEHzaMnzaU1zZldzIG9fofYgr80zaBYBeldzoNQ4eldBs82BsBCgsbHBpldzIG9fofYgr80zaBYBeldzoRlht29foEnBsf2zaMlBav9fowxSVfCgr9nzsyrgrN9foDCht29foEnBoEHgry0BrN9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2go9lzaRrgsBYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2go91grE1zaRlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gob2BaR2ga8CSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBs80zaUlgrUngHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foEYBaMngrU1Bog9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2grErzsfCgoyCSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBs92gsBYgsO9fowxSVfCgr9nzsyrgrN9foDCht29foEYBrb0Bry2Bsv9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2grUrBrUHBo8nSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsyCBsBHgrb7BZldzIG9fofYgr80zaBYBeldzoylht29foE1BobCBo81Brv9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2zaU2gaBCBsb0SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsy7zsM1gr91BpldzIG9fofYgr80zaBYBeldzoNQ4eldBsy7zsBYzaM1geldzIG9fofYgr80zaBYBeldzoRlht29foE1gsfYgoMnBaO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2za8CgsyCBsZ9fowxSVfCgr9nzsyrgrN9foDlht29foE1go81zsU0Bom9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2zay7gsblBsBCSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsy0goBHBrf0gpldzIG9fofYgr80zaBYBeldzoRlht29foE0BsM7za9nBsm9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2zsE1Br97Br81SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zsfYgo8lgaf1SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBsbYBs97gsErBpldzIG9fofYgr80zaBYBeldzoRlht29foE0grbngsbrBrk9fowxSVfCgr9nzsyrgrN9foDCht29foE0za82BaBnzsg9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCBaMCBo9lBsbrSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBaf0Brb0grBnSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoM7BrRrgaMHgeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflga9CBsf7gog9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBa8nzabHzaU1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBsMrzsB7za91SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBsM7grE7goE0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoE2zay7zabrgHldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof2go9Cgsy0gap9fowxSVfCgr9nzsyrgrN9foDlht29fof2gr81zsEnzap9fowxSVfCgr9nzsyrgrN9foDlht29fof2zsMlBaU7Bok9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBoErBofCBoE7SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBofrgsB2zaU0geldzIG9fofYgr80zaBYBeldzoNQ4eldBofrzsUlzs9lgpldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofCzaBlBafrzsO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCBobYza87gsUnSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBoB7go81gs9HSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBrR7BaR2zsEYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoUlBaf0Boe9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfCga8CgaE0goE1SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBoU0ga87zs8CSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoRHzsy1gsbnzZldzIG9fofYgr80zaBYBeldzoylht29fofnBaMCga8Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fofnBaBrzaE0gsZ9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCgoE7grM1goZ9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCgoB2gab7goyrSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBo8nBabnBsyrgZldzIG9fofYgr80zaBYBeldzovQ4eldBo9CzayHga92geldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYBrRrgoECzsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaf7Bo9CBo39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCzaRlgrfYgsy0SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBoyngaynBsblgHldzIG9fofYgr80zaBYBeldzoRlht29fof1grM0ga9HBHldzIG9fofYgr80zaBYBeldzoRlht29fof1grR2BsU1zaZ9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCzab1zafCBsy2SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzsM2gry0BrUCSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBob2go8CBab0BpldzIG9fofYgr80zaBYBeldzoNQ4eldBob2zaUHzsElSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBobCgoUlgo8CgZldzIG9fofYgr80zaBYBeldzoRlht29fof0BrBngaRHzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof0Br8YgrM1gsg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCzsR7BoElgr91SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrMHzsylBof1SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrM1Bo9nBo91gHldzIG9fofYgr80zaBYBeldzoRlht29foB2Baf0BsUlBrp9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrBsMHgaRrBobHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBsEYza90Brb2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrECgsB2BaBHgpldzIG9fofYgr80zaBYBeldzovQ4eldBrE7grBlBsbYgZldzIG9fofYgr80zaBYBeldzoRlht29foB2gabCgrMrgam9fowxSVfCgr9nzsyrgrN9foDlht29foB2gsMHBs8CBaZ9fowxSVfCgr9nzsyrgrN9foDlht29foB2gsf7zaE7gsv9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrBs82gry2Ba9lSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBrEYBrBlBsE2geldzIG9fofYgr80zaBYBeldzovQ4eldBrE1BoyHgoU0gHldzIG9fofYgr80zaBYBeldzoRlht29foBCBrRnBa97zsO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrBoU1BaUngo9nSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrfngaBHgoM2BHldzIG9fofYgr80zaBYBeldzovQ4eldBrf1BabCgoB2BHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBCzsM1zs8rBag9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBrMHBa8ngsf1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrBCBof2gsE2zeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBrga97BsEHgop9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrBr8lgsUYzaE0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrBr8Hzay2grUrSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBrUlBaEnBoRnzeldzIG9fofYgr80zaBYBeldzoRlht29foB7BrBrgrb7zap9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfrgaB1gaR0goRYSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBrU7gaUCzs8CgHldzIG9fofYgr80zaBYBeldzoylht29foB7gaR0goblzZldzIG9fofYgr80zaBYBeldzoRlht29foB7gsE2gob2grv9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrga8CBaB7BoynSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrgay7Bsf1BoBrSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrU1go9YBaE0BeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHgrMrgoM1zZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHgr82Bsblgoe9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsyCgsR1Br8YSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrgsyYBrECBok9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrgoMYgsyYza9CSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBr82BoRrBa8nBHldzIG9fofYgr80zaBYBeldzovQ4eldBr82grEYzabCBHldzIG9fofYgr80zaBYBeldzoRlht29foBngaR1Brf0Brm9fowxSVfCgr9nzsyrgrN9foDlht29foBngoMCBoR2Bag9fowxSVfCgr9nzsyrgrN9foDlht29foBngryHgafCBaZ9fowxSVfCgr9nzsyrgrN9foDCht29foBnzaBHBs8CBak9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgrM2zaf2BoRHSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBr92gsbHgsRYBHldzIG9fofYgr80zaBYBeldzoRlht29foBYgo91zsElgrO9fowxSVfCgr9nzsyrgrN9foDCht29foBYzayrzaf0gov9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgrbrBoR1zsp9fowxSVfCgr9nzsyrgrN9foDlht29foB1ga91ga91Bsg9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrzaU1ga8nzsbrSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrynBryrBrBlgpldzIG9fofYgr80zaBYBeldzovQ4eldBry0BoMHzs81BHldzIG9fofYgr80zaBYBeldzoRlht29foB0BaMrBa9Czae9fowxSVfCgr9nzsyrgrN9foDlht29foB0Ba8rgaMHBov9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfrzsE7zafCgsO9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfrzsfYgo8Ygo9HSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBrbYgsfYgsfrBHldzIG9fofYgr80zaBYBeldzovQ4eldBrb1zsEYgrM1gHldzIG9fofYgr80zaBYBeldzoRlht29foUlBa9rBryngom9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf7BaECgaMCzayHSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgaMHgayYBrN9fowxSVfCgr9nzsyrgrN9foD1BP7ASVf7BablgaMYBs91SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgaErzsMYBsyYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgaEHgsBCgsf0gHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foU2grBrBayYzam9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7BsyYBaf7BoR0SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldgaf2gr81BabHzZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foUCzabHgsBrBog9fowxSVfCgr9nzsyrgrN9foD1BP7ASVf7Boy0goRnBeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foUrBsflgaRrBZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foU7gayYBsR2BpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foU7gsBrzay7zZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foU7zaylBry0gHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foUYgayHgoylgZldzIG9fofYgr80zaBYBeldzovQ4eldgabCBrbngsyYSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgsM7grb7BrRYSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldgsE2zs8nzaBnSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldgsB7goyYgrflSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgsBHgrMHBryCSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgsbrBsEYgoUnSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgsb1grfHzaBnSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgoErBrR1zs80SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgofHgaUrBafYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgoB2BaR7Bs9YSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgoUCBrE1gsfnSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgoRnzsR2goR0SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgoyrBoECgsb7SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldgoyHBrfrgop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfnzabCBoMYgsk9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfYBaMYgs90BsN9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfYBobrgsb7Bom9fowxSVfCgr9nzsyrgrN9foDlht29fo9nBsM0BabrBpldzIG9fofYgr80zaBYBeldz5O3cPgpht29fo91zsb0zaM0zZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foyngsB2Bob1BpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foyYBo81grBHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldzsB2zs97gaBnSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldzsUYgrUHgrUnSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldzsRrzsb1BsUCSVfjqHldBo9Ygob1Br9lSVfjBI7ASVf0gs81Br9CBoO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf0grM0grEHgam9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf0zab7grErBaN9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBoRbZasHvEmZvhUFpCfoDdqHldBsy1zaBHBayrgeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofHBobYgrynzsm9fowxSVfCgr9nzsyrgrN9fow9fp29SVvcSZ29SVv9fIHQfdldfCgtmRgWRbmeRpQNXSfyvdNa95QH8n3wc59dzdvxSVf2zsMCgaElzsMnSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBo91gaUCBab2BeldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldhS7d4VfofHveU7QtmEZtS7gCcYZoXip6OCfjfIG9foB0zayHgaEHBsO9fowxSVfCgr9nzsyrgrN9fow9fp29SVvcSZ29SVv9fI7ASVfHzsy7BsE2zsv9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgtmRgWRbmeRpQi8FGpcieIfoDdqHldBoEHBsBlgoRnBZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBCgofngrElgoe9fowxSVfCgr9nzsyrgrN9fow9fp29SVvcSZ29SVv9fIHQfdldfCgtmRgWRbmeRpQi95Zp9Ym3c5mwc59dzdvxSVfCBa91BoM1zsU7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoE7zsB7gaE0gpldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldhS7d4VfofHveU7QtmEZtS7H3cIZ3cVNO8S9dzdvxSVfrgafCBob1zsg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfHga9rzaM1zap9fowxSVfCgr9nzsyrgrN9fow9fp29SVvcSZ29SVv9fIHQfdldfCgtmRgWRbmeRpQgcYOpfV8yUYvKkFgDXF0IfoDdqHldBsE0go8Hgs9CBZldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldht29fof2gsRlzs8ngoe9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgtmRgWRbmeRpQWcdNH9nRdzdvxSVf2goBHBsy2gaf1SVfjqHldBo9Ygob1Br9lSVfjSVv9SeldFHH9SeldSVvQ4eldBs9rBs8Hgaf7BeldzIG9fofYgr80zaBYBeldz5O3cPgphS7d4VfofHveU7QtmEZtSHvHc50wc59dzdvxSVf2BoRHgoB0BofrSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoBngrMlBr9CBHldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldhS7d4VfofHveU7QtmEZtSHg3O5RytiZ3OVfjfIG9fofYzayngs92gak9fowxSVfCgr9nzsyrgrN9fow9fp29SVvcSZ29SVv9fI7ASVfrgobrgab7BsE0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhtfAfdBoRbZasHvEmZvhRn3395ZbfoDdqHldBs91gobrzs87zZldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldht29foE1zaB7Bsf7goe9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgtmRgWRbmeRpQsciQYfiHKkipKcdfjfIG9foECgsB0BaE2zap9fowxSVfCgr9nzsyrgrN9fow9fp29SVvcSZ29SVv9fI7ASVfrBa9rzaRCzsErSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhtfAfdBoRbZasHvEmZvhRYm3c5mwc59dzdvxSVfCzs8HBaBHzs9lSVfjqHldBo9Ygob1Br9lSVfjSVv9SeldFHH9SeldSVvQ4eldgoU0grUHzaB1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhtvQ"));
    v993();
    l_v875_1.list:update(v988());
end;
v875 = nil;
v875 = {};
v876 = 0;
v877 = false;
v923 = nil;
v924 = 0;
v925 = 0;
v926 = false;
v927 = {
    [1] = -1, 
    [2] = 1, 
    [3] = 0, 
    [4] = -1, 
    [5] = 1, 
    [6] = 0, 
    [7] = -1, 
    [8] = 0, 
    [9] = 1, 
    [10] = -1, 
    [11] = 0, 
    [12] = 1
};
l_match_0 = 0;
local v1016 = 0;
local v1017 = {};
local l_angles_0 = v28.antiaim.angles;
local v1019 = {};
v1019.__index = v1019;
v1019.clear = function(v1020)
    for v1021 in pairs(v1020) do
        v1020[v1021] = nil;
    end;
end;
v1019.copy = function(v1022, v1023)
    for v1024, v1025 in pairs(v1023) do
        v1022[v1024] = v1025;
    end;
end;
do
    local l_l_angles_0_0 = l_angles_0;
    v1019.unset = function(_)
        -- upvalues: l_l_angles_0_0 (ref)
        l_l_angles_0_0.enabled:override();
        l_l_angles_0_0.pitch:override();
        l_l_angles_0_0.yaw[1]:override();
        l_l_angles_0_0.yaw[2]:override();
        l_l_angles_0_0.yaw[3]:override();
        l_l_angles_0_0.yaw[4]:override();
        l_l_angles_0_0.yaw[5]:override();
        l_l_angles_0_0.yaw_modifier[1]:override();
        l_l_angles_0_0.yaw_modifier[2]:override();
        l_l_angles_0_0.body_yaw[1]:override();
        l_l_angles_0_0.body_yaw[2]:override();
        l_l_angles_0_0.body_yaw[3]:override();
        l_l_angles_0_0.body_yaw[4]:override();
        l_l_angles_0_0.body_yaw[5]:override();
        l_l_angles_0_0.body_yaw[6]:override();
        l_l_angles_0_0.freestanding[1]:override();
        l_l_angles_0_0.freestanding[2]:override();
        l_l_angles_0_0.freestanding[3]:override();
        l_l_angles_0_0.extended_angles[1]:override();
        l_l_angles_0_0.extended_angles[2]:override();
        l_l_angles_0_0.extended_angles[3]:override();
    end;
    v1019.set = function(v1028)
        -- upvalues: l_l_angles_0_0 (ref)
        l_l_angles_0_0.enabled:override(v1028.enabled);
        l_l_angles_0_0.pitch:override(v1028.pitch);
        l_l_angles_0_0.yaw[1]:override(v1028.yaw);
        l_l_angles_0_0.yaw[2]:override(v1028.yaw_base);
        l_l_angles_0_0.yaw[3]:override(v1028.yaw_offset);
        l_l_angles_0_0.yaw[4]:override(v1028.avoid_backstab);
        l_l_angles_0_0.yaw[5]:override(v1028.hidden);
        l_l_angles_0_0.yaw_modifier[1]:override(v1028.yaw_modifier);
        l_l_angles_0_0.yaw_modifier[2]:override(v1028.modifier_offset);
        l_l_angles_0_0.body_yaw[1]:override(v1028.body_yaw);
        l_l_angles_0_0.body_yaw[2]:override(v1028.inverter);
        l_l_angles_0_0.body_yaw[3]:override(v1028.left_limit);
        l_l_angles_0_0.body_yaw[4]:override(v1028.right_limit);
        l_l_angles_0_0.body_yaw[5]:override(v1028.options);
        l_l_angles_0_0.body_yaw[6]:override(v1028.freestanding_body_yaw);
        l_l_angles_0_0.freestanding[1]:override(v1028.freestanding);
        l_l_angles_0_0.freestanding[2]:override(v1028.freestanding_disable_yaw_modifiers);
        l_l_angles_0_0.freestanding[3]:override(v1028.freestanding_body_freestanding);
        l_l_angles_0_0.extended_angles[1]:override(v1028.extended_angles);
        l_l_angles_0_0.extended_angles[2]:override(v1028.extended_angles_pitch);
        l_l_angles_0_0.extended_angles[3]:override(v1028.extended_angles_roll);
    end;
    setmetatable(v1017, v1019);
end;
l_angles_0 = {};
v1019 = v360.antiaim.settings.disablers;
local function v1030()
    local v1029 = entity.get_game_rules();
    if v1029 == nil then
        return false;
    else
        return v1029.m_bWarmupPeriod;
    end;
end;
local function v1036()
    local v1031 = entity.get_local_player();
    if v1031 == nil then
        return false;
    else
        local l_m_iTeamNum_0 = v1031.m_iTeamNum;
        local v1033 = entity.get_player_resource();
        for v1034 = 1, globals.max_players do
            if v1033.m_bConnected[v1034] then
                local v1035 = v1033.m_iTeam[v1034];
                if v1031 ~= v1034 and v1035 ~= l_m_iTeamNum_0 and v1033.m_bAlive[v1034] then
                    return false;
                end;
            end;
        end;
        return true;
    end;
end;
do
    local l_v876_1, l_v877_2, l_v923_0, l_v924_1, l_v925_1, l_v926_1, l_v927_1, l_l_match_0_2, l_v1016_0, l_v1017_0, l_l_angles_0_1, l_v1019_0, l_v1030_0, l_v1036_0 = v876, v877, v923, v924, v925, v926, v927, l_match_0, v1016, v1017, l_angles_0, v1019, v1030, v1036;
    do
        local l_l_v1019_0_0, l_l_v1030_0_0, l_l_v1036_0_0 = l_v1019_0, l_v1030_0, l_v1036_0;
        local function v1054()
            -- upvalues: l_l_v1019_0_0 (ref), l_l_v1030_0_0 (ref), l_l_v1036_0_0 (ref)
            if l_l_v1019_0_0.select:get("On Warmup") and l_l_v1030_0_0() then
                return true;
            elseif l_l_v1019_0_0.select:get("Enemies Dead") and l_l_v1036_0_0() then
                return true;
            else
                return false;
            end;
        end;
        l_l_angles_0_1.update = function(_, _)
            -- upvalues: v1054 (ref), l_v1017_0 (ref)
            if not v1054() then
                return false;
            else
                local v1057 = globals.curtime * 5;
                l_v1017_0.pitch = "Disabled";
                l_v1017_0.yaw = "Backward";
                l_v1017_0.yaw_offset = 360 * (v1057 % 1);
                l_v1017_0.yaw_modifier = "Disabled";
                l_v1017_0.modifier_offset = 0;
                l_v1017_0.body_yaw = false;
                return true;
            end;
        end;
    end;
    l_v1019_0 = {};
    l_v1030_0 = false;
    l_v1036_0 = 0;
    do
        local l_l_v1030_0_1, l_l_v1036_0_1 = l_v1030_0, l_v1036_0;
        local function v1060()
            -- upvalues: l_l_v1030_0_1 (ref)
            l_l_v1030_0_1 = not l_l_v1030_0_1;
        end;
        local function v1061()
            -- upvalues: l_l_v1036_0_1 (ref)
            l_l_v1036_0_1 = l_l_v1036_0_1 + 1;
        end;
        local function v1063(v1062)
            -- upvalues: v371 (ref), l_v1017_0 (ref)
            if not v1062.force_target_yaw:get() then
                return;
            elseif v371.defensive_ticks == 0 then
                return;
            else
                l_v1017_0.yaw_left = -9;
                l_v1017_0.yaw_right = 6;
                l_v1017_0.yaw_modifier = "Disabled";
                l_v1017_0.modifier_offset = 0;
                l_v1017_0.body_yaw = true;
                l_v1017_0.inverter = false;
                l_v1017_0.left_limit = 60;
                l_v1017_0.right_limit = 60;
                l_v1017_0.options = {};
                return;
            end;
        end;
        local function v1071(v1064, v1065)
            -- upvalues: l_l_v1030_0_1 (ref), v16 (ref)
            local v1066 = v1065.pitch:get();
            local v1067 = v1065.pitch_speed:get();
            local v1068 = v1065.pitch_offset_1:get();
            local v1069 = v1065.pitch_offset_2:get();
            if v1066 == "Off" then
                return;
            elseif v1066 == "Static" then
                v1064.pitch_offset = v1068;
                return;
            elseif v1066 == "Jitter" then
                v1064.pitch_offset = l_l_v1030_0_1 and v1069 or v1068;
                return;
            elseif v1066 == "Spin" then
                local v1070 = globals.curtime * v1067 * 0.1;
                v1064.pitch_offset = v16.lerp(v1068, v1069, v1070 % 1);
                return;
            elseif v1066 == "Random" then
                v1064.pitch_offset = utils.random_int(v1068, v1069);
                return;
            elseif v1066 == "Angelic" then
                v1064.pitch_offset = math.map(math.abs(globals.realtime % 0.3 - 0.15), 0, 0.15, -89, 89);
                return;
            else
                return;
            end;
        end;
        local function v1082(v1072, v1073)
            local v1074 = v1073.yaw_modifier:get();
            if v1074 == "Off" then
                return;
            else
                local v1075 = nil;
                if v1073.delay:get() then
                    local v1076 = v1073.delay_mode:get();
                    if v1076 == "Default" then
                        local v1077 = v1073.delay_value:get();
                        local v1078 = v1073.delay_random:get();
                        if v1078 > 0 then
                            v1077 = utils.random_int(v1077, v1078);
                        end;
                        v1075 = v1077;
                    end;
                    if v1076 == "Custom" then
                        local v1079 = v1073.delay_count:get();
                        local v1080 = math.random(1, v1079);
                        if v1073.delay_values[v1080] ~= nil then
                            v1075 = v1073.delay_values[v1080]:get();
                        end;
                    end;
                end;
                local v1081 = v1073.modifier_offset:get();
                if v1074 == "Offset" then
                    v1072.yaw_offset = 0;
                    v1072.yaw_modifier = "Offset";
                    v1072.modifier_offset = v1081;
                    v1072.delay = v1075;
                end;
                if v1074 == "Center" then
                    v1072.yaw_offset = 0;
                    v1072.yaw_modifier = "Center";
                    v1072.modifier_offset = v1081;
                    v1072.delay = v1075;
                end;
                if v1074 == "Skitter" then
                    v1072.yaw_offset = 0;
                    v1072.yaw_modifier = "Skitter";
                    v1072.modifier_offset = v1081;
                    v1072.delay = v1075;
                end;
                return;
            end;
        end;
        local function v1091(v1083, v1084)
            -- upvalues: v16 (ref), v1082 (ref)
            local v1085 = v1084.yaw:get();
            if v1085 == "Off" then
                return;
            else
                local v1086 = v1084.yaw_speed:get();
                local v1087 = v1084.yaw_offset:get();
                v1083.yaw_left = 0;
                v1083.yaw_right = 0;
                v1083.yaw_offset = 0;
                v1083.delay = 1;
                if v1085 == "Static" then
                    v1083.yaw_offset = v1087;
                end;
                if v1085 == "Spin" then
                    local v1088 = globals.curtime * v1086 * 0.1;
                    local v1089 = v1087 * 0.5;
                    v1083.yaw_offset = -(180 + v16.lerp(-v1089, v1089, v1088 % 1));
                end;
                if v1085 == "Random" then
                    local v1090 = math.abs(v1087 * 0.5);
                    v1083.yaw_offset = 180 + utils.random_int(-v1090, v1090);
                end;
                if v1085 == "Left/Right" then
                    v1083.yaw_offset = 0;
                    v1083.yaw_left = v1083.yaw_left + v1084.yaw_left:get();
                    v1083.yaw_right = v1083.yaw_right + v1084.yaw_right:get();
                end;
                if v1085 == "Side-Based" then
                    v1083.yaw_offset = 0;
                    v1083.yaw_left = v1083.yaw_left - 90 + utils.random_int(-v1087, v1087);
                    v1083.yaw_right = v1083.yaw_right + 90 + utils.random_int(-v1087, v1087);
                end;
                v1082(v1083, v1084);
                return;
            end;
        end;
        local function v1095(v1092, v1093)
            local v1094 = nil;
            if v1093.tickbase:get() == "Ticks" then
                v1094 = v1093.tickbase_ticks:get();
            end;
            if v1093.tickbase:get() == "Random" then
                v1094 = utils.random_int(v1093.tickbase_min:get(), v1093.tickbase_max:get());
            end;
            if v1094 ~= nil then
                v1092.force_defensive = v1092.command_number % v1094 == 0;
            end;
        end;
        l_v1019_0.update = function(_, v1097)
            -- upvalues: l_v1017_0 (ref), v28 (ref), v1060 (ref), v1061 (ref)
            l_v1017_0.hidden = false;
            v28.ragebot.main.hide_shots[2]:override();
            v28.ragebot.main.double_tap[2]:override();
            if v1097.choked_commands == 0 then
                v1060();
                v1061();
            end;
        end;
        l_v1019_0.apply = function(_, v1099, v1100)
            -- upvalues: l_v1017_0 (ref), v28 (ref), v1095 (ref), v1063 (ref), v1071 (ref), v1091 (ref)
            if v1100.force_break_lc ~= nil and v1100.force_break_lc:get() then
                l_v1017_0.hidden = true;
                v28.ragebot.main.hide_shots[2]:override("Break LC");
                v28.ragebot.main.double_tap[2]:override("Always On");
                v1095(v1099, v1100);
            end;
            if v1100.enabled:get() then
                local v1101 = {};
                v1063(v1100);
                v1071(v1101, v1100);
                v1091(v1101, v1100);
                l_v1017_0.defensive = v1101;
                return true;
            else
                return false;
            end;
        end;
    end;
    l_v1030_0 = {};
    l_v1036_0 = v360.antiaim.settings.invert_flick;
    local v1102 = 0;
    local function v1106()
        if rage.exploit:get() ~= 1 then
            return false;
        else
            local v1103 = entity.get_local_player();
            if v1103 == nil then
                return false;
            else
                local v1104 = v1103:get_player_weapon();
                if v1104 == nil then
                    return false;
                else
                    local v1105 = v1104:get_weapon_info();
                    if v1105 == nil or v1105.is_revolver then
                        return false;
                    else
                        return true;
                    end;
                end;
            end;
        end;
    end;
    do
        local l_l_v1036_0_2, l_v1102_0, l_v1106_0 = l_v1036_0, v1102, v1106;
        l_v1030_0.update = function(_, v1111, v1112)
            -- upvalues: l_v1106_0 (ref), l_v1102_0 (ref), v371 (ref), l_v1017_0 (ref), l_l_v1036_0_2 (ref)
            if not v1112.flick_enabled:get() then
                return false;
            elseif not l_v1106_0() then
                return false;
            else
                if v1111.choked_commands == 0 then
                    l_v1102_0 = l_v1102_0 + 1;
                end;
                v1111.force_defensive = v1111.command_number % 7 == 0;
                if v371.defensive_ticks > 0 then
                    local v1113 = v1112.flick_speed:get();
                    local v1114 = v1112.flick_speed_random:get();
                    if v1114 > 0 then
                        v1113 = v1113 + utils.random_int(-v1114, v1114);
                        v1113 = math.clamp(v1113, 2, 10);
                    end;
                    if v1113 < v371.defensive_ticks - v371.max_defensive_ticks then
                        return;
                    end;
                end;
                local v1115 = v1112.flick_limit:get();
                l_v1017_0.yaw = "Backward";
                l_v1017_0.yaw_offset = 0;
                l_v1017_0.yaw_left = 0;
                l_v1017_0.yaw_right = 0;
                l_v1017_0.hidden = true;
                l_v1017_0.yaw_modifier = "Disabled";
                l_v1017_0.modifier_offset = 0;
                l_v1017_0.body_yaw = true;
                l_v1017_0.inverter = false;
                l_v1017_0.left_limit = v1115;
                l_v1017_0.right_limit = v1115;
                l_v1017_0.options = {};
                local v1116 = {};
                local v1117 = v1112.flick_pitch:get();
                local v1118 = v1112.flick_yaw:get();
                local v1119 = v1112.flick_yaw_random:get();
                v1118 = v1118 + utils.random_int(-v1119 * 0.6, v1119 * 0.6);
                v1116.pitch_offset = v1117;
                v1116.yaw_offset = v1118;
                v1117 = l_l_v1036_0_2.enabled:get();
                if v1112.flick_mode:get() == "Silent" and bit.band(l_v1102_0, 1) ~= 0 then
                    v1117 = not v1117;
                end;
                if v1117 then
                    v1116.yaw_offset = -v1116.yaw_offset;
                end;
                l_v1017_0.defensive = v1116;
                return true;
            end;
        end;
    end;
    l_v1036_0 = {};
    v1102 = v360.antiaim.recorder;
    v1106 = v360.antiaim.builder;
    local v1120 = "dWP7FQ3AEliGeqr98jbUM64XmCfc05gw1JDHhaYBKk2tRxVypInNouvsLZzOST+/=";
    local v1121 = {};
    local v1122 = 0;
    local function v1126(v1123)
        local l_status_8, l_result_8 = pcall(json.parse, v1123);
        if not l_status_8 then
            return false, "Can't parse data";
        else
            return true, l_result_8;
        end;
    end;
    do
        local l_v1102_1, l_v1106_1, l_v1120_0, l_v1121_0, l_v1122_0, l_v1126_0 = v1102, v1106, v1120, v1121, v1122, v1126;
        local function v1136(v1133)
            -- upvalues: l_base64_0 (ref), l_v1120_0 (ref)
            local l_status_9, l_result_9 = pcall(l_base64_0.decode, v1133, l_v1120_0);
            if not l_status_9 then
                return false, "Can't decode data";
            else
                return true, l_result_9;
            end;
        end;
        local function v1138(v1137)
            if type(v1137) == "table" then
                v1137 = "[ " .. table.concat(v1137, ", ") .. " ]";
            end;
            return v1137;
        end;
        local function _(v1139, v1140)
            table.insert(v1139, {
                measure = vector(0, v1140)
            });
            return v1140;
        end;
        local function v1146(v1142, v1143)
            -- upvalues: l_play_0 (ref)
            local v1144 = l_play_0.measure_text(1, "", v1143);
            local v1145 = {
                text = v1143, 
                measure = v1144
            };
            table.insert(v1142, v1145);
            return v1145;
        end;
        local function _(v1147, v1148, v1149)
            -- upvalues: v1138 (ref), v1146 (ref)
            local v1150 = string.format("%s: \a{Link Active}%s\aDEFAULT", v1148, v1138(v1149));
            return v1146(v1147, v1150);
        end;
        local function v1155(v1152, v1153, v1154)
            -- upvalues: l_get_0 (ref)
            if v1152 == v1153 and v1152 == v1154 then
                return ui.get_icon("arrow-right") .. l_get_0:rep(3);
            elseif v1152 == v1153 then
                return ui.get_icon("arrow-down") .. l_get_0:rep(4);
            elseif v1152 == v1154 then
                return ui.get_icon("arrow-up") .. l_get_0:rep(4);
            elseif v1153 < v1152 and v1152 < v1154 then
                return l_get_0:rep(2) .. ui.get_icon("pipe") .. l_get_0:rep(6);
            else
                return l_get_0:rep(9);
            end;
        end;
        local function v1163(v1156)
            -- upvalues: v12 (ref), v1155 (ref)
            if v1156 == nil then
                return {};
            else
                local l_data_0 = v1156.data;
                local l_sequence_start_0 = v1156.sequence_start;
                local l_sequence_end_0 = v1156.sequence_end;
                if l_data_0 == nil then
                    return {};
                else
                    local v1160 = {};
                    for v1161 = 1, #l_data_0 do
                        local v1162 = l_data_0[v1161];
                        v1160[v1161] = v12(v1155(v1161, l_sequence_start_0, l_sequence_end_0), "\a{Link Active}", v1161, "\aDEFAULT", ":", " ", "Yaw: ", "\a{Link Active}", v1162[4], "\aDEFAULT", " ", "Modifier: ", "\a{Link Active}", v1162[8], "\aDEFAULT");
                    end;
                    return v1160;
                end;
            end;
        end;
        local function v1164()
            -- upvalues: l_v1106_1 (ref)
            return l_v1106_1.state:get();
        end;
        local function v1166(v1165)
            -- upvalues: l_v1106_1 (ref)
            return l_v1106_1[v1165];
        end;
        local function v1171(v1167, v1168)
            local l_status_10, l_result_10 = pcall(json.stringify, v1168);
            if not l_status_10 then
                return false;
            else
                v1167 = v1167.recorder;
                if v1167 == nil then
                    return false;
                else
                    v1167.record:set(l_result_10);
                    return true;
                end;
            end;
        end;
        local function v1175(v1172, v1173, v1174)
            v1172.pitch = v1173[1];
            v1172.yaw = v1173[2];
            v1172.yaw_base = v1173[3];
            v1172.yaw_offset = v1173[4];
            v1172.hidden = v1173[6];
            v1172.yaw_modifier = v1173[7];
            v1172.modifier_offset = v1173[8];
            v1172.body_yaw = v1173[9];
            v1172.inverter = v1173[10];
            v1172.left_limit = v1173[11];
            v1172.right_limit = v1173[12];
            v1172.options = v1173[13];
            v1172.freestanding_body_yaw = v1173[14];
            v1172.delay = nil;
            if v1174 then
                v1172.inverter = not v1172.inverter;
            end;
        end;
        local function v1177()
            -- upvalues: v1163 (ref), v126 (ref), l_v1102_1 (ref)
            local v1176 = v1163(v126.recorder);
            l_v1102_1.sequence_list:update(v1176);
        end;
        local function v1179(v1178)
            -- upvalues: l_v1102_1 (ref)
            l_v1102_1.sequence_list:visibility(v1178);
            l_v1102_1.set_start_button:visibility(v1178);
            l_v1102_1.set_end_button:visibility(v1178);
            l_v1102_1.save_button:visibility(v1178);
            l_v1102_1.import_button:visibility(not v1178);
        end;
        local function v1186()
            -- upvalues: v127 (ref), v1166 (ref), l_v1121_0 (ref)
            for v1180 = 0, #v127.states do
                local v1181 = v127.states[v1180];
                local v1182 = v1166(v1181);
                if v1182 ~= nil then
                    v1182 = v1182.recorder;
                    if v1182 ~= nil then
                        local v1183 = v1182.record:get();
                        local l_status_11, l_result_11 = pcall(json.parse, v1183);
                        if l_status_11 then
                            l_v1121_0[v1181] = l_result_11;
                        end;
                    end;
                end;
            end;
        end;
        l_v1036_0.update = function(_, v1188)
            -- upvalues: v1166 (ref), v126 (ref), l_v1102_1 (ref), v1175 (ref), l_v1017_0 (ref), l_v1121_0 (ref), l_v1122_0 (ref)
            local v1189 = v1166(v1188);
            if v1189 == nil then
                return;
            else
                v1189 = v1189.recorder;
                if v1189 == nil then
                    return;
                else
                    local l_data_1 = v126.recorder.data;
                    local l_capture_0 = v126.recorder.capture;
                    if l_data_1 ~= nil and l_capture_0 ~= nil then
                        local v1192 = l_v1102_1.sequence_list:get();
                        if v1192 == nil then
                            return false;
                        else
                            local v1193 = l_data_1[v1192];
                            if v1193 == nil then
                                return false;
                            else
                                local v1194 = v1189.inverse_inverter:get();
                                v1175(l_v1017_0, v1193, v1194);
                                return true;
                            end;
                        end;
                    else
                        local v1195 = l_v1121_0[v1188];
                        if v1195 == nil then
                            return false;
                        else
                            local v1196 = #v1195;
                            if globals.choked_commands == 0 then
                                if v1196 <= l_v1122_0 then
                                    l_v1122_0 = 0;
                                end;
                                l_v1122_0 = l_v1122_0 + 1;
                            end;
                            local v1197 = v1195[l_v1122_0];
                            if v1197 == nil then
                                return false;
                            else
                                local v1198 = v1189.inverse_inverter:get();
                                v1175(l_v1017_0, v1197, v1198);
                                return true;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        local function v1199()
            -- upvalues: v1186 (ref)
            v1186();
        end;
        local _ = nil;
        local function v1202()
            -- upvalues: v126 (ref), l_v1102_1 (ref), v1177 (ref)
            if v126.recorder.capture == nil then
                return;
            else
                local v1201 = l_v1102_1.sequence_list:get();
                if v126.recorder.sequence_end < v1201 then
                    v126.recorder.sequence_end = #v126.recorder.data;
                end;
                v126.recorder.sequence_start = v1201;
                v1177();
                return;
            end;
        end;
        local function v1204()
            -- upvalues: v126 (ref), l_v1102_1 (ref), v1177 (ref)
            if v126.recorder.capture == nil then
                return;
            else
                local v1203 = l_v1102_1.sequence_list:get();
                if v1203 < v126.recorder.sequence_start then
                    v126.recorder.sequence_start = 1;
                end;
                v126.recorder.sequence_end = v1203;
                v1177();
                return;
            end;
        end;
        local function v1210()
            -- upvalues: v1164 (ref), v1166 (ref), v126 (ref), v1171 (ref), v1177 (ref), v1179 (ref), v1186 (ref)
            local v1205 = v1164();
            if v1205 == nil then
                return;
            else
                local v1206 = v1166(v1205);
                if v1206 == nil then
                    return;
                else
                    local l_data_2 = v126.recorder.data;
                    if l_data_2 == nil then
                        return;
                    else
                        local v1208 = {};
                        for v1209 = v126.recorder.sequence_start, v126.recorder.sequence_end do
                            table.insert(v1208, l_data_2[v1209]);
                        end;
                        v1171(v1206, v1208);
                        v126.recorder.data = nil;
                        v126.recorder.capture = nil;
                        v126.recorder.sequence_start = nil;
                        v126.recorder.sequence_end = nil;
                        v1177();
                        v1179(false);
                        v1186();
                        return;
                    end;
                end;
            end;
        end;
        local function v1217()
            -- upvalues: v1164 (ref), v1166 (ref), l_clipboard_0 (ref), v1136 (ref), l_v1126_0 (ref), v126 (ref), v1179 (ref), v1177 (ref)
            local v1211 = v1164();
            if v1211 == nil then
                return;
            elseif v1166(v1211) == nil then
                return;
            else
                local v1212 = l_clipboard_0.get();
                if v1212 == nil then
                    return nil;
                else
                    local v1213, v1214 = v1136(v1212);
                    if not v1213 or v1214 == nil then
                        return;
                    else
                        local v1215, v1216 = l_v1126_0(v1214);
                        v1214 = v1216;
                        if not v1215 or v1214 == nil then
                            return;
                        else
                            v1215 = #v1214;
                            v126.recorder.data = v1214;
                            v126.recorder.capture = v1211;
                            v126.recorder.sequence_start = 1;
                            v126.recorder.sequence_end = v1215;
                            v1179(true);
                            v1177();
                            return;
                        end;
                    end;
                end;
            end;
        end;
        l_v1102_1.set_start_button:set_callback(v1202);
        l_v1102_1.set_end_button:set_callback(v1204);
        l_v1102_1.save_button:set_callback(v1210);
        l_v1102_1.import_button:set_callback(v1217);
        events.update_records(v1199);
        v1179(false);
        v1186();
    end;
    v1102 = {};
    v1106 = v360.antiaim.builder;
    v1120 = nil;
    v1121 = function(v1218)
        local v1219 = {};
        if v1218.x > 0 then
            table.insert(v1219, "Forward");
        end;
        if v1218.x < 0 then
            table.insert(v1219, "Backward");
        end;
        if v1218.y > 0 then
            table.insert(v1219, "Right");
        end;
        if v1218.y < 0 then
            table.insert(v1219, "Left");
        end;
        return table.concat(v1219, "-");
    end;
    do
        local l_v1106_2, l_v1120_1, l_v1121_1, l_v1122_1, l_v1126_1 = v1106, v1120, v1121, v1122, v1126;
        l_v1122_1 = function(v1225)
            -- upvalues: l_v1121_1 (ref), v370 (ref), l_v1017_0 (ref)
            local l_angles_1 = v1225.angles;
            local v1227 = l_angles_1.yaw_offset:get();
            local v1228 = nil;
            local v1229 = nil;
            local v1230 = l_angles_1.random:get();
            local v1231 = l_angles_1.add_yaw:get();
            if v1231 then
                v1228 = l_angles_1.yaw_left:get();
                v1229 = l_angles_1.yaw_right:get();
            end;
            if l_angles_1.direction ~= nil then
                local v1232 = l_angles_1[l_v1121_1(vector(v370.forwardmove, v370.sidemove))];
                if v1232 ~= nil and v1232.enabled:get() then
                    v1227 = v1232.yaw_offset:get();
                    if v1231 then
                        v1228 = v1232.yaw_left:get();
                        v1229 = v1232.yaw_right:get();
                    end;
                end;
            end;
            if v1230 > 0 and v1228 ~= nil and v1229 ~= nil then
                local v1233 = v1230 * 0.01;
                local v1234 = utils.random_float(-v1233 * 0.6, v1233 * 0.6);
                v1228 = v1228 + v1228 * v1234;
                v1229 = v1229 + v1229 * v1234;
            end;
            l_v1017_0.yaw = "Backward";
            l_v1017_0.yaw_offset = v1227;
            l_v1017_0.yaw_left = v1228;
            l_v1017_0.yaw_right = v1229;
        end;
        l_v1126_1 = function(v1235)
            -- upvalues: l_v1017_0 (ref)
            local l_angles_2 = v1235.angles;
            local v1237 = l_angles_2.yaw_jitter:get();
            local v1238 = l_angles_2.jitter_offset:get();
            if v1237 == "Off" then
                l_v1017_0.yaw_modifier = "Disabled";
                l_v1017_0.modifier_offset = nil;
                return;
            else
                local v1239 = l_angles_2.random:get();
                if v1239 > 0 then
                    local v1240 = v1239 * 0.01;
                    v1238 = v1238 + v1238 * utils.random_float(-v1240 * 0.6, v1240 * 0.6);
                end;
                l_v1017_0.yaw_modifier = v1237;
                l_v1017_0.modifier_offset = v1238;
                if l_angles_2.way_values ~= nil then
                    l_v1017_0.way = {};
                    for v1241 = 1, l_angles_2.way_count:get() do
                        l_v1017_0.way[v1241] = l_angles_2.way_values[v1241]:get();
                    end;
                end;
                return;
            end;
        end;
        local function v1253(v1242)
            -- upvalues: l_v1017_0 (ref)
            local l_angles_3 = v1242.angles;
            local v1244 = l_angles_3.body_yaw:get();
            local v1245 = l_angles_3.left_limit:get();
            local v1246 = l_angles_3.right_limit:get();
            local v1247 = v1244 ~= "Off";
            if v1247 then
                l_v1017_0.options = {};
                l_v1017_0.left_limit = v1245;
                l_v1017_0.right_limit = v1246;
                if v1244 == "Left" then
                    l_v1017_0.inverter = true;
                    l_v1017_0.right_limit = v1245;
                end;
                if v1244 == "Right" then
                    l_v1017_0.inverter = false;
                    l_v1017_0.left_limit = v1246;
                end;
                if v1244 == "Jitter" then
                    table.insert(l_v1017_0.options, "Jitter");
                    l_v1017_0.invert_chance = l_angles_3.invert_chance:get();
                end;
                if v1244 == "Random" then
                    table.insert(l_v1017_0.options, "Jitter");
                    table.insert(l_v1017_0.options, "Randomize Jitter");
                end;
                if l_angles_3.avoid_overlap:get() then
                    table.insert(l_v1017_0.options, "Avoid Overlap");
                end;
                l_v1017_0.freestanding_body_yaw = l_angles_3.freestanding_body_yaw:get();
            end;
            if l_angles_3.delay:get() then
                local v1248 = l_angles_3.delay_mode:get();
                if v1248 == "Default" then
                    local v1249 = l_angles_3.delay_value:get();
                    local v1250 = l_angles_3.delay_random:get();
                    if v1250 > 0 then
                        v1249 = utils.random_int(v1249, v1250);
                    end;
                    l_v1017_0.delay = v1249;
                end;
                if v1248 == "Custom" then
                    local v1251 = l_angles_3.delay_count:get();
                    local v1252 = math.random(1, v1251);
                    if l_angles_3.delay_values[v1252] ~= nil then
                        l_v1017_0.delay = l_angles_3.delay_values[v1252]:get();
                    end;
                end;
            end;
            l_v1017_0.body_yaw = v1247;
        end;
        v1102.get = function(_, v1255)
            -- upvalues: l_v1106_2 (ref)
            return l_v1106_2[v1255];
        end;
        v1102.is_active_ex = function(_, v1257)
            return v1257.enabled == nil or v1257.enabled:get();
        end;
        v1102.is_active = function(v1258, v1259)
            -- upvalues: v1102 (ref)
            local v1260 = v1258:get(v1259);
            if v1260 == nil then
                return false;
            else
                return v1102:is_active_ex(v1260);
            end;
        end;
        v1102.get_old_items = function(_)
            -- upvalues: l_v1120_1 (ref)
            return l_v1120_1;
        end;
        v1102.apply_ex = function(_, v1263)
            -- upvalues: l_v1017_0 (ref), l_v1122_1 (ref), l_v1126_1 (ref), v1253 (ref), l_v1120_1 (ref)
            if v1263 == nil then
                return false;
            else
                if v1263.angles ~= nil then
                    l_v1017_0.enabled = true;
                    l_v1017_0.pitch = "Down";
                    l_v1017_0.yaw_base = "At Target";
                    l_v1122_1(v1263);
                    l_v1126_1(v1263);
                    v1253(v1263);
                end;
                l_v1120_1 = v1263;
                return true;
            end;
        end;
        v1102.apply = function(v1264, v1265)
            -- upvalues: l_v1036_0 (ref)
            local v1266 = v1264:get(v1265);
            if v1266 == nil then
                return nil;
            elseif not v1264:is_active_ex(v1266) then
                return nil;
            else
                local v1267 = v1266.mode:get();
                if v1267 == "Builder" then
                    v1264:apply_ex(v1266);
                end;
                if v1267 == "Recorder" then
                    l_v1036_0:update(v1265);
                end;
                return v1266;
            end;
        end;
        v1102.update = function(v1268, _)
            -- upvalues: v374 (ref)
            if rage.exploit:get() ~= 1 then
                local v1270 = v1268:apply("Fakelag");
                if v1270 ~= nil then
                    return v1270;
                end;
            end;
            local v1271 = v1268:apply((v374.get()));
            if v1271 ~= nil then
                return v1271;
            else
                return v1268:apply("Shared");
            end;
        end;
        v875.builder = v1102;
    end;
    v1106 = {};
    v1120 = v360.antiaim.settings.antibrute;
    v1121 = nil;
    v1122 = nil;
    v1126 = nil;
    local v1272 = nil;
    local v1273 = v390.get_event_bus();
    do
        local l_v1120_2, l_v1121_2, l_v1122_2, l_v1126_2, l_v1272_0, l_v1273_0 = v1120, v1121, v1122, v1126, v1272, v1273;
        local function v1280()
            -- upvalues: l_v1120_2 (ref)
            if l_v1120_2.refresh_offset:get() then
                return math.random(-7, 13);
            else
                return nil;
            end;
        end;
        local function v1282()
            -- upvalues: l_v1120_2 (ref)
            local v1281 = l_v1120_2.refresh_modifier:get();
            if v1281 == "increase" then
                return math.random(0, 5);
            elseif v1281 == "decrease" then
                return math.random(-5, 0);
            elseif v1281 == "adaptive" then
                return math.random(-3, 5);
            else
                return nil;
            end;
        end;
        local function v1283()
            -- upvalues: l_v1121_2 (ref), l_v1122_2 (ref), l_v1126_2 (ref), l_v1272_0 (ref)
            l_v1121_2 = nil;
            l_v1122_2 = nil;
            l_v1126_2 = nil;
            l_v1272_0 = nil;
        end;
        v1106.update = function(_, _)
            -- upvalues: l_v1120_2 (ref), l_v1121_2 (ref), v1283 (ref), l_v1122_2 (ref), l_v1017_0 (ref), l_v1126_2 (ref), l_v1272_0 (ref)
            if not l_v1120_2.enabled:get() then
                return false;
            elseif l_v1121_2 ~= nil and globals.curtime > l_v1121_2 then
                v1283();
                return false;
            else
                if l_v1122_2 ~= nil then
                    l_v1017_0.delay = l_v1122_2;
                end;
                if l_v1126_2 ~= nil and l_v1017_0.yaw_offset ~= nil then
                    l_v1017_0.yaw_offset = l_v1017_0.yaw_offset + l_v1126_2;
                end;
                if l_v1272_0 ~= nil and l_v1017_0.modifier_offset ~= nil then
                    l_v1017_0.modifier_offset = l_v1017_0.modifier_offset + l_v1272_0;
                end;
                return true;
            end;
        end;
        local function v1287()
            -- upvalues: l_v1120_2 (ref), l_v1121_2 (ref), l_v1122_2 (ref), l_v1126_2 (ref), v1280 (ref), l_v1272_0 (ref), v1282 (ref)
            local v1286 = l_v1120_2.duration:get();
            if v1286 ~= 0 then
                l_v1121_2 = globals.curtime + v1286 * 0.1;
            end;
            if l_v1120_2.enforce_delay:get() then
                l_v1122_2 = math.random(1, 5);
            end;
            l_v1126_2 = v1280();
            l_v1272_0 = v1282();
        end;
        local _ = nil;
        local function v1291(v1289)
            -- upvalues: v1283 (ref), l_v1273_0 (ref), v1287 (ref)
            local v1290 = v1289:get();
            if not v1290 then
                v1283();
            end;
            l_v1273_0.enemy_shot:set(v1287, v1290);
        end;
        do
            local l_v1291_0 = v1291;
            local function v1295(v1293)
                -- upvalues: v1283 (ref), l_v1273_0 (ref), v1287 (ref), l_v1120_2 (ref), l_v1291_0 (ref)
                local v1294 = v1293:get();
                if not v1294 then
                    v1283();
                    l_v1273_0.enemy_shot:set(v1287, false);
                end;
                if v1294 then
                    l_v1120_2.enabled:set_callback(l_v1291_0, true);
                else
                    l_v1120_2.enabled:unset_callback(l_v1291_0);
                end;
            end;
            v360.antiaim.enabled:set_callback(v1295, true);
        end;
    end;
    v1120 = {};
    v1121 = v360.antiaim.settings.roll;
    do
        local l_v1121_3, l_v1122_3 = v1121, v1122;
        l_v1122_3 = function()
            -- upvalues: l_v1121_3 (ref)
            if l_v1121_3.change_on_fakelag:get() and rage.exploit:get() ~= 1 then
                return l_v1121_3.fakelag_value:get();
            else
                return l_v1121_3.value:get();
            end;
        end;
        v1120.update = function(_, v1299)
            -- upvalues: l_v1122_3 (ref)
            local v1300 = l_v1122_3();
            if v1300 == nil or v1300 == 0 then
                return;
            else
                v1299.view_angles.z = v1300;
                return;
            end;
        end;
    end;
    v1121 = {};
    v1122 = false;
    do
        local l_v1122_4, l_v1126_3 = v1122, v1126;
        l_v1126_3 = function(v1303, v1304)
            -- upvalues: l_play_0 (ref), l_v1122_4 (ref)
            local v1305 = entity.get_local_player();
            if v1305 == nil then
                return false;
            else
                local v1306 = v1305:get_player_weapon();
                if v1306 == nil then
                    return false;
                else
                    local l_m_iTeamNum_1 = v1305.m_iTeamNum;
                    local v1308 = v1305:get_origin();
                    local v1309 = v1306:get_weapon_index() == 49;
                    if v1305.m_bIsDefusing or v1305.m_bIsGrabbingHostage then
                        return false;
                    elseif v1305.m_bInBombZone and (not v1304.bomb_e_fix:get() or v1309) then
                        return false;
                    else
                        if l_m_iTeamNum_1 == 3 and v1303.view_angles.x > 15 then
                            local v1310 = entity.get_entities("CPlantedC4");
                            for v1311 = 1, #v1310 do
                                if (v1310[v1311]:get_origin() - v1308):lengthsqr() < 3844 then
                                    return false;
                                end;
                            end;
                        end;
                        local v1312 = l_play_0.camera_angles();
                        local v1313 = vector():angles(v1312);
                        local v1314 = v1305:get_eye_position();
                        local v1315 = v1314 + v1313 * 128;
                        local v1316 = utils.trace_line(v1314, v1315, v1305, 4294967295, 0);
                        if v1316.fraction ~= 1 then
                            local l_entity_0 = v1316.entity;
                            if l_entity_0 == nil then
                                return true;
                            else
                                local v1318 = l_entity_0:get_classname();
                                if v1318 == "CWorld" then
                                    return true;
                                elseif v1318 == "CFuncBrush" then
                                    return true;
                                elseif v1318 == "CCSPlayer" then
                                    return true;
                                elseif v1318 == "CHostage" and v1314:distsqr((l_entity_0:get_origin())) < 7056 then
                                    return false;
                                elseif not l_v1122_4 then
                                    l_v1122_4 = true;
                                    return false;
                                end;
                            end;
                        end;
                        return true;
                    end;
                end;
            end;
        end;
        v1121.update = function(_, v1320)
            -- upvalues: l_v1122_4 (ref), v1102 (ref), l_v1126_3 (ref), l_v1019_0 (ref), l_v1030_0 (ref), l_v1017_0 (ref)
            if not v1320.in_use then
                l_v1122_4 = false;
                return false;
            else
                local v1321 = v1102:get("On use");
                if v1321 == nil then
                    return false;
                elseif not v1102:is_active_ex(v1321) then
                    return false;
                elseif not l_v1126_3(v1320, v1321) then
                    return false;
                else
                    v1320.in_use = false;
                    v1102:apply_ex(v1321);
                    if v1321 ~= nil and v1321.defensive ~= nil then
                        l_v1019_0:apply(v1320, v1321.defensive);
                        l_v1030_0:update(v1320, v1321.defensive);
                    end;
                    if l_v1017_0.yaw_offset ~= nil then
                        l_v1017_0.yaw_offset = l_v1017_0.yaw_offset + 180;
                    end;
                    l_v1017_0.pitch = "Disabled";
                    l_v1017_0.yaw_base = "Local View";
                    l_v1017_0.freestanding = false;
                    return true;
                end;
            end;
        end;
    end;
    v1122 = {};
    v1126 = v360.antiaim.settings.manual_yaw;
    v1272 = {
        Forward = 180, 
        Right = 90, 
        Left = -90, 
        Backward = 0
    };
    do
        local l_v1126_4, l_v1272_1, l_v1273_1 = v1126, v1272, v1273;
        l_v1273_1 = function()
            -- upvalues: l_v1272_1 (ref), l_v1126_4 (ref)
            return l_v1272_1[l_v1126_4.select:get()];
        end;
        v1122.update = function(_, v1326)
            -- upvalues: l_v1273_1 (ref), l_v1017_0 (ref), l_v1126_4 (ref), v1102 (ref), l_v1030_0 (ref), l_v1019_0 (ref)
            local v1327 = l_v1273_1();
            if v1327 == nil then
                return false;
            else
                local v1328 = l_v1017_0.yaw_offset or 0;
                l_v1017_0.enabled = true;
                l_v1017_0.yaw_offset = v1328 + v1327;
                l_v1017_0.freestanding = false;
                if l_v1126_4.disable_yaw_modifiers:get() then
                    l_v1017_0.yaw_offset = v1328 + v1327;
                    l_v1017_0.yaw_left = 0;
                    l_v1017_0.yaw_right = 0;
                    l_v1017_0.yaw_modifier = "Disabled";
                    l_v1017_0.modifier_offset = 0;
                end;
                if l_v1126_4.body_freestanding:get() then
                    l_v1017_0.body_yaw = true;
                    l_v1017_0.left_limit = 60;
                    l_v1017_0.right_limit = 60;
                    l_v1017_0.options = {};
                    l_v1017_0.freestanding_body_yaw = "Peek Fake";
                end;
                local v1329 = v1102:apply("Manual Yaw");
                if v1329 ~= nil then
                    l_v1017_0.yaw_offset = l_v1017_0.yaw_offset + v1327;
                    if v1329.defensive ~= nil and (l_v1030_0:update(v1326, v1329.defensive) or l_v1019_0:apply(v1326, v1329.defensive)) then
                        local l_yaw_offset_0 = l_v1017_0.defensive.yaw_offset;
                        if l_yaw_offset_0 ~= nil then
                            l_v1017_0.defensive.yaw_offset = l_yaw_offset_0 + v1327;
                        end;
                    end;
                end;
                l_v1017_0.yaw_base = "Local View";
                return true;
            end;
        end;
    end;
    v1126 = {};
    v1272 = v360.antiaim.settings.freestanding;
    v1273 = function()
        -- upvalues: v370 (ref), v28 (ref)
        if not v370.is_onground then
            return "Air";
        elseif v370.is_crouched then
            return "Crouching";
        elseif v370.is_moving then
            if v28.antiaim.misc.slow_walk:get() then
                return "Slow motion";
            else
                return "Running";
            end;
        else
            return "Standing";
        end;
    end;
    do
        local l_v1272_2, l_v1273_2 = v1272, v1273;
        local function v1333()
            -- upvalues: l_v1272_2 (ref), l_v1273_2 (ref)
            return l_v1272_2.disablers:get(l_v1273_2());
        end;
        local function v1334()
            -- upvalues: l_v1272_2 (ref), v1333 (ref)
            return l_v1272_2.enabled:get() and not v1333();
        end;
        local function v1337()
            local v1335 = rage.antiaim:get_target(false);
            local v1336 = rage.antiaim:get_target(true);
            if v1335 == nil or v1336 == nil then
                return nil;
            else
                return v1336 - v1335;
            end;
        end;
        local function v1342(v1338)
            -- upvalues: v1337 (ref), v1102 (ref), l_v1017_0 (ref), l_v1272_2 (ref), l_v1030_0 (ref), l_v1019_0 (ref)
            local v1339 = v1337();
            if v1339 == nil then
                return;
            else
                local v1340 = v1102:apply("Freestanding");
                if v1340 == nil then
                    l_v1017_0.freestanding = true;
                    l_v1017_0.freestanding_disable_yaw_modifiers = l_v1272_2.disable_yaw_modifiers:get();
                    l_v1017_0.freestanding_body_freestanding = l_v1272_2.body_freestanding:get();
                    return;
                else
                    l_v1017_0.yaw_offset = l_v1017_0.yaw_offset + v1339;
                    if v1340.defensive ~= nil and (l_v1030_0:update(v1338, v1340.defensive) or l_v1019_0:apply(v1338, v1340.defensive)) then
                        local l_yaw_offset_1 = l_v1017_0.defensive.yaw_offset;
                        if l_yaw_offset_1 ~= nil then
                            l_v1017_0.defensive.yaw_offset = l_yaw_offset_1 + v1339;
                        end;
                    end;
                    l_v1017_0.freestanding = false;
                    return;
                end;
            end;
        end;
        v1126.update = function(_, v1344)
            -- upvalues: v1334 (ref), l_v1017_0 (ref), v1342 (ref)
            if not v1334() then
                l_v1017_0.freestanding = false;
                return false;
            else
                v1342(v1344);
                return true;
            end;
        end;
    end;
    v1272 = {};
    v1273 = v360.antiaim.settings.edge_yaw;
    local function v1359(v1345)
        local v1346 = entity.get_local_player();
        if v1346 == nil then
            return nil;
        else
            local v1347 = v1346:get_eye_position();
            if v1347 == nil then
                return nil;
            else
                local v1348 = 1;
                local v1349 = nil;
                local v1350 = {};
                for v1351 = -180, 179, 45 do
                    local v1352 = v1347 + vector():angles(vector(0, v1351, 0)) * 24;
                    local v1353 = utils.trace_line(v1347, v1352, v1346);
                    if v1353.fraction < v1348 and (v1353.entity == nil or not v1353.entity:is_player()) then
                        local l_fraction_0 = v1353.fraction;
                        v1349 = v1351;
                        v1348 = l_fraction_0;
                    end;
                end;
                if v1349 == nil then
                    return nil;
                else
                    for v1355 = v1349 - 30, v1349 + 30, 10 do
                        local v1356 = v1347 + vector():angles(vector(0, v1355, 0)) * 24;
                        local v1357 = utils.trace_line(v1347, v1356, v1346, nil, 1);
                        if v1357.fraction < 1 then
                            v1350[#v1350 + 1] = v1355;
                            if v1357.fraction < v1348 then
                                local l_fraction_1 = v1357.fraction;
                                v1349 = v1355;
                                v1348 = l_fraction_1;
                            end;
                        end;
                    end;
                    return math.normalize_yaw(v1349 * 2 - v1345.move_yaw);
                end;
            end;
        end;
    end;
    do
        local l_v1273_3, l_v1359_0 = v1273, v1359;
        v1272.update = function(_, v1363)
            -- upvalues: l_v1273_3 (ref), l_v1359_0 (ref), l_v1017_0 (ref)
            if not l_v1273_3.enabled:get() then
                return false;
            else
                local v1364 = l_v1359_0(v1363);
                if v1364 == nil then
                    return false;
                else
                    l_v1017_0.yaw_offset = (l_v1017_0.yaw_offset or 0) + v1364;
                    return true;
                end;
            end;
        end;
    end;
    v1273 = {};
    v1359 = v360.antiaim.settings.safe_head;
    local v1365 = 0;
    local v1366 = 1440000;
    local function v1368(v1367)
        return v1367:get_weapon_index() == 31;
    end;
    do
        local l_v1359_1, l_v1365_0, l_v1366_0, l_v1368_0 = v1359, v1365, v1366, v1368;
        local function v1375(v1373)
            -- upvalues: l_v1368_0 (ref), l_v1365_0 (ref)
            if l_v1368_0(v1373) then
                return false;
            else
                local v1374 = v1373:get_weapon_info();
                if v1374 == nil then
                    return false;
                else
                    return v1374.weapon_type == l_v1365_0;
                end;
            end;
        end;
        local function v1386()
            -- upvalues: v1375 (ref), l_v1368_0 (ref), v370 (ref), l_v1359_1 (ref), l_v1366_0 (ref)
            local v1376 = entity.get_local_player();
            if v1376 == nil then
                return nil;
            else
                local v1377 = v1376:get_player_weapon();
                if v1377 == nil then
                    return nil;
                else
                    local v1378 = entity.get_threat();
                    if v1378 == nil then
                        return nil;
                    else
                        local v1379 = v1375(v1377);
                        local v1380 = l_v1368_0(v1377);
                        local v1381 = not v370.is_onground;
                        local l_is_moving_0 = v370.is_moving;
                        local l_is_crouched_0 = v370.is_crouched;
                        local v1384 = v1376:get_origin() - v1378:get_origin();
                        local v1385 = v1384:lengthsqr();
                        if v1379 and v1381 and l_is_crouched_0 and l_v1359_1.select:get("With Knife") then
                            return "With Knife";
                        elseif v1380 and v1381 and l_is_crouched_0 and l_v1359_1.select:get("With Taser") then
                            return "With Taser";
                        elseif v1384.z > 50 and (not l_is_moving_0 or l_is_crouched_0) and l_v1359_1.select:get("Above Enemy") then
                            return "Above Enemy";
                        elseif l_v1366_0 < v1385 and not l_is_moving_0 and l_is_crouched_0 and l_v1359_1.select:get("Far from Enemy") then
                            return "Far from Enemy";
                        else
                            return nil;
                        end;
                    end;
                end;
            end;
        end;
        local function v1390(v1387, _)
            -- upvalues: v1102 (ref), l_v1019_0 (ref), l_v1030_0 (ref), l_v1017_0 (ref)
            local v1389 = v1102:apply("Safe Head");
            if v1389 ~= nil then
                if v1387 ~= nil and v1389.defensive ~= nil then
                    l_v1019_0:apply(v1387, v1389.defensive);
                    l_v1030_0:update(v1387, v1389.defensive);
                end;
                return true;
            else
                l_v1017_0.pitch = "Down";
                l_v1017_0.yaw_base = "At Target";
                l_v1017_0.yaw = "Backward";
                l_v1017_0.yaw_offset = 10;
                l_v1017_0.yaw_left = 0;
                l_v1017_0.yaw_right = 0;
                l_v1017_0.yaw_modifier = "Off";
                l_v1017_0.modifier_offset = 0;
                l_v1017_0.body_yaw = true;
                l_v1017_0.left_limit = 0;
                l_v1017_0.right_limit = 0;
                l_v1017_0.freestanding_body_yaw = "Off";
                return;
            end;
        end;
        v1273.update = function(_, v1392)
            -- upvalues: v1386 (ref), v1390 (ref)
            local v1393 = v1386();
            if v1393 == nil then
                return false;
            else
                v1390(v1392, v1393);
                return true;
            end;
        end;
    end;
    v1359 = function()
        -- upvalues: l_v1017_0 (ref), l_l_match_0_2 (ref), v9 (ref), l_v876_1 (ref), l_v877_2 (ref)
        if rage.exploit:get() == 1 then
            local v1394 = math.max(1, l_v1017_0.delay or 1);
            l_l_match_0_2 = l_l_match_0_2 + 1;
            if l_l_match_0_2 < v1394 then
                return;
            end;
        end;
        local v1395 = true;
        if l_v1017_0.options ~= nil and v9(l_v1017_0.options, "Randomize Jitter") ~= nil then
            v1395 = utils.random_int(0, 1) == 0;
        end;
        if l_v1017_0.invert_chance ~= nil and l_v1017_0.invert_chance < utils.random_int(0, 100) then
            v1395 = false;
        end;
        l_v876_1 = l_v876_1 + 1;
        if v1395 then
            l_v877_2 = not l_v877_2;
        end;
        l_l_match_0_2 = 0;
    end;
    v1365 = function()
        -- upvalues: l_v1017_0 (ref), l_v1016_0 (ref), l_v925_1 (ref), l_v926_1 (ref)
        local l_defensive_0 = l_v1017_0.defensive;
        local v1397 = 1;
        if l_defensive_0 ~= nil and l_defensive_0.delay ~= nil then
            v1397 = math.max(1, l_defensive_0.delay);
        end;
        l_v1016_0 = l_v1016_0 + 1;
        if l_v1016_0 < v1397 then
            return;
        else
            l_v925_1 = l_v925_1 + 1;
            l_v926_1 = not l_v926_1;
            l_v1016_0 = 0;
            return;
        end;
    end;
    v1366 = function()
        -- upvalues: l_v1017_0 (ref), l_v926_1 (ref), l_v925_1 (ref), l_v927_1 (ref)
        local l_defensive_1 = l_v1017_0.defensive;
        if l_defensive_1 == nil then
            return;
        else
            if l_defensive_1.pitch_offset ~= nil then
                rage.antiaim:override_hidden_pitch(l_defensive_1.pitch_offset);
            end;
            if l_defensive_1.yaw_offset ~= nil then
                local l_yaw_offset_2 = l_defensive_1.yaw_offset;
                if l_v1017_0.yaw_offset ~= nil then
                    l_yaw_offset_2 = l_yaw_offset_2 - l_v1017_0.yaw_offset;
                end;
                if l_defensive_1.yaw_left ~= nil and l_v926_1 == true then
                    l_yaw_offset_2 = l_yaw_offset_2 + l_defensive_1.yaw_left;
                end;
                if l_defensive_1.yaw_right ~= nil and l_v926_1 == false then
                    l_yaw_offset_2 = l_yaw_offset_2 + l_defensive_1.yaw_right;
                end;
                if l_defensive_1.yaw_modifier == "Offset" then
                    local l_modifier_offset_0 = l_defensive_1.modifier_offset;
                    if not l_v926_1 then
                        l_modifier_offset_0 = 0;
                    end;
                    l_yaw_offset_2 = l_yaw_offset_2 + l_modifier_offset_0;
                end;
                if l_defensive_1.yaw_modifier == "Center" then
                    local v1401 = l_defensive_1.modifier_offset * 0.5;
                    if not l_v926_1 then
                        v1401 = -v1401;
                    end;
                    l_yaw_offset_2 = l_yaw_offset_2 + v1401;
                end;
                if l_defensive_1.yaw_modifier == "Skitter" then
                    l_yaw_offset_2 = l_yaw_offset_2 + l_defensive_1.modifier_offset * l_v927_1[l_v925_1 % #l_v927_1 + 1];
                end;
                rage.antiaim:override_hidden_yaw_offset(-l_yaw_offset_2);
            end;
            return;
        end;
    end;
    v1368 = function()
        -- upvalues: l_v1017_0 (ref)
        if l_v1017_0.yaw_left ~= nil and l_v1017_0.yaw_right ~= nil then
            local v1402 = l_v1017_0.yaw_offset or 0;
            if l_v1017_0.inverter == true then
                l_v1017_0.yaw_offset = v1402 + l_v1017_0.yaw_left;
            end;
            if l_v1017_0.inverter == false then
                l_v1017_0.yaw_offset = v1402 + l_v1017_0.yaw_right;
            end;
            return;
        else
            return;
        end;
    end;
    local function v1425()
        -- upvalues: l_v1017_0 (ref), l_v924_1 (ref), l_v923_0 (ref), l_v877_2 (ref), l_v876_1 (ref), l_v927_1 (ref), v16 (ref)
        if l_v1017_0.yaw_modifier == "Angelic" then
            local v1403 = {
                [1] = "Offset", 
                [2] = "Random", 
                [3] = "Skitter", 
                [4] = "Center"
            };
            local l_modifier_offset_1 = l_v1017_0.modifier_offset;
            if globals.realtime - l_v924_1 > 0.15 then
                l_v924_1 = globals.realtime;
                l_v923_0 = v1403[math.random(1, #v1403)];
            end;
            local v1405 = globals.tickcount * 0.2;
            local _ = l_v923_0;
            local _ = math.floor(math.sin(v1405) * l_modifier_offset_1);
            l_v1017_0.yaw_modifier = modifier_value;
            l_v1017_0.modifier_offset = modifier_offset;
        end;
        if l_v1017_0.yaw_modifier == "Offset" then
            local v1408 = l_v1017_0.yaw_offset or 0;
            local l_modifier_offset_2 = l_v1017_0.modifier_offset;
            l_v1017_0.yaw_modifier = "Off";
            l_v1017_0.modifier_offset = 0;
            l_v1017_0.yaw_offset = v1408 + (l_v877_2 and l_modifier_offset_2 or 0);
            return;
        elseif l_v1017_0.yaw_modifier == "Center" then
            local v1410 = l_v1017_0.yaw_offset or 0;
            local l_modifier_offset_3 = l_v1017_0.modifier_offset;
            if not l_v877_2 then
                l_modifier_offset_3 = -l_modifier_offset_3;
            end;
            l_v1017_0.yaw_modifier = "Off";
            l_v1017_0.modifier_offset = 0;
            l_v1017_0.yaw_offset = v1410 + l_modifier_offset_3 / 2;
            return;
        elseif l_v1017_0.yaw_modifier == "Skitter" then
            local v1412 = l_v927_1[l_v876_1 % #l_v927_1 + 1];
            local v1413 = l_v1017_0.yaw_offset or 0;
            local l_modifier_offset_4 = l_v1017_0.modifier_offset;
            l_v1017_0.yaw_modifier = "Off";
            l_v1017_0.modifier_offset = 0;
            l_v1017_0.yaw_offset = v1413 + l_modifier_offset_4 * v1412;
            return;
        elseif l_v1017_0.yaw_modifier == "Custom Ways" then
            local v1415 = l_v1017_0.yaw_offset or 0;
            local v1416 = 0;
            if l_v1017_0.way ~= nil then
                local v1417 = #l_v1017_0.way;
                local v1418 = l_v876_1 % v1417 + 1;
                local v1419 = l_v1017_0.way[v1418];
                if v1419 ~= nil then
                    v1416 = v1419;
                end;
            end;
            l_v1017_0.yaw_modifier = "Off";
            l_v1017_0.modifier_offset = 0;
            l_v1017_0.yaw_offset = v1415 + v1416;
            return;
        elseif l_v1017_0.yaw_modifier == "Spin" then
            local v1420 = globals.curtime * 3;
            local v1421 = l_v1017_0.yaw_offset or 0;
            local l_modifier_offset_5 = l_v1017_0.modifier_offset;
            l_v1017_0.yaw_modifier = "Off";
            l_v1017_0.modifier_offset = 0;
            l_v1017_0.yaw_offset = v1421 + v16.lerp(-l_modifier_offset_5, l_modifier_offset_5, v1420 % 1);
            return;
        elseif l_v1017_0.yaw_modifier == "Random" then
            local v1423 = l_v1017_0.yaw_offset or 0;
            local l_modifier_offset_6 = l_v1017_0.modifier_offset;
            l_v1017_0.yaw_modifier = "Off";
            l_v1017_0.modifier_offset = 0;
            l_v1017_0.yaw_offset = v1423 + utils.random_int(-l_modifier_offset_6, l_modifier_offset_6);
            return;
        else
            return;
        end;
    end;
    local function v1430()
        -- upvalues: l_v1017_0 (ref), l_v877_2 (ref)
        if l_v1017_0.options == nil then
            return;
        else
            local v1426 = false;
            local v1427 = {};
            for v1428 = 1, #l_v1017_0.options do
                local v1429 = l_v1017_0.options[v1428];
                if v1429 == "Jitter" then
                    v1426 = true;
                elseif v1429 ~= "Randomize Jitter" then
                    table.insert(v1427, v1429);
                end;
            end;
            if v1426 then
                l_v1017_0.inverter = l_v877_2;
            end;
            l_v1017_0.options = v1427;
            return;
        end;
    end;
    local function v1433(v1431)
        -- upvalues: l_l_angles_0_1 (ref), l_v1019_0 (ref), v1102 (ref), v1106 (ref), v1121 (ref), v1120 (ref), v1122 (ref), v1126 (ref), v1273 (ref), v1272 (ref), l_v1030_0 (ref)
        if l_l_angles_0_1:update(v1431) then
            return;
        else
            l_v1019_0:update(v1431);
            local v1432 = v1102:update();
            v1106:update(v1431);
            if v1121:update(v1431) then
                return;
            else
                v1120:update(v1431);
                if v1122:update(v1431) then
                    return;
                elseif v1126:update(v1431) then
                    return;
                elseif v1273:update(v1431) then
                    return;
                elseif v1272:update(v1431) then
                    return;
                else
                    if v1432 ~= nil and v1432.defensive ~= nil then
                        l_v1019_0:apply(v1431, v1432.defensive);
                        l_v1030_0:update(v1431, v1432.defensive);
                    end;
                    return;
                end;
            end;
        end;
    end;
    local function v1435(v1434)
        -- upvalues: v1359 (ref), v1365 (ref), v1430 (ref), v1425 (ref), v1368 (ref), v1366 (ref)
        rage.antiaim:override_hidden_yaw_offset(0);
        if v1434.choked_commands == 0 then
            v1359();
            v1365();
        end;
        v1430();
        v1425();
        v1368();
        v1366();
    end;
    local function v1436()
        -- upvalues: l_v1017_0 (ref)
        l_v1017_0:unset();
    end;
    local function v1438(v1437)
        -- upvalues: l_v1017_0 (ref), v1433 (ref), v1435 (ref)
        l_v1017_0:clear();
        l_v1017_0:unset();
        v1433(v1437);
        v1435(v1437);
        l_v1017_0:set();
    end;
    local _ = nil;
    local l_antiaim_0 = v360.antiaim;
    local function v1443(v1441)
        -- upvalues: l_v1017_0 (ref), v28 (ref), v1436 (ref), v1438 (ref)
        local v1442 = v1441:get();
        if not v1442 then
            l_v1017_0:unset();
            v28.ragebot.main.hide_shots[2]:override();
            v28.ragebot.main.double_tap[2]:override();
        end;
        events.shutdown(v1436, v1442);
        events.createmove(v1438, v1442);
    end;
    l_antiaim_0.enabled:set_callback(v1443, true);
end;
v876 = nil;
v877 = nil;
v923 = v360.ragebot.aimtools;
v924 = 0;
v925 = 1;
v926 = 2;
v927 = 3;
l_match_0 = 4;
v1016 = 5;
v1017 = 6;
l_angles_0 = 7;
v1019 = 10;
v1030 = 1;
v1036 = 5;
local l_aimtools_0 = v127.aimtools;
local v1445 = {};
local v1446 = {};
do
    local l_v923_1, l_v925_2, l_v927_2, l_v1017_1, l_l_angles_0_2, l_v1030_1, l_v1036_1, l_l_aimtools_0_0, l_v1445_0, l_v1446_0 = v923, v925, v927, v1017, l_angles_0, v1030, v1036, l_aimtools_0, v1445, v1446;
    local function v1458(v1457)
        -- upvalues: l_v1446_0 (ref)
        l_v1446_0[v1457] = {
            head_scale = ui.find("Aimbot", "Ragebot", "Selection", v1457, "Multipoint", "Head Scale"), 
            body_scale = ui.find("Aimbot", "Ragebot", "Selection", v1457, "Multipoint", "Body Scale"), 
            hit_chance = ui.find("Aimbot", "Ragebot", "Selection", v1457, "Hit Chance"), 
            body_aim = ui.find("Aimbot", "Ragebot", "Safety", v1457, "Body Aim"), 
            safe_points = ui.find("Aimbot", "Ragebot", "Safety", v1457, "Safe Points")
        };
    end;
    for v1459 = 1, #l_l_aimtools_0_0 do
        v1458(l_l_aimtools_0_0[v1459]);
    end;
    v1458 = function(v1460)
        -- upvalues: l_v1030_1 (ref), l_v1036_1 (ref)
        local v1461 = v1460:get_weapon_info();
        if v1461 == nil then
            return nil;
        else
            local l_weapon_type_0 = v1461.weapon_type;
            local v1463 = v1460:get_weapon_index();
            if l_weapon_type_0 == l_v1030_1 then
                if v1463 == 1 then
                    return "Desert Eagle";
                elseif v1463 == 64 then
                    return "R8 Revolver";
                else
                    return "Pistols";
                end;
            elseif l_weapon_type_0 == l_v1036_1 then
                if v1463 == 9 then
                    return "AWP";
                elseif v1463 == 40 then
                    return "SSG-08";
                else
                    return "AutoSnipers";
                end;
            else
                return nil;
            end;
        end;
    end;
    local function v1465(v1464)
        -- upvalues: l_v925_2 (ref), l_v927_2 (ref), l_v1017_1 (ref), l_l_angles_0_2 (ref)
        if v1464 == l_v925_2 then
            return 4;
        elseif v1464 == l_v927_2 then
            return 1.25;
        elseif v1464 == l_v1017_1 then
            return 0.75;
        elseif v1464 == l_l_angles_0_2 then
            return 0.75;
        else
            return 1;
        end;
    end;
    local function v1470(v1466, v1467, v1468, v1469)
        -- upvalues: v1465 (ref), l_v925_2 (ref)
        v1467 = v1467 * v1465(v1468);
        if v1466.m_ArmorValue > 0 then
            if v1468 == l_v925_2 then
                if v1466.m_bHasHelmet then
                    v1467 = v1467 * (v1469 * 0.5);
                end;
            else
                v1467 = v1467 * (v1469 * 0.5);
            end;
        end;
        return v1467;
    end;
    local function v1482(v1471, v1472, v1473, v1474, v1475)
        -- upvalues: v1470 (ref)
        local v1476 = v1472 - v1471;
        local l_damage_0 = v1475.damage;
        local l_armor_ratio_0 = v1475.armor_ratio;
        local l_range_0 = v1475.range;
        local l_range_modifier_0 = v1475.range_modifier;
        local v1481 = math.min(l_range_0, v1476:length());
        l_damage_0 = l_damage_0 * math.pow(l_range_modifier_0, v1481 * 0.002);
        return (v1470(v1473, l_damage_0, v1474, l_armor_ratio_0));
    end;
    local function v1487(v1483, v1484)
        local v1485 = v1483:get_origin();
        local v1486 = v1484:get_origin();
        return v1485.z - v1486.z > 53;
    end;
    local function v1491(v1488, v1489)
        local v1490 = v1488:get_origin();
        return v1489:get_origin().z - v1490.z > 53;
    end;
    local function v1497(v1492, v1493, v1494, v1495, v1496)
        -- upvalues: v1482 (ref)
        return v1482(v1492, v1493, v1494, v1495, v1496) >= v1494.m_iHealth;
    end;
    local function v1500()
        -- upvalues: l_l_aimtools_0_0 (ref), l_v1446_0 (ref)
        for v1498 = 1, #l_l_aimtools_0_0 do
            local v1499 = l_v1446_0[l_l_aimtools_0_0[v1498]];
            v1499.head_scale:override();
            v1499.body_scale:override();
            v1499.hit_chance:override();
            v1499.body_aim:override();
            v1499.safe_points:override();
        end;
    end;
    local function v1501()
        return {
            force_safe = false, 
            misses = 0, 
            prefer_body = false
        };
    end;
    local function v1503(v1502)
        -- upvalues: l_v1445_0 (ref)
        return l_v1445_0[v1502];
    end;
    local function v1506(v1504)
        -- upvalues: v1503 (ref), v1501 (ref), l_v1445_0 (ref)
        local v1505 = v1503(v1504);
        if v1505 == nil then
            v1505 = v1501();
            l_v1445_0[v1504] = v1505;
        end;
        return v1505;
    end;
    local function v1508(v1507)
        -- upvalues: l_v1445_0 (ref)
        l_v1445_0[v1507] = nil;
    end;
    local function v1510()
        -- upvalues: l_v1445_0 (ref), v1508 (ref)
        for v1509 in pairs(l_v1445_0) do
            v1508(v1509);
        end;
    end;
    local function v1521(v1511, v1512, v1513, v1514, v1515, v1516)
        -- upvalues: v1487 (ref), v1491 (ref), v1497 (ref)
        local v1517 = v1511:get_eye_position();
        local v1518 = v1513:get_hitbox_position(5);
        local v1519 = v1512:get_weapon_info();
        local v1520 = v1516.body_aim:get() ~= "Force" and (v1515.conditions:get("Higher than you") and v1487(v1513, v1511) or v1515.conditions:get("Lower than you") and v1491(v1513, v1511) or v1515.conditions:get("Lethal") and v1497(v1517, v1518, v1513, 3, v1519) or v1515.conditions:get("After X misses") and not (v1514.misses <= v1515.max_misses:get()) or v1515.conditions:get("HP lower than X") and v1513.m_iHealth < v1515.lower_hp:get());
        v1516.body_aim:override(v1520 and "Prefer" or nil);
        v1514.prefer_body = v1520;
    end;
    local function v1532(v1522, v1523, v1524, v1525, v1526, v1527)
        -- upvalues: v1487 (ref), v1491 (ref), v1497 (ref)
        local v1528 = v1522:get_eye_position();
        local v1529 = v1524:get_hitbox_position(5);
        local v1530 = v1523:get_weapon_info();
        local v1531 = v1526.conditions:get("Higher than you") and v1487(v1524, v1522) or v1526.conditions:get("Lower than you") and v1491(v1524, v1522) or v1526.conditions:get("Lethal") and v1497(v1528, v1529, v1524, 3, v1530) or v1526.conditions:get("After X misses") and v1525.misses > v1526.max_misses:get() or v1526.conditions:get("HP lower than X") and v1524.m_iHealth < v1526.lower_hp:get();
        v1527.safe_points:override(v1531 and "Force" or nil);
        v1525.force_safe = v1531;
    end;
    local function v1543(v1533, v1534, v1535, v1536, v1537, v1538)
        -- upvalues: v1487 (ref), v1491 (ref), v1497 (ref)
        local v1539 = v1533:get_eye_position();
        local v1540 = v1535:get_hitbox_position(5);
        local v1541 = v1534:get_weapon_info();
        local v1542 = v1537["Higher than you"].enabled:get() and v1487(v1535, v1533) and v1537["Higher than you"].value:get() or v1537["Lower than you"].enabled:get() and v1491(v1535, v1533) and v1537["Lower than you"].value:get() or v1537.Lethal.enabled:get() and v1497(v1539, v1540, v1535, 3, v1541) and v1537.Lethal.value:get() or v1537["After X misses"].enabled:get() and v1536.misses > v1537["After X misses"].max_misses:get() and v1537["After X misses"].value:get() or v1537["HP lower than X"].enabled:get() and v1535.m_iHealth < v1537["HP lower than X"].lower_hp:get() and v1537["HP lower than X"].value:get() or nil;
        v1538.hit_chance:override(v1542);
        v1536.hit_chance = v1542;
    end;
    local function v1554(v1544, v1545, v1546, v1547, v1548, v1549)
        -- upvalues: v1487 (ref), v1491 (ref), v1497 (ref)
        local v1550 = v1544:get_eye_position();
        local v1551 = v1546:get_hitbox_position(5);
        local v1552 = v1545:get_weapon_info();
        local v1553 = v1548["Higher than you"].enabled:get() and v1487(v1546, v1544) and v1548["Higher than you"].value:get() or v1548["Lower than you"].enabled:get() and v1491(v1546, v1544) and v1548["Lower than you"].value:get() or v1548.Lethal.enabled:get() and v1497(v1550, v1551, v1546, 3, v1552) and v1548.Lethal.value:get() or v1548["After X misses"].enabled:get() and v1547.misses > v1548["After X misses"].max_misses:get() and v1548["After X misses"].value:get() or v1548["HP lower than X"].enabled:get() and v1546.m_iHealth < v1548["HP lower than X"].lower_hp:get() and v1548["HP lower than X"].value:get() or nil;
        v1549.head_scale:override(v1553);
        v1549.body_scale:override(v1553);
        v1547.multipoints = v1553;
    end;
    local function v1562(v1555, v1556, v1557)
        -- upvalues: v1458 (ref), l_v923_1 (ref), l_v1446_0 (ref), v1506 (ref), v1521 (ref), v1532 (ref), v1543 (ref), v1554 (ref), v1500 (ref)
        local v1558 = v1458(v1557);
        local v1559 = l_v923_1[v1558];
        local v1560 = l_v1446_0[v1558];
        if v1556 ~= nil and v1559 ~= nil and v1560 ~= nil then
            local v1561 = v1506(v1556:get_index());
            v1521(v1555, v1557, v1556, v1561, v1559.prefer_body, v1560);
            v1532(v1555, v1557, v1556, v1561, v1559.force_safe, v1560);
            v1543(v1555, v1557, v1556, v1561, v1559.hit_chance, v1560);
            v1554(v1555, v1557, v1556, v1561, v1559.multipoints, v1560);
        else
            v1500();
        end;
    end;
    local function v1563()
        -- upvalues: v1500 (ref)
        v1500();
    end;
    local function v1566()
        -- upvalues: v1562 (ref)
        local v1564 = entity.get_local_player();
        if v1564 == nil then
            return;
        else
            local v1565 = v1564:get_player_weapon();
            if v1565 == nil then
                return;
            else
                v1562(v1564, entity.get_threat(), v1565);
                return;
            end;
        end;
    end;
    local function v1578()
        -- upvalues: v1458 (ref), v1503 (ref), l_play_0 (ref)
        local v1567 = entity.get_local_player();
        if v1567 == nil or not v1567:is_alive() then
            return;
        else
            local v1568 = v1567:get_player_weapon();
            if v1568 == nil then
                return;
            else
                local v1569 = entity.get_threat();
                local v1570 = v1458(v1568);
                if v1569 == nil or v1570 == nil then
                    return;
                else
                    local v1571 = v1503(v1569:get_index());
                    if v1571 == nil then
                        return;
                    else
                        local v1572 = {};
                        if v1571.prefer_body then
                            table.insert(v1572, "BODY");
                        end;
                        if v1571.force_safe then
                            table.insert(v1572, "SAFE");
                        end;
                        if v1571.multipoints ~= nil then
                            table.insert(v1572, v1571.multipoints);
                        end;
                        if v1571.hit_chance ~= nil then
                            table.insert(v1572, v1571.hit_chance .. "%");
                        end;
                        if #v1572 == 0 then
                            return;
                        else
                            local v1573 = v1569:get_bbox();
                            if v1573 == nil then
                                return;
                            else
                                local l_pos1_0 = v1573.pos1;
                                local l_pos2_0 = v1573.pos2;
                                local l_alpha_0 = v1573.alpha;
                                if l_pos1_0 == nil or l_pos2_0 == nil or l_alpha_0 == nil then
                                    return;
                                else
                                    local v1577 = vector((v1573.pos1.x + v1573.pos2.x) * 0.5, v1573.pos1.y - 20);
                                    l_play_0.text(1, v1577, color(255, 255, 255, 200 * l_alpha_0), "c", table.concat(v1572, " + "));
                                    return;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
    local function v1583(v1579)
        -- upvalues: v1506 (ref)
        local l_state_1 = v1579.state;
        local l_target_0 = v1579.target;
        if l_state_1 == nil or l_target_0 == nil then
            return;
        else
            local v1582 = v1506(l_target_0:get_index());
            v1582.misses = v1582.misses + 1;
            return;
        end;
    end;
    local function v1587(v1584)
        -- upvalues: v1508 (ref)
        local v1585 = entity.get_local_player();
        local v1586 = entity.get(v1584.userid, true);
        if v1585 ~= entity.get(v1584.attacker, true) or v1585 == v1586 then
            return;
        else
            v1508(v1586:get_index());
            return;
        end;
    end;
    local function v1590(v1588)
        -- upvalues: v1508 (ref)
        local v1589 = entity.get(v1588.userid, true);
        if v1589 == nil then
            return;
        else
            v1508(v1589:get_index());
            return;
        end;
    end;
    local _ = nil;
    local function v1593(v1592)
        -- upvalues: v1578 (ref)
        events.render(v1578, v1592:get());
    end;
    do
        local l_v1593_0 = v1593;
        local function v1597(v1595)
            -- upvalues: v1500 (ref), v1510 (ref), l_v923_1 (ref), l_v1593_0 (ref), v1563 (ref), v1566 (ref), v1583 (ref), v1587 (ref), v1590 (ref)
            local v1596 = v1595:get();
            if not v1596 then
                v1500();
                v1510();
            end;
            if v1596 then
                l_v923_1.flag:set_callback(l_v1593_0, true);
            else
                l_v923_1.flag:unset_callback(l_v1593_0);
            end;
            events.shutdown(v1563, v1596);
            events.createmove(v1566, v1596);
            events.aim_ack(v1583, v1596);
            events.player_death(v1587, v1596);
            events.player_spawn(v1590, v1596);
        end;
        l_v923_1.enabled:set_callback(v1597, true);
    end;
end;
v923 = nil;
v924 = v360.ragebot.ai_peek;
v925 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap");
v926 = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage");
v927 = {
    ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"), 
    ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Auto Stop"), 
    ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Retreat Mode")
};
l_match_0 = ffi.typeof("float[3]");
v1016 = ffi.typeof("uint8_t[4]");
v1017 = nil;
l_angles_0 = ffi.typeof("                void(__thiscall*)(\n                    void*,\n                    float origin[3],\n                    float mins[3],\n                    float maxs[3],\n                    float angles[3],\n                    uint8_t face_color[4],\n                    uint8_t edge_color[4],\n                    float duration\n                )\n            ");
v1017 = utils.get_vfunc("engine.dll", "VDebugOverlay004", 21, l_angles_0);
l_angles_0 = 1;
v1019 = 5;
v1030 = 0;
v1036 = 3;
l_aimtools_0 = 5;
v1445 = 7;
v1446 = 8;
local v1598 = 9;
local v1599 = 10;
local v1600 = 11;
local v1601 = 12;
local v1602 = 15;
local v1603 = 17;
local v1604 = {
    Head = {
        [1] = v1030
    }, 
    Chest = {
        [1] = l_aimtools_0
    }, 
    Stomach = {
        [1] = v1036
    }, 
    Arms = {
        [1] = v1603, 
        [2] = v1602
    }, 
    Legs = {
        [1] = v1446, 
        [2] = v1445, 
        [3] = v1599, 
        [4] = v1598
    }
};
local v1605 = 1;
local v1606 = 2;
local v1607 = 3;
local v1608 = 4;
local v1609 = 5;
local v1610 = 6;
local v1611 = 7;
local v1612 = {
    [v1030] = v1605, 
    [l_aimtools_0] = v1606, 
    [v1036] = v1607, 
    [v1446] = v1610, 
    [v1445] = v1611, 
    [v1601] = v1610, 
    [v1600] = v1611, 
    [v1603] = v1608, 
    [v1602] = v1609
};
local v1613 = nil;
v1613 = {};
do
    local l_v924_2, l_v925_3, l_v926_2, l_v927_3, l_l_match_0_3, l_v1016_1, l_v1017_2, l_l_angles_0_3, l_v1019_1, l_v1604_0, l_v1612_0, l_v1613_0 = v924, v925, v926, v927, l_match_0, v1016, v1017, l_angles_0, v1019, v1604, v1612, v1613;
    local function v1628(v1626, v1627)
        -- upvalues: l_v1613_0 (ref)
        l_v1613_0[v1626] = v1627;
    end;
    local function v1630(v1629)
        return {
            body_aim = ui.find("Aimbot", "Ragebot", "Safety", v1629, "Body Aim"), 
            safe_points = ui.find("Aimbot", "Ragebot", "Safety", v1629, "Safe Points"), 
            ensure_hitbox_safety = ui.find("Aimbot", "Ragebot", "Safety", v1629, "Ensure Hitbox Safety"), 
            min_damage = ui.find("Aimbot", "Ragebot", "Selection", v1629, "Min. Damage"), 
            hit_chance = ui.find("Aimbot", "Ragebot", "Selection", v1629, "Hit Chance"), 
            head_scale = ui.find("Aimbot", "Ragebot", "Selection", v1629, "Multipoint", "Head Scale"), 
            body_scale = ui.find("Aimbot", "Ragebot", "Selection", v1629, "Multipoint", "Body Scale")
        };
    end;
    v1628("AutoSnipers", v1630("AutoSnipers"));
    v1628("AWP", v1630("AWP"));
    v1628("SSG-08", v1630("SSG-08"));
    v1628("Desert Eagle", v1630("Desert Eagle"));
    v1628("R8 Revolver", v1630("R8 Revolver"));
    v1628("Pistols", v1630("Pistols"));
    v1628 = nil;
    v1630 = 0;
    local v1631 = nil;
    local function v1633(v1632)
        return v1632[0];
    end;
    local function v1634()
        -- upvalues: v1628 (ref), v1630 (ref), v1631 (ref)
        v1628 = nil;
        v1630 = 0;
        v1631 = nil;
    end;
    local function v1637()
        -- upvalues: l_v1613_0 (ref), l_v925_3 (ref), l_v927_3 (ref)
        for _, v1636 in pairs(l_v1613_0) do
            v1636.body_aim:override();
            v1636.safe_points:override();
            v1636.ensure_hitbox_safety:override();
            v1636.hit_chance:override();
            v1636.head_scale:override();
            v1636.body_scale:override();
        end;
        l_v925_3:override();
        l_v927_3[3]:override();
    end;
    local function v1642()
        -- upvalues: l_v924_2 (ref), l_v1613_0 (ref), l_v927_3 (ref)
        local v1638 = l_v924_2.hit_chance:get();
        local v1639 = l_v924_2.unsafe:get();
        for _, v1641 in pairs(l_v1613_0) do
            if v1639 then
                v1641.body_aim:override("Default");
                v1641.safe_points:override("Default");
                v1641.ensure_hitbox_safety:override({});
            end;
            if v1638 ~= 0 then
                v1641.hit_chance:override(v1638);
            end;
            v1641.head_scale:override(100);
            v1641.body_scale:override(100);
        end;
        l_v927_3[3]:override("On Shot");
    end;
    local function v1644(v1643)
        if v1643 == 1 then
            return 4;
        elseif v1643 == 3 then
            return 1.25;
        elseif v1643 == 6 or v1643 == 7 then
            return 0.75;
        else
            return 1;
        end;
    end;
    local function v1653(v1645, v1646, v1647, v1648, v1649)
        -- upvalues: v1644 (ref)
        local v1650 = v1647 - v1646;
        local v1651 = math.min(v1645.range, v1650:length());
        local v1652 = v1645.damage * math.pow(v1645.range_modifier, v1651 * 0.002) * v1644(v1649);
        if v1648.m_ArmorValue > 0 and (v1649 ~= 1 or v1648.m_bHasHelmet) then
            v1652 = v1652 * (v1645.armor_ratio / 2);
        end;
        return v1652;
    end;
    local function v1659()
        -- upvalues: l_v924_2 (ref), l_v1604_0 (ref)
        local v1654 = {};
        local v1655 = l_v924_2.hitboxes:get();
        for v1656 = 1, #v1655 do
            local v1657 = l_v1604_0[v1655[v1656]];
            for v1658 = 1, #v1657 do
                table.insert(v1654, v1657[v1658]);
            end;
        end;
        return v1654;
    end;
    local function v1664(v1660, v1661)
        -- upvalues: l_l_angles_0_3 (ref), l_v1019_1 (ref)
        local v1662 = v1660:get_weapon_index();
        local l_weapon_type_1 = v1661.weapon_type;
        if l_weapon_type_1 == l_l_angles_0_3 then
            if v1662 == 1 then
                return "Desert Eagle";
            elseif v1662 == 64 then
                return "R8 Revolver";
            else
                return "Pistols";
            end;
        elseif l_weapon_type_1 == l_v1019_1 then
            if v1662 == 9 then
                return "AWP";
            elseif v1662 == 40 then
                return "SSG-08";
            else
                return "AutoSnipers";
            end;
        else
            return nil;
        end;
    end;
    local function v1679(v1665, v1666, v1667, v1668, v1669)
        -- upvalues: l_v1612_0 (ref), v1653 (ref)
        local v1670 = {};
        local l_m_iHealth_0 = v1668.m_iHealth;
        local v1672 = v1666:get_eye_position();
        local v1673 = v1667:get_weapon_info();
        for v1674 = 1, #v1665 do
            local v1675 = v1665[v1674];
            local v1676 = l_v1612_0[v1675] or 0;
            local v1677 = v1668:get_hitbox_position(v1675);
            local v1678 = v1653(v1673, v1672, v1677, v1668, v1676);
            if v1669 <= v1678 or l_m_iHealth_0 <= v1678 then
                table.insert(v1670, v1677);
            end;
        end;
        return v1670;
    end;
    local function v1681(v1680)
        -- upvalues: v1633 (ref)
        if v1680 == nil or not pcall(v1633, v1680) then
            return false;
        else
            return true;
        end;
    end;
    local function v1687(v1682, v1683, v1684)
        if v1682 == nil or v1683 == nil then
            return false;
        else
            local v1685 = v1684.max_clip1 > 0 and v1683.m_iClip1 > 0;
            local v1686 = globals.curtime >= v1682.m_flNextAttack and globals.curtime >= v1683.m_flNextPrimaryAttack;
            return v1685 and v1686;
        end;
    end;
    local function v1692(v1688, v1689)
        -- upvalues: l_v924_2 (ref), v1630 (ref)
        local v1690 = l_v924_2.scan_frequency:get() * 0.01;
        if v1690 > 0 then
            v1630 = math.max(0, v1630 - globals.frametime);
            if v1630 > 0 then
                return false;
            else
                v1630 = v1690;
            end;
        end;
        if v1688.in_forward or v1688.in_back or v1688.in_moveleft or v1688.in_moveright then
            return false;
        else
            local l_m_fFlags_0 = v1689.m_fFlags;
            if bit.band(l_m_fFlags_0, 1) == 0 then
                return false;
            elseif v1689.m_vecVelocity:length2dsqr() > 480 then
                return false;
            else
                return true;
            end;
        end;
    end;
    local function v1695(v1693, v1694)
        return {
            ctx = v1693, 
            target = v1694, 
            simtime = 0, 
            retreat = -1, 
            teleport = 0
        };
    end;
    local function v1697(v1696)
        -- upvalues: l_v1017_2 (ref), l_l_match_0_3 (ref), l_v1016_1 (ref), l_v924_2 (ref)
        l_v1017_2(l_l_match_0_3(v1696.origin:unpack()), l_l_match_0_3(v1696.obb_mins:unpack()), l_l_match_0_3(v1696.obb_maxs:unpack()), l_l_match_0_3(), l_v1016_1(), l_v1016_1(l_v924_2.color:get():unpack()), globals.tickinterval * 2);
    end;
    local function v1699(v1698)
        v1698.in_forward = true;
        v1698.in_back = false;
        v1698.in_moveleft = false;
        v1698.in_moveright = false;
        v1698.in_duck = false;
        v1698.in_jump = false;
        v1698.in_speed = false;
    end;
    local function v1705(v1700, v1701, v1702)
        local function v1704(v1703)
            -- upvalues: v1700 (ref)
            if v1703 == v1700 then
                return false;
            elseif not v1703:is_enemy() then
                return false;
            else
                return true;
            end;
        end;
        return utils.trace_bullet(v1700, v1701, v1702, v1704);
    end;
    local function v1712(v1706, v1707)
        local _ = nil;
        local _ = nil;
        local v1710 = v1706:get_origin();
        local v1711 = (v1707:get_origin() - v1710):angles().y + 180;
        return v1711 - 90, v1711 + 90;
    end;
    local function v1724(v1713, v1714, v1715, v1716, v1717)
        -- upvalues: v1705 (ref)
        local l_m_iHealth_1 = v1715.m_iHealth;
        for v1719 = 1, #v1716 do
            local v1720 = v1716[v1719];
            local v1721 = v1705(v1713, v1714, v1720);
            local v1722 = v1717 <= v1721;
            local v1723 = l_m_iHealth_1 <= v1721;
            if v1722 or v1723 then
                return v1721;
            end;
        end;
        return nil;
    end;
    local function v1733(v1725, v1726, v1727, v1728, v1729, v1730, v1731)
        -- upvalues: v1724 (ref)
        v1725.view_angles.y = v1727;
        v1726:think(1);
        if bit.band(v1726.flags, 1) == 0 then
            return nil;
        else
            local v1732 = v1724(v1728, v1726.origin + vector(0, 0, v1726.view_offset), v1729, v1730, v1731);
            if v1732 ~= nil then
                v1726:think(1);
            end;
            return {
                ctx = v1726, 
                damage = v1732
            };
        end;
    end;
    local function v1748(v1734, v1735, v1736, v1737, v1738)
        -- upvalues: v1712 (ref), v1733 (ref), v1695 (ref)
        local v1739 = true;
        local v1740 = true;
        local v1741 = v1735:simulate_movement(nil, vector(), 1);
        local v1742 = v1735:simulate_movement(nil, vector(), 1);
        local v1743, v1744 = v1712(v1735, v1736);
        for _ = 1, 25 do
            if v1739 then
                local v1746 = v1733(v1734, v1741, v1743, v1735, v1736, v1737, v1738);
                if v1746 ~= nil and v1746.damage ~= nil then
                    return v1695(v1746.ctx, v1736);
                elseif v1746 == nil then
                    v1739 = false;
                end;
            end;
            if v1740 then
                local v1747 = v1733(v1734, v1742, v1744, v1735, v1736, v1737, v1738);
                if v1747 ~= nil and v1747.damage ~= nil then
                    return v1695(v1747.ctx, v1736);
                elseif v1747 == nil then
                    v1740 = false;
                end;
            end;
        end;
    end;
    local function v1761(v1749, v1750, v1751, v1752, v1753)
        -- upvalues: v1748 (ref)
        local v1754 = v1749.view_angles:clone();
        local l_forwardmove_0 = v1749.forwardmove;
        local l_sidemove_0 = v1749.sidemove;
        local l_in_duck_0 = v1749.in_duck;
        local l_in_jump_0 = v1749.in_jump;
        local l_in_speed_0 = v1749.in_speed;
        v1749.forwardmove = 450;
        v1749.sidemove = 0;
        v1749.in_duck = false;
        v1749.in_jump = false;
        v1749.in_speed = false;
        local v1760 = v1748(v1749, v1750, v1751, v1752, v1753);
        v1749.view_angles.y = v1754.y;
        v1749.forwardmove = l_forwardmove_0;
        v1749.sidemove = l_sidemove_0;
        v1749.in_duck = l_in_duck_0;
        v1749.in_jump = l_in_jump_0;
        v1749.in_speed = l_in_speed_0;
        return v1760;
    end;
    local function v1775(v1762, v1763, v1764)
        -- upvalues: l_v926_2 (ref), v1659 (ref), v1628 (ref), v1681 (ref), v1679 (ref), v1724 (ref), v1692 (ref), v1761 (ref)
        local v1765 = l_v926_2:get();
        local v1766 = v1659();
        if v1628 ~= nil and v1681(v1628.target) then
            local l_ctx_0 = v1628.ctx;
            local l_target_1 = v1628.target;
            local l_m_iHealth_2 = l_target_1.m_iHealth;
            if v1765 >= 100 then
                v1765 = v1765 - 100 + l_m_iHealth_2;
            end;
            local v1770 = v1679(v1766, v1763, v1764, l_target_1, v1765);
            if v1724(v1763, l_ctx_0.origin + vector(0, 0, l_ctx_0.view_offset), l_target_1, v1770, v1765) ~= nil then
                v1628.simtime = 0;
            end;
            v1628.simtime = v1628.simtime + globals.frametime;
            return true;
        elseif not v1692(v1762, v1763) then
            return false;
        else
            local v1771 = entity.get_threat();
            if v1771 == nil or v1771:is_dormant() then
                return false;
            else
                local l_m_iHealth_3 = v1771.m_iHealth;
                if v1765 >= 100 then
                    v1765 = v1765 - 100 + l_m_iHealth_3;
                end;
                local v1773 = v1679(v1766, v1763, v1764, v1771, v1765);
                if v1724(v1763, v1763:get_eye_position(), v1771, v1773, v1765) then
                    return false;
                else
                    local v1774 = v1761(v1762, v1763, v1771, v1773, v1765);
                    if v1774 ~= nil then
                        v1628 = v1774;
                    end;
                    return v1628 ~= nil;
                end;
            end;
        end;
    end;
    local function v1776()
        -- upvalues: l_v925_3 (ref)
        rage.exploit:force_teleport();
        l_v925_3:override(false);
    end;
    local function v1786(v1777, v1778, v1779)
        -- upvalues: v1699 (ref), v1642 (ref)
        local v1780 = 450;
        local v1781 = v1779 - v1778:get_origin();
        local v1782 = v1781:angles();
        local v1783 = v1781:length2dsqr();
        local v1784 = v1783 < 10;
        if v1784 then
            local l_m_vecVelocity_1 = v1778.m_vecVelocity;
            v1780 = -l_m_vecVelocity_1:length();
            v1782 = l_m_vecVelocity_1:angles();
        end;
        v1777.move_yaw = v1782.y;
        v1777.forwardmove = v1780;
        v1777.sidemove = 0;
        v1699(v1777);
        v1642();
        return v1784, v1783;
    end;
    local function v1798(v1787, v1788, v1789, v1790)
        -- upvalues: v1775 (ref), v1628 (ref), l_v924_2 (ref), v1631 (ref), v1786 (ref), v1697 (ref), v1687 (ref), v1634 (ref), v1776 (ref), v1637 (ref)
        local v1791 = v1775(v1787, v1788, v1789);
        if v1628 == nil then
            return;
        else
            if v1628.simtime > l_v924_2.simulation:get() * 0.01 then
                v1791 = false;
            end;
            if v1790.weapon_type == 5 and not v1788.m_bIsScoped then
                v1791 = false;
            end;
            if v1791 and v1628.retreat <= 0 then
                local l_ctx_1 = v1628.ctx;
                if v1631 == nil then
                    local v1793 = v1788:get_origin();
                    local v1794 = (l_ctx_1.origin - v1793):normalize();
                    local l_obb_mins_0 = l_ctx_1.obb_mins;
                    local l_obb_maxs_0 = l_ctx_1.obb_maxs;
                    v1631 = utils.trace_hull(v1793, l_ctx_1.origin - v1794 * 25, l_obb_mins_0, l_obb_maxs_0, v1788, 33636363, 0).end_pos;
                end;
                v1628.retreat = v1786(v1787, v1788, l_ctx_1.origin) and 1 or 0;
                v1697(l_ctx_1);
                return;
            elseif not v1687(v1788, v1789, v1790) then
                v1634();
                return;
            else
                if v1628.ctx ~= nil and v1628.retreat ~= -1 then
                    local v1797 = v1786(v1787, v1788, v1631);
                    if v1788.m_vecVelocity:length2dsqr() > 1600 then
                        v1776();
                    end;
                    v1628.retreat = v1628.retreat + 1;
                    if v1797 then
                        v1637();
                        v1634();
                    end;
                end;
                return;
            end;
        end;
    end;
    local function v1804(v1799)
        -- upvalues: v1664 (ref), l_v927_3 (ref), l_v924_2 (ref), v1637 (ref), v1634 (ref), v1798 (ref)
        local v1800 = entity.get_local_player();
        if v1800 == nil then
            return;
        else
            local v1801 = v1800:get_player_weapon();
            if v1801 == nil then
                return;
            else
                local v1802 = v1801:get_weapon_info();
                if v1802 == nil then
                    return;
                else
                    local v1803 = v1664(v1801, v1802);
                    if not (l_v927_3[1]:get() and l_v924_2.weapons:get(v1803)) then
                        v1637();
                        v1634();
                        return;
                    else
                        v1798(v1799, v1800, v1801, v1802);
                        return;
                    end;
                end;
            end;
        end;
    end;
    local function v1805()
        -- upvalues: v1634 (ref)
        v1634();
    end;
    local _ = nil;
    local function v1809(v1807)
        -- upvalues: v1637 (ref), v1634 (ref), v1805 (ref), v1804 (ref)
        local v1808 = v1807:get();
        if not v1808 then
            v1637();
            v1634();
        end;
        events.aim_fire(v1805, v1808);
        events.createmove(v1804, v1808);
    end;
    l_v924_2.enabled:set_callback(v1809, true);
end;
v924 = nil;
v925 = v360.ragebot.logs;
v926 = string.upper(v15.name:sub(1, 1));
v927 = string.lower(v15.name);
l_match_0 = 7;
v1016 = 5;
v1017 = l_match_0;
l_angles_0 = {};
v1019 = {
    [0] = "generic", 
    [1] = "head", 
    [2] = "chest", 
    [3] = "stomach", 
    [4] = "left arm", 
    [5] = "right arm", 
    [6] = "left leg", 
    [7] = "right leg", 
    [8] = "neck", 
    [9] = nil, 
    [10] = "gear"
};
v1030 = {
    smokegrenade = "harmed", 
    incgrenade = "harmed", 
    molotov = "harmed", 
    hegrenade = "naded", 
    flashbang = "harmed", 
    inferno = "burned", 
    decoy = "decoyed", 
    knife = "knifed", 
    c4 = "bombed"
};
do
    local l_v925_4, l_v926_3, l_v927_4, l_l_match_0_4, l_v1016_2, l_v1017_3, l_l_angles_0_4, l_v1019_2, l_v1030_2, l_v1036_2, l_l_aimtools_0_1, l_v1445_1, l_v1446_1, l_v1598_0, l_v1599_0, l_v1600_0, l_v1601_0, l_v1602_0, l_v1603_0, l_v1604_1, l_v1605_0 = v925, v926, v927, l_match_0, v1016, v1017, l_angles_0, v1019, v1030, v1036, l_aimtools_0, v1445, v1446, v1598, v1599, v1600, v1601, v1602, v1603, v1604, v1605;
    l_v1036_2 = function(v1831)
        -- upvalues: l_v925_4 (ref)
        if not l_v925_4.output:get("Events") then
            return;
        else
            print_dev(v1831);
            return;
        end;
    end;
    l_l_aimtools_0_1 = function(v1832, v1833)
        -- upvalues: l_v925_4 (ref), l_l_angles_0_4 (ref)
        if not l_v925_4.output:get("Render") then
            return;
        else
            local v1834 = l_v925_4.duration:get();
            local v1835 = #l_l_angles_0_4 + 1;
            l_l_angles_0_4[v1835] = {
                alpha = 0, 
                text = v1833, 
                color = v1832, 
                time = v1834
            };
            return v1835;
        end;
    end;
    l_v1445_1 = function(v1836)
        -- upvalues: l_v925_4 (ref)
        if not l_v925_4.output:get("Console") then
            return;
        else
            print_raw(v1836);
            return;
        end;
    end;
    l_v1446_1 = function(v1837, v1838, v1839)
        local v1840 = string.gsub(v1837, "${(.-)}", string.format("\a%s%%1\a%s", v1838, v1839));
        if v1840:sub(1, 1) ~= "\a" then
            v1840 = "\a" .. v1839 .. v1840;
        end;
        return v1840;
    end;
    l_v1598_0 = function()
        -- upvalues: l_l_angles_0_4 (ref)
        for v1841 = 1, #l_l_angles_0_4 do
            l_l_angles_0_4[v1841] = nil;
        end;
    end;
    l_v1599_0 = function(v1842)
        -- upvalues: l_v926_3 (ref), l_v927_4 (ref)
        if v1842 == "Off" then
            return nil;
        elseif v1842 == "Icon" then
            return l_v926_3;
        elseif v1842 == "Text" then
            return l_v927_4;
        else
            return v1842;
        end;
    end;
    l_v1600_0 = function(v1843, v1844, v1845, v1846, v1847)
        -- upvalues: l_play_0 (ref), v14 (ref)
        local v1848 = 4;
        if v1846 > 0 then
            local v1849 = math.map(v1846, 0, 1.5, 0, 115, true);
            local v1850 = v1845:clone();
            v1850.a = v1849 * v1847;
            l_play_0.shadow(v1843, v1844, v1850, v14(8 * v1846), 0, v1848);
        end;
        local v1851 = v1845:clone();
        v1851.a = v1851.a * v1847;
        l_play_0.rect(v1843, v1844, v1851, v1848);
    end;
    l_v1601_0 = function()
        -- upvalues: l_v925_4 (ref), l_l_angles_0_4 (ref), l_play_0 (ref), l_v1599_0 (ref), v89 (ref), l_l_match_0_4 (ref), l_v1016_2 (ref), l_v1017_3 (ref), l_v1600_0 (ref), v14 (ref)
        local v1852 = l_v925_4.background_color:get();
        local l_frametime_0 = globals.frametime;
        local v1854 = #l_l_angles_0_4;
        local v1855 = l_play_0.screen_size() / 2;
        v1855.y = v1855.y + l_v925_4.offset:get() * 5;
        local v1856 = l_v925_4.logo:get();
        local v1857 = v1856 == "!";
        local v1858 = l_v1599_0(v1856);
        local v1859 = 4;
        local v1860 = "";
        local v1861 = l_play_0.measure_text(v1859, v1860, v1858);
        for v1862 = v1854, 1, -1 do
            local v1863 = l_l_angles_0_4[v1862];
            local v1864 = v1863.time > 0 and v1854 - v1862 < 6;
            v1863.alpha = v89.interp(v1863.alpha, v1864, 0.075);
            if not v1864 then
                if v1863.alpha <= 0 then
                    table.remove(l_l_angles_0_4, v1862);
                end;
            else
                v1863.time = v1863.time - l_frametime_0;
            end;
        end;
        local v1865 = 1;
        local v1866 = "";
        local v1867 = l_v925_4.glow:get() * 0.01;
        for v1868 = 1, #l_l_angles_0_4 do
            local v1869 = l_l_angles_0_4[v1868];
            local l_color_0 = v1869.color;
            local l_text_0 = v1869.text;
            local l_alpha_1 = v1869.alpha;
            if not v1857 then
                l_text_0 = l_text_0 .. " !";
            end;
            local v1873 = l_play_0.measure_text(v1865, v1866, l_text_0);
            local v1874 = v1873 + vector(l_l_match_0_4, l_v1016_2) * 2;
            if v1858 ~= nil then
                v1874.x = v1874.x + v1861.x + l_v1017_3;
            end;
            local v1875 = v1855 - v1874 / 2;
            local v1876 = v1875 + vector(l_l_match_0_4, l_v1016_2);
            local v1877 = vector(v1876.x, v1875.y + (v1874.y - v1861.y) / 2);
            l_v1600_0(v1875, v1875 + v1874, v1852, v1867, l_alpha_1);
            if v1858 ~= nil then
                local v1878 = l_color_0:clone();
                v1878.a = v1878.a * l_alpha_1;
                l_play_0.text(v1859, v1877, v1878, v1860, v1858);
                v1876.x = v1876.x + v1861.x + l_v1017_3;
            end;
            v1876.y = v1875.y + (v1874.y - v1873.y) / 2;
            local v1879 = color(255, 255, 255, 255 * l_alpha_1);
            l_play_0.text(v1865, v1876, v1879, v1866, l_text_0);
            v1855.y = v1855.y - v14((v1874.y + 5) * l_alpha_1);
        end;
    end;
    l_v1602_0 = function(v1880)
        -- upvalues: l_v925_4 (ref), l_v1019_2 (ref), l_v1446_1 (ref), l_v1036_2 (ref), l_v1445_1 (ref), l_l_aimtools_0_1 (ref)
        local l_target_2 = v1880.target;
        if l_target_2 == nil then
            return;
        else
            local v1882 = l_v925_4.hit_color:get();
            local v1883 = l_target_2:get_name();
            local l_m_iHealth_4 = l_target_2.m_iHealth;
            local l_backtrack_0 = v1880.backtrack;
            local l_hitchance_0 = v1880.hitchance;
            local v1887 = v1880.damage or 0;
            local v1888 = v1880.wanted_damage or 0;
            local v1889 = l_v1019_2[v1880.hitgroup] or "?";
            local v1890 = l_v1019_2[v1880.wanted_hitgroup] or "?";
            local v1891 = v1888 - v1887 > 10;
            local v1892 = v1890 ~= v1889;
            local v1893 = nil;
            v1893 = string.format("hit ${%s}'s ${%s} for ${%d} dmg", v1883, v1889, v1887);
            local v1894 = nil;
            local v1895 = {};
            table.insert(v1895, string.format("hit: ${%s}", v1883));
            if v1892 then
                table.insert(v1895, string.format("hb: ${%s}/%s", v1889, v1890));
            else
                table.insert(v1895, string.format("hb: ${%s}", v1889));
            end;
            if v1891 then
                table.insert(v1895, string.format("dmg: ${%d}/%d", v1887, v1888));
            else
                table.insert(v1895, string.format("dmg: ${%d}", v1887));
            end;
            table.insert(v1895, string.format("bt: ${%d}", l_backtrack_0));
            table.insert(v1895, string.format("hc: ${%d%%}", l_hitchance_0));
            if l_m_iHealth_4 <= 0 then
                table.insert(v1895, "rph: ${0} (dead)");
            else
                table.insert(v1895, string.format("rph: ${%d}", l_m_iHealth_4));
            end;
            v1894 = table.concat(v1895, "  ");
            v1893 = l_v1446_1(v1893, v1882:to_hex(), "c8c8c8ff");
            v1894 = l_v1446_1(v1894, v1882:to_hex(), "c8c8c8ff");
            l_v1036_2(v1894);
            l_v1445_1(v1894);
            l_l_aimtools_0_1(v1882, v1893);
            return;
        end;
    end;
    l_v1603_0 = function(v1896)
        -- upvalues: l_v925_4 (ref), l_v1019_2 (ref), l_v1446_1 (ref), l_v1036_2 (ref), l_v1445_1 (ref), l_l_aimtools_0_1 (ref)
        local l_target_3 = v1896.target;
        if l_target_3 == nil then
            return;
        else
            local v1898 = l_v925_4.miss_color:get();
            local v1899 = l_target_3:get_name();
            local l_state_2 = v1896.state;
            local l_hitchance_1 = v1896.hitchance;
            local l_backtrack_1 = v1896.backtrack;
            local v1903 = v1896.wanted_damage or 0;
            local v1904 = l_v1019_2[v1896.wanted_hitgroup] or "?";
            local v1905 = nil;
            v1905 = string.format("missed ${%s}'s ${%s} due to ${%s}", v1899, v1904, l_state_2);
            local v1906 = nil;
            local v1907 = {};
            table.insert(v1907, string.format("missed: ${%s}", v1899));
            table.insert(v1907, string.format("hb: ${%s}", v1904));
            table.insert(v1907, string.format("due: ${%s}", l_state_2));
            table.insert(v1907, string.format("dmg: ${%d}", v1903));
            table.insert(v1907, string.format("bt: ${%d}", l_backtrack_1));
            table.insert(v1907, string.format("hc: ${%d%%}", l_hitchance_1));
            v1906 = table.concat(v1907, "  ");
            v1905 = l_v1446_1(v1905, v1898:to_hex(), "c8c8c8ff");
            v1906 = l_v1446_1(v1906, v1898:to_hex(), "c8c8c8ff");
            l_v1036_2(v1906);
            l_v1445_1(v1906);
            l_l_aimtools_0_1(v1898, v1905);
            return;
        end;
    end;
    l_v1604_1 = function(v1908)
        -- upvalues: l_v1602_0 (ref), l_v1603_0 (ref)
        if v1908.state == nil then
            l_v1602_0(v1908);
        else
            l_v1603_0(v1908);
        end;
    end;
    l_v1605_0 = function(v1909)
        -- upvalues: l_v1030_2 (ref), l_v925_4 (ref), l_v1446_1 (ref), l_v1036_2 (ref), l_v1445_1 (ref), l_l_aimtools_0_1 (ref)
        local v1910 = entity.get_local_player();
        local v1911 = entity.get(v1909.userid, true);
        if entity.get(v1909.attacker, true) ~= v1910 or v1911 == v1910 then
            return;
        else
            local l_weapon_0 = v1909.weapon;
            local v1913 = l_v1030_2[l_weapon_0];
            if v1913 == nil then
                return;
            else
                local v1914 = l_v925_4.hit_color:get();
                local v1915 = v1911:get_name();
                local l_m_iHealth_5 = v1911.m_iHealth;
                local l_dmg_health_0 = v1909.dmg_health;
                local v1918 = nil;
                v1918 = string.format("%s ${%s} for ${%d} dmg", v1913, v1915, l_dmg_health_0);
                local v1919 = nil;
                local v1920 = {};
                table.insert(v1920, string.format("harmed: ${%s}", v1915));
                table.insert(v1920, string.format("dmg: ${%d}", l_dmg_health_0));
                if l_m_iHealth_5 <= 0 then
                    table.insert(v1920, "rph: ${0} (dead)");
                else
                    table.insert(v1920, string.format("rph: ${%d}", l_m_iHealth_5));
                end;
                table.insert(v1920, string.format("wep: ${%s}", l_weapon_0));
                v1919 = table.concat(v1920, "  ");
                v1918 = l_v1446_1(v1918, v1914:to_hex(), "c8c8c8ff");
                v1919 = l_v1446_1(v1919, v1914:to_hex(), "c8c8c8ff");
                l_v1036_2(v1919);
                l_v1445_1(v1919);
                l_l_aimtools_0_1(v1914, v1918);
                return;
            end;
        end;
    end;
    v1606 = nil;
    v1607 = function(v1921)
        -- upvalues: l_v1598_0 (ref), l_v1601_0 (ref)
        local v1922 = v1921:get("Render");
        if not v1922 then
            l_v1598_0();
        end;
        events.render(l_v1601_0, v1922);
    end;
    do
        local l_v1607_0 = v1607;
        v1608 = function(v1924)
            -- upvalues: l_v1598_0 (ref), l_v1601_0 (ref), l_v925_4 (ref), l_v1607_0 (ref), l_v1604_1 (ref), l_v1605_0 (ref)
            local v1925 = v1924:get();
            if not v1925 then
                l_v1598_0();
            end;
            if not v1925 then
                events.render(l_v1601_0, false);
            end;
            if v1925 then
                l_v925_4.output:set_callback(l_v1607_0, true);
            else
                l_v925_4.output:unset_callback(l_v1607_0);
            end;
            events.aim_ack(l_v1604_1, v1925);
            events.player_hurt(l_v1605_0, v1925);
        end;
        l_v925_4.enabled:set_callback(v1608, true);
    end;
end;
v925 = nil;
v926 = v360.ragebot.dormant_aimbot;
v927 = true;
l_match_0 = 5;
v1016 = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot");
v1017 = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage");
l_angles_0 = nil;
v1019 = nil;
v1030 = nil;
v1036 = nil;
l_aimtools_0 = nil;
v1445 = false;
v1446 = false;
v1598 = 1;
v1599 = 0;
v1600 = {
    [0] = "Generic", 
    [1] = "Head", 
    [2] = "Chest", 
    [3] = "Stomach", 
    [4] = "Chest", 
    [5] = "Chest", 
    [6] = "Legs", 
    [7] = "Legs", 
    [8] = "Head", 
    [9] = nil, 
    [10] = "Gear"
};
v1601 = {
    [1] = {
        hitbox = "Stomach", 
        scale = 5, 
        vec = vector(0, 0, 40)
    }, 
    [2] = {
        hitbox = "Chest", 
        scale = 6, 
        vec = vector(0, 0, 50)
    }, 
    [3] = {
        hitbox = "Head", 
        scale = 3, 
        vec = vector(0, 0, 58)
    }, 
    [4] = {
        hitbox = "Legs", 
        scale = 4, 
        vec = vector(0, 0, 20)
    }
};
v1602 = function(v1926, v1927)
    for v1928 = 1, #v1926 do
        if v1926[v1928] == v1927 then
            return true;
        end;
    end;
    return false;
end;
v1603 = function(v1929)
    return v1929 >= 1 and v1929 <= 6;
end;
v1604 = function()
    local v1930 = {};
    local v1931 = entity.get_player_resource();
    for v1932 = 1, globals.max_players do
        local v1933 = entity.get(v1932);
        if v1933 ~= nil and v1931.m_bConnected[v1932] and v1933:is_enemy() and v1933:is_dormant() then
            table.insert(v1930, v1933);
        end;
    end;
    return v1930;
end;
v1605 = function(v1934, v1935, v1936)
    local v1937 = v1934:to(v1935):angles();
    local v1938 = math.rad(v1937.y + 90);
    local v1939 = vector(math.cos(v1938), math.sin(v1938), 0) * v1936;
    return {
        [1] = {
            text = "Middle", 
            vec = v1935
        }, 
        [2] = {
            text = "Left", 
            vec = v1935 + v1939
        }, 
        [3] = {
            text = "Right", 
            vec = v1935 - v1939
        }
    };
end;
v1606 = function(v1940, v1941, v1942, v1943)
    local v1944, v1945 = utils.trace_bullet(v1940, v1941, v1942, v1943);
    if v1945 ~= nil then
        local l_entity_1 = v1945.entity;
        if l_entity_1 == nil then
            return 0, v1945;
        elseif l_entity_1:is_player() and not l_entity_1:is_enemy() then
            return 0, v1945;
        end;
    end;
    return v1944, v1945;
end;
do
    local l_v926_4, l_v927_5, l_l_match_0_5, l_v1016_3, l_v1017_4, l_l_angles_0_5, l_v1019_3, l_v1030_3, l_v1036_3, l_l_aimtools_0_2, l_v1445_2, l_v1446_2, l_v1598_1, l_v1599_1, l_v1600_1, l_v1601_1, l_v1602_1, l_v1603_1, l_v1604_2, l_v1605_1, l_v1606_0, l_v1607_1, l_v1608_0, l_v1609_0, l_v1610_0 = v926, v927, l_match_0, v1016, v1017, l_angles_0, v1019, v1030, v1036, l_aimtools_0, v1445, v1446, v1598, v1599, v1600, v1601, v1602, v1603, v1604, v1605, v1606, v1607, v1608, v1609, v1610;
    l_v1607_1 = function(v1972)
        -- upvalues: l_v1016_3 (ref), l_v1599_1 (ref), l_v1603_1 (ref), l_v1604_2 (ref), l_v926_4 (ref), l_v1598_1 (ref), l_v1017_4 (ref), l_v1601_1 (ref), l_v1602_1 (ref), l_v1605_1 (ref), l_v1606_0 (ref), l_l_angles_0_5 (ref), l_v1030_3 (ref), l_v1036_3 (ref), l_v1019_3 (ref), l_l_aimtools_0_2 (ref), l_v927_5 (ref), l_l_match_0_5 (ref), l_v1446_2 (ref)
        l_v1016_3:override(false);
        local v1973 = entity.get_local_player();
        if v1973 == nil then
            return;
        else
            local v1974 = v1973:get_player_weapon();
            if v1974 == nil then
                return;
            else
                local v1975 = v1974:get_weapon_info();
                if v1975 == nil then
                    return;
                else
                    local v1976 = v1974:get_inaccuracy();
                    if v1976 == nil then
                        return;
                    else
                        local l_tickcount_1 = globals.tickcount;
                        local v1978 = v1973:get_eye_position();
                        local l_current_0 = v1973:get_simulation_time().current;
                        local v1980 = bit.band(v1973.m_fFlags, bit.lshift(1, 0)) ~= 0;
                        if l_tickcount_1 < l_v1599_1 then
                            return;
                        elseif v1972.in_jump and not v1980 then
                            return;
                        else
                            local l_weapon_type_2 = v1975.weapon_type;
                            if not l_v1603_1(l_weapon_type_2) or v1974.m_iClip1 <= 0 then
                                return false;
                            else
                                local v1982 = l_v1604_2();
                                local v1983 = l_v926_4.hitboxes:get();
                                if l_tickcount_1 % #v1982 ~= 0 then
                                    l_v1598_1 = l_v1598_1 + 1;
                                else
                                    l_v1598_1 = 1;
                                end;
                                local v1984 = v1982[l_v1598_1];
                                if v1984 == nil then
                                    return;
                                else
                                    local v1985 = v1984:get_bbox();
                                    local v1986 = v1984:get_origin();
                                    local l_m_flDuckAmount_0 = v1984.m_flDuckAmount;
                                    local v1988 = l_v926_4.alpha_modifier:get();
                                    local v1989 = l_v926_4.minimum_damage:get();
                                    if v1989 == 0 then
                                        v1989 = l_v1017_4:get();
                                    end;
                                    if v1989 >= 100 then
                                        v1989 = v1989 - 100 + v1984.m_iHealth;
                                    end;
                                    local v1990 = {};
                                    for v1991 = 1, #l_v1601_1 do
                                        local v1992 = l_v1601_1[v1991];
                                        local l_vec_0 = v1992.vec;
                                        local l_scale_0 = v1992.scale;
                                        local l_hitbox_0 = v1992.hitbox;
                                        if l_hitbox_0 == "Head" then
                                            l_vec_0 = l_vec_0 - vector(0, 0, 10 * l_m_flDuckAmount_0);
                                        end;
                                        if l_hitbox_0 == "Chest" then
                                            l_vec_0 = l_vec_0 - vector(0, 0, 4 * l_m_flDuckAmount_0);
                                        end;
                                        if #v1983 ~= 0 then
                                            if l_v1602_1(v1983, l_hitbox_0) then
                                                table.insert(v1990, {
                                                    vec = l_vec_0, 
                                                    scale = l_scale_0, 
                                                    hitbox = l_hitbox_0
                                                });
                                            end;
                                        else
                                            table.insert(v1990, 1, {
                                                vec = l_vec_0, 
                                                scale = l_scale_0, 
                                                hitbox = l_hitbox_0
                                            });
                                        end;
                                    end;
                                    if not (v1975.is_revolver and not (v1974.m_flNextPrimaryAttack >= l_current_0) or math.max(v1973.m_flNextAttack, v1974.m_flNextPrimaryAttack, v1974.m_flNextSecondaryAttack) < l_current_0) then
                                        return;
                                    else
                                        local v1996 = nil;
                                        local v1997 = nil;
                                        if math.floor(v1985.alpha * 100) + 5 <= v1988 then
                                            return;
                                        else
                                            for v1998 = 1, #v1990 do
                                                local v1999 = v1990[v1998];
                                                local v2000 = l_v1605_1(v1978, v1986 + v1999.vec, v1999.scale);
                                                for v2001 = 1, #v2000 do
                                                    local v2002 = v2000[v2001];
                                                    local l_vec_1 = v2002.vec;
                                                    local v2005, v2006 = l_v1606_0(v1973, v1978, l_vec_1, function(v2004)
                                                        -- upvalues: v1984 (ref)
                                                        return v2004 == v1984;
                                                    end);
                                                    if (v2006 == nil or not v2006:is_visible()) and v2005 ~= 0 and v1989 < v2005 then
                                                        v1996 = l_vec_1;
                                                        v1997 = v2005;
                                                        l_l_angles_0_5 = v1984;
                                                        l_v1030_3 = v1999.hitbox;
                                                        l_v1036_3 = v2005;
                                                        l_v1019_3 = v2002.text;
                                                        l_l_aimtools_0_2 = v1985.alpha;
                                                        break;
                                                    end;
                                                end;
                                                if v1996 and v1997 then
                                                    break;
                                                end;
                                            end;
                                            if not v1996 or not v1997 then
                                                return;
                                            else
                                                local v2007 = v1978:to(v1996):angles();
                                                v1972.block_movement = 1;
                                                if l_v927_5 then
                                                    local v2008 = not v1972.in_jump and v1980;
                                                    local v2009 = v1973.m_bIsScoped or v1973.m_bResumeZoom;
                                                    local v2010 = v1975.weapon_type == l_l_match_0_5;
                                                    if not v2009 and v2010 and v2008 then
                                                        v1972.in_attack2 = true;
                                                    end;
                                                end;
                                                if v1976 < 0.01 then
                                                    v1972.view_angles = v2007;
                                                    v1972.in_attack = true;
                                                    l_v1446_2 = true;
                                                end;
                                                return;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
    l_v1608_0 = function(v2011)
        -- upvalues: l_v1446_2 (ref), l_v1445_2 (ref), l_l_angles_0_5 (ref), l_v1030_3 (ref), l_v1036_3 (ref), l_v1019_3 (ref), l_l_aimtools_0_2 (ref)
        utils.execute_after(0.03, function()
            -- upvalues: v2011 (ref), l_v1446_2 (ref), l_v1445_2 (ref), l_l_angles_0_5 (ref), l_v1030_3 (ref), l_v1036_3 (ref), l_v1019_3 (ref), l_l_aimtools_0_2 (ref)
            if entity.get(v2011.userid, true) == entity.get_local_player() then
                if l_v1446_2 and not l_v1445_2 then
                    events.dormant_miss:call({
                        userid = l_l_angles_0_5, 
                        aim_hitbox = l_v1030_3, 
                        aim_damage = l_v1036_3, 
                        aim_point = l_v1019_3, 
                        accuracy = l_l_aimtools_0_2
                    });
                end;
                l_v1445_2 = false;
                l_v1446_2 = false;
                l_l_angles_0_5 = nil;
                l_v1030_3 = nil;
                l_v1036_3 = nil;
                l_v1019_3 = nil;
                l_l_aimtools_0_2 = nil;
            end;
        end);
    end;
    l_v1609_0 = function(v2012)
        -- upvalues: l_v1446_2 (ref), l_v1445_2 (ref), l_v1600_1 (ref), l_v1019_3 (ref), l_v1030_3 (ref), l_v1036_3 (ref)
        local v2013 = entity.get_local_player();
        local v2014 = entity.get(v2012.userid, true);
        local v2015 = entity.get(v2012.attacker, true);
        if v2014 == nil or v2015 ~= v2013 then
            return;
        else
            local v2016 = v2014:get_bbox();
            if v2016 == nil then
                return;
            else
                if v2014:is_dormant() and l_v1446_2 == true then
                    l_v1445_2 = true;
                    events.dormant_hit:call({
                        userid = v2014, 
                        attacker = v2015, 
                        health = v2012.health, 
                        armor = v2012.armor, 
                        weapon = v2012.weapon, 
                        dmg_health = v2012.dmg_health, 
                        dmg_armor = v2012.dmg_armor, 
                        hitgroup = v2012.hitgroup, 
                        accuracy = v2016.alpha, 
                        hitbox = l_v1600_1[v2012.hitgroup], 
                        aim_point = l_v1019_3, 
                        aim_hitbox = l_v1030_3, 
                        aim_damage = l_v1036_3
                    });
                end;
                return;
            end;
        end;
    end;
    l_v1610_0 = function()
        -- upvalues: l_v1016_3 (ref)
        l_v1016_3:override();
    end;
    v1611 = nil;
    v1612 = function(v2017)
        -- upvalues: l_v1016_3 (ref), l_v1610_0 (ref), l_v1607_1 (ref), l_v1608_0 (ref), l_v1609_0 (ref)
        local v2018 = v2017:get();
        if not v2018 then
            l_v1016_3:override();
        end;
        events.shutdown(l_v1610_0, v2018);
        events.createmove(l_v1607_1, v2018);
        events.weapon_fire(l_v1608_0, v2018);
        events.player_hurt(l_v1609_0, v2018);
    end;
    l_v926_4.enabled:set_callback(v1612, true);
end;
v877 = nil;
v923 = nil;
v924 = v360.visuals.aspect_ratio;
v925 = cvar.r_aspectratio;
do
    local l_v924_3, l_v925_5, l_v926_5, l_v927_6, l_l_match_0_6 = v924, v925, v926, v927, l_match_0;
    l_v926_5 = function()
        -- upvalues: l_v925_5 (ref)
        l_v925_5:float(tonumber(l_v925_5:string()), true);
    end;
    l_v927_6 = function(v2024)
        -- upvalues: l_v925_5 (ref)
        l_v925_5:float(v2024, true);
    end;
    l_l_match_0_6 = function()
        -- upvalues: l_v926_5 (ref)
        l_v926_5();
    end;
    v1016 = nil;
    v1017 = function(v2025)
        -- upvalues: l_v927_6 (ref)
        l_v927_6(v2025:get() * 0.01);
    end;
    do
        local l_v1017_5 = v1017;
        l_angles_0 = function(v2027)
            -- upvalues: l_v926_5 (ref), l_v924_3 (ref), l_v1017_5 (ref), l_l_match_0_6 (ref)
            local v2028 = v2027:get();
            if not v2028 then
                l_v926_5();
            end;
            if v2028 then
                l_v924_3.value:set_callback(l_v1017_5, true);
            else
                l_v924_3.value:unset_callback(l_v1017_5);
            end;
            events.shutdown(l_l_match_0_6, v2028);
        end;
        l_v924_3.enabled:set_callback(l_angles_0, true);
    end;
end;
v924 = nil;
v925 = v360.visuals.viewmodel;
v926 = 0;
v927 = cvar.cl_righthand;
l_match_0 = cvar.viewmodel_fov;
v1016 = cvar.viewmodel_offset_x;
v1017 = cvar.viewmodel_offset_y;
l_angles_0 = cvar.viewmodel_offset_z;
v1019 = nil;
v1030 = function(v2029)
    return tonumber(v2029:string());
end;
do
    local l_v925_6, l_v926_6, l_v927_7, l_l_match_0_7, l_v1016_4, l_v1017_6, l_l_angles_0_6, l_v1019_4, l_v1030_4, l_v1036_4, l_l_aimtools_0_3, l_v1445_3, l_v1446_3, l_v1598_2 = v925, v926, v927, l_match_0, v1016, v1017, l_angles_0, v1019, v1030, v1036, l_aimtools_0, v1445, v1446, v1598;
    l_v1036_4 = function(v2044)
        -- upvalues: l_v927_7 (ref)
        if l_v927_7:string() == "1" then
            l_v927_7:int(v2044 and 0 or 1, true);
        else
            l_v927_7:int(v2044 and 1 or 0, true);
        end;
    end;
    l_l_aimtools_0_3 = function()
        -- upvalues: l_l_match_0_7 (ref), l_v1030_4 (ref), l_v1016_4 (ref), l_v1017_6 (ref), l_l_angles_0_6 (ref), l_v927_7 (ref)
        l_l_match_0_7:float(l_v1030_4(l_l_match_0_7), false);
        l_v1016_4:float(l_v1030_4(l_v1016_4), false);
        l_v1017_6:float(l_v1030_4(l_v1017_6), false);
        l_l_angles_0_6:float(l_v1030_4(l_l_angles_0_6), false);
        l_v927_7:int(l_v927_7:string() == "1" and 1 or 0, false);
    end;
    l_v1445_3 = function()
        -- upvalues: l_l_aimtools_0_3 (ref)
        l_l_aimtools_0_3();
    end;
    l_v1446_3 = function()
        -- upvalues: l_v1019_4 (ref), l_v926_6 (ref), l_v1036_4 (ref)
        local v2045 = entity.get_local_player();
        if v2045 == nil then
            return;
        else
            local v2046 = v2045:get_player_weapon();
            if v2046 == nil then
                return;
            else
                local v2047 = v2046:get_weapon_index();
                if l_v1019_4 ~= v2047 then
                    l_v1019_4 = v2047;
                    local v2048 = v2046:get_weapon_info();
                    if v2048 == nil then
                        return;
                    else
                        local v2049 = v2048.weapon_type == l_v926_6;
                        l_v1036_4(v2049);
                    end;
                end;
                return;
            end;
        end;
    end;
    l_v1598_2 = function(v2050)
        -- upvalues: l_l_aimtools_0_3 (ref), l_v1446_3 (ref), l_v1445_3 (ref)
        if not v2050 then
            l_l_aimtools_0_3();
        end;
        if not v2050 then
            events.pre_render(l_v1446_3, v2050);
        end;
        events.shutdown(l_v1445_3, v2050);
    end;
    v1599 = nil;
    v1600 = function(v2051)
        -- upvalues: l_l_match_0_7 (ref)
        l_l_match_0_7:float(v2051:get() * 0.01, true);
    end;
    v1601 = function(v2052)
        -- upvalues: l_v1016_4 (ref)
        l_v1016_4:float(v2052:get() * 0.01, true);
    end;
    v1602 = function(v2053)
        -- upvalues: l_v1017_6 (ref)
        l_v1017_6:float(v2053:get() * 0.01, true);
    end;
    v1603 = function(v2054)
        -- upvalues: l_l_angles_0_6 (ref)
        l_l_angles_0_6:float(v2054:get() * 0.01, true);
    end;
    v1604 = function(v2055)
        -- upvalues: l_v927_7 (ref), l_v1019_4 (ref), l_v1446_3 (ref)
        local v2056 = v2055:get();
        if not v2056 then
            l_v927_7:int(l_v927_7:string() == "1" and 1 or 0, false);
        else
            l_v1019_4 = nil;
        end;
        events.pre_render(l_v1446_3, v2056);
    end;
    do
        local l_v1600_2, l_v1601_2, l_v1602_2, l_v1603_2, l_v1604_3 = v1600, v1601, v1602, v1603, v1604;
        v1605 = function(v2062)
            -- upvalues: l_v925_6 (ref), l_v1600_2 (ref), l_v1601_2 (ref), l_v1602_2 (ref), l_v1603_2 (ref), l_v1604_3 (ref), l_v1598_2 (ref)
            local v2063 = v2062:get();
            if v2063 then
                l_v925_6.fov:set_callback(l_v1600_2, true);
                l_v925_6.offset_x:set_callback(l_v1601_2, true);
                l_v925_6.offset_y:set_callback(l_v1602_2, true);
                l_v925_6.offset_z:set_callback(l_v1603_2, true);
                l_v925_6.opposite_knife_hand:set_callback(l_v1604_3, true);
            else
                l_v925_6.fov:unset_callback(l_v1600_2);
                l_v925_6.offset_x:unset_callback(l_v1601_2);
                l_v925_6.offset_y:unset_callback(l_v1602_2);
                l_v925_6.offset_z:unset_callback(l_v1603_2);
                l_v925_6.opposite_knife_hand:unset_callback(l_v1604_3);
            end;
            l_v1598_2(v2063);
        end;
        l_v925_6.enabled:set_callback(v1605, true);
    end;
end;
v925 = nil;
v926 = v360.visuals.indicators;
v927 = {};
l_match_0 = {
    [1] = {
        [1] = "\226\156\166", 
        [2] = 0, 
        [3] = 10, 
        [4] = 0.5
    }, 
    [2] = {
        [1] = "\226\139\134", 
        [2] = -3, 
        [3] = 3, 
        [4] = 0.2
    }, 
    [3] = {
        [1] = "\226\152\133", 
        [2] = -1, 
        [3] = 8, 
        [4] = 0.4
    }, 
    [4] = {
        [1] = "\226\156\166", 
        [2] = 0, 
        [3] = 6, 
        [4] = 0.7
    }, 
    [5] = {
        [1] = "\226\139\134", 
        [2] = -2, 
        [3] = 2, 
        [4] = 0.3
    }, 
    [6] = {
        [1] = "\226\152\133", 
        [2] = 1, 
        [3] = 7, 
        [4] = 0.6
    }, 
    [7] = {
        [1] = "\226\139\134", 
        [2] = 0, 
        [3] = 3, 
        [4] = 0.2
    }, 
    [8] = {
        [1] = "\226\156\166", 
        [2] = 0, 
        [3] = 8, 
        [4] = 0.7
    }, 
    [9] = {
        [1] = "\226\139\134", 
        [2] = -2, 
        [3] = 7, 
        [4] = 0.2
    }
};
v1016 = 0;
v1017 = 0;
l_angles_0 = 0;
v1019 = 0;
v1030 = 0;
v1036 = function()
    -- upvalues: v370 (ref), v28 (ref)
    if not v370.is_onground then
        if v370.is_crouched then
            return "airc";
        else
            return "air";
        end;
    elseif v370.is_crouched then
        if v370.is_moving then
            return "sneak";
        else
            return "crouch";
        end;
    elseif v370.is_moving then
        if v28.antiaim.misc.slow_walk:get() then
            return "walk";
        else
            return "run";
        end;
    else
        return "stand";
    end;
end;
do
    local l_v926_7, l_v927_8, l_l_match_0_8, l_v1016_5 = v926, v927, l_match_0, v1016;
    do
        local l_l_l_match_0_8_0, l_l_v1016_5_0, l_v1017_7, l_l_angles_0_7, l_v1019_5, l_v1030_5, l_v1036_5, l_l_aimtools_0_4, l_v1445_4, l_v1446_4, l_v1598_3, l_v1599_2, l_v1600_3, l_v1601_3, l_v1602_3 = l_l_match_0_8, l_v1016_5, v1017, l_angles_0, v1019, v1030, v1036, l_aimtools_0, v1445, v1446, v1598, v1599, v1600, v1601, v1602;
        l_l_aimtools_0_4 = function(v2083, v2084)
            -- upvalues: l_l_l_match_0_8_0 (ref), l_play_0 (ref), v14 (ref), l_v1017_7 (ref)
            local l_realtime_0 = globals.realtime;
            local v2086 = {};
            local v2087 = #l_l_l_match_0_8_0;
            local v2088 = 0;
            local v2089 = 0;
            for v2090 = 1, v2087 do
                local v2091 = l_l_l_match_0_8_0[v2090];
                local v2092 = l_play_0.measure_text(1, "", v2091[1]);
                v2088 = v2088 + (v2092.x + v2091[2]);
                v2089 = math.max(v2089, v2092.y + v2091[3]);
                v2086[v2090] = v2092;
            end;
            local v2093 = v2083:clone();
            v2093.x = v14(v2093.x - v2088 * 0.5 * (1 - l_v1017_7));
            for v2094 = 1, v2087 do
                local v2095 = l_l_l_match_0_8_0[v2094];
                local v2096 = v2086[v2094];
                local v2097 = v2095[1];
                local v2098 = v2095[2];
                local v2099 = v2095[3];
                local v2100 = v2095[4];
                local v2101 = (math.sin(l_realtime_0 * v2100) * 0.5 + 0.5) * 0.7 + 0.3;
                local v2102 = v2084:clone();
                local v2103 = v2093:clone();
                v2103.x = v2103.x + v2098;
                v2103.y = v2103.y + v2099;
                v2102.a = v2102.a * v2101;
                l_play_0.text(1, v2103, v2102, "", v2097);
                v2093.x = v2093.x + (v2096.x + v2098);
            end;
            v2083.y = v2083.y + v2089 * 0.66;
        end;
        l_v1445_4 = function(v2104, v2105, v2106)
            -- upvalues: v15 (ref), l_play_0 (ref), v125 (ref), v14 (ref), l_v1017_7 (ref)
            local v2107 = 4;
            local l_name_1 = v15.name;
            local v2109 = "";
            local v2110 = l_play_0.measure_text(v2107, v2109, l_name_1);
            local v2111 = -globals.realtime * 1.25;
            l_name_1 = v125.gradient(l_name_1, v2111, v2105, v2106);
            local v2112 = v2104:clone();
            v2112.x = v14(v2112.x - v2110.x * 0.5 * (1 - l_v1017_7));
            l_play_0.text(v2107, v2112, v2105, v2109, l_name_1);
            v2104.y = v2104.y + v2110.y;
        end;
        l_v1446_4 = function(v2113, v2114, v2115)
            -- upvalues: l_v1036_5 (ref), l_play_0 (ref), v14 (ref), l_v1017_7 (ref)
            local v2116 = 1;
            local v2117 = l_v1036_5();
            local v2118 = "";
            local v2119 = l_play_0.measure_text(v2116, v2118, v2117);
            local v2120 = v2114:clone();
            local v2121 = v2113:clone();
            v2120.a = v2120.a * v2115;
            v2121.x = v14(v2121.x - v2119.x * 0.5 * (1 - l_v1017_7));
            l_play_0.text(v2116, v2121, v2120, v2118, v2117);
            v2113.y = v2113.y + v14(v2119.y);
        end;
        l_v1598_3 = function(v2122, v2123, v2124)
            -- upvalues: l_play_0 (ref), v14 (ref), l_v1017_7 (ref)
            local v2125 = 1;
            local v2126 = "dt";
            local v2127 = "";
            local v2128 = l_play_0.measure_text(v2125, v2127, v2126);
            local v2129 = v2123:clone();
            local v2130 = v2122:clone();
            local v2131 = rage.exploit:get();
            v2129 = v2129:lerp(color(255, 0, 50, 255), 1 - v2131 * v2131);
            v2129.a = v2129.a * v2124;
            v2130.x = v14(v2130.x - v2128.x * 0.5 * (1 - l_v1017_7));
            l_play_0.text(v2125, v2130, v2129, v2127, v2126);
            v2122.y = v2122.y + v14(v2128.y * v2124);
        end;
        l_v1599_2 = function(v2132, v2133, v2134)
            -- upvalues: l_play_0 (ref), v14 (ref), l_v1017_7 (ref)
            local v2135 = 1;
            local v2136 = "dmg";
            local v2137 = "";
            local v2138 = l_play_0.measure_text(v2135, v2137, v2136);
            local v2139 = v2133:clone();
            local v2140 = v2132:clone();
            v2139.a = v2139.a * v2134;
            v2140.x = v14(v2140.x - v2138.x * 0.5 * (1 - l_v1017_7));
            l_play_0.text(v2135, v2140, v2139, v2137, v2136);
            v2132.y = v2132.y + v14(v2138.y * v2134);
        end;
        l_v1600_3 = function(v2141, v2142, v2143)
            -- upvalues: l_play_0 (ref), v14 (ref), l_v1017_7 (ref)
            local v2144 = 1;
            local v2145 = "osaa";
            local v2146 = "";
            local v2147 = l_play_0.measure_text(v2144, v2146, v2145);
            local v2148 = v2142:clone();
            local v2149 = v2141:clone();
            v2148.a = v2148.a * v2143;
            v2149.x = v14(v2149.x - v2147.x * 0.5 * (1 - l_v1017_7));
            l_play_0.text(v2144, v2149, v2148, v2146, v2145);
            v2141.y = v2141.y + v14(v2147.y * v2143);
        end;
        l_v1601_3 = function(v2150)
            -- upvalues: v798 (ref), v28 (ref), l_l_v1016_5_0 (ref), v89 (ref), l_v1017_7 (ref), l_l_angles_0_7 (ref), l_v1019_5 (ref), l_v1030_5 (ref)
            local v2151 = v2150:is_alive();
            local l_m_bIsScoped_0 = v2150.m_bIsScoped;
            local v2153 = v798.get(v28.ragebot.selection.min_damage);
            local v2154 = v2153 ~= nil and (v2153.active or false);
            local v2155 = v28.ragebot.main.double_tap[1]:get();
            local v2156 = v28.ragebot.main.hide_shots[1]:get();
            l_l_v1016_5_0 = v89.interp(l_l_v1016_5_0, v2151, 0.05);
            l_v1017_7 = v89.interp(l_v1017_7, l_m_bIsScoped_0, 0.05);
            l_l_angles_0_7 = v89.interp(l_l_angles_0_7, v2155, 0.05);
            l_v1019_5 = v89.interp(l_v1019_5, v2154, 0.05);
            l_v1030_5 = v89.interp(l_v1030_5, v2156, 0.05);
        end;
        l_v1602_3 = function()
            -- upvalues: l_play_0 (ref), l_v926_7 (ref), v14 (ref), l_v1017_7 (ref), l_l_v1016_5_0 (ref), l_l_aimtools_0_4 (ref), l_v1445_4 (ref), l_v1446_4 (ref), l_v1598_3 (ref), l_l_angles_0_7 (ref), l_v1599_2 (ref), l_v1019_5 (ref), l_v1600_3 (ref), l_v1030_5 (ref)
            local v2157 = l_play_0.screen_size() * 0.5;
            local v2158 = l_v926_7.accent_color:get();
            local v2159 = l_v926_7.secondary_color:get();
            v2157.x = v2157.x + v14(10 * l_v1017_7);
            v2157.y = v2157.y + l_v926_7.offset:get();
            v2158.a = v2158.a * l_l_v1016_5_0;
            v2159.a = v2159.a * l_l_v1016_5_0;
            l_l_aimtools_0_4(v2157, v2158);
            l_v1445_4(v2157, v2158, v2159);
            l_v1446_4(v2157, color(255, 255, 255, 200), l_l_v1016_5_0);
            l_v1598_3(v2157, color(255, 255, 255, 200), l_l_angles_0_7 * l_l_v1016_5_0);
            l_v1599_2(v2157, color(255, 255, 255, 200), l_v1019_5 * l_l_v1016_5_0);
            l_v1600_3(v2157, color(255, 255, 255, 200 * (1 - l_l_angles_0_7 * 0.5)), l_v1030_5 * l_l_v1016_5_0);
        end;
        l_v927_8.on_render = function()
            -- upvalues: l_v1601_3 (ref), l_l_v1016_5_0 (ref), l_v1602_3 (ref)
            local v2160 = entity.get_local_player();
            if v2160 == nil then
                return;
            else
                l_v1601_3(v2160);
                if l_l_v1016_5_0 > 0 then
                    l_v1602_3();
                end;
                return;
            end;
        end;
    end;
    l_l_match_0_8 = {};
    l_v1016_5 = "";
    v1017 = 0;
    l_angles_0 = 0;
    v1019 = 0;
    v1030 = 0;
    v1036 = 0;
    l_aimtools_0 = 0;
    v1445 = function(v2161)
        local v2162 = v2161:get_player_weapon();
        if v2162 == nil then
            return false;
        else
            local v2163 = v2162:get_weapon_info();
            if v2163 == nil then
                return false;
            elseif v2163.type ~= 9 then
                return false;
            else
                return true;
            end;
        end;
    end;
    v1446 = function(v2164, v2165)
        -- upvalues: v16 (ref)
        local v2166 = globals.realtime * 3;
        local v2167 = math.abs(math.sin(v2166));
        return v16.lerp(v2164, v2165, v2167);
    end;
    v1598 = function()
        -- upvalues: v370 (ref), v28 (ref)
        if not v370.is_onground then
            return "-AIR-";
        elseif v370.is_crouched then
            return "-CROUCH-";
        elseif v370.is_moving then
            if v28.antiaim.misc.slow_walk:get() then
                return "-WALKING-";
            else
                return "-MOVING-";
            end;
        else
            return "-STANDING-";
        end;
    end;
    do
        local l_l_v1016_5_1, l_v1017_8, l_l_angles_0_8, l_v1019_6, l_v1030_6, l_v1036_6, l_l_aimtools_0_5, l_v1445_5, l_v1446_5, l_v1598_4, l_v1599_3, l_v1600_4, l_v1601_4, l_v1602_4, l_v1603_3, l_v1604_4, l_v1605_2, l_v1606_1 = l_v1016_5, v1017, l_angles_0, v1019, v1030, v1036, l_aimtools_0, v1445, v1446, v1598, v1599, v1600, v1601, v1602, v1603, v1604, v1605, v1606;
        l_v1599_3 = function()
            -- upvalues: v28 (ref), l_l_v1016_5_1 (ref)
            if v28.ragebot.main.double_tap[1]:get() then
                l_l_v1016_5_1 = "DT";
            elseif v28.ragebot.main.hide_shots[1]:get() then
                l_l_v1016_5_1 = "HIDE";
            end;
            return l_l_v1016_5_1, color(255, 255, 255, 255);
        end;
        l_v1600_4 = function(v2186)
            -- upvalues: v371 (ref)
            if v2186 == 0 then
                return "WAITING", color(255, 64, 64, 255);
            elseif v2186 == 1 then
                if v371.defensive_ticks > 0 then
                    return "ACTIVE", color(120, 255, 255, 255);
                else
                    return "READY", color(192, 255, 109, 255);
                end;
            else
                return "CHARGING", color(255, 64, 64, 255):lerp(color(192, 255, 109, 255), v2186);
            end;
        end;
        l_v1601_4 = function(v2187)
            -- upvalues: l_v1445_5 (ref), v798 (ref), v28 (ref), l_v1017_8 (ref), v89 (ref), l_l_angles_0_8 (ref), l_v1030_6 (ref), l_v1036_6 (ref), l_l_aimtools_0_5 (ref)
            local v2188 = v2187:is_alive();
            local l_m_bIsScoped_1 = v2187.m_bIsScoped;
            local v2190 = l_v1445_5(v2187);
            local v2191 = v798.get(v28.ragebot.selection.min_damage);
            local v2192 = v2191 ~= nil and (v2191.active or false);
            local v2193 = v28.ragebot.main.double_tap[1]:get();
            local v2194 = v28.ragebot.main.hide_shots[1]:get();
            local v2195 = 0;
            if v2188 then
                v2195 = v2190 and 0.5 or 1;
            end;
            l_v1017_8 = v89.interp(l_v1017_8, v2195, 0.05);
            l_l_angles_0_8 = v89.interp(l_l_angles_0_8, l_m_bIsScoped_1, 0.05);
            l_v1030_6 = v89.interp(l_v1030_6, v2193, 0.03);
            l_v1036_6 = v89.interp(l_v1036_6, v2192, 0.03);
            l_l_aimtools_0_5 = v89.interp(l_l_aimtools_0_5, v2194, 0.03);
        end;
        l_v1602_4 = function(v2196, v2197, v2198, v2199)
            -- upvalues: l_play_0 (ref), l_v1446_5 (ref), l_l_angles_0_8 (ref)
            local v2200 = 2;
            local v2201 = "";
            local v2202 = "ANGELIC";
            local v2203 = "YAW";
            local v2204 = l_play_0.measure_text(v2200, v2201, v2202);
            local v2205 = l_play_0.measure_text(v2200, v2201, v2203);
            local v2206 = v2204.x + v2205.x;
            local v2207 = math.max(v2204.y, v2205.y);
            local v2208 = v2196:clone();
            local v2209 = v2206 * 0.5;
            local v2210 = l_v1446_5(0.25, 1);
            local v2211 = v2197:clone();
            local v2212 = v2198:clone();
            v2211.a = v2211.a * v2199;
            v2212.a = v2212.a * v2199;
            v2211.a = v2211.a * v2210;
            v2208.x = v2208.x - v2209 * (1 - l_l_angles_0_8) + 1;
            l_play_0.text(v2200, v2208, v2212, v2201, v2202);
            v2208.x = v2208.x + v2204.x;
            l_play_0.text(v2200, v2208, v2211, v2201, v2203);
            v2196.y = v2196.y + (v2207 - 3);
        end;
        l_v1603_3 = function(v2213, _, v2215)
            -- upvalues: l_v1598_4 (ref), l_play_0 (ref), l_v1019_6 (ref), v89 (ref), l_l_angles_0_8 (ref)
            local v2216 = 2;
            local v2217 = "";
            local v2218 = l_v1598_4();
            local v2219 = l_play_0.measure_text(v2216, v2217, v2218);
            local l_x_1 = v2219.x;
            local l_y_0 = v2219.y;
            if l_v1019_6 < l_x_1 then
                l_v1019_6 = v89.interp(l_v1019_6, l_x_1, 0.05);
            else
                l_v1019_6 = l_x_1;
            end;
            local v2222 = v2213:clone();
            local v2223 = l_v1019_6 * 0.5;
            v2222.x = v2222.x - v2223 * (1 - l_l_angles_0_8) + 1;
            local v2224 = color(255, 255, 255, 255);
            v2224.a = v2224.a * v2215;
            l_play_0.push_clip_rect(v2222, v2222 + vector(l_v1019_6, l_y_0));
            l_play_0.text(v2216, v2222, v2224, v2217, v2218);
            l_play_0.pop_clip_rect();
            v2213.y = v2213.y + (l_y_0 - 3);
        end;
        l_v1604_4 = function(v2225, v2226, v2227)
            -- upvalues: l_v1599_3 (ref), l_v1600_4 (ref), l_play_0 (ref), l_l_angles_0_8 (ref)
            local v2228 = 2;
            local v2229 = "";
            local v2230 = rage.exploit:get();
            local v2231, v2232 = l_v1599_3();
            local v2233, v2234 = l_v1600_4(v2230);
            local v2235 = string.format("\a%s%s \a%s%s", v2232:to_hex(), v2231, v2234:to_hex(), v2233);
            local v2236 = l_play_0.measure_text(v2228, v2229, v2235);
            local l_x_2 = v2236.x;
            local l_y_1 = v2236.y;
            local v2239 = v2225:clone();
            local v2240 = l_x_2 * 0.5;
            v2239.x = v2239.x - v2240 * v2226 * (1 - l_l_angles_0_8) + 1;
            local v2241 = color(255, 255, 255, 255);
            v2241.a = v2241.a * v2227 * v2226;
            local v2242 = v2241:clone();
            v2242.a = v2242.a * 0.5;
            l_play_0.push_clip_rect(v2239, v2239 + vector(l_x_2 * v2226, l_y_1));
            l_play_0.text(v2228, v2239, v2242, v2229, v2235);
            l_play_0.pop_clip_rect();
            l_play_0.push_clip_rect(v2239, v2239 + vector(l_x_2 * v2226 * v2230, l_y_1));
            l_play_0.text(v2228, v2239, v2241, v2229, v2235);
            l_play_0.pop_clip_rect();
            v2225.y = v2225.y + (l_y_1 - 3) * v2226;
        end;
        l_v1605_2 = function(v2243, v2244, v2245)
            -- upvalues: l_play_0 (ref), l_l_angles_0_8 (ref)
            local v2246 = 2;
            local v2247 = "";
            local v2248 = "DMG";
            local v2249 = l_play_0.measure_text(v2246, v2247, v2248);
            local l_x_3 = v2249.x;
            local l_y_2 = v2249.y;
            local v2252 = v2243:clone();
            local v2253 = l_x_3 * 0.5;
            v2252.x = v2252.x - v2253 * v2244 * (1 - l_l_angles_0_8) + 1;
            local v2254 = color(255, 255, 255, 255);
            v2254.a = v2254.a * v2245 * v2244;
            l_play_0.push_clip_rect(v2252, v2252 + vector(l_x_3 * v2244, l_y_2));
            l_play_0.text(v2246, v2252, v2254, v2247, v2248);
            l_play_0.pop_clip_rect();
            v2243.y = v2243.y + (l_y_2 - 3) * v2244;
        end;
        l_v1606_1 = function()
            -- upvalues: l_play_0 (ref), l_v926_7 (ref), l_v1030_6 (ref), l_l_aimtools_0_5 (ref), v14 (ref), l_l_angles_0_8 (ref), l_v1602_4 (ref), l_v1017_8 (ref), l_v1603_3 (ref), l_v1604_4 (ref), l_v1605_2 (ref), l_v1036_6 (ref)
            local v2255 = l_play_0.screen_size() * 0.5;
            local v2256 = l_v926_7.accent_color:get();
            local v2257 = l_v926_7.secondary_color:get();
            local v2258 = math.max(l_v1030_6, l_l_aimtools_0_5);
            v2255.x = v2255.x + v14(10 * l_l_angles_0_8);
            v2255.y = v2255.y + l_v926_7.offset:get();
            l_v1602_4(v2255, v2256, v2257, l_v1017_8);
            l_v1603_3(v2255, color(255, 255, 255, 255), l_v1017_8);
            l_v1604_4(v2255, v2258, l_v1017_8);
            l_v1605_2(v2255, l_v1036_6, l_v1017_8);
        end;
        l_l_match_0_8.on_render = function()
            -- upvalues: l_v1601_4 (ref), l_v1017_8 (ref), l_v1606_1 (ref)
            local v2259 = entity.get_local_player();
            if v2259 == nil then
                return;
            else
                l_v1601_4(v2259);
                if l_v1017_8 > 0 then
                    l_v1606_1();
                end;
                return;
            end;
        end;
    end;
    l_v1016_5 = function(v2260)
        -- upvalues: l_v927_8 (ref), l_l_match_0_8 (ref)
        local v2261 = v2260 == 1;
        local v2262 = v2260 == 2;
        events.render(l_v927_8.on_render, v2261);
        events.render(l_l_match_0_8.on_render, v2262);
    end;
    v1017 = nil;
    l_angles_0 = function(v2263)
        -- upvalues: l_v1016_5 (ref)
        l_v1016_5(v2263:get());
    end;
    do
        local l_l_angles_0_9 = l_angles_0;
        v1019 = function(v2265)
            -- upvalues: l_v1016_5 (ref), l_v926_7 (ref), l_l_angles_0_9 (ref)
            local v2266 = v2265:get();
            if not v2266 then
                l_v1016_5(nil);
            end;
            if v2266 then
                l_v926_7.style:set_callback(l_l_angles_0_9, true);
            else
                l_v926_7.style:unset_callback(l_l_angles_0_9);
            end;
        end;
        l_v926_7.enabled:set_callback(v1019, true);
    end;
end;
v926 = nil;
v927 = v360.visuals.solus_ui;
l_match_0 = 5;
v1016 = 1;
v1017 = function(v2267, v2268)
    local v2269 = {};
    for v2270 = 1, v2268 do
        v2269[v2270] = v2267;
    end;
    return v2269;
end;
l_angles_0 = function(v2271, v2272, v2273)
    if v2273 or v2271[#v2271] ~= v2272 then
        table.insert(v2271, v2272);
        table.remove(v2271, 1);
    end;
end;
v1019 = function(v2274)
    local v2275 = 0;
    local v2276 = 0;
    for _, v2278 in pairs(v2274) do
        v2276 = v2276 + v2278;
        v2275 = v2275 + 1;
    end;
    return v2276 / v2275;
end;
v1030 = function()
    -- upvalues: l_play_0 (ref)
    return {
        draw = function(_, v2280, v2281, v2282, v2283, v2284, v2285)
            -- upvalues: l_play_0 (ref)
            local l_v2281_0 = v2281;
            local l_clr_1_0 = v2284.clr_1;
            v2281 = 0;
            v2282 = v2282 - l_v2281_0;
            v2284.h = v2284.h - v2284.thickness;
            if v2285 then
                l_play_0.rect_outline(vector(v2284.x, v2284.y), vector(v2284.x + v2284.w - 1, v2284.y + v2284.h - 1 + v2284.thickness), l_clr_1_0);
            end;
            if v2281 == v2282 then
                l_play_0.line(vector(v2284.x, v2284.y + v2284.h), vector(v2284.x + v2284.w, v2284.y + v2284.h), l_clr_1_0);
                return;
            else
                local v2288 = v2284.w / (v2283 - 1);
                local v2289 = v2282 - v2281;
                for v2290 = 1, v2283 - 1 do
                    local v2291 = vector((v2280[v2290] - l_v2281_0) / v2289, (v2280[v2290 + 1] - l_v2281_0) / v2289);
                    local v2292 = {
                        vector(v2284.x + v2288 * (v2290 - 1), v2284.y + v2284.h - v2284.h * v2291.x), 
                        vector(v2284.x + v2288 * v2290, v2284.y + v2284.h - v2284.h * v2291.y)
                    };
                    for v2293 = 1, v2284.thickness do
                        l_play_0.line(vector(v2292[1].x, v2292[1].y + v2293 - 1), vector(v2292[2].x, v2292[2].y + v2293 - 1), l_clr_1_0);
                    end;
                end;
                return;
            end;
        end, 
        draw_histogram = function(_, v2295, v2296, v2297, v2298, v2299, v2300)
            -- upvalues: l_play_0 (ref)
            local l_v2296_0 = v2296;
            v2296 = 0;
            v2297 = v2297 - l_v2296_0;
            if v2300 then
                l_play_0.rect_outline(vector(v2299.x, v2299.y), vector(v2299.x + v2299.w - 1, v2299.y + v2299.h - 1), color(255, 255, 255, 255));
            end;
            local v2302 = v2299.w / (v2298 - 1);
            local v2303 = v2297 - v2296;
            for v2304 = 1, v2298 - 1 do
                local v2305 = vector((v2295[v2304] - l_v2296_0) / v2303, (v2295[v2304 + 1] - l_v2296_0) / v2303);
                local v2306 = {
                    [1] = vector(math.floor(v2299.x + v2302 * (v2304 - 1)), math.floor(v2299.y + v2299.h - v2299.h * v2305.x)), 
                    [2] = vector(math.floor(v2299.x + v2302 * v2304), math.floor(v2299.y + v2299.h)), 
                    isZero = math.floor(v2299.y + v2299.h) == math.floor(v2299.y + v2299.h - v2299.h * v2305.x)
                };
                if v2299.draw_bar == "fill" then
                    l_play_0.rect(v2306[1], v2306[2], v2299.clr_1);
                elseif v2299.draw_bar == "gradient_fadeout" then
                    local v2307 = v2299.clr_1:clone();
                    local v2308 = v2299.clr_1:clone();
                    v2308.a = 0;
                    l_play_0.gradient(v2306[1], v2306[2], v2307, v2307, v2308, v2308);
                elseif v2299.draw_bar == "gradient_fadein" then
                    local v2309 = v2299.clr_1:clone();
                    local v2310 = v2299.clr_1:clone();
                    v2310.a = 0;
                    l_play_0.gradient(v2306[1], v2306[2], v2310, v2310, v2309, v2309);
                end;
                if v2299.draw_peeks and not v2306.isZero then
                    l_play_0.line(v2306[1], v2306[2], v2299.clr_2);
                end;
            end;
        end
    };
end;
v1036 = function(v2311, v2312, v2313, v2314, v2315, ...)
    -- upvalues: l_play_0 (ref)
    l_play_0.rect(vector(v2311, v2312), vector(v2311 + v2313, v2312 + v2314), v2315, ...);
end;
l_aimtools_0 = function(v2316, v2317, v2318, v2319, v2320, v2321, v2322, ...)
    -- upvalues: l_play_0 (ref)
    local v2323 = nil;
    local v2324 = nil;
    local v2325 = nil;
    local v2326 = nil;
    if v2322 then
        local l_v2320_0 = v2320;
        v2325 = v2320;
        v2323 = l_v2320_0;
        l_v2320_0 = v2321;
        v2326 = v2321;
        v2324 = l_v2320_0;
    else
        local l_v2320_1 = v2320;
        v2324 = v2320;
        v2323 = l_v2320_1;
        l_v2320_1 = v2321;
        v2326 = v2321;
        v2325 = l_v2320_1;
    end;
    l_play_0.gradient(vector(v2316, v2317), vector(v2316 + v2318, v2317 + v2319), v2323, v2324, v2325, v2326, ...);
end;
do
    local l_v927_9, l_l_match_0_9, l_v1016_6, l_l_angles_0_10, l_v1019_7, l_v1036_7, l_l_aimtools_0_6, l_v1445_6, l_v1446_6, l_v1598_5, l_v1599_4, l_v1600_5, l_v1601_5 = v927, l_match_0, v1016, l_angles_0, v1019, v1036, l_aimtools_0, v1445, v1446, v1598, v1599, v1600, v1601;
    l_v1445_6 = function(v2342, v2343, v2344, v2345)
        -- upvalues: l_play_0 (ref), l_l_match_0_9 (ref), l_v1036_7 (ref), l_v1016_6 (ref), l_l_aimtools_0_6 (ref)
        local l_x_4 = v2342.x;
        local l_y_3 = v2342.y;
        local v2348 = v2343.x - v2342.x;
        local v2349 = v2343.y - v2342.y;
        local v2350 = v2344:alpha_modulate(255 * v2345);
        local v2351 = v2344:alpha_modulate(50 * v2345);
        l_play_0.blur(v2342, v2343, 0.5, v2345, l_l_match_0_9);
        l_play_0.rect(v2342, v2343, color(17, 17, 17, v2344.a * v2345), l_l_match_0_9);
        l_v1036_7(l_x_4 + l_l_match_0_9, l_y_3, v2348 - l_l_match_0_9 * 2, l_v1016_6, v2350);
        l_v1036_7(l_x_4 + l_l_match_0_9, l_y_3 + v2349 - l_v1016_6, v2348 - l_l_match_0_9 * 2, l_v1016_6, v2351);
        l_play_0.circle_outline(vector(l_x_4 + l_l_match_0_9, l_y_3 + l_l_match_0_9), v2350, l_l_match_0_9 + 0.5, 180, 0.25, l_v1016_6);
        l_play_0.circle_outline(vector(l_x_4 + v2348 - l_l_match_0_9, l_y_3 + l_l_match_0_9), v2350, l_l_match_0_9 + 0.5, 270, 0.25, l_v1016_6);
        l_play_0.circle_outline(vector(l_x_4 + l_l_match_0_9, l_y_3 + v2349 - l_l_match_0_9), v2351, l_l_match_0_9 + 0.5, 90, 0.25, l_v1016_6);
        l_play_0.circle_outline(vector(l_x_4 + v2348 - l_l_match_0_9, l_y_3 + v2349 - l_l_match_0_9), v2351, l_l_match_0_9 + 0.5, 0, 0.25, l_v1016_6);
        l_l_aimtools_0_6(l_x_4, l_y_3 + l_l_match_0_9, l_v1016_6, v2349 - l_l_match_0_9 * 2, v2350, v2351, false);
        l_l_aimtools_0_6(l_x_4 + v2348 - l_v1016_6, l_y_3 + l_l_match_0_9, l_v1016_6, v2349 - l_l_match_0_9 * 2, v2350, v2351, false);
    end;
    l_v1446_6 = {};
    l_v1598_5 = 0;
    l_v1599_4 = function()
        -- upvalues: l_v927_9 (ref)
        return l_v927_9.enabled:get() and l_v927_9.select:get("Watermark");
    end;
    do
        local l_l_v1598_5_0, l_l_v1599_4_0 = l_v1598_5, l_v1599_4;
        l_v1446_6.draw = function(v2354)
            -- upvalues: l_l_v1598_5_0 (ref), v89 (ref), l_l_v1599_4_0 (ref), l_play_0 (ref), l_v1445_6 (ref), l_v927_9 (ref)
            local v2355 = v2354:clone();
            l_l_v1598_5_0 = v89.interp(l_l_v1598_5_0, l_l_v1599_4_0(), 0.05);
            if l_l_v1598_5_0 <= 0 then
                return;
            else
                local v2356 = {};
                local v2357 = utils.net_channel();
                local v2358 = common.get_system_time();
                table.insert(v2356, "angelwings");
                table.insert(v2356, common.get_username());
                if v2357 ~= nil then
                    table.insert(v2356, string.format("delay: %dms", v2357.latency[1] * 1000));
                end;
                if v2358 ~= nil then
                    table.insert(v2356, string.format("%02d:%02d:%02d", v2358.hours, v2358.minutes, v2358.seconds));
                end;
                v2357 = 1;
                v2358 = "";
                local v2359 = table.concat(v2356, " | ");
                local v2360 = l_play_0.measure_text(v2357, v2358, v2359);
                local v2361 = color(255, 255, 255, 255);
                local v2362 = v2360 + vector(10, 8);
                v2355.x = v2355.x - v2362.x;
                v2361.a = v2361.a * l_l_v1598_5_0;
                l_v1445_6(v2355, v2355 + v2362, l_v927_9.color:get(), l_l_v1598_5_0);
                l_play_0.text(v2357, v2355 + vector(5, 4), v2361, v2358, v2359);
                v2354.y = v2354.y + (v2362.y + 10) * l_l_v1598_5_0;
                return;
            end;
        end;
    end;
    l_v1598_5 = {};
    l_v1599_4 = {};
    l_v1600_5 = 0;
    l_v1601_5 = nil;
    v1602 = nil;
    v1603 = vector(400, 340);
    v1604 = vector(120, 20);
    v1605 = l_play_0.screen_size();
    v1602 = v117.new("spectators", v1603, v1604, {
        border = {
            vector(0, 0), 
            v1605:clone()
        }
    });
    do
        local l_l_v1599_4_1, l_l_v1600_5_0, l_l_v1601_5_0, l_v1602_5, l_v1603_4, l_v1604_5, l_v1605_3 = l_v1599_4, l_v1600_5, l_v1601_5, v1602, v1603, v1604, v1605;
        l_v1602_5.update = function()
            -- upvalues: l_l_v1600_5_0 (ref)
            return l_l_v1600_5_0;
        end;
        l_v1603_4 = function()
            -- upvalues: l_v927_9 (ref)
            return l_v927_9.enabled:get() and l_v927_9.select:get("Spectators");
        end;
        l_v1604_5 = function(v2370)
            local l_m_iObserverMode_0 = v2370.m_iObserverMode;
            if l_m_iObserverMode_0 == 4 or l_m_iObserverMode_0 == 5 then
                local l_m_hObserverTarget_0 = v2370.m_hObserverTarget;
                if l_m_hObserverTarget_0 ~= nil then
                    return l_m_hObserverTarget_0:get_spectators();
                end;
            end;
            return v2370:get_spectators();
        end;
        l_v1605_3 = function(v2373, v2374)
            -- upvalues: l_v1604_5 (ref), l_l_v1599_4_1 (ref), l_play_0 (ref), v89 (ref)
            local v2375 = entity.get_local_player();
            local v2376 = {};
            local v2377 = false;
            local v2378 = 0;
            if v2375 ~= nil then
                local v2379 = l_v1604_5(v2375) or {};
                for _, v2381 in pairs(v2379) do
                    local v2382 = v2381:get_index();
                    local v2383 = v2381:get_name();
                    local v2384 = v2381:get_steam_avatar();
                    v2377 = true;
                    v2376[v2382] = v2381;
                    l_l_v1599_4_1[v2382] = l_l_v1599_4_1[v2382] or {
                        name_height = 0, 
                        alpha = 0, 
                        name_width = 0, 
                        name = v2383, 
                        avatar = v2384
                    };
                    local v2385 = l_l_v1599_4_1[v2382];
                    local v2386 = l_play_0.measure_text(v2373, v2374, v2383);
                    v2385.name = v2383;
                    v2385.name_width = v2386.x;
                    v2385.name_height = v2386.y;
                end;
            end;
            for v2387, v2388 in pairs(l_l_v1599_4_1) do
                local v2389 = v2376[v2387] ~= nil;
                v2388.alpha = v89.interp(v2388.alpha, v2389, 0.05);
                if v2388.alpha <= 0.01 then
                    l_l_v1599_4_1[v2387] = nil;
                elseif (v2388.alpha > 0 or v2389) and v2378 < v2388.name_width then
                    v2378 = v2388.name_width;
                end;
            end;
            return l_l_v1599_4_1, v2377, v2378;
        end;
        l_v1598_5.draw = function()
            -- upvalues: l_v1605_3 (ref), l_v1603_4 (ref), l_l_v1600_5_0 (ref), v89 (ref), l_v1602_5 (ref), l_l_v1601_5_0 (ref), l_v1445_6 (ref), l_v927_9 (ref), l_play_0 (ref), v14 (ref)
            local v2390 = 1;
            local v2391 = "c";
            local v2392 = "spectators";
            local v2393, v2394, v2395 = l_v1605_3(v2390, v2391);
            local v2396 = l_v1603_4() and (v2394 or ui.get_alpha() > 0);
            l_l_v1600_5_0 = v89.interp(l_l_v1600_5_0, v2396, 0.05);
            if l_l_v1600_5_0 <= 0 then
                return;
            else
                local v2397 = l_v1602_5:get_drag_position():clone();
                local v2398 = math.max(66, v2395);
                local v2399 = vector(75 + v2398, 20);
                if l_l_v1601_5_0 == nil then
                    l_l_v1601_5_0 = v2399.x;
                end;
                l_l_v1601_5_0 = v89.interp(l_l_v1601_5_0, v2399.x, 0.033);
                v2399.x = math.floor(l_l_v1601_5_0);
                l_v1445_6(v2397, v2397 + v2399, l_v927_9.color:get(), l_l_v1600_5_0);
                l_play_0.text(v2390, v2397 + v2399 / 2 - vector(0, 1), color(255, 255 * l_l_v1600_5_0), v2391, v2392);
                local v2400 = 0;
                v2397.y = v2397.y + 3;
                for _, v2402 in pairs(v2393) do
                    local l_name_2 = v2402.name;
                    local l_avatar_0 = v2402.avatar;
                    local v2405 = color(255, 255, 255, 255);
                    local v2406 = l_l_v1600_5_0 * v2402.alpha;
                    v2405.a = v2405.a * v2406;
                    local v2407 = vector(v2402.name_height, v2402.name_height);
                    local v2408 = vector(v2397.x + 5, v2397.y + v2399.y);
                    local v2409 = vector(v2397.x + v2399.x - 5 - v2407.x, v2397.y + v2399.y);
                    l_play_0.text(v2390, v2408, v2405, "", l_name_2);
                    if l_avatar_0 ~= nil then
                        l_play_0.texture(l_avatar_0, v2409, v2407, v2405);
                    end;
                    v2400 = math.max(v2400, v2406);
                    v2399.y = v2399.y + v14(15 * v2406);
                end;
                v2399.y = v2399.y + v14(3 * v2400);
                l_v1602_5.size = v2399;
                l_v1602_5();
                return;
            end;
        end;
    end;
    l_v1599_4 = {};
    l_v1600_5 = {};
    l_v1601_5 = 0;
    v1602 = nil;
    v1603 = nil;
    v1604 = vector(400, 200);
    v1605 = vector(120, 20);
    v1606 = l_play_0.screen_size();
    v1603 = v117.new("hotkey_list", v1604, v1605, {
        border = {
            vector(0, 0), 
            v1606:clone()
        }
    });
    do
        local l_l_v1600_5_1, l_l_v1601_5_1, l_v1602_6, l_v1603_5, l_v1604_6, l_v1605_4, l_v1606_2, l_v1607_2 = l_v1600_5, l_v1601_5, v1602, v1603, v1604, v1605, v1606, v1607;
        l_v1603_5.update = function()
            -- upvalues: l_l_v1601_5_1 (ref)
            return l_l_v1601_5_1;
        end;
        l_v1604_6 = function()
            -- upvalues: l_v927_9 (ref)
            return l_v927_9.enabled:get() and l_v927_9.select:get("Hotkey List");
        end;
        l_v1605_4 = function(v2418, v2419)
            if next(v2419) == nil then
                v2419 = v2418:get();
                if next(v2419) == nil then
                    v2419 = v2418:list();
                end;
            end;
            local v2420 = {};
            for v2421 = 1, #v2419 do
                v2420[#v2420 + 1] = v2419[v2421]:sub(1, 1);
            end;
            return table.concat(v2420, ", ");
        end;
        l_v1606_2 = function(v2422, v2423, v2424)
            -- upvalues: l_v927_9 (ref), l_v1605_4 (ref)
            if type(v2424) == "boolean" or l_v927_9.only_key_state:get() then
                if v2423 == 1 then
                    return "Holding";
                elseif v2423 == 2 then
                    return "Toggled";
                else
                    return "Enabled";
                end;
            elseif type(v2424) == "table" then
                return l_v1605_4(v2422, v2424);
            else
                return tostring(v2424);
            end;
        end;
        l_v1607_2 = function(v2425, v2426)
            -- upvalues: l_v1606_2 (ref), l_l_v1600_5_1 (ref), l_play_0 (ref), v89 (ref)
            local v2427 = {};
            local v2428 = false;
            local v2429 = 0;
            local v2430 = 0;
            for _, v2432 in pairs(ui.get_binds()) do
                local v2433 = v2432.reference:id();
                local v2434 = string.format("[%s]", string.lower(l_v1606_2(v2432.reference, v2432.mode, v2432.value)));
                local l_name_3 = v2432.name;
                if v2432.active then
                    v2428 = true;
                    v2427[v2433] = v2432;
                end;
                l_l_v1600_5_1[v2433] = l_l_v1600_5_1[v2433] or {
                    value_width = 0, 
                    height = 0, 
                    alpha = 0, 
                    name_width = 0, 
                    name = l_name_3, 
                    mode = v2432.mode, 
                    value = v2432.value, 
                    reference = v2432.reference
                };
                local v2436 = l_l_v1600_5_1[v2433];
                local v2437 = l_play_0.measure_text(v2425, v2426, l_name_3);
                local v2438 = l_play_0.measure_text(v2425, v2426, v2434);
                v2436.name = l_name_3;
                v2436.value = v2434;
                v2436.mode = v2432.mode;
                v2436.reference = v2432.reference;
                v2436.height = math.max(v2437.y, v2438.y);
                v2436.name_width = v2437.x;
                v2436.value_width = v2438.x;
            end;
            for v2439, v2440 in pairs(l_l_v1600_5_1) do
                local v2441 = v2427[v2439] ~= nil;
                v2440.alpha = v89.interp(v2440.alpha, v2441, 0.05);
                if v2440.alpha <= 0.01 then
                    l_l_v1600_5_1[v2439] = nil;
                elseif v2440.alpha > 0 or v2441 then
                    if v2429 < v2440.name_width then
                        v2429 = v2440.name_width;
                    end;
                    if v2430 < v2440.value_width then
                        v2430 = v2440.value_width;
                    end;
                end;
            end;
            return l_l_v1600_5_1, v2428, v2429, v2430;
        end;
        l_v1599_4.draw = function()
            -- upvalues: l_v1607_2 (ref), l_v1604_6 (ref), l_l_v1601_5_1 (ref), v89 (ref), l_v1603_5 (ref), l_v1602_6 (ref), l_v1445_6 (ref), l_v927_9 (ref), l_play_0 (ref), v14 (ref)
            local v2442 = 1;
            local v2443 = "c";
            local v2444 = "keybinds";
            local v2445, v2446, v2447 = l_v1607_2(v2442, v2443);
            local v2448 = l_v1604_6() and (v2446 or ui.get_alpha() > 0);
            l_l_v1601_5_1 = v89.interp(l_l_v1601_5_1, v2448, 0.033);
            if l_l_v1601_5_1 <= 0 then
                return;
            else
                local v2449 = l_v1603_5:get_drag_position():clone();
                local v2450 = math.max(66, v2447);
                local v2451 = vector(75 + v2450, 20);
                if l_v1602_6 == nil then
                    l_v1602_6 = v2451.x;
                end;
                l_v1602_6 = v89.interp(l_v1602_6, v2451.x, 0.035);
                v2451.x = math.floor(l_v1602_6);
                l_v1445_6(v2449, v2449 + v2451, l_v927_9.color:get(), l_l_v1601_5_1);
                l_play_0.text(v2442, v2449 + v2451 / 2 - vector(0, 1), color(255, 255 * l_l_v1601_5_1), v2443, v2444);
                local v2452 = 0;
                v2449.y = v2449.y + 3;
                for _, v2454 in pairs(v2445) do
                    local l_v2454_0 = v2454;
                    local l_name_4 = l_v2454_0.name;
                    local l_value_0 = l_v2454_0.value;
                    local v2458 = color(255, 255, 255, 255);
                    local v2459 = l_v2454_0.alpha * l_l_v1601_5_1;
                    v2458.a = v2458.a * v2459;
                    local v2460 = vector(v2449.x + 5, v2449.y + v2451.y);
                    local v2461 = vector(v2449.x + v2451.x - 5, v2449.y + v2451.y);
                    l_play_0.text(v2442, v2460, v2458, "", l_name_4);
                    l_play_0.text(v2442, v2461, v2458, "r", l_value_0);
                    v2452 = math.max(v2452, l_v2454_0.alpha);
                    v2451.y = v2451.y + v14(15 * l_v2454_0.alpha);
                end;
                v2451.y = v2451.y + v14(3 * v2452);
                l_v1603_5.size = v2451;
                l_v1603_5();
                return;
            end;
        end;
    end;
    l_v1600_5 = {};
    l_v1601_5 = 0;
    v1602 = 0;
    v1603 = 0;
    v1604 = v1017(0, 2);
    v1605 = v1017(0, 3);
    v1606 = 0;
    v1607 = 0;
    v1608 = 0;
    v1609 = 0;
    v1610 = 0;
    v1611 = 0;
    v1612 = vector();
    v1613 = false;
    local v2462 = false;
    local function v2463()
        -- upvalues: l_v927_9 (ref)
        return l_v927_9.enabled:get() and l_v927_9.select:get("Anti-aimbot indication");
    end;
    local function v2468()
        local v2464 = rage.antiaim:get_max_desync();
        local v2465 = rage.antiaim:get_rotation(false);
        local v2466 = rage.antiaim:get_rotation(true);
        local v2467 = math.normalize_yaw(v2466 - v2465);
        return math.clamp(v2467, -v2464, v2464);
    end;
    do
        local l_l_v1601_5_2, l_v1602_7, l_v1603_6, l_v1604_7, l_v1605_5, l_v1606_3, l_v1607_3, l_v1608_1, l_v1609_1, l_v1610_1, l_v1611_0, l_v1612_1, l_v1613_1, l_v2462_0, l_v2463_0, l_v2468_0 = l_v1601_5, v1602, v1603, v1604, v1605, v1606, v1607, v1608, v1609, v1610, v1611, v1612, v1613, v2462, v2463, v2468;
        local function v2486()
            -- upvalues: l_v1609_1 (ref)
            local l_l_v1609_1_0 = l_v1609_1;
            if tonumber(l_l_v1609_1_0) < 10 then
                l_l_v1609_1_0 = "  " .. l_l_v1609_1_0;
            end;
            return string.format("FL: %s", l_l_v1609_1_0);
        end;
        local function v2489()
            -- upvalues: l_v1613_1 (ref), l_v1603_6 (ref), v89 (ref), l_v1602_7 (ref), l_v2462_0 (ref)
            if l_v1613_1 then
                l_v1603_6 = v89.interp(l_v1603_6, false, 0.05);
                local v2487 = l_v1603_6 <= 0.01;
                l_v1602_7 = v89.interp(l_v1602_7, v2487, 0.05);
                return;
            elseif l_v2462_0 then
                l_v1602_7 = v89.interp(l_v1602_7, false, 0.05);
                local v2488 = l_v1602_7 <= 0.01;
                l_v1603_6 = v89.interp(l_v1603_6, v2488, 0.05);
                return;
            else
                l_v1602_7 = v89.interp(l_v1602_7, false, 0.05);
                l_v1603_6 = v89.interp(l_v1603_6, false, 0.05);
                return;
            end;
        end;
        local function v2493(v2490)
            -- upvalues: l_v1612_1 (ref), l_v1611_0 (ref), l_l_angles_0_10 (ref), l_v1605_5 (ref), l_v1604_7 (ref), l_v2468_0 (ref), l_v1609_1 (ref), l_v1610_1 (ref), l_v1613_1 (ref), l_v2462_0 (ref), l_v1019_7 (ref)
            local v2491 = entity.get_local_player();
            if v2491 == nil then
                return;
            else
                if v2490.choked_commands == 0 then
                    local l_m_vecOrigin_1 = v2491.m_vecOrigin;
                    if l_v1612_1 ~= nil then
                        l_v1611_0 = (l_m_vecOrigin_1 - l_v1612_1):length2dsqr();
                        l_l_angles_0_10(l_v1605_5, l_v1611_0, true);
                    end;
                    l_l_angles_0_10(l_v1604_7, math.abs(l_v2468_0()), true);
                    l_v1609_1 = l_v1610_1;
                    l_v1612_1 = l_m_vecOrigin_1;
                end;
                l_v1613_1 = rage.exploit:get() == 1;
                l_v2462_0 = l_v1019_7(l_v1605_5) > 3200;
                l_v1610_1 = v2490.choked_commands;
                return;
            end;
        end;
        l_v1600_5.draw = function(v2494)
            -- upvalues: l_v2463_0 (ref), l_l_v1601_5_2 (ref), v89 (ref), v2489 (ref), l_v927_9 (ref), v2486 (ref), l_v1019_7 (ref), l_v1605_5 (ref), l_v1611_0 (ref), l_v1607_3 (ref), l_v1608_1 (ref), l_v1606_3 (ref), l_v2462_0 (ref), l_play_0 (ref), l_v1602_7 (ref), l_v1603_6 (ref), l_v1445_6 (ref), l_v1604_7 (ref)
            local v2495 = v2494:clone();
            local v2496 = entity.get_local_player();
            local v2497 = l_v2463_0() and v2496 ~= nil and v2496:is_alive();
            l_l_v1601_5_2 = v89.interp(l_l_v1601_5_2, v2497, 0.05);
            v2489();
            if l_l_v1601_5_2 <= 0 then
                return;
            else
                local v2498 = 1;
                local v2499 = "";
                local v2500 = l_v927_9.color:get();
                local v2501 = v2486();
                local v2502 = globals.frametime * 3.75;
                local v2503 = 1200 + math.max(0, l_v1019_7(l_v1605_5) - 3800);
                local v2504 = math.abs(math.min(l_v1611_0 - 3800, v2503) / v2503 * 100);
                if l_v1607_3 ~= v2504 and l_v1608_1 < globals.realtime then
                    l_v1608_1 = globals.realtime + 0.005;
                    l_v1607_3 = l_v1607_3 + (v2504 < l_v1607_3 and -1 or 1);
                end;
                l_v1606_3 = l_v1606_3 + (l_v2462_0 and v2502 or -v2502);
                l_v1606_3 = l_v1606_3 > 1 and 1 or l_v1606_3;
                l_v1606_3 = l_v1606_3 < 0 and 0 or l_v1606_3;
                local v2505 = " | SHIFTING";
                local v2506 = l_play_0.measure_text(v2498, v2499, v2505);
                local v2507 = " | dst: " .. string.rep(" ", 10);
                local v2508 = l_play_0.measure_text(v2498, v2499, v2507);
                local v2509 = l_play_0.measure_text(v2498, v2499, v2501);
                local v2510 = color(255, 255, 255, 255);
                local v2511 = vector(v2509.x + 8, 17);
                v2511.x = v2511.x + v2506.x * l_v1602_7;
                v2511.x = v2511.x + v2508.x * l_v1603_6;
                v2495.x = v2495.x - v2511.x;
                v2510.a = v2510.a * l_l_v1601_5_2;
                local v2512 = vector(v2495.x + 4, v2495.y + 2);
                l_v1445_6(v2495, v2495 + v2511, l_v927_9.color:get(), l_l_v1601_5_2);
                l_play_0.text(v2498, v2512, v2510, v2499, v2501);
                v2512.x = v2512.x + v2509.x;
                if l_v1602_7 > 0 then
                    local v2513 = v2510:clone();
                    v2513.a = v2513.a * math.map(l_v1602_7, 0.9, 1, 0, 1);
                    l_play_0.text(v2498, v2512, v2513, v2499, v2505);
                end;
                if l_v1603_6 > 0 then
                    local v2514 = v2510:clone();
                    local v2515 = math.map(l_v1603_6, 0.9, 1, 0, 1);
                    v2514.a = v2514.a * v2515;
                    local v2516 = l_play_0.measure_text(v2498, v2499, " | dst: ");
                    local v2517 = vector(v2512.x + v2516.x + 2, v2512.y + 4);
                    local v2518 = v2517 + vector(math.min(100, l_v1607_3) / 100 * 24, 5);
                    local v2519 = v2500:clone();
                    local v2520 = v2500:clone();
                    v2519.a = 220 * l_v1606_3 * v2515 * l_l_v1601_5_2;
                    v2520.a = 25 * l_v1606_3 * v2515 * l_l_v1601_5_2;
                    l_play_0.text(v2498, v2512, v2514, v2499, v2507);
                    l_play_0.gradient(v2517, v2518, v2519, v2520, v2519, v2520);
                end;
                local v2521 = string.format("FAKE (%.1f\194\176)", l_v1019_7(l_v1604_7));
                local v2522 = l_play_0.measure_text(v2498, v2499, v2521);
                local v2523 = vector(v2522.x + 8, 18);
                v2495.x = v2495.x - v2523.x - 4;
                l_v1445_6(v2495, v2495 + v2523, l_v927_9.color:get(), l_l_v1601_5_2);
                l_play_0.text(v2498, v2495 + vector(4, 2), v2510, v2499, v2521);
                v2494.y = v2494.y + (v2523.y + 10) * l_l_v1601_5_2;
                return;
            end;
        end;
        events.createmove(v2493);
    end;
    l_v1601_5 = {};
    v1602 = v1030();
    v1603 = function(v2524)
        if v2524 < 1 then
            return ("%.2f"):format(v2524);
        elseif v2524 < 10 then
            return ("%.1f"):format(v2524);
        else
            return ("%d"):format(v2524);
        end;
    end;
    pcall(ffi.cdef, "                bool EnumDisplaySettingsA(\n                    unsigned int  lpszDeviceName,\n                    unsigned long iModeNum,\n                    void*         lpDevMode\n                );\n            ");
    v1605 = ffi.typeof("                struct {\n                    char pad_0[120];\n                    unsigned long dmDisplayFrequency;\n                    char pad_1[32];\n                }\n            ")();
    ffi.C.EnumDisplaySettingsA(0, -1, v1605);
    v1606 = 0;
    v1607 = common.get_timestamp();
    v1608 = v1017(0, 90);
    v1609 = v1017(0, 30);
    v1610 = 0;
    v1611 = 0;
    v1612 = function()
        -- upvalues: l_v927_9 (ref)
        return l_v927_9.enabled:get() and l_v927_9.select:get("Frequency update information");
    end;
    do
        local l_v1602_8, l_v1603_7, l_v1605_6, l_v1606_4, l_v1607_4, l_v1608_2, l_v1609_2, l_v1610_2, l_v1611_1, l_v1612_2, l_v1613_2 = v1602, v1603, v1605, v1606, v1607, v1608, v1609, v1610, v1611, v1612, v1613;
        l_v1613_2 = function()
            -- upvalues: l_v1610_2 (ref), l_l_angles_0_10 (ref), l_v1609_2 (ref), l_v1611_1 (ref)
            l_v1610_2 = 0.9 * l_v1610_2 + 0.09999999999999998 * globals.absoluteframetime;
            l_l_angles_0_10(l_v1609_2, math.abs(l_v1611_1 - 1 / l_v1610_2), true);
            l_v1611_1 = 1 / l_v1610_2;
        end;
        v2462 = function()
            -- upvalues: l_v1607_4 (ref)
            l_v1607_4 = common.get_timestamp();
        end;
        v2463 = function()
            -- upvalues: l_v1607_4 (ref), l_l_angles_0_10 (ref), l_v1608_2 (ref)
            local v2536 = common.get_timestamp() - l_v1607_4;
            l_l_angles_0_10(l_v1608_2, v2536);
        end;
        l_v1601_5.draw = function(v2537)
            -- upvalues: l_v1613_2 (ref), l_v1612_2 (ref), l_v1606_4 (ref), v89 (ref), l_v927_9 (ref), l_v1019_7 (ref), l_v1608_2 (ref), l_v1605_6 (ref), l_v1603_7 (ref), l_play_0 (ref), l_v1445_6 (ref), l_v1609_2 (ref), l_v1602_8 (ref)
            l_v1613_2();
            local v2538 = v2537:clone();
            local v2539 = l_v1612_2();
            l_v1606_4 = v89.interp(l_v1606_4, v2539, 0.05);
            if l_v1606_4 <= 0 then
                return;
            else
                local v2540 = 1;
                local v2541 = "";
                local v2542 = l_v927_9.color:get();
                local v2543 = l_v1019_7(l_v1608_2);
                local v2544 = tonumber(l_v1605_6.dmDisplayFrequency);
                local v2545 = string.format("%sms / %dhz", l_v1603_7(v2543), v2544);
                local v2546 = l_play_0.measure_text(v2540, v2541, v2545);
                local v2547 = color(255, 255, 255, 255);
                local v2548 = vector(v2546.x + 8, 18);
                v2538.x = v2538.x - v2548.x;
                v2547.a = v2547.a * l_v1606_4;
                l_v1445_6(v2538, v2538 + v2548, l_v927_9.color:get(), l_v1606_4);
                l_play_0.text(v2540, vector(v2538.x + 4, v2538.y + 2), v2547, v2541, v2545);
                local v2549 = "IO | ";
                local v2550 = l_play_0.measure_text(v2540, v2541, v2549);
                local v2551 = v2549 .. "       ";
                local v2552 = l_play_0.measure_text(v2540, v2541, v2551);
                local v2553 = v2550.x + 4;
                local v2554 = vector(v2552.x + 8, 18);
                local v2555 = {
                    [1] = nil, 
                    [2] = 1, 
                    [3] = 3, 
                    [4] = nil, 
                    [5] = 0, 
                    [1] = v2543, 
                    [4] = l_v1019_7(l_v1609_2) / 4
                };
                local _ = math.min(unpack(v2555));
                local v2557 = math.max(unpack(v2555));
                v2538.x = v2538.x - v2554.x;
                local v2558 = vector(v2538.x - 4, v2538.y);
                l_v1445_6(v2558, v2558 + v2554, l_v927_9.color:get(), l_v1606_4);
                l_play_0.text(v2540, v2538 + vector(0, 2), v2547, v2541, v2551);
                l_v1602_8:draw_histogram(v2555, 0, v2557, #v2555, {
                    thickness = 1, 
                    draw_peeks = false, 
                    draw_bar = "gradient_fadein", 
                    x = v2538.x - 4 + v2553, 
                    y = v2538.y + 4, 
                    w = v2554.x - v2553 - 4, 
                    h = v2554.y - 8, 
                    clr_1 = v2542:alpha_modulate(255 * l_v1606_4), 
                    clr_2 = color(0, 127, 255, 255 * l_v1606_4)
                }, false);
                return;
            end;
        end;
        events.pre_render(v2462);
        events.post_render(v2463);
    end;
    v1602 = function()
        -- upvalues: l_play_0 (ref), l_v1446_6 (ref), l_v1598_5 (ref), l_v1599_4 (ref), l_v1600_5 (ref), l_v1601_5 (ref)
        local v2559 = l_play_0.screen_size();
        local v2560 = vector(v2559.x - 10, 10);
        l_v1446_6.draw(v2560);
        l_v1598_5.draw();
        l_v1599_4.draw();
        l_v1600_5.draw(v2560);
        l_v1601_5.draw(v2560);
    end;
    events.render(v1602);
end;
v927 = nil;
l_match_0 = v360.visuals.watermark;
v1016 = {};
v1017 = string.format("%s\a%%s.PINK", string.upper(v15.name));
l_angles_0 = string.format("VICTIM - %s [\a%%s%s\a%%s]", string.upper(v15.user), string.upper(v15.build));
do
    local l_l_match_0_10, l_v1016_7, l_v1017_9, l_l_angles_0_11 = l_match_0, v1016, v1017, l_angles_0;
    do
        local l_l_v1017_9_0, l_l_l_angles_0_11_0 = l_v1017_9, l_l_angles_0_11;
        l_v1016_7.on_render = function()
            -- upvalues: l_l_match_0_10 (ref), l_play_0 (ref), l_l_v1017_9_0 (ref), l_l_l_angles_0_11_0 (ref), v233 (ref)
            local v2567 = l_l_match_0_10.color:get():alpha_modulate(255);
            local v2568 = color();
            local v2569 = v2567:to_hex();
            local v2570 = v2568:to_hex();
            local v2571 = l_play_0.screen_size();
            local v2572 = 2;
            local v2573 = "";
            local v2574 = {
                string.format(l_l_v1017_9_0, v2569), 
                string.format(l_l_l_angles_0_11_0, v2569, v2570)
            };
            local v2575 = vector(8, v2571.y / 2);
            if v233.eva_small ~= nil then
                local v2576 = vector(35, 35);
                local v2577 = color(255, 255, 255);
                l_play_0.texture(v233.eva_small, v2575, v2576, v2577, "f");
                v2575.x = v2575.x + v2576.x - 4;
                v2575.y = v2575.y + v2576.y + 1;
            end;
            local v2578 = l_play_0.measure_text(v2572, v2573, v2574[1]);
            local v2579 = l_play_0.measure_text(v2572, v2573, v2574[2]);
            v2578.y = v2578.y - 2;
            v2579.y = v2579.y - 2;
            v2575.y = v2575.y - v2579.y;
            l_play_0.text(v2572, v2575, v2568, v2573, v2574[2]);
            v2575.y = v2575.y - (v2578.y - 2);
            l_play_0.text(v2572, v2575, v2568, v2573, v2574[1]);
        end;
    end;
    l_v1017_9 = {};
    l_l_angles_0_11 = 1;
    v1019 = 3;
    v1030 = 3;
    v1036 = 34;
    l_aimtools_0 = 5;
    v1445 = utils.get_vfunc("steamclient.dll", "SteamClient017", 2, "int(__thiscall*)(void*, int)");
    v1446 = utils.get_vfunc("steamclient.dll", "SteamClient017", 8, "int*(__thiscall*)(void*, int, int, const char*)");
    v1598 = utils.get_vfunc("steamclient.dll", "SteamClient017", 9, "int*(__thiscall*)(void*, int, const char*)");
    v1599 = utils.get_vfunc(35, "int(__thiscall*)(void*, uint64_t)");
    v1600 = utils.get_vfunc(5, "bool(__thiscall*)(void*, int, uint32_t*, uint32_t*)");
    v1601 = utils.get_vfunc(6, "bool(__thiscall*)(void*, int, unsigned char*, int)");
    v1603 = v1446(v1445(l_l_angles_0_11), l_l_angles_0_11, "SteamFriends015");
    v1604 = v1598(l_l_angles_0_11, "SteamUtils009");
    v1605 = string.format("\a%%s%s\a%%s.pink", string.lower(v15.name));
    v1606 = string.format("build: \a%%s%s", string.lower(v15.build));
    v1607 = string.format("user: \a%%s%s", v15.user);
    do
        local l_v1019_8, l_v1030_7, l_v1036_8, l_l_aimtools_0_7, l_v1599_5, l_v1600_6, l_v1601_6, l_v1603_8, l_v1604_8, l_v1605_7, l_v1606_5, l_v1607_5, l_v1610_3 = v1019, v1030, v1036, l_aimtools_0, v1599, v1600, v1601, v1603, v1604, v1605, v1606, v1607, v1610;
        l_v1610_3 = (function(v2593)
            -- upvalues: l_v1599_5 (ref), l_v1603_8 (ref), l_v1600_6 (ref), l_v1604_8 (ref), l_v1601_6 (ref), l_play_0 (ref)
            local v2594 = l_v1599_5(l_v1603_8, v2593);
            if v2594 <= 0 then
                return nil;
            else
                local v2595 = ffi.new("unsigned int[?]", 1);
                local v2596 = ffi.new("unsigned int[?]", 1);
                if not l_v1600_6(l_v1604_8, v2594, v2595, v2596) then
                    return nil;
                else
                    local v2597 = v2595[0] * v2596[0] * 4;
                    local v2598 = ffi.new("unsigned char[?]", v2597);
                    if not l_v1601_6(l_v1604_8, v2594, v2598, v2597) then
                        return nil;
                    else
                        local v2599 = ffi.string(v2598, v2597);
                        local v2600 = vector(v2595[0], v2596[0]);
                        return l_play_0.load_image_rgba(v2599, v2600), v2600;
                    end;
                end;
            end;
        end)((function()
            local l_MyPersonaAPI_0 = panorama.MyPersonaAPI;
            if l_MyPersonaAPI_0 == nil then
                return 0ULL;
            else
                local v2602 = l_MyPersonaAPI_0.GetXuid();
                return 76500000000000000ULL + tonumber(v2602:sub(4, -1));
            end;
        end)());
        l_v1017_9.on_render = function()
            -- upvalues: l_v1610_3 (ref), l_l_match_0_10 (ref), l_play_0 (ref), l_v1605_7 (ref), l_v1606_5 (ref), l_v1607_5 (ref), l_v1019_8 (ref), l_v1030_7 (ref), l_v1036_8 (ref), l_l_aimtools_0_7 (ref)
            if l_v1610_3 == nil then
                return;
            else
                local v2603 = l_l_match_0_10.color:get():alpha_modulate(255);
                local v2604 = color();
                local v2605 = v2603:to_hex();
                local v2606 = v2604:to_hex();
                local v2607 = l_play_0.screen_size();
                local v2608 = vector(v2607.x, 0);
                local v2609 = 4;
                local v2610 = "";
                local v2611 = string.format(l_v1605_7, v2605, v2606);
                local v2612 = 1;
                local v2613 = "";
                local v2614 = string.format(l_v1606_5, v2605);
                local v2615 = 1;
                local v2616 = "";
                local v2617 = string.format(l_v1607_5, v2605);
                local v2618 = l_play_0.measure_text(v2609, v2610, v2611);
                local v2619 = l_play_0.measure_text(v2612, v2613, v2614);
                local v2620 = l_play_0.measure_text(v2615, v2616, v2617);
                local v2621 = vector(l_v1019_8, l_v1030_7) * 2 + vector(math.max(v2618.x, v2619.x, v2620.x) + l_v1036_8 + l_l_aimtools_0_7, math.max(v2618.y + v2619.y + v2620.y, l_v1036_8));
                local v2622 = v2621 + vector(10, 0);
                local v2623 = v2608 + vector(-(l_v1019_8 + l_v1036_8), (v2621.y - l_v1036_8) / 2);
                local v2624 = v2608 + vector(-v2622.x, 0);
                l_play_0.gradient(v2624, v2624 + v2622, v2603:alpha_modulate(0), v2603:alpha_modulate(220), v2603:alpha_modulate(0), v2603:alpha_modulate(220));
                l_play_0.texture(l_v1610_3, v2623, vector(l_v1036_8, l_v1036_8), color(), "f");
                local v2625 = v2608 + vector(-v2621.x + l_v1019_8, l_v1030_7);
                l_play_0.text(v2609, v2625, v2604, v2610, v2611);
                v2625.y = v2625.y + v2618.y;
                l_play_0.text(v2612, v2625, v2604, v2613, v2614);
                v2625.y = v2625.y + v2619.y;
                l_play_0.text(v2615, v2625, v2604, v2616, v2617);
                v2625.y = v2625.y + v2620.y;
                return;
            end;
        end;
    end;
    l_l_angles_0_11 = function(v2626)
        -- upvalues: l_v1016_7 (ref), l_v1017_9 (ref)
        if v2626 == nil then
            v2626 = {};
        end;
        events.render(l_v1016_7.on_render, v2626.branded == true);
        events.render(l_v1017_9.on_render, v2626.corner == true);
    end;
    v1019 = nil;
    v1030 = function(v2627)
        -- upvalues: l_l_angles_0_11 (ref)
        l_l_angles_0_11({
            branded = v2627:get("Branded"), 
            corner = v2627:get("Corner")
        });
    end;
    do
        local l_v1030_8 = v1030;
        v1036 = function(v2629)
            -- upvalues: l_l_angles_0_11 (ref), l_l_match_0_10 (ref), l_v1030_8 (ref)
            local v2630 = v2629:get();
            if not v2630 then
                l_l_angles_0_11(nil);
            end;
            if v2630 then
                l_l_match_0_10.style:set_callback(l_v1030_8, true);
            else
                l_l_match_0_10.style:unset_callback(l_v1030_8);
            end;
        end;
        l_l_match_0_10.enabled:set_callback(v1036, true);
    end;
end;
l_match_0 = nil;
v1016 = v360.visuals.manual_arrows;
v1017 = v360.antiaim.settings.manual_yaw;
l_angles_0 = l_play_0.load_font("C:\\Windows\\Fonts\\verdana.ttf", vector(16, 16.5, 0), "a");
v1019 = l_play_0.load_font("C:\\Windows\\Fonts\\calibrib.ttf", vector(25, 23.5, 0), "a");
v1030 = 0;
v1036 = 0;
l_aimtools_0 = function(v2631, v2632, v2633)
    return v2631 + v2632 * vector():angles(vector(0, v2633, 0));
end;
do
    local l_v1016_8, l_v1017_10, l_l_angles_0_12, l_v1019_9, l_v1030_9, l_v1036_9, l_l_aimtools_0_8, l_v1445_7, l_v1446_7, l_v1598_6, l_v1599_6 = v1016, v1017, l_angles_0, v1019, v1030, v1036, l_aimtools_0, v1445, v1446, v1598, v1599;
    l_v1445_7 = function()
        -- upvalues: l_v1016_8 (ref), l_play_0 (ref), l_l_aimtools_0_8 (ref)
        if not l_v1016_8.dynamic_mode:get() then
            return 0;
        else
            local v2645 = l_v1016_8.style:get();
            if v2645 ~= 1 and v2645 ~= 4 then
                return 0;
            else
                local v2646 = entity.get_local_player();
                local v2647 = entity.get_threat();
                if v2646 == nil or v2647 == nil then
                    return 0;
                else
                    local v2648 = l_play_0.camera_angles();
                    local l_m_angEyeAngles_0 = v2647.m_angEyeAngles;
                    local v2650 = v2646:get_origin();
                    local v2651 = v2647:get_origin();
                    local v2652 = l_l_aimtools_0_8(v2650, 50, v2648.y + 110);
                    local v2653 = l_l_aimtools_0_8(v2650, 30, v2648.y + 60);
                    local v2654 = l_l_aimtools_0_8(v2650, 50, v2648.y - 110);
                    local v2655 = l_l_aimtools_0_8(v2650, 30, v2648.y - 60);
                    local v2656 = l_l_aimtools_0_8(v2651, 40, l_m_angEyeAngles_0.y + 115);
                    local v2657 = l_l_aimtools_0_8(v2651, 20, l_m_angEyeAngles_0.y + 35);
                    local v2658 = l_l_aimtools_0_8(v2651, 40, l_m_angEyeAngles_0.y - 115);
                    local v2659 = l_l_aimtools_0_8(v2651, 20, l_m_angEyeAngles_0.y - 35);
                    local v2660 = utils.trace_bullet(v2647, vector(v2656.x, v2656.y, v2656.z + 70), v2652);
                    local v2661 = utils.trace_bullet(v2647, vector(v2657.x, v2657.y, v2657.z + 30), v2653);
                    local v2662 = utils.trace_bullet(v2647, vector(v2658.x, v2658.y, v2658.z + 70), v2654);
                    local v2663 = utils.trace_bullet(v2647, vector(v2659.x, v2659.y, v2659.z + 30), v2655);
                    local v2664 = 0;
                    if v2660 == 0 then
                        if v2663 > 0 then
                            v2664 = 2;
                        elseif v2662 > 0 then
                            v2664 = 1;
                        end;
                    end;
                    if v2662 == 0 then
                        if v2661 > 0 then
                            v2664 = -2;
                        elseif v2660 > 0 then
                            v2664 = -1;
                        end;
                    end;
                    return v2664;
                end;
            end;
        end;
    end;
    l_v1446_7 = function()
        -- upvalues: l_v1017_10 (ref)
        return l_v1017_10.select:get();
    end;
    l_v1598_6 = function()
        -- upvalues: l_v1036_9 (ref), l_v1445_7 (ref)
        l_v1036_9 = l_v1445_7();
    end;
    l_v1599_6 = function()
        -- upvalues: l_v1016_8 (ref), l_v1446_7 (ref), l_v1036_9 (ref), l_play_0 (ref), l_v1030_9 (ref), v89 (ref), l_v1019_9 (ref), v14 (ref), l_l_angles_0_12 (ref)
        local v2665 = entity.get_local_player();
        if v2665 == nil or not v2665:is_alive() then
            return;
        else
            local v2666 = l_v1016_8.style:get();
            local v2667 = l_v1016_8.offset:get();
            local v2668 = l_v1016_8.accent_color:get();
            local v2669 = l_v1016_8.secondary_color:get();
            local v2670 = l_v1446_7();
            local v2671 = rage.antiaim:inverter();
            local v2672 = v2670 == "Left" or l_v1036_9 < 0;
            local v2673 = v2670 == "Right" or l_v1036_9 > 0;
            local l_m_bIsScoped_2 = v2665.m_bIsScoped;
            local v2675 = l_play_0.screen_size();
            local v2676, v2677 = vector(v2675.x / 2, v2675.y / 2):unpack();
            local v2678 = v2670 ~= nil and v2670 ~= "Off";
            l_v1030_9 = v89.interp(l_v1030_9, l_m_bIsScoped_2 and l_v1016_8.animate_scope:get(), 0.05);
            if v2678 or l_v1036_9 ~= 0 then
                if v2666 == 1 then
                    local l_l_v1019_9_0 = l_v1019_9;
                    local v2680 = "+";
                    local v2681 = l_v1036_9 == -2 and "<<" or "<";
                    local v2682 = l_v1036_9 == 2 and ">>" or ">";
                    local v2683 = l_play_0.measure_text(l_l_v1019_9_0, v2680, v2681);
                    local v2684 = l_play_0.measure_text(l_l_v1019_9_0, v2680, v2682);
                    local v2685 = v2672 and v2668 or v2669;
                    local v2686 = v2673 and v2668 or v2669;
                    local v2687 = vector(v2676 - v2667, v2677 + 1 - v2683.y * 0.5);
                    local v2688 = vector(v2676 + v2667, v2677 + 1 - v2684.y * 0.5);
                    v2687.x = v2687.x - v2683.x;
                    l_play_0.text(l_l_v1019_9_0, v2687, v2685, v2680, v2681);
                    l_play_0.text(l_l_v1019_9_0, v2688, v2686, v2680, v2682);
                end;
                if v2666 == 3 then
                    local l_l_v1019_9_1 = l_v1019_9;
                    local v2690 = "+";
                    local v2691 = "\239\132\132";
                    local v2692 = "\239\132\133";
                    local v2693 = l_play_0.measure_text(l_l_v1019_9_1, v2690, v2691);
                    local v2694 = l_play_0.measure_text(l_l_v1019_9_1, v2690, v2692);
                    local v2695 = v2672 and v2668 or v2669;
                    local v2696 = v2673 and v2668 or v2669;
                    local v2697 = v14(20 * l_v1030_9);
                    local v2698 = v14(20 * l_v1030_9);
                    v2695.a = v2695.a - v2695.a * (0.4 * l_v1030_9);
                    v2696.a = v2696.a - v2696.a * (0.4 * l_v1030_9);
                    local v2699 = vector(v2676 - v2667 - v2697, v2677 - v2693.y * 0.4);
                    local v2700 = vector(v2676 + v2667 + v2698, v2677 - v2694.y * 0.4);
                    v2699.x = v2699.x - v2693.x;
                    l_play_0.text(l_l_v1019_9_1, v2699, v2695, v2690, v2691);
                    l_play_0.text(l_l_v1019_9_1, v2700, v2696, v2690, v2692);
                end;
                if v2666 == 4 then
                    local l_l_l_angles_0_12_0 = l_l_angles_0_12;
                    local v2702 = "";
                    local v2703 = l_v1036_9 == -2 and "\226\157\174\226\157\174" or "\226\157\174";
                    local v2704 = l_v1036_9 == 2 and "\226\157\175\226\157\175" or "\226\157\175";
                    local v2705 = l_play_0.measure_text(l_l_l_angles_0_12_0, v2702, v2703);
                    local v2706 = l_play_0.measure_text(l_l_l_angles_0_12_0, v2702, v2704);
                    local v2707 = v2672 and v2668 or v2669;
                    local v2708 = v2673 and v2668 or v2669;
                    local v2709 = vector(v2676 - v2667, v2677 - v2705.y * 0.5);
                    local v2710 = vector(v2676 + v2667, v2677 - v2706.y * 0.5);
                    v2709.x = v2709.x - v2705.x;
                    l_play_0.text(l_l_l_angles_0_12_0, v2709, v2707, v2702, v2703);
                    l_play_0.text(l_l_l_angles_0_12_0, v2710, v2708, v2702, v2704);
                end;
            end;
            if v2666 == 2 then
                local v2711 = 2;
                local v2712 = 13;
                local v2713 = 9;
                local v2714 = color(35, 35, 35, 150);
                local v2715 = v2672 and v2668 or v2714;
                local v2716 = v2673 and v2668 or v2714;
                local v2717 = v2671 == true and v2669 or v2714;
                local v2718 = v2671 == false and v2669 or v2714;
                local v2719 = v2676 - v2667 - v2712;
                local v2720 = v2676 + v2667 + v2712;
                local v2721 = vector(v2719 + v2711 + 2, v2677 - v2713);
                local v2722 = vector(v2720 - v2711 - 2, v2677 - v2713);
                local v2723 = vector(-v2711, v2713 * 2);
                local v2724 = vector(v2711, v2713 * 2);
                l_play_0.poly(v2715, vector(v2719 + 1 - v2712, v2677), vector(v2719 + 1, v2677 - v2713), vector(v2719 + 1, v2677 + v2713));
                l_play_0.poly(v2716, vector(v2720 + v2712, v2677), vector(v2720, v2677 - v2713), vector(v2720, v2677 + v2713));
                l_play_0.rect(v2721, v2721 + v2723, v2717);
                l_play_0.rect(v2722, v2722 + v2724, v2718);
            end;
            return;
        end;
    end;
    v1600 = nil;
    v1601 = function(v2725)
        -- upvalues: l_v1599_6 (ref), l_v1598_6 (ref)
        local v2726 = v2725:get();
        events.render(l_v1599_6, v2726);
        events.createmove(l_v1598_6, v2726);
    end;
    l_v1016_8.enabled:set_callback(v1601, true);
end;
v1016 = nil;
v1017 = v360.visuals.custom_scope;
l_angles_0 = 9.25925925925926E-4;
v1019 = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay");
v1030 = 0;
do
    local l_v1017_11, l_l_angles_0_13, l_v1019_10, l_v1030_10, l_v1036_10, l_l_aimtools_0_9, l_v1445_8 = v1017, l_angles_0, v1019, v1030, v1036, l_aimtools_0, v1445;
    l_v1036_10 = function()
        -- upvalues: l_v1030_10 (ref), v89 (ref), l_play_0 (ref), l_v1017_11 (ref), l_l_angles_0_13 (ref), v14 (ref)
        local v2734 = entity.get_local_player();
        if v2734 == nil or not v2734:is_alive() then
            return;
        else
            local v2735 = v2734:get_player_weapon();
            if v2735 == nil then
                return;
            else
                l_v1030_10 = v89.interp(l_v1030_10, v2734.m_bIsScoped, 0.05);
                if l_v1030_10 == 0 then
                    return;
                else
                    local v2736 = l_play_0.screen_size();
                    local v2737 = v2736 * 0.5;
                    local v2738 = l_v1017_11.accent_color:get();
                    local v2739 = l_v1017_11.secondary_color:get();
                    local v2740 = l_v1017_11.offset:get() * v2736.y * l_l_angles_0_13;
                    local v2741 = l_v1017_11.position:get() * v2736.y * l_l_angles_0_13;
                    local v2742 = l_v1017_11.thickness:get();
                    local v2743 = l_v1017_11.extra_options:get("Rotate Angle");
                    if l_v1017_11.extra_options:get("Dynamic Offset") then
                        local v2744 = v2735:get_spread();
                        local v2745 = (v2735:get_inaccuracy() + v2744) * 360;
                        v2740 = v2740 + v2745;
                        v2741 = v2741 + v2745;
                    end;
                    v2740 = v14(v2740);
                    v2741 = v14(v2741);
                    v2738.a = v2738.a * l_v1030_10;
                    v2739.a = v2739.a * l_v1030_10;
                    if v2743 then
                        l_play_0.push_rotation(45);
                    end;
                    if not l_v1017_11.exclude_lines:get("Top") then
                        local v2746 = vector(v2737.x + 0.5 - v2742 * 0.5, v2737.y - v2740 + 1);
                        local v2747 = vector(v2737.x + 0.5 + v2742 * 0.5, v2737.y - v2741 + 1);
                        l_play_0.gradient(v2746, v2747, v2738, v2738, v2739, v2739);
                    end;
                    if not l_v1017_11.exclude_lines:get("Bottom") then
                        local v2748 = vector(v2737.x + 0.5 - v2742 * 0.5, v2737.y + v2740);
                        local v2749 = vector(v2737.x + 0.5 + v2742 * 0.5, v2737.y + v2741);
                        l_play_0.gradient(v2748, v2749, v2738, v2738, v2739, v2739);
                    end;
                    if not l_v1017_11.exclude_lines:get("Left") then
                        local v2750 = vector(v2737.x - v2740 + 1, v2737.y + 0.5 - v2742 * 0.5);
                        local v2751 = vector(v2737.x - v2741 + 1, v2737.y + 0.5 + v2742 * 0.5);
                        l_play_0.gradient(v2750, v2751, v2738, v2739, v2738, v2739);
                    end;
                    if not l_v1017_11.exclude_lines:get("Right") then
                        local v2752 = vector(v2737.x + v2740, v2737.y + 0.5 - v2742 * 0.5);
                        local v2753 = vector(v2737.x + v2741, v2737.y + 0.5 + v2742 * 0.5);
                        l_play_0.gradient(v2752, v2753, v2738, v2739, v2738, v2739);
                    end;
                    if v2743 then
                        l_play_0.pop_rotation();
                    end;
                    return;
                end;
            end;
        end;
    end;
    l_l_aimtools_0_9 = function()
        -- upvalues: l_v1019_10 (ref)
        l_v1019_10:override();
    end;
    l_v1445_8 = function(v2754)
        -- upvalues: l_v1019_10 (ref), l_v1036_10 (ref), l_l_aimtools_0_9 (ref)
        if not v2754 then
            l_v1019_10:override();
        end;
        events.render(l_v1036_10, v2754);
        events.shutdown(l_l_aimtools_0_9, v2754);
    end;
    v1446 = nil;
    v1598 = function(v2755)
        -- upvalues: l_v1019_10 (ref), l_v1445_8 (ref)
        local v2756 = v2755:get();
        if v2756 then
            l_v1019_10:override("Remove All");
        end;
        l_v1445_8(v2756);
    end;
    l_v1017_11.enabled:set_callback(v1598, true);
end;
v1017 = nil;
l_angles_0 = v360.visuals.damage_indicator;
v1019 = {
    Default = 1, 
    Alternative = 2
};
v1030 = function()
    -- upvalues: v28 (ref)
    local v2757 = v28.ragebot.selection.min_damage:get();
    if v2757 == 0 then
        return "A";
    elseif v2757 > 100 then
        return string.format("+%d", v2757 - 100);
    else
        return v2757;
    end;
end;
do
    local l_l_angles_0_14, l_v1019_11, l_v1030_11, l_v1036_11, l_l_aimtools_0_10 = l_angles_0, v1019, v1030, v1036, l_aimtools_0;
    l_v1036_11 = function()
        -- upvalues: v798 (ref), v28 (ref), l_l_angles_0_14 (ref), l_play_0 (ref), l_v1019_11 (ref), l_v1030_11 (ref)
        local v2763 = entity.get_local_player();
        if v2763 == nil or not v2763:is_alive() then
            return;
        else
            local v2764 = v798.get(v28.ragebot.selection.min_damage);
            if (v2764 == nil or not v2764.active) and l_l_angles_0_14.if_override:get() then
                return;
            else
                local v2765 = v2764 ~= nil and v2764.active and l_l_angles_0_14.active_color:get() or l_l_angles_0_14.inactive_color:get();
                local v2766 = (l_play_0.screen_size() / 2):clone();
                local v2767 = l_v1019_11[l_l_angles_0_14.font:get()];
                if v2767 == nil then
                    return;
                else
                    local v2768 = l_l_angles_0_14.offset:get();
                    local v2769 = "";
                    local v2770 = l_v1030_11();
                    local v2771 = l_play_0.measure_text(v2767, v2769, v2770);
                    v2766.x = v2766.x + v2768 + 2;
                    v2766.y = v2766.y - v2768;
                    v2766.y = v2766.y - v2771.y;
                    l_play_0.text(v2767, v2766, v2765, v2769, v2770);
                    return;
                end;
            end;
        end;
    end;
    l_l_aimtools_0_10 = function(v2772)
        -- upvalues: l_v1036_11 (ref)
        events.render(l_v1036_11, v2772);
    end;
    v1445 = nil;
    v1446 = function(v2773)
        -- upvalues: l_l_aimtools_0_10 (ref)
        l_l_aimtools_0_10(v2773:get());
    end;
    l_l_angles_0_14.enabled:set_callback(v1446, true);
end;
l_angles_0 = nil;
v1019 = v360.visuals.break_lc_indicator;
v1030 = l_play_0.load_font("Calibri", 11, "ad");
v1036 = 0;
l_aimtools_0 = 0;
v1445 = "lc status";
v1446 = color();
v1598 = 0;
v1599 = 0;
v1600 = 0;
v1601 = false;
v1602 = nil;
v1603 = l_play_0.screen_size();
v1604 = vector(60, 30);
v1605 = vector((v1603.x - v1604.x) / 2, v1603.y * 0.3475);
v1602 = v117.new("lc_indicator", v1605, v1604, {
    rulers = {
        [1] = {
            [1] = true, 
            [2] = vector(v1603.x / 2, 0), 
            [3] = v1603.y
        }
    }, 
    border = {
        vector(v1603.x * 0.5, 0), 
        vector(v1603.x * 0.5, v1603.y)
    }
});
v1603 = function()
    -- upvalues: v360 (ref), v370 (ref), v875 (ref)
    if not v360.antiaim.enabled:get() then
        return not v370.is_onground;
    else
        local v2774 = entity.get_local_player();
        if v2774 == nil then
            return;
        else
            local v2775 = v2774:get_player_weapon();
            if v2775 == nil then
                return;
            else
                local v2776 = v2775:get_weapon_info();
                if v2776 == nil then
                    return;
                else
                    local l_weapon_type_3 = v2776.weapon_type;
                    local v2778 = v2775:get_weapon_index();
                    local v2779 = l_weapon_type_3 == 9;
                    local v2780 = v2778 == 64;
                    if v2779 or v2780 then
                        return false;
                    else
                        local v2781 = v875.builder:get_old_items();
                        if v2781 == nil then
                            return false;
                        else
                            local l_defensive_2 = v2781.defensive;
                            if l_defensive_2 == nil then
                                return false;
                            else
                                return l_defensive_2.force_break_lc:get();
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
v1604 = function(v2783)
    if v2783 <= 0 then
        return "failed", color(255, 64, 64);
    elseif v2783 <= 3 then
        return "bad", color(255, 175, 104);
    elseif v2783 <= 6 then
        return "ok", color(255, 255, 255);
    elseif v2783 <= 9 then
        return "good", color(205, 236, 142);
    elseif v2783 <= 11 then
        return "nice", color(122, 241, 182);
    elseif v2783 <= 12 then
        return "ideal lc", color(101, 213, 255);
    else
        return "angel lc", color(207, 145, 255);
    end;
end;
do
    local l_v1030_12, l_v1036_12, l_l_aimtools_0_11, l_v1445_9, l_v1446_8, l_v1598_7, l_v1599_7, l_v1600_7, l_v1601_7, l_v1602_9, l_v1603_9, l_v1604_9, l_v1605_8, l_v1606_6, l_v1607_6 = v1030, v1036, l_aimtools_0, v1445, v1446, v1598, v1599, v1600, v1601, v1602, v1603, v1604, v1605, v1606, v1607;
    l_v1605_8 = function()
        -- upvalues: l_v1602_9 (ref), l_l_aimtools_0_11 (ref), l_v1445_9 (ref), l_v1598_7 (ref), l_v1446_8 (ref), l_v1036_12 (ref), l_play_0 (ref), l_v1030_12 (ref)
        local v2799 = l_v1602_9:get_drag_position() + l_v1602_9:get_drag_size() / 2;
        local v2800 = ui.get_alpha();
        if v2800 > 0 then
            l_l_aimtools_0_11 = 1;
        end;
        if l_l_aimtools_0_11 <= 0 then
            return;
        else
            local v2801 = "";
            local l_l_v1445_9_0 = l_v1445_9;
            local v2803 = l_v1598_7 .. "t";
            local v2804 = l_v1446_8:clone();
            local v2805 = color(255, 255, 255, 128);
            if l_v1036_12 == 0 and v2800 > 0 then
                l_l_v1445_9_0 = "lc status";
                v2804 = color();
            end;
            v2805.a = v2805.a * l_l_aimtools_0_11;
            v2804.a = v2804.a * l_l_aimtools_0_11;
            local v2806 = l_play_0.measure_text(l_v1030_12, v2801, l_l_v1445_9_0);
            local v2807 = l_play_0.measure_text(l_v1030_12, v2801, v2803);
            v2799.y = v2799.y - (v2806.y + v2807.y + 1) / 2;
            local v2808 = v2799 + vector(-v2806.x * 0.5, 0);
            local v2809 = v2799 + vector(-v2807.x * 0.5, 0);
            v2809.y = v2809.y + (v2806.y + 1);
            l_play_0.text(l_v1030_12, v2808, v2804, v2801, l_l_v1445_9_0);
            l_play_0.text(l_v1030_12, v2809, v2805, v2801, v2803);
            l_v1036_12 = math.max(0, l_v1036_12 - globals.frametime);
            if l_v1036_12 == 0 then
                l_l_aimtools_0_11 = math.max(0, l_l_aimtools_0_11 - globals.frametime * 8);
            end;
            l_v1602_9();
            return;
        end;
    end;
    l_v1606_6 = function()
        -- upvalues: l_v1599_7 (ref), l_v1601_7 (ref), l_v1603_9 (ref), l_v1600_7 (ref), l_v1604_9 (ref), l_v1036_12 (ref), l_l_aimtools_0_11 (ref), l_v1446_8 (ref), l_v1445_9 (ref), l_v1598_7 (ref), v371 (ref)
        local v2810 = rage.exploit:get();
        local v2811 = v2810 - l_v1599_7;
        if v2811 > 0 then
            l_v1601_7 = true;
        end;
        if l_v1601_7 and v2811 < 0 then
            l_v1601_7 = false;
            if l_v1603_9() or l_v1600_7 > 0 then
                local v2812, v2813 = l_v1604_9(l_v1600_7);
                l_v1036_12 = 0.66;
                l_l_aimtools_0_11 = 1;
                l_v1446_8 = v2813;
                l_v1445_9 = v2812;
                l_v1598_7 = l_v1600_7;
            end;
        end;
        l_v1599_7 = v2810;
        l_v1600_7 = v371.defensive_ticks;
    end;
    l_v1607_6 = function(v2814)
        -- upvalues: l_v1605_8 (ref), l_v1606_6 (ref)
        events.render(l_v1605_8, v2814);
        events.createmove(l_v1606_6, v2814);
    end;
    v1608 = nil;
    v1609 = function(v2815)
        -- upvalues: l_v1607_6 (ref)
        l_v1607_6(v2815:get());
    end;
    v1019.enabled:set_callback(v1609, true);
end;
v1019 = nil;
v1030 = v360.visuals.velocity_warning;
v1036 = 0;
l_aimtools_0 = nil;
v1445 = l_play_0.screen_size();
v1446 = vector(130, 12);
v1598 = vector((v1445.x - v1446.x) / 2, v1445.y * 0.285);
l_aimtools_0 = v117.new("velocity_warning", v1598, v1446, {
    rulers = {
        [1] = {
            [1] = true, 
            [2] = vector(v1445.x / 2, 0), 
            [3] = v1445.y
        }
    }, 
    border = {
        vector(v1445.x * 0.5, 0), 
        vector(v1445.x * 0.5, v1445.y)
    }
});
do
    local l_v1030_13, l_v1036_13, l_l_aimtools_0_12, l_v1445_10, l_v1446_9 = v1030, v1036, l_aimtools_0, v1445, v1446;
    l_v1445_10 = function()
        -- upvalues: l_l_aimtools_0_12 (ref), l_v1030_13 (ref), l_v1036_13 (ref), v89 (ref), v125 (ref), l_play_0 (ref)
        local v2821 = entity.get_local_player();
        if v2821 == nil then
            return;
        else
            local v2822 = l_l_aimtools_0_12:get_drag_position():clone();
            local v2823 = l_l_aimtools_0_12:get_drag_size();
            local v2824 = -globals.realtime;
            local v2825 = v2821:is_alive();
            local v2826 = ui.get_alpha() > 0;
            local v2827 = l_v1030_13.color_accent:get();
            local v2828 = l_v1030_13.color_secondary:get();
            local l_m_flVelocityModifier_0 = v2821.m_flVelocityModifier;
            if not v2825 then
                l_m_flVelocityModifier_0 = 1;
            end;
            local v2830 = v2826 or v2825 and l_m_flVelocityModifier_0 < 1;
            l_v1036_13 = v89.interp(l_v1036_13, v2830, 0.05);
            if l_v1036_13 > 0 then
                v2827.a = v2827.a * l_v1036_13;
                v2828.a = v2828.a * l_v1036_13;
                local v2831 = v125.gradient(string.format("%d%%", l_m_flVelocityModifier_0 * 100), v2824, v2827, v2828);
                local v2832 = 1;
                local v2833 = "";
                local v2834 = string.format("velocity inflicted ~ %s", v2831);
                local v2835 = l_play_0.measure_text(v2832, v2833, v2834);
                v2822.x = v2822.x + (v2823.x - v2835.x) / 2 + 1;
                l_play_0.text(v2832, v2822, v2827, v2833, v2834);
            end;
            l_l_aimtools_0_12();
            return;
        end;
    end;
    l_v1446_9 = function(v2836)
        -- upvalues: l_v1445_10 (ref)
        events.render(l_v1445_10, v2836);
    end;
    v1598 = nil;
    v1599 = function(v2837)
        -- upvalues: l_v1446_9 (ref)
        l_v1446_9(v2837:get());
    end;
    l_v1030_13.enabled:set_callback(v1599, true);
end;
v1030 = nil;
v1036 = v360.visuals.grenade_radius;
l_aimtools_0 = cvar.mp_friendlyfire;
v1445 = {};
v1446 = {};
do
    local l_v1036_14, l_l_aimtools_0_13, l_v1445_11, l_v1446_10, l_v1598_8, l_v1599_8, l_v1600_8, l_v1601_8, l_v1602_10 = v1036, l_aimtools_0, v1445, v1446, v1598, v1599, v1600, v1601, v1602;
    l_v1598_8 = function(v2847)
        -- upvalues: l_l_aimtools_0_13 (ref)
        if l_l_aimtools_0_13:int() == 1 then
            return false;
        else
            local v2848 = entity.get_local_player();
            local l_m_hOwnerEntity_0 = v2847.m_hOwnerEntity;
            if l_m_hOwnerEntity_0 == nil or not l_m_hOwnerEntity_0:is_player() then
                return false;
            elseif v2848 == l_m_hOwnerEntity_0 or l_m_hOwnerEntity_0:is_enemy() then
                return false;
            else
                return true;
            end;
        end;
    end;
    l_v1599_8 = function(v2850)
        for v2851 in pairs(v2850) do
            v2850[v2851] = nil;
        end;
    end;
    l_v1600_8 = function()
        -- upvalues: l_v1445_11 (ref)
        local v2852 = entity.get_entities("CSmokeGrenadeProjectile");
        local v2853 = {};
        for v2854 = 1, #v2852 do
            local v2855 = v2852[v2854];
            if v2855.m_bDidSmokeEffect then
                local v2856 = v2855:get_index();
                if l_v1445_11[v2856] == nil then
                    local v2857 = v2855:get_origin();
                    l_v1445_11[v2856] = {
                        alpha = 0, 
                        radius = 125, 
                        index = v2856, 
                        origin = v2857
                    };
                end;
                v2853[v2856] = true;
            end;
        end;
        for v2858 in pairs(l_v1445_11) do
            if v2853[v2858] == nil then
                l_v1445_11[v2858] = nil;
            end;
        end;
    end;
    l_v1601_8 = function()
        -- upvalues: l_v1446_10 (ref), l_v1598_8 (ref)
        local v2859 = entity.get_entities("CInferno");
        local v2860 = {};
        for v2861 = 1, #v2859 do
            local v2862 = v2859[v2861];
            local l_m_fireCount_0 = v2862.m_fireCount;
            if l_m_fireCount_0 ~= 0 then
                local v2864 = v2862:get_index();
                if l_v1446_10[v2864] == nil then
                    local v2865 = v2862:get_origin();
                    local v2866 = l_v1598_8(v2862);
                    l_v1446_10[v2864] = {
                        radius = 0, 
                        alpha = 0, 
                        fire_count = 0, 
                        index = v2864, 
                        origin = v2865, 
                        friendly = v2866
                    };
                end;
                local v2867 = l_v1446_10[v2864];
                if v2867.fire_count < l_m_fireCount_0 then
                    v2867.fire_count = l_m_fireCount_0;
                    local v2868 = 0;
                    local v2869 = nil;
                    local v2870 = nil;
                    local v2871 = {};
                    local v2872 = 0;
                    local _ = v2862:get_origin();
                    for v2874 = 0, l_m_fireCount_0 - 1 do
                        if v2862.m_bFireIsBurning[v2874] then
                            local v2875 = vector(v2862.m_fireXDelta[v2874], v2862.m_fireYDelta[v2874], v2862.m_fireZDelta[v2874]);
                            v2872 = v2872 + 1;
                            v2871[v2872] = v2875;
                        end;
                    end;
                    for v2876 = 1, v2872 do
                        for v2877 = 1, v2872 do
                            local v2878 = v2871[v2876];
                            local v2879 = v2871[v2877];
                            local v2880 = (v2879 - v2878):lengthsqr();
                            if v2868 < v2880 then
                                v2868 = v2880;
                                v2869 = v2878;
                                v2870 = v2879;
                            end;
                        end;
                    end;
                    if v2869 ~= nil and v2870 ~= nil then
                        v2867.radius = math.sqrt(v2868) / 2 + 40;
                    end;
                end;
                v2860[v2864] = true;
            end;
        end;
        for v2881 in pairs(l_v1446_10) do
            if v2860[v2881] == nil then
                l_v1446_10[v2881] = nil;
            end;
        end;
    end;
    l_v1602_10 = function()
        -- upvalues: l_v1036_14 (ref), l_v1445_11 (ref), l_play_0 (ref), l_v1446_10 (ref)
        local l_frametime_1 = globals.frametime;
        local v2883 = l_v1036_14.smoke_color:get();
        local v2884 = l_v1036_14.molotov_color:get();
        for _, v2886 in pairs(l_v1445_11) do
            v2886.alpha = math.min(v2886.alpha + l_frametime_1 * 4, 1);
            local v2887 = v2886.radius * v2886.alpha;
            l_play_0.circle_3d_outline(v2886.origin, v2883, v2887, 0, 1, 1);
        end;
        for _, v2889 in pairs(l_v1446_10) do
            v2889.alpha = math.min(v2889.alpha + l_frametime_1 * 4, 1);
            local v2890 = v2889.radius * v2889.alpha;
            l_play_0.circle_3d_outline(v2889.origin, v2884, v2890, 0, 1, 1);
            local v2891 = l_play_0.world_to_screen(v2889.origin);
            if v2891 ~= nil then
                if v2889.teammate then
                    l_play_0.text(1, v2891, color(149, 184, 6, 255), "c", "\226\156\148");
                else
                    l_play_0.text(1, v2891, color(230, 21, 21, 255), "c", "\226\157\140");
                end;
            end;
        end;
    end;
    v1603 = nil;
    v1604 = function(v2892)
        -- upvalues: l_v1599_8 (ref), l_v1445_11 (ref), l_v1600_8 (ref)
        local v2893 = v2892:get();
        if not v2893 then
            l_v1599_8(l_v1445_11);
        end;
        events.net_update_start(l_v1600_8, v2893);
    end;
    v1605 = function(v2894)
        -- upvalues: l_v1599_8 (ref), l_v1446_10 (ref), l_v1601_8 (ref)
        local v2895 = v2894:get();
        if not v2895 then
            l_v1599_8(l_v1446_10);
        end;
        events.net_update_start(l_v1601_8, v2895);
    end;
    do
        local l_v1604_10, l_v1605_9 = v1604, v1605;
        v1606 = function(v2898)
            -- upvalues: l_v1599_8 (ref), l_v1445_11 (ref), l_v1446_10 (ref), l_v1600_8 (ref), l_v1601_8 (ref), l_v1036_14 (ref), l_v1604_10 (ref), l_v1605_9 (ref), l_v1602_10 (ref)
            local v2899 = v2898:get();
            if not v2899 then
                l_v1599_8(l_v1445_11);
                l_v1599_8(l_v1446_10);
                events.net_update_start(l_v1600_8, false);
                events.net_update_start(l_v1601_8, false);
            end;
            if v2899 then
                l_v1036_14.smoke:set_callback(l_v1604_10, true);
                l_v1036_14.molotov:set_callback(l_v1605_9, true);
            else
                l_v1036_14.smoke:unset_callback(l_v1604_10);
                l_v1036_14.molotov:unset_callback(l_v1605_9);
            end;
            events.render(l_v1602_10, v2899);
        end;
        l_v1036_14.enabled:set_callback(v1606, true);
    end;
end;
v1036 = nil;
l_aimtools_0 = v360.visuals.gamesense_indicators;
v1445 = 380;
v1446 = 8;
v1598 = 24;
v1599 = 4;
v1600 = 3;
v1601 = l_play_0.load_font("C:\\Windows\\Fonts\\calibrib.ttf", vector(25, 23.5, 0), "a");
v1602 = {};
v1602.__index = v1602;
v1602.new = function(v2900, v2901, v2902)
    return setmetatable({
        id = v2901, 
        size = v2902
    }, v2900);
end;
v1602.draw = function(v2903, v2904, v2905, ...)
    -- upvalues: l_play_0 (ref)
    l_play_0.texture(v2903.id, v2904, v2903.size, v2905, ...);
end;
v1604 = {
    bomb_c4 = v1602:new(({
        bomb_c4 = l_play_0.load_image_from_file("materials\\panorama\\images\\icons\\ui\\bomb_c4.svg", vector(32, 32))
    }).bomb_c4, vector(32, 29))
};
v1605 = {};
v1606 = 100;
v1607 = 0;
v1608 = 0;
v1609 = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot");
v1610 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap");
v1611 = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots");
v1612 = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim");
v1613 = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points");
local v2906 = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage");
local v2907 = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance");
local v2908 = ui.find("Aimbot", "Ragebot", "Selection", "Hitboxes");
local v2909 = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck");
local v2910 = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding");
local v2911 = ui.find("Miscellaneous", "Main", "Other", "Fake Latency");
local l_feature_list_0 = l_aimtools_0.feature_list;
local function v2915(v2913)
    local v2914 = v2913:get_override();
    if v2914 ~= nil then
        return v2914;
    else
        return v2913:get();
    end;
end;
local function v2918(v2916)
    -- upvalues: v798 (ref)
    local v2917 = v798.get(v2916);
    return v2917 ~= nil and v2917.active;
end;
do
    local l_l_aimtools_0_14, l_v1445_12, l_v1446_11, l_v1598_9, l_v1599_9, l_v1600_9, l_v1601_9, l_v1604_11, l_v1605_10, l_v1606_7, l_v1607_7, l_v1608_3, l_v1609_3, l_v1610_4, l_v1611_2, l_v1612_3, l_v1613_3, l_v2906_0, l_v2907_0, l_v2908_0, l_v2909_0, l_v2910_0, l_v2911_0, l_l_feature_list_0_0, l_v2915_0, l_v2918_0 = l_aimtools_0, v1445, v1446, v1598, v1599, v1600, v1601, v1604, v1605, v1606, v1607, v1608, v1609, v1610, v1611, v1612, v1613, v2906, v2907, v2908, v2909, v2910, v2911, l_feature_list_0, v2915, v2918;
    local function v2946()
        -- upvalues: l_v1605_10 (ref)
        for v2945 = 1, #l_v1605_10 do
            l_v1605_10[v2945] = nil;
        end;
    end;
    local function v2951(v2947)
        -- upvalues: l_play_0 (ref), l_v1601_9 (ref), l_v1599_9 (ref), l_v1605_10 (ref), l_v1445_12 (ref), l_v1446_11 (ref)
        local v2948 = l_play_0.measure_text(l_v1601_9, nil, v2947.text);
        local v2949 = l_play_0.screen_size();
        v2948.y = v2948.y + l_v1599_9 * 2;
        local v2950 = next(l_v1605_10) == nil and v2949.y - (v2949.y - l_v1445_12) / 2 or l_v1605_10[#l_v1605_10].offset - l_v1446_11 - v2948.y;
        v2947.offset = v2950;
        v2947.text_size = v2948;
        table.insert(l_v1605_10, v2947);
        return v2950;
    end;
    local function v2954(v2952, v2953, ...)
        -- upvalues: v2951 (ref)
        v2953 = table.concat({
            v2953, 
            ...
        });
        return v2951({
            text = v2953, 
            color = v2952
        });
    end;
    local function v2960(v2955, v2956)
        local v2957 = 0.5;
        local v2958 = 0.5;
        if v2956 > 0 then
            local v2959 = v2955 * v2957;
            if v2956 < (v2955 - v2959) * v2958 then
                v2959 = v2955 - v2956 * (1 / v2958);
            end;
            v2955 = v2959;
        end;
        return v2955;
    end;
    local function v2969(v2961, v2962)
        -- upvalues: v2960 (ref)
        local v2963 = 1;
        local v2964 = 500;
        local v2965 = v2964 * 3.5;
        local v2966 = (v2962:get_origin() - v2961:get_eye_position()):length();
        local v2967 = v2965 / 3;
        local v2968 = v2964 * math.exp(-v2966 * v2966 / (2 * v2967 * v2967)) * v2963;
        return v2960(v2968, v2961.m_ArmorValue);
    end;
    local function v2998(_)
        -- upvalues: l_v2918_0 (ref), l_v2906_0 (ref), l_v2907_0 (ref), l_v2908_0 (ref), l_v2911_0 (ref), l_v2915_0 (ref), l_v2909_0 (ref), l_v2910_0 (ref), v360 (ref), l_v1612_3 (ref), l_v1613_3 (ref), l_v1610_4 (ref), l_v1611_2 (ref), l_v1609_3 (ref), l_l_feature_list_0_0 (ref), v2954 (ref), v370 (ref), v371 (ref), l_v1606_7 (ref)
        local v2971 = l_v2918_0(l_v2906_0);
        local v2972 = l_v2918_0(l_v2907_0);
        local v2973 = l_v2918_0(l_v2908_0);
        local v2974 = l_v2911_0:get() > 0;
        local v2975 = l_v2915_0(l_v2909_0);
        local v2976 = l_v2915_0(l_v2910_0) or v360.antiaim.settings.freestanding.enabled:get();
        local v2977 = l_v2915_0(l_v1612_3) == "Force";
        local v2978 = l_v2915_0(l_v1613_3) == "Force";
        local v2979 = l_v2915_0(l_v1610_4) and not v2975;
        local v2980 = l_v2915_0(l_v1611_2) and not v2975 and not v2979;
        local v2981 = l_v2915_0(l_v1609_3);
        if v2974 and l_l_feature_list_0_0:get("Fake Latency") then
            local v2982 = utils.net_channel();
            if v2982 ~= nil then
                local v2983 = nil;
                local v2984 = l_v2915_0(l_v2911_0);
                local v2985 = math.clamp(v2982.latency[0] + v2982.latency[1], 0.001, 0.2);
                local v2986 = math.clamp(v2984 * 0.001 + v2982.avg_latency[1], 0.001, 0.2);
                local v2987 = math.clamp(v2985 / v2986, 0, 1);
                if v2987 < 0.5 then
                    v2983 = color(250, 234, 232, 255):lerp(color(213, 197, 84, 255), v2987 * 2);
                else
                    v2983 = color(213, 197, 84, 255):lerp(color(143, 194, 21, 255), (v2987 - 0.5) * 2);
                end;
                v2954(v2983, "PING");
            end;
        end;
        if v2980 and l_l_feature_list_0_0:get("Hide Shots") then
            v2954(color(255, 255, 255, 200), "OSAA");
        end;
        if v2979 and l_l_feature_list_0_0:get("Double Tap") then
            local v2988 = color(255, 0, 50, 255);
            if rage.exploit:get() == 1 then
                v2988 = color(255, 255, 255, 200);
            end;
            v2954(v2988, "DT");
        end;
        if v2981 and l_l_feature_list_0_0:get("Dormant Aimbot") then
            v2954(color(255, 255, 255, 200), "DA");
        end;
        if v2975 and l_l_feature_list_0_0:get("Fake Duck") then
            v2954(color(255, 255, 255, 200), "DUCK");
        end;
        if v2978 and l_l_feature_list_0_0:get("Safe Points") then
            v2954(color(255, 255, 255, 200), "SAFE");
        end;
        if v2977 and l_l_feature_list_0_0:get("Body Aim") then
            v2954(color(255, 255, 255, 200), "BODY");
        end;
        if v2971 and l_l_feature_list_0_0:get("Damage Override") then
            v2954(color(255, 255, 255, 200), "MD");
        end;
        if v2972 and l_l_feature_list_0_0:get("Hitchance Override") then
            v2954(color(255, 255, 255, 200), "HITCHANCE OVR");
        end;
        if v2973 and l_l_feature_list_0_0:get("Hitbox Override") then
            v2954(color(255, 255, 255, 200), "HITBOX OVR");
        end;
        if v2976 and l_l_feature_list_0_0:get("Freestanding") then
            v2954(color(255, 255, 255, 200), "FS");
        end;
        if not v370.is_onground and l_l_feature_list_0_0:get("Lag Compensation") then
            local v2989 = 255;
            local v2990 = 0;
            local v2991 = 50;
            local v2992 = 255;
            if v371.defensive_ticks > 0 or v371.teleport_units_sqr > 4096 then
                local v2993 = 255;
                local v2994 = 255;
                local v2995 = 255;
                v2992 = 200;
                v2991 = v2995;
                v2990 = v2994;
                v2989 = v2993;
            end;
            v2954(color(v2989, v2990, v2991, v2992), "LC");
        end;
        if l_l_feature_list_0_0:get("Fake Angles") then
            local v2996 = rage.antiaim:get_max_desync();
            local v2997 = color(196, 15, 15):lerp(color(132, 196, 20), v2996 / 58);
            v2954(v2997, "FAKE");
        end;
        if l_l_feature_list_0_0:get("Hit/Miss") then
            v2954(color(255, 255, 255, 200), l_v1606_7 .. "%");
        end;
    end;
    local function v3008(v2999, v3000)
        -- upvalues: v2951 (ref), l_v1604_11 (ref)
        local v3001 = v3000:get_player_weapon();
        if v3001 == nil then
            return;
        elseif not v3001.m_bStartedArming then
            return;
        else
            local l_m_fArmedTime_0 = v3001.m_fArmedTime;
            if l_m_fArmedTime_0 == nil then
                return;
            else
                local v3003 = v3000:get_origin();
                local l_m_bombsiteCenterA_0 = v2999.m_bombsiteCenterA;
                local l_m_bombsiteCenterB_0 = v2999.m_bombsiteCenterB;
                local v3006 = v3003:distsqr(l_m_bombsiteCenterA_0) < v3003:distsqr(l_m_bombsiteCenterB_0) and "A" or "B";
                local v3007 = (l_m_fArmedTime_0 - globals.curtime) / 3;
                v2951({
                    text = v3006, 
                    color = color(252, 243, 105, 255), 
                    progress = 1 - v3007, 
                    draw_cmd = l_v1604_11.bomb_c4
                });
                return;
            end;
        end;
    end;
    local function v3023(v3009, v3010)
        -- upvalues: l_play_0 (ref), v2951 (ref), l_v1604_11 (ref), v2969 (ref), v2954 (ref)
        local l_m_bBombDefused_0 = v3010.m_bBombDefused;
        if not v3010.m_bBombTicking or l_m_bBombDefused_0 then
            return;
        else
            local l_curtime_0 = globals.curtime;
            local l_m_flC4Blow_0 = v3010.m_flC4Blow;
            local v3014 = l_m_flC4Blow_0 - l_curtime_0;
            if v3014 > 0 then
                if v3010.m_hBombDefuser ~= nil then
                    local v3015 = l_play_0.screen_size();
                    local l_m_flDefuseCountDown_0 = v3010.m_flDefuseCountDown;
                    local v3017 = (l_m_flDefuseCountDown_0 - l_curtime_0) / 10;
                    local v3018 = l_m_flC4Blow_0 < l_m_flDefuseCountDown_0 and color(235, 50, 75, 125) or color(50, 235, 75, 125);
                    local v3019 = (v3015.y - 2) * (1 - v3017);
                    l_play_0.rect(vector(0, 0), vector(20, v3015.y), color(0, 0, 0, 115));
                    l_play_0.rect(vector(1, 1 + v3019), vector(19, v3015.y - 1), v3018);
                end;
                local v3020 = string.format("%s - %.1fs", v3010.m_nBombSite == 1 and "B" or "A", v3014);
                v2951({
                    text = v3020, 
                    color = color(255, 255, 255, 200), 
                    draw_cmd = l_v1604_11.bomb_c4
                });
            end;
            local l_m_iHealth_6 = v3009.m_iHealth;
            local v3022 = v2969(v3009, v3010);
            v3022 = math.floor(v3022);
            if l_m_iHealth_6 <= v3022 then
                v2954(color(255, 0, 50, 255), "FATAL");
            elseif v3022 > 0 then
                v2954(color(252, 243, 105, 255), string.format("-%d HP", v3022));
            end;
            return;
        end;
    end;
    local function v3031(v3024)
        -- upvalues: v3008 (ref), v3023 (ref)
        local v3025 = entity.get_game_rules();
        if v3025 == nil then
            return;
        else
            local v3026 = entity.get_player_resource();
            if v3026 == nil then
                return;
            else
                local l_m_bBombPlanted_0 = v3025.m_bBombPlanted;
                local l_m_iPlayerC4_0 = v3026.m_iPlayerC4;
                if l_m_iPlayerC4_0 ~= nil and l_m_iPlayerC4_0 ~= 0 then
                    local v3029 = entity.get(l_m_iPlayerC4_0);
                    if v3029 ~= nil then
                        v3008(v3026, v3029);
                    end;
                end;
                if l_m_bBombPlanted_0 then
                    local v3030 = entity.get_entities("CPlantedC4")[1];
                    if v3030 ~= nil then
                        v3023(v3024, v3030);
                    end;
                end;
                return;
            end;
        end;
    end;
    local function v3033()
        -- upvalues: v2998 (ref), l_l_feature_list_0_0 (ref), v3031 (ref)
        local v3032 = entity.get_local_player();
        if v3032 == nil then
            return;
        else
            if v3032:is_alive() then
                v2998(v3032);
            end;
            if l_l_feature_list_0_0:get("Bomb Info") then
                v3031(v3032);
            end;
            return;
        end;
    end;
    local function v3039(v3034, v3035)
        -- upvalues: l_play_0 (ref)
        local v3036 = (v3034 + v3035) / 2;
        local v3037 = color(0, 0, 0, 0);
        local v3038 = color(0, 0, 0, 50);
        l_play_0.gradient(v3034, vector(v3036.x, v3035.y), v3037, v3038, v3037, v3038);
        l_play_0.gradient(v3035, vector(v3036.x, v3034.y), v3037, v3038, v3037, v3038);
    end;
    local function v3046(v3040, v3041, v3042, v3043, v3044, v3045)
        -- upvalues: l_play_0 (ref)
        l_play_0.circle_outline(v3040, color(0, 0, 0, 255), v3042, v3043, 1, v3045);
        l_play_0.circle_outline(v3040, v3041, v3042 - 1, v3043, v3044, v3045 - 2);
    end;
    local function v3060()
        -- upvalues: l_v1605_10 (ref), l_v1600_9 (ref), l_v1598_9 (ref), l_v1599_9 (ref), v3039 (ref), l_play_0 (ref), l_v1601_9 (ref), v3046 (ref)
        for v3047 = 1, #l_v1605_10 do
            local v3048 = l_v1605_10[v3047];
            if v3048.color ~= nil then
                local v3049 = vector(l_v1600_9, v3048.offset);
                local v3050 = v3049 + vector(l_v1598_9, l_v1599_9);
                local v3051 = v3048.text_size + vector(50);
                local l_color_1 = v3048.color;
                local l_draw_cmd_0 = v3048.draw_cmd;
                local l_progress_0 = v3048.progress;
                v3050.y = v3050.y + 2;
                if l_draw_cmd_0 ~= nil then
                    v3051.x = v3051.x + l_draw_cmd_0.size.x + 5;
                end;
                if l_progress_0 ~= nil then
                    v3051.x = v3051.x + 30;
                end;
                v3039(v3049, v3049 + v3051);
                if l_draw_cmd_0 ~= nil then
                    local v3055 = v3049:clone();
                    v3055.x = v3055.x + l_v1598_9;
                    v3055.y = v3055.y + (v3051.y - l_draw_cmd_0.size.y) / 2;
                    l_draw_cmd_0:draw(v3055, l_color_1, "f");
                    v3050.x = v3050.x + l_draw_cmd_0.size.x + 5;
                end;
                l_play_0.text(l_v1601_9, v3050 + 1, color(0, 0, 0, 128), "", v3048.text);
                l_play_0.text(l_v1601_9, v3050, l_color_1, "", v3048.text);
                v3050.x = v3050.x + v3048.text_size.x;
                if l_progress_0 ~= nil then
                    local v3056 = v3050.x + 10 / 2 + 12;
                    local v3057 = v3049.y + v3051.y / 2;
                    local v3058 = vector(v3056, v3057);
                    local v3059 = color(255, 255, 255, 200);
                    v3046(v3058, v3059, 10, 0, l_progress_0, 5);
                end;
            end;
        end;
    end;
    local function v3068()
        -- upvalues: l_play_0 (ref)
        local v3061 = entity.get_local_player();
        if v3061 == nil then
            return;
        else
            local v3062 = v3061:get_spectators();
            if v3062 == nil then
                return;
            else
                local v3063 = l_play_0.screen_size();
                local v3064 = vector(v3063.x - 10, 5);
                for v3065 = 1, #v3062 do
                    local v3066 = v3062[v3065]:get_name();
                    local v3067 = color(255, 255, 255, 200);
                    l_play_0.text(1, v3064, v3067, "r", v3066);
                    v3064.y = v3064.y + 18;
                end;
                return;
            end;
        end;
    end;
    local function v3069()
        -- upvalues: v3033 (ref), v3060 (ref), v2946 (ref)
        if globals.is_in_game then
            v3033();
            v3060();
        end;
        v2946();
    end;
    local function v3071(v3070)
        -- upvalues: l_v1608_3 (ref), l_v1607_7 (ref), l_v1606_7 (ref)
        if v3070.state == "death" or not (v3070.state ~= "player death") or v3070.state == "unregistered shot" then
            return;
        else
            l_v1608_3 = l_v1608_3 + 1;
            if v3070.state == nil then
                l_v1607_7 = l_v1607_7 + 1;
            end;
            l_v1606_7 = math.floor(l_v1607_7 / math.max(1, l_v1608_3) * 100);
            return;
        end;
    end;
    local function v3073(v3072)
        -- upvalues: v3069 (ref), v3071 (ref)
        events.render(v3069, v3072);
        events.aim_ack(v3071, v3072);
    end;
    local _ = nil;
    local function v3076(v3075)
        -- upvalues: v3068 (ref)
        events.render(v3068, v3075:get());
    end;
    do
        local l_v3076_0 = v3076;
        local function v3080(v3078)
            -- upvalues: v3068 (ref), l_l_aimtools_0_14 (ref), l_v3076_0 (ref), v3073 (ref)
            local v3079 = v3078:get();
            if not v3079 then
                events.render(v3068, false);
            end;
            if v3079 then
                l_l_aimtools_0_14.spectator_list:set_callback(l_v3076_0, true);
            else
                l_l_aimtools_0_14.spectator_list:unset_callback(l_v3076_0);
            end;
            v3073(v3079);
        end;
        l_l_aimtools_0_14.enabled:set_callback(v3080, true);
    end;
end;
l_aimtools_0 = nil;
v1445 = v360.visuals.static_watermark;
v1446 = v360.visuals.watermark;
v1598 = v360.visuals.indicators;
v1599 = v360.visuals.solus_ui;
v1600 = {};
v1601 = 0;
do
    local l_v1601_10, l_v1602_11, l_v1603_10 = v1601, v1602, v1603;
    l_v1602_11 = function()
        -- upvalues: l_v1601_10 (ref)
        if l_v1601_10 <= 0 then
            return;
        else
            local v3084 = globals.frametime * 1.66;
            l_v1601_10 = math.max(0, l_v1601_10 - v3084);
            return;
        end;
    end;
    l_v1603_10 = function()
        -- upvalues: l_play_0 (ref), v15 (ref), l_v1601_10 (ref)
        local v3085 = l_play_0.screen_size();
        local v3086 = vector(v3085.x * 0.5, v3085.y - 18);
        local v3087 = 4;
        local v3088 = "";
        local l_name_5 = v15.name;
        local v3090 = l_play_0.measure_text(v3087, v3088, l_name_5);
        local v3091 = color(255, 255, 255, 255);
        v3086.x = v3086.x - v3090.x * 0.5;
        v3086.y = v3086.y - v3090.y;
        l_play_0.text(v3087, v3086, v3091, v3088, l_name_5);
        if l_v1601_10 > 0 then
            local v3092 = "";
            local v3093 = 5;
            local v3094 = "\194\168\203\156\226\128\157*\194\176\226\128\162";
            local v3095 = "\226\128\162\194\176*\226\128\157\203\156\194\168";
            local v3096 = l_play_0.measure_text(v3087, v3092, v3094);
            local v3097 = vector(v3086.x - v3096.x - v3093, v3086.y);
            local v3098 = vector(v3086.x + v3090.x + v3093, v3086.y);
            local v3099 = v3091:clone();
            v3099.a = v3099.a * l_v1601_10;
            l_play_0.text(v3087, v3097, v3099, v3092, v3094);
            l_play_0.text(v3087, v3098, v3099, v3092, v3095);
        end;
    end;
    v1600.on_render = function()
        -- upvalues: l_v1602_11 (ref), l_v1603_10 (ref)
        l_v1602_11();
        l_v1603_10();
    end;
    v1600.on_player_death = function(v3100)
        -- upvalues: l_v1601_10 (ref)
        local v3101 = entity.get_local_player();
        local v3102 = entity.get(v3100.userid, true);
        if entity.get(v3100.attacker, true) ~= v3101 or v3102 == v3101 then
            return;
        else
            l_v1601_10 = 1;
            return;
        end;
    end;
end;
v1601 = {};
v1602 = 4;
v1603 = function(v3103, v3104)
    return v3103:gsub(".", "%1" .. v3104, #v3103 - 1);
end;
do
    local l_v1445_13, l_v1446_12, l_v1598_10, l_v1599_10, l_v1600_10, l_v1601_11, l_v1602_12 = v1445, v1446, v1598, v1599, v1600, v1601, v1602;
    do
        local l_l_v1602_12_0, l_v1603_11, l_v1604_12, l_v1605_11 = l_v1602_12, v1603, v1604, v1605;
        l_v1604_12 = function()
            -- upvalues: l_v1445_13 (ref), l_v1603_11 (ref), v125 (ref)
            local v3116 = "";
            local v3117 = "ANGEL";
            local v3118 = "WINGS";
            if not l_v1445_13.remove_spaces:get() then
                v3116 = " ";
                v3117 = l_v1603_11(v3117, v3116);
                v3118 = l_v1603_11(v3118, v3116);
            end;
            return v3117 .. v3116 .. v125.gradient(v3118, -globals.realtime, color(255, 255, 255, 255), color(55, 55, 55, 255));
        end;
        l_v1605_11 = function()
            -- upvalues: v15 (ref)
            return string.format("[%s]", v15.build:upper());
        end;
        l_v1601_11.on_render = function()
            -- upvalues: l_play_0 (ref), l_v1445_13 (ref), l_v1604_12 (ref), l_v1605_11 (ref), l_l_v1602_12_0 (ref)
            local v3119 = 1;
            local v3120 = "";
            local v3121 = l_play_0.screen_size();
            local v3122 = l_v1445_13.color:get();
            local v3123 = l_v1445_13.position:get();
            local v3124 = l_v1604_12();
            local v3125 = l_v1605_11();
            local v3126 = l_play_0.measure_text(v3119, v3120, v3124);
            local v3127 = l_play_0.measure_text(v3119, v3120, v3125);
            if v3123 == "Bottom" then
                local v3128 = vector(v3121.x * 0.5, v3121.y - 14);
                local v3129 = v3128 - vector(v3126.x * 0.5, v3126.y);
                v3128.y = v3128.y - v3126.y;
                v3128.y = v3128.y - l_l_v1602_12_0;
                local v3130 = v3128 - vector(v3127.x * 0.5, v3127.y);
                l_play_0.text(v3119, v3129, v3122, v3120, v3124);
                l_play_0.text(v3119, v3130, color(200, 69, 69), v3120, v3125);
                return;
            else
                local v3131 = vector(20, v3121.y * 0.5);
                local v3132 = v3126.x + v3127.x + l_l_v1602_12_0;
                local v3133 = math.max(v3126.y, v3127.y);
                if v3123 == "Right" then
                    v3131.x = v3121.x - v3131.x;
                    v3131.x = v3131.x - v3132 + 1;
                end;
                v3131.y = v3131.y - v3133 * 0.5;
                local v3134 = v3131:clone();
                local v3135 = v3131:clone();
                v3135.x = v3135.x + v3126.x;
                v3135.x = v3135.x + l_l_v1602_12_0;
                l_play_0.text(v3119, v3134, v3122, v3120, v3124);
                l_play_0.text(v3119, v3135, color(200, 69, 69), v3120, v3125);
                return;
            end;
        end;
    end;
    l_v1602_12 = function(v3136)
        -- upvalues: l_v1600_10 (ref), l_v1601_11 (ref)
        local v3137 = v3136 == 1;
        local v3138 = v3136 == 2;
        events.render(l_v1600_10.on_render, v3137);
        events.render(l_v1601_11.on_render, v3138);
        events.player_death(l_v1600_10.on_player_death, v3137);
    end;
    v1603 = nil;
    v1604 = function(v3139)
        -- upvalues: l_v1445_13 (ref), l_v1602_12 (ref)
        local v3140 = v3139:get();
        local v3141 = v3140 == 2;
        l_v1445_13.remove_spaces:visibility(v3141);
        l_v1445_13.position:visibility(v3141);
        l_v1445_13.color:visibility(v3141);
        l_v1602_12(v3140);
    end;
    do
        local l_v1604_13 = v1604;
        v1605 = function()
            -- upvalues: l_v1446_12 (ref), l_v1598_10 (ref), l_v1599_10 (ref), l_v1602_12 (ref), l_v1445_13 (ref), l_v1604_13 (ref)
            local v3143 = l_v1446_12.enabled:get() or l_v1598_10.enabled:get();
            local v3144 = l_v1599_10.enabled:get() and l_v1599_10.select:get("Watermark");
            local v3145 = v3143 or v3144;
            if v3145 then
                l_v1602_12(nil);
            end;
            if not v3145 then
                l_v1445_13.style:set_callback(l_v1604_13, true);
            else
                l_v1445_13.style:unset_callback(l_v1604_13);
            end;
        end;
        l_v1598_10.enabled:set_callback(v1605);
        l_v1446_12.enabled:set_callback(v1605);
        l_v1599_10.enabled:set_callback(v1605);
        l_v1599_10.select:set_callback(v1605);
        v1605();
    end;
end;
v923 = nil;
v924 = nil;
v925 = v360.misc.clantag;
v926 = ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag");
v927 = 0;
l_match_0 = {
    [1] = "", 
    [2] = "a", 
    [3] = "an", 
    [4] = "ang", 
    [5] = "ange", 
    [6] = "angel", 
    [7] = "angelw", 
    [8] = "angelwi", 
    [9] = "angelwin", 
    [10] = "angelwing", 
    [11] = "angelwings", 
    [12] = "angelwings", 
    [13] = "angelwings", 
    [14] = "angelwings", 
    [15] = "angelwings", 
    [16] = "angelwings.dumped", 
    [17] = "angelwings", 
    [18] = "angelwings", 
    [19] = "angelwings", 
    [20] = "angelwings", 
    [21] = "angelwings", 
    [22] = "angelwings", 
    [23] = "angelwings", 
    [24] = "ngelwings", 
    [25] = "gelwings", 
    [26] = "elwings", 
    [27] = "lwings", 
    [28] = "wings", 
    [29] = "ings", 
    [30] = "ngs", 
    [31] = "gs", 
    [32] = "s", 
    [33] = ""
};
v1016 = function()
    -- upvalues: v14 (ref)
    return v14(globals.curtime * 4);
end;
do
    local l_v926_8, l_v927_10, l_l_match_0_11, l_v1016_9, l_v1017_12 = v926, v927, l_match_0, v1016, v1017;
    l_v1017_12 = function()
        -- upvalues: l_v1016_9 (ref), l_l_match_0_11 (ref), l_v927_10 (ref)
        if not globals.is_in_game then
            return;
        else
            local v3151 = l_v1016_9() % #l_l_match_0_11 + 1;
            if l_v927_10 ~= v3151 then
                l_v927_10 = v3151;
                common.set_clan_tag(l_l_match_0_11[v3151] or "");
            end;
            return;
        end;
    end;
    l_angles_0 = nil;
    v1019 = function(v3152)
        -- upvalues: l_v926_8 (ref), l_v1017_12 (ref)
        local v3153 = v3152:get();
        if not v3153 then
            common.set_clan_tag("");
        end;
        local l_l_v926_8_0 = l_v926_8;
        local l_l_l_v926_8_0_0 = l_l_v926_8_0;
        l_l_v926_8_0 = l_l_v926_8_0.override;
        if v3153 then

        end;
        l_l_v926_8_0(l_l_l_v926_8_0_0, nil);
        events.net_update_end(l_v1017_12, v3153);
    end;
    v925.enabled:set_callback(v1019, true);
end;
v925 = nil;
v926 = v360.misc.trashtalk;
v927 = 0;
l_match_0 = {};
v1016 = "https://cdn.hysteria.one/angelwings/trashtalk.txt";
do
    local l_v927_11, l_l_match_0_12, l_v1016_10 = v927, l_match_0, v1016;
    v1017 = function(v3159)
        -- upvalues: l_l_match_0_12 (ref)
        if not v3159 or string.find(v3159, "404") then
            return;
        else
            local v3160 = 0;
            for v3161 in string.gmatch(v3159, "(.-)\n") do
                v3160 = v3160 + 1;
                l_l_match_0_12[v3160] = v3161;
            end;
            return;
        end;
    end;
    network.get(l_v1016_10, nil, v1017);
    l_v1016_10 = function(v3162)
        -- upvalues: l_l_match_0_12 (ref), l_v927_11 (ref)
        local v3163 = entity.get_local_player();
        local v3164 = entity.get(v3162.userid, true);
        if entity.get(v3162.attacker, true) ~= v3163 or v3164 == v3163 then
            return;
        else
            local v3165 = #l_l_match_0_12;
            local v3166 = math.random(1, v3165);
            if v3166 == l_v927_11 then
                v3166 = v3166 + 1;
                if v3166 == v3165 then
                    v3166 = 1;
                end;
            end;
            utils.console_exec("say " .. l_l_match_0_12[v3166]);
            l_v927_11 = v3166;
            return;
        end;
    end;
    v1017 = nil;
    l_angles_0 = function(v3167)
        -- upvalues: l_v1016_10 (ref)
        events.player_death(l_v1016_10, v3167:get());
    end;
    v926.enabled:set_callback(l_angles_0, true);
end;
v926 = nil;
v927 = v360.misc.fast_ladder;
l_match_0 = 9;
do
    local l_l_match_0_13, l_v1016_11 = l_match_0, v1016;
    l_v1016_11 = function(v3170)
        -- upvalues: l_l_match_0_13 (ref), l_play_0 (ref), v14 (ref)
        local v3171 = entity.get_local_player();
        if v3171 == nil then
            return;
        elseif v3171.m_MoveType ~= l_l_match_0_13 then
            return;
        else
            local v3172 = l_play_0.camera_angles();
            v3170.view_angles.y = v14(v3170.view_angles.y);
            v3170.view_angles.z = 0;
            if v3170.forwardmove > 0 and v3172.x < 45 then
                v3170.view_angles.x = 89;
                v3170.in_moveright = 1;
                v3170.in_moveleft = 0;
                v3170.in_forward = 0;
                v3170.in_back = 1;
                if v3170.sidemove == 0 then
                    v3170.view_angles.y = v3170.view_angles.y + 90;
                end;
                if v3170.sidemove < 0 then
                    v3170.view_angles.y = v3170.view_angles.y + 150;
                end;
                if v3170.sidemove > 0 then
                    v3170.view_angles.y = v3170.view_angles.y + 30;
                end;
            elseif v3170.forwardmove < 0 then
                v3170.view_angles.x = 89;
                v3170.in_moveleft = 1;
                v3170.in_moveright = 0;
                v3170.in_forward = 1;
                v3170.in_back = 0;
                if v3170.sidemove == 0 then
                    v3170.view_angles.y = v3170.view_angles.y + 90;
                end;
                if v3170.sidemove > 0 then
                    v3170.view_angles.y = v3170.view_angles.y + 150;
                end;
                if v3170.sidemove < 0 then
                    v3170.view_angles.y = v3170.view_angles.y + 30;
                end;
            end;
            return;
        end;
    end;
    v1017 = nil;
    l_angles_0 = function(v3173)
        -- upvalues: l_v1016_11 (ref)
        events.createmove(l_v1016_11, v3173:get());
    end;
    v927.enabled:set_callback(l_angles_0, true);
end;
v927 = nil;
l_match_0 = v360.misc.edge_stop;
v1016 = function(v3174)
    local v3175 = entity.get_local_player();
    if v3175 == nil then
        return;
    else
        local v3176 = v3175:simulate_movement();
        v3176:think(5);
        if v3176.velocity.z < 0 then
            v3174.block_movement = 2;
        end;
        return;
    end;
end;
v1017 = nil;
do
    local l_v1016_12 = v1016;
    l_angles_0 = function(v3178)
        -- upvalues: l_v1016_12 (ref)
        events.createmove(l_v1016_12, v3178:get());
    end;
    l_match_0.enabled:set_callback(l_angles_0, true);
end;
l_match_0 = nil;
v1016 = v360.misc.collision_air_duck;
v1017 = function(v3179)
    local v3180 = entity.get_local_player();
    if v3180 == nil then
        return;
    else
        local l_m_fFlags_1 = v3180.m_fFlags;
        if bit.band(l_m_fFlags_1, 1) ~= 0 then
            return;
        elseif v3179.in_duck then
            return;
        else
            local v3182 = false;
            local v3183 = v3180:simulate_movement();
            v3179.in_duck = true;
            v3183:think(1);
            v3182 = bit.band(v3183.flags, 1) == 0 and v3183.did_hit_collision;
            v3183 = false;
            local v3184 = v3180:simulate_movement();
            v3179.in_duck = false;
            v3184:think(1);
            v3183 = bit.band(v3184.flags, 1) == 0 and v3184.did_hit_collision;
            if not v3182 and v3183 then
                v3179.in_duck = true;
            end;
            return;
        end;
    end;
end;
l_angles_0 = nil;
do
    local l_v1017_13 = v1017;
    v1019 = function(v3186)
        -- upvalues: l_v1017_13 (ref)
        events.createmove(l_v1017_13, v3186:get());
    end;
    v1016.enabled:set_callback(v1019, true);
end;
v1016 = nil;
v1017 = v360.misc.no_fall_damage;
l_angles_0 = false;
v1019 = function(v3187, v3188)
    local v3189 = v3187:get_origin();
    for v3190 = 0, math.pi * 2, math.pi * 2 / 8 do
        local v3191 = math.sin(v3190);
        local v3192 = math.cos(v3190);
        local v3193 = v3189 + vector(10 * v3192, 10 * v3191, 0);
        local v3194 = v3193 - vector(0, 0, v3188);
        if utils.trace_line(v3193, v3194, v3187).fraction ~= 1 then
            return true;
        end;
    end;
    return false;
end;
do
    local l_l_angles_0_15, l_v1019_12, l_v1030_14 = l_angles_0, v1019, v1030;
    l_v1030_14 = function(v3198)
        -- upvalues: l_l_angles_0_15 (ref), l_v1019_12 (ref)
        local v3199 = entity.get_local_player();
        if v3199 == nil then
            return;
        else
            if v3199.m_vecVelocity.z >= -500 then
                l_l_angles_0_15 = false;
            elseif l_v1019_12(v3199, 15) then
                l_l_angles_0_15 = false;
            elseif l_v1019_12(v3199, 75) then
                l_l_angles_0_15 = true;
            end;
            if v3199.m_vecVelocity.z < -500 then
                v3198.in_duck = l_l_angles_0_15;
            end;
            return;
        end;
    end;
    v1036 = nil;
    l_aimtools_0 = function(v3200)
        -- upvalues: l_v1030_14 (ref)
        events.createmove(l_v1030_14, v3200:get());
    end;
    v1017.enabled:set_callback(l_aimtools_0, true);
end;
v1017 = nil;
l_angles_0 = v360.misc.super_toss;
v1019 = 0.3;
v1030 = function(v3201, v3202, v3203)
    if math.abs(v3201.x) > math.abs(v3201.y) then
        local v3204 = v3201.y / v3201.x;
        local v3205 = 1 + v3204 * v3204;
        local v3206 = -2 * v3202.x - 2 * v3204 * v3202.y;
        local v3207 = v3202:length2dsqr() - v3203 * v3203;
        local v3208 = v3206 * v3206 - 4 * v3205 * v3207;
        if v3208 < 0 then
            return v3202 + (v3201 * v3202:dot(v3201) - v3202):normalized() * v3203;
        elseif v3208 < 0.001 then
            local v3209 = -v3206 / (2 * v3205);
            local v3210 = v3204 * v3209;
            return vector(v3209, v3210);
        else
            local v3211 = math.sqrt(v3208);
            local v3212 = (-v3206 + v3211) / (2 * v3205);
            local v3213 = v3204 * v3212;
            local v3214 = vector(v3212, v3213);
            v3212 = (-v3206 - v3211) / (2 * v3205);
            v3213 = v3204 * v3212;
            local v3215 = vector(v3212, v3213);
            if v3201:dot(v3214) > v3201:dot(v3215) then
                return v3214;
            else
                return v3215;
            end;
        end;
    else
        local v3216 = v3201.x / v3201.y;
        local v3217 = 1 + v3216 * v3216;
        local v3218 = -2 * v3202.y - 2 * v3216 * v3202.x;
        local v3219 = v3202:length2dsqr() - v3203 * v3203;
        local v3220 = v3218 * v3218 - 4 * v3217 * v3219;
        if v3220 < 0 then
            return v3202 + (v3201 * v3202:dot(v3201) - v3202):normalized() * v3203;
        elseif v3220 < 0.001 then
            local v3221 = -v3218 / (2 * v3217);
            local v3222 = v3216 * v3221;
            return vector(v3222, v3221);
        else
            local v3223 = math.sqrt(v3220);
            local v3224 = (-v3218 + v3223) / (2 * v3217);
            local v3225 = v3216 * v3224;
            local v3226 = vector(v3225, v3224);
            v3224 = (-v3218 - v3223) / (2 * v3217);
            v3225 = v3216 * v3224;
            local v3227 = vector(v3225, v3224);
            if v3201:dot(v3226) > v3201:dot(v3227) then
                return v3226;
            else
                return v3227;
            end;
        end;
    end;
end;
do
    local l_v1019_13, l_v1030_15, l_v1036_15, l_l_aimtools_0_15, l_v1445_14, l_v1446_13 = v1019, v1030, v1036, l_aimtools_0, v1445, v1446;
    l_v1036_15 = function(v3234, v3235, v3236, v3237)
        -- upvalues: v16 (ref), l_v1019_13 (ref), l_v1030_15 (ref)
        local v3238 = vector():angles(v3234);
        local v3239 = vector():angles(v3234.x - (90 - math.abs(v3234.x)) * 10 / 90, v3234.y);
        local v3240 = v3239:dot(v3238) / v3238:length();
        local v3241 = math.clamp(v3236 * 0.9, 15, 750);
        local v3242 = math.clamp(v3237, 0, 1);
        v3241 = v3241 * v16.lerp(l_v1019_13, 1, v3242);
        v3234.y = (l_v1030_15(v3239, v3235 * 1.25, v3241 * v3240) - v3235 * 1.25):angles().y;
        v3234.x = math.clamp(v3234.x + math.clamp(v3235.z * 0.1, -20, 20), -89, 89);
    end;
    l_l_aimtools_0_15 = function(v3243, v3244)
        local v3245 = math.rad(v3244);
        local v3246 = math.cos(v3245);
        local v3247 = math.sin(v3245);
        local v3248 = v3246 * v3243.forwardmove + v3247 * v3243.sidemove;
        local v3249 = v3247 * v3243.forwardmove + v3246 * v3243.sidemove;
        v3243.forwardmove = v3248;
        v3243.sidemove = v3249;
    end;
    l_v1445_14 = function(v3250)
        -- upvalues: l_play_0 (ref), l_v1036_15 (ref), l_l_aimtools_0_15 (ref)
        local v3251 = entity.get_local_player();
        if v3251 == nil then
            return;
        else
            local v3252 = v3251:get_player_weapon();
            if v3252 == nil then
                return;
            else
                local v3253 = v3252:get_weapon_info();
                if v3253 == nil or v3253.weapon_type ~= 9 then
                    return;
                elseif v3252.m_fThrowTime == 0 then
                    return;
                elseif v3251.m_nTickBase * globals.tickinterval < v3252.m_fThrowTime and rage.exploit:get() ~= 1 then
                    return;
                else
                    local l_view_angles_0 = v3250.view_angles;
                    local l_y_4 = l_view_angles_0.y;
                    local v3256 = l_play_0.camera_angles();
                    if v3256.x ~= l_view_angles_0.x or v3256.y ~= l_view_angles_0.y then
                        return;
                    else
                        l_v1036_15(l_view_angles_0, v3251.m_vecVelocity, v3253.throw_velocity, v3252.m_flThrowStrength);
                        l_l_aimtools_0_15(v3250, math.normalize_yaw(l_y_4 - l_view_angles_0.y));
                        return;
                    end;
                end;
            end;
        end;
    end;
    l_v1446_13 = function(v3257)
        -- upvalues: l_v1036_15 (ref)
        local v3258 = entity.get_local_player();
        if v3258 == nil then
            return;
        else
            local v3259 = v3258:get_player_weapon();
            if v3259 == nil then
                return;
            else
                local v3260 = v3259:get_weapon_info();
                if v3260 ~= nil and v3260.weapon_type == 9 then
                    l_v1036_15(v3257.angles, v3257.velocity, v3260.throw_velocity, v3259.m_flThrowStrength);
                end;
                return;
            end;
        end;
    end;
    v1598 = nil;
    v1599 = function(v3261)
        -- upvalues: l_v1445_14 (ref), l_v1446_13 (ref)
        local v3262 = v3261:get();
        events.createmove(l_v1445_14, v3262);
        events.grenade_override_view(l_v1446_13, v3262);
    end;
    l_angles_0.enabled:set_callback(v1599, true);
end;
l_angles_0 = nil;
v1019 = v360.misc.grenade_release;
v1030 = nil;
do
    local l_v1019_14, l_v1030_16, l_v1036_16, l_l_aimtools_0_16, l_v1445_15 = v1019, v1030, v1036, l_aimtools_0, v1445;
    l_v1036_16 = function(v3268, v3269)
        -- upvalues: l_v1019_14 (ref)
        if v3268 == nil or v3269 == nil then
            return false;
        elseif v3268:get_weapon_index() == 45 then
            return v3269 > 0;
        else
            return l_v1019_14.damage:get() <= v3269;
        end;
    end;
    l_l_aimtools_0_16 = function(v3270)
        -- upvalues: l_v1036_16 (ref), l_v1030_16 (ref)
        local v3271 = entity.get_local_player();
        if v3271 == nil then
            return;
        else
            local v3272 = v3271:get_player_weapon();
            if v3272 == nil then
                return;
            elseif not v3272.m_bPinPulled then
                return;
            elseif v3272.m_flThrowStrength <= 0 then
                return;
            else
                if l_v1036_16(v3272, l_v1030_16) then
                    v3270.in_attack = false;
                    v3270.in_attack2 = false;
                end;
                l_v1030_16 = nil;
                return;
            end;
        end;
    end;
    l_v1445_15 = function(v3273)
        -- upvalues: l_v1030_16 (ref)
        l_v1030_16 = v3273.damage;
    end;
    v1446 = nil;
    v1598 = function(v3274)
        -- upvalues: l_l_aimtools_0_16 (ref), l_v1445_15 (ref)
        local v3275 = v3274:get();
        events.createmove(l_l_aimtools_0_16, v3275);
        events.grenade_prediction(l_v1445_15, v3275);
    end;
    l_v1019_14.enabled:set_callback(v1598, true);
end;
v1019 = nil;
v1030 = v360.misc.fps_optimize;
v1036 = false;
l_aimtools_0 = {};
v1445 = function(v3276)
    assert(type(v3276) == "table", "cmds must be a table");
    assert(type(v3276.set) == "function", "set must be a function");
    assert(type(v3276.unset) == "function", "unset must be a function");
    return {
        set = v3276.set, 
        unset = v3276.unset
    };
end;
do
    local l_v1445_16 = v1445;
    v1446 = function(v3278, v3279)
        -- upvalues: l_v1445_16 (ref)
        assert(type(v3278) == "userdata", "convar must be a userdata");
        assert(type(v3279) == "number", "value must be a number");
        local v3280 = nil;
        local l_v3279_0 = v3279;
        local function v3282()
            -- upvalues: v3280 (ref), v3278 (ref), l_v3279_0 (ref)
            if v3280 == nil then
                v3280 = v3278:int();
                v3278:int(l_v3279_0);
            end;
        end;
        local function v3283()
            -- upvalues: v3280 (ref), v3278 (ref)
            if v3280 ~= nil then
                v3278:int(v3280);
                v3280 = nil;
            end;
        end;
        return l_v1445_16({
            set = v3282, 
            unset = v3283
        });
    end;
    v1598 = function(v3284)
        -- upvalues: l_v1445_16 (ref)
        assert(type(v3284) == "function", "fn must be a function");
        local v3285 = {};
        v3284(v3285);
        return l_v1445_16(v3285);
    end;
    l_aimtools_0.Fog = {
        v1446(cvar.fog_enable, 0), 
        v1446(cvar.fog_enable_water_fog, 0)
    };
    l_aimtools_0.Blood = {
        v1446(cvar.violence_hblood, 0)
    };
    l_aimtools_0.Bloom = {
        v1446(cvar.mat_disable_bloom, 1)
    };
    l_aimtools_0.Decals = {
        v1446(cvar.r_drawdecals, 0)
    };
    l_aimtools_0.Shadows = {
        v1446(cvar.r_shadows, 0), 
        v1446(cvar.cl_csm_static_prop_shadows, 0), 
        v1446(cvar.cl_csm_shadows, 0), 
        v1446(cvar.cl_csm_world_shadows, 0), 
        v1446(cvar.cl_foot_contact_shadows, 0), 
        v1446(cvar.cl_csm_viewmodel_shadows, 0), 
        v1446(cvar.cl_csm_rope_shadows, 0), 
        v1446(cvar.cl_csm_sprite_shadows, 0), 
        v1446(cvar.cl_csm_translucent_shadows, 0), 
        v1446(cvar.cl_csm_entity_shadows, 0), 
        v1446(cvar.cl_csm_world_shadows_in_viewmodelcascade, 0)
    };
    l_aimtools_0.Sprites = {
        v1446(cvar.r_drawsprites, 0)
    };
    l_aimtools_0.Particles = {
        v1446(cvar.r_drawparticles, 0)
    };
    l_aimtools_0.Ropes = {
        v1446(cvar.r_drawropes, 0)
    };
    l_aimtools_0["Dynamic lights"] = {
        v1446(cvar.mat_disable_fancy_blending, 1)
    };
    l_aimtools_0["Map details"] = {
        v1446(cvar.func_break_max_pieces, 0), 
        v1446(cvar.props_break_max_pieces, 0)
    };
    l_aimtools_0["Weapon effects"] = {
        v1446(cvar.muzzleflash_light, 0), 
        v1446(cvar.r_drawtracers_firstperson, 0)
    };
    l_aimtools_0.Teammates = {
        v1598(function(v3286)
            local function v3291(v3287)
                local v3288 = entity.get_local_player();
                if v3288 == nil then
                    return;
                else
                    local v3289 = v3288:is_alive();
                    entity.get_players(false, true, function(v3290)
                        -- upvalues: v3288 (ref), v3287 (ref), v3289 (ref)
                        if v3290 ~= v3288 and not v3290:is_enemy() then
                            if v3287 or not v3289 then
                                v3290.m_nRenderMode = 0;
                            else
                                v3290.m_nRenderMode = 10;
                            end;
                        end;
                    end);
                    return;
                end;
            end;
            local function v3292()
                -- upvalues: v3291 (ref)
                v3291(true);
            end;
            local function v3293()
                -- upvalues: v3291 (ref)
                v3291(false);
            end;
            local function v3294()
                -- upvalues: v3291 (ref), v3292 (ref), v3293 (ref)
                v3291(false);
                events.shutdown(v3292, true);
                events.net_update_end(v3293, true);
            end;
            local function v3295()
                -- upvalues: v3291 (ref), v3292 (ref), v3293 (ref)
                v3291(true);
                events.shutdown(v3292, false);
                events.net_update_end(v3293, false);
            end;
            v3286.set = v3294;
            v3286.unset = v3295;
        end)
    };
end;
do
    local l_v1030_17, l_v1036_17, l_l_aimtools_0_17, l_v1445_17, l_v1446_14, l_v1598_11, l_v1599_11, l_v1600_11 = v1030, v1036, l_aimtools_0, v1445, v1446, v1598, v1599, v1600;
    l_v1445_17 = function()
        -- upvalues: l_v1030_17 (ref), v370 (ref)
        if l_v1030_17.always_on:get() then
            return true;
        elseif v370.is_peeking and l_v1030_17.detections:get("Peeking") then
            return true;
        elseif v370.is_vulnerable and l_v1030_17.detections:get("Hit Flag") then
            return true;
        else
            return false;
        end;
    end;
    l_v1446_14 = function()
        -- upvalues: l_v1036_17 (ref), l_l_aimtools_0_17 (ref)
        if not l_v1036_17 then
            return;
        else
            for _, v3305 in pairs(l_l_aimtools_0_17) do
                for v3306 = 1, #v3305 do
                    v3305[v3306]:unset();
                end;
            end;
            l_v1036_17 = false;
            return;
        end;
    end;
    l_v1598_11 = function()
        -- upvalues: l_v1036_17 (ref), l_v1030_17 (ref), l_l_aimtools_0_17 (ref)
        if l_v1036_17 then
            return;
        else
            local v3307 = l_v1030_17.select:get();
            for v3308 = 1, #v3307 do
                local v3309 = l_l_aimtools_0_17[v3307[v3308]];
                for v3310 = 1, #v3309 do
                    v3309[v3310]:set();
                end;
            end;
            l_v1036_17 = true;
            return;
        end;
    end;
    l_v1599_11 = function()
        -- upvalues: l_v1446_14 (ref)
        l_v1446_14();
    end;
    l_v1600_11 = function()
        -- upvalues: l_v1445_17 (ref), l_v1446_14 (ref), l_v1598_11 (ref)
        if not l_v1445_17() then
            return l_v1446_14();
        else
            l_v1598_11();
            return;
        end;
    end;
    v1601 = nil;
    v1602 = function(_)
        -- upvalues: l_v1446_14 (ref), l_v1598_11 (ref)
        l_v1446_14();
        l_v1598_11();
    end;
    do
        local l_v1602_13 = v1602;
        v1603 = function(v3313)
            -- upvalues: l_v1030_17 (ref), l_v1602_13 (ref), l_v1446_14 (ref), l_v1599_11 (ref), l_v1600_11 (ref)
            local v3314 = v3313:get();
            if v3314 then
                l_v1030_17.select:set_callback(l_v1602_13, true);
            else
                l_v1030_17.select:unset_callback(l_v1602_13);
            end;
            if not v3314 then
                l_v1446_14();
            end;
            events.shutdown(l_v1599_11, v3314);
            events.net_update_end(l_v1600_11, v3314);
        end;
        l_v1030_17.enabled:set_callback(v1603, true);
    end;
end;
v1030 = nil;
v1036 = v360.misc.ping_unlocker;
l_aimtools_0 = ui.find("Miscellaneous", "Main", "Other", "Fake Latency");
v1445 = cvar.sv_maxunlag;
do
    local l_v1036_18, l_l_aimtools_0_18, l_v1445_18, l_v1446_15, l_v1598_12, l_v1599_12 = v1036, l_aimtools_0, v1445, v1446, v1598, v1599;
    l_v1446_15 = function()
        -- upvalues: l_l_aimtools_0_18 (ref), l_v1445_18 (ref)
        l_l_aimtools_0_18:override();
        l_l_aimtools_0_18:disabled(false);
        l_v1445_18:float(tonumber(l_v1445_18:string()), true);
    end;
    l_v1598_12 = function(v3321)
        -- upvalues: l_l_aimtools_0_18 (ref), l_v1445_18 (ref)
        l_l_aimtools_0_18:override(v3321);
        l_l_aimtools_0_18:disabled(true);
        l_v1445_18:float(0.4, true);
    end;
    l_v1599_12 = function()
        -- upvalues: l_v1446_15 (ref)
        l_v1446_15();
    end;
    v1600 = nil;
    v1601 = function(v3322)
        -- upvalues: l_v1598_12 (ref)
        l_v1598_12(v3322:get());
    end;
    do
        local l_v1601_12 = v1601;
        v1602 = function(v3324)
            -- upvalues: l_v1446_15 (ref), l_v1036_18 (ref), l_v1601_12 (ref), l_v1599_12 (ref)
            local v3325 = v3324:get();
            if not v3325 then
                l_v1446_15();
            end;
            if v3325 then
                l_v1036_18.value:set_callback(l_v1601_12, true);
            else
                l_v1036_18.value:unset_callback(l_v1601_12);
            end;
            events.shutdown(l_v1599_12, v3325);
        end;
        l_v1036_18.enabled:set_callback(v1602, true);
    end;
end;
v1036 = nil;
l_aimtools_0 = v360.misc.animation_breaker;
v1445 = 2;
v1446 = 6;
v1598 = 12;
v1599 = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement");
v1600 = ffi.typeof("            struct {\n                float  m_flLayerAnimtime;\n                float  m_flLayerFadeOuttime;\n\n                // dispatch flags\n                void  *m_pDispatchedStudioHdr;\n                int    m_nDispatchedSrc;\n                int    m_nDispatchedDst;\n\n                int    m_nOrder;\n                int    m_nSequence;\n                float  m_flPrevCycle;\n                float  m_flWeight;\n                float  m_flWeightDeltaRate;\n\n                // used for automatic crossfades between sequence changes;\n                float  m_flPlaybackRate;\n                float  m_flCycle;\n                int    m_pOwner;\n                int    m_nInvalidatePhysicsBits;\n            } **\n        ");
do
    local l_l_aimtools_0_19, l_v1445_19, l_v1446_16, l_v1598_13, l_v1599_13, l_v1600_12, l_v1601_13, l_v1602_14, l_v1603_12, l_v1604_14, l_v1605_12, l_v1606_8 = l_aimtools_0, v1445, v1446, v1598, v1599, v1600, v1601, v1602, v1603, v1604, v1605, v1606;
    l_v1601_13 = function(v3338)
        -- upvalues: l_v1600_12 (ref)
        return ffi.cast(l_v1600_12, ffi.cast("uintptr_t", v3338[0]) + 10640)[0];
    end;
    l_v1602_14 = function(v3339)
        -- upvalues: v370 (ref), l_l_aimtools_0_19 (ref), l_v1599_13 (ref)
        if v370.is_onground then
            local v3340 = l_l_aimtools_0_19.ground_legs:get();
            if v3340 == "Static" then
                l_v1599_13:override("Sliding");
                v3339.m_flPoseParameter[0] = 0;
                return;
            elseif v3340 == "Jitter" then
                local l_tickcount_2 = globals.tickcount;
                local v3342 = l_l_aimtools_0_19.legs_offset_1:get();
                local v3343 = l_l_aimtools_0_19.legs_offset_2:get();
                local v3344 = 1 / (l_tickcount_2 % 8 >= 4 and 200 or 400);
                local v3345 = l_tickcount_2 % 4 >= 2 and v3342 or v3343;
                l_v1599_13:override("Sliding");
                v3339.m_flPoseParameter[0] = v3345 * v3344;
                return;
            elseif v3340 == "Allah" then
                l_v1599_13:override("Walking");
                v3339.m_flPoseParameter[7] = 0;
                return;
            elseif v3340 == "Kangaroo" then
                v3339.m_flPoseParameter[3] = math.random();
                v3339.m_flPoseParameter[6] = math.random();
                v3339.m_flPoseParameter[7] = math.random();
            end;
        end;
        l_v1599_13:override();
    end;
    l_v1603_12 = function(v3346, v3347)
        -- upvalues: l_l_aimtools_0_19 (ref), v370 (ref), l_v1446_16 (ref)
        local v3348 = l_l_aimtools_0_19.air_legs:get();
        if v3348 == "Disabled" then
            return;
        elseif v370.is_onground then
            return;
        elseif v3348 == "Static" then
            v3346.m_flPoseParameter[6] = 1;
            return;
        elseif v3348 == "kangaroo" then
            v3346.m_flPoseParameter[3] = math.random();
            v3346.m_flPoseParameter[6] = math.random();
            v3346.m_flPoseParameter[7] = math.random();
            return;
        elseif v3348 == "Haram" then
            if not v370.is_moving then
                return;
            else
                local v3349 = v3347[l_v1446_16];
                if v3349 == nil then
                    return;
                else
                    v3349.m_flWeight = 1;
                    return;
                end;
            end;
        else
            return;
        end;
    end;
    l_v1604_14 = function(v3350)
        -- upvalues: l_l_aimtools_0_19 (ref), l_v1598_13 (ref)
        local v3351 = l_l_aimtools_0_19.body_lean:get();
        if v3351 == -1 then
            return;
        else
            local v3352 = v3350[l_v1598_13];
            if v3352 == nil then
                return;
            else
                v3352.m_flWeight = v3351 * 0.1;
                return;
            end;
        end;
    end;
    l_v1605_12 = function(v3353, v3354)
        -- upvalues: l_l_aimtools_0_19 (ref), v370 (ref)
        if not l_l_aimtools_0_19.pitch_on_land:get() then
            return;
        elseif not v370.is_onground then
            return;
        elseif not v3354.landing then
            return;
        else
            v3353.m_flPoseParameter[12] = 0.5;
            return;
        end;
    end;
    l_v1606_8 = function(v3355)
        -- upvalues: l_v1601_13 (ref), l_v1445_19 (ref), l_v1602_14 (ref), l_v1603_12 (ref), l_v1605_12 (ref), l_v1604_14 (ref)
        local v3356 = entity.get_local_player();
        if v3356 == nil or v3355 ~= v3356 then
            return;
        else
            local v3357 = v3355:get_anim_state();
            if v3357 == nil then
                return;
            else
                local v3358 = l_v1601_13(v3355);
                if v3358 == nil then
                    return;
                else
                    if v3356.m_MoveType == l_v1445_19 then
                        l_v1602_14(v3356);
                        l_v1603_12(v3356, v3358);
                        l_v1605_12(v3356, v3357);
                    end;
                    l_v1604_14(v3358);
                    return;
                end;
            end;
        end;
    end;
    v1607 = nil;
    v1608 = function(v3359)
        -- upvalues: l_v1599_13 (ref), l_v1606_8 (ref)
        local v3360 = v3359:get();
        if not v3360 then
            l_v1599_13:override();
        end;
        events.post_update_clientside_animation(l_v1606_8, v3360);
    end;
    l_l_aimtools_0_19.enabled:set_callback(v1608, true);
end;
l_aimtools_0 = nil;
v1445 = v360.misc.fake_duck;
v1446 = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots");
v1598 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap");
v1599 = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck");
v1600 = {};
v1601 = 0;
do
    local l_v1446_17, l_v1598_14, l_v1599_14, l_v1600_13, l_v1601_14 = v1446, v1598, v1599, v1600, v1601;
    do
        local l_l_v1601_14_0, l_v1602_15, l_v1603_13, l_v1604_15, l_v1605_13, l_v1606_9 = l_v1601_14, v1602, v1603, v1604, v1605, v1606;
        l_v1602_15 = function()
            -- upvalues: l_l_v1601_14_0 (ref)
            if l_l_v1601_14_0 >= 14 then
                l_l_v1601_14_0 = 0;
            end;
            l_l_v1601_14_0 = l_l_v1601_14_0 + 1;
        end;
        l_v1603_13 = function()
            -- upvalues: l_v1446_17 (ref), l_v1598_14 (ref)
            l_v1446_17:override();
            l_v1598_14:override();
        end;
        l_v1604_15 = function()
            -- upvalues: l_v1603_13 (ref)
            l_v1603_13();
        end;
        l_v1605_13 = function(v3372)
            -- upvalues: l_v1599_14 (ref)
            if not l_v1599_14:get() then
                return;
            else
                local v3373 = entity.get_local_player();
                if v3373 == nil then
                    return;
                else
                    local v3374 = entity.get_game_rules();
                    if v3374 == nil or not v3374.m_bFreezePeriod then
                        return;
                    else
                        v3372.camera.z = v3373:get_origin().z + 64;
                        return;
                    end;
                end;
            end;
        end;
        l_v1606_9 = function(v3375)
            -- upvalues: l_v1599_14 (ref), l_v1603_13 (ref), l_v1602_15 (ref), l_l_v1601_14_0 (ref), l_v1446_17 (ref), l_v1598_14 (ref)
            if not l_v1599_14:get() then
                return l_v1603_13();
            else
                local v3376 = entity.get_game_rules();
                if v3376 == nil or not v3376.m_bFreezePeriod then
                    return;
                else
                    l_v1602_15();
                    v3375.in_duck = l_l_v1601_14_0 > 7;
                    v3375.send_packet = l_l_v1601_14_0 == 14;
                    l_v1446_17:override(false);
                    l_v1598_14:override(false);
                    return;
                end;
            end;
        end;
        l_v1600_13.update = function(v3377)
            -- upvalues: l_v1604_15 (ref), l_v1606_9 (ref), l_v1605_13 (ref)
            local v3378 = v3377:get("On Freezetime");
            events.shutdown(l_v1604_15, v3378);
            events.createmove(l_v1606_9, v3378);
            events.override_view(l_v1605_13, v3378);
        end;
    end;
    l_v1601_14 = {};
    v1602 = function(v3379)
        -- upvalues: l_v1599_14 (ref)
        if not l_v1599_14:get() then
            return;
        else
            local v3380 = vector(v3379.forwardmove, v3379.sidemove);
            if v3380:length2dsqr() < 25 then
                return;
            else
                v3380:normalize();
                v3379.forwardmove = v3380.x * 150;
                v3379.sidemove = v3380.y * 150;
                return;
            end;
        end;
    end;
    do
        local l_v1602_16 = v1602;
        l_v1601_14.update = function(v3382)
            -- upvalues: l_v1602_16 (ref)
            events.createmove_run(l_v1602_16, v3382:get("Unlock Speed"));
        end;
    end;
    v1602 = nil;
    v1603 = function(v3383)
        -- upvalues: l_v1600_13 (ref), l_v1601_14 (ref)
        l_v1600_13.update(v3383);
        l_v1601_14.update(v3383);
    end;
    v1445.options:set_callback(v1603, true);
end;
v1445 = nil;
v1446 = v360.misc.nickname_generator;
v1598 = cvar.name;
v1599 = nil;
v1600 = {
    [1] = "\208\177\208\187\209\143 \208\189\208\190\209\128\208\188\208\176\208\187\209\140\208\189\208\190 \208\189\208\176\208\178\208\176\209\133\209\131 \208\186\209\131\208\191\208\184\208\187", 
    [2] = "\209\143 \208\178\208\181\208\185\208\191 \208\186\209\131\208\191\208\184\208\187", 
    [3] = "\209\135\208\180? \208\186\208\180?", 
    [4] = "\209\143\208\186\209\131\208\177\208\190\208\178\209\135\208\184567", 
    [5] = "\208\177\208\187\208\181\208\186 \208\176\208\189\208\179\208\181\208\187 \209\131\208\177\208\184\208\178\209\136\208\186\208\17611", 
    [6] = "\209\130\208\176\209\128\208\176\208\186\208\176\208\189 \208\180\208\184\208\189\208\184\209\129", 
    [7] = "\208\182\209\131\208\187\209\140\208\178\208\181\209\128\208\184\208\186", 
    [8] = "\209\143\209\128\208\190\209\129\209\130\208\189\209\139\208\185 \208\188\208\184\208\189\208\181\209\128\208\187\209\140\208\189\209\139\208\185 \209\135\208\181\209\135\208\181\208\189\208\181\209\134 \208\186\208\176\208\182\209\141\209\131\208\176\208\187", 
    [9] = "\209\129\208\189\208\181\208\179\208\190\208\178\208\190\208\185 \208\176\208\178\208\191\208\186\208\184\208\189\208\179\209\131\208\187\209\143", 
    [10] = "mr \208\179\208\181\208\185\208\188\208\181\209\128300", 
    [11] = "\209\133\209\129\208\176\209\142 \208\178\208\178 \209\129 \208\191\208\181\209\128\208\178\208\190\208\185 \208\191\209\131", 
    [12] = "\208\186\209\131\208\180\208\176 \208\178 \209\133\209\131\208\185", 
    [13] = "hasbik style KZ", 
    [14] = "60G AJlTaUcKuX 7oP", 
    [15] = "4\208\181 \208\178 Xy\209\1437y", 
    [16] = "\209\133\209\129\208\176\209\142 \208\180\208\176\208\182\208\181 \208\189\208\176 \209\130\208\190\208\1874\208\186\208\181", 
    [17] = "OnlyBaim gang$", 
    [18] = "\208\177\209\139\208\187 \208\178\209\139\208\181\208\177\208\176\208\189 \208\186\208\184\208\183\208\176\209\128\209\131\209\133\208\178\209\133", 
    [19] = "9PoCtHblU KUnKoG", 
    [20] = "TTu3\208\180oH\209\142x", 
    [21] = "CTaPa\209\143 Ho OTTacHeH\209\140Ka\209\143", 
    [22] = "\209\143 \208\178\209\139\208\181\208\183\208\182\208\176\209\142 \208\189\208\190\209\129\208\190\208\191\209\139\209\128\208\186\208\184", 
    [23] = "\226\156\170FasTIK\226\156\170", 
    [24] = "\208\130\206\163\198\138O\197\129\226\136\134G\226\136\134", 
    [25] = "\239\184\187\227\131\135\226\149\144\228\184\128 \226\152\173 sniper", 
    [26] = "\208\147\209\131\208\161\208\181\208\153\208\189 \208\168\208\190\208\163", 
    [27] = "o\208\159 \208\175 \208\186\208\160\209\131\208\162\208\190\208\153 \208\144 \209\130\208\171 \208\165\209\131\208\153", 
    [28] = "\209\133\209\131\209\143\209\130\208\190\209\128\209\131\208\177\208\184\208\178\208\176\209\130\208\190\209\1286731", 
    [29] = "\226\153\149\239\189\129\239\189\146\239\189\148\239\189\133\239\189\141 \239\188\145\239\188\149\239\188\148", 
    [30] = "\209\129\209\128\208\181\208\179\208\176 \208\188\208\190\208\177\208\184\208\187\208\186\208\184\208\189", 
    [31] = "\208\188\208\176\209\130\208\178\208\181\208\185 \208\186\209\128\208\176\208\177\208\190\208\178", 
    [32] = "\208\186\208\190\208\185\209\132\208\190\208\178\208\176\209\143 \208\186\209\128\208\184\208\178\208\181\209\130\208\186\208\176 \208\181\208\177\208\187\208\176\208\189\208\184\209\137\208\181", 
    [33] = "\226\156\167*:\239\189\165\239\190\159\226\156\167 \240\157\144\133\240\157\144\148\240\157\144\130\240\157\144\138 \240\157\144\152\240\157\144\142\240\157\144\148 \226\156\167*:\239\189\165\239\190\159\226\156\167", 
    [34] = "SPASIBO ZA SKEET", 
    [35] = "\240\157\144\141\240\157\144\154\240\157\144\128\240\157\144\162\240\157\144\171\240\157\144\140\240\157\144\154\240\157\144\177", 
    [36] = "\208\177\209\131\208\185\208\189\209\139\208\185 \209\129\208\187\208\176\208\178\208\184\208\186 \208\179\208\176\208\183\208\190\208\187\208\184\209\128", 
    [37] = "\208\187\209\145\208\178\208\176 \209\130\208\176\209\128\208\176\208\186\208\176\208\189-56", 
    [38] = "yKpoTuTeJlb_6a6yweK", 
    [39] = "anatoly fakeyaw", 
    [40] = "\208\146\208\176\208\187\208\181\208\189\209\130\208\184\208\189", 
    [41] = "\208\161\209\131\208\191\208\181\209\128 \208\161\208\189\208\176\208\185\208\191\208\181\209\128228", 
    [42] = "\208\151\208\176\208\186\208\176\208\183\208\176\209\130\209\140 \208\191\208\181\208\180\208\190\209\132u\208\187\208\176", 
    [43] = "\208\160\208\176\208\188\208\183\208\176\208\189 \208\154\208\176\208\180\209\139\209\128\208\190\208\178", 
    [44] = "\208\191\209\128\208\190\208\178\208\181\209\128\208\186\208\176 \208\189\208\176 \209\135\208\184\209\130\209\139", 
    [45] = "main nick sanyaKiller228", 
    [46] = "\208\145\208\190\209\128\208\184\209\129 \208\150\208\184\208\178\208\190\209\130\208\189\208\190\208\181", 
    [47] = "bmw top", 
    [48] = "\208\148\208\184\208\188\208\176[RUS]2005", 
    [49] = "\208\184\209\129\208\187\208\176\208\188 \208\188\208\176\208\179\208\190\208\188\208\181\208\180\208\190\208\178", 
    [50] = "\208\162\208\152\208\156\208\144\208\162\208\152\208\165\208\146\208\165", 
    [51] = "eldoradohvh", 
    [52] = "\208\177\209\131\208\187\209\140\209\130\208\176\208\183\208\176\209\128", 
    [53] = "\209\143 \208\181\208\177\208\187\208\176\208\189 \208\177\208\184\208\179\208\184\209\130\208\184", 
    [54] = "pavlo.matvei98", 
    [55] = "www.CSGOSETTINGS.ru 111", 
    [56] = "\208\188\208\176\208\188\208\186\208\176\208\181\208\1772009", 
    [57] = "\209\132\209\131\208\179\208\176\209\129 \209\130\208\184\208\188\208\190\209\133\208\176", 
    [58] = "VLAD_\208\159\208\163\208\161\208\162\208\158\208\153", 
    [59] = "\208\146\208\181\208\187\208\184\208\188\208\184\209\128 (Not Cheater)", 
    [60] = "\208\158\208\191\208\144$\208\189\208\171\208\185 \208\188\208\176\209\129\209\130\208\181\209\128 \208\186\208\187\208\176\209\130\209\135\208\181\208\185 \208\187\208\181\209\133\208\176 \208\181\208\177\208\176\209\130\209\140", 
    [61] = "KirillMachine", 
    [62] = "THIS IS OMLEEEEEEET (\226\151\163\226\151\162)", 
    [63] = "soldier (\209\129\208\190\208\187\208\180\208\176\209\130)", 
    [64] = "-----= S.E.N.A.T.O.R =-----", 
    [65] = "*-\208\154\209\128Y\209\135E_\208\145\208\190\208\179\208\176_u_\208\166\208\176\208\160\209\143-*", 
    [66] = "\225\180\155\202\156\225\180\135\202\153\225\180\135s\225\180\155", 
    [67] = "\226\153\165\194\167\226\130\173\195\174\226\132\146\200\180\226\138\149\225\151\169\225\153\161\199\158\226\132\153\226\132\176\226\132\156\226\130\179\240\159\142\134", 
    [68] = "GloBal~BaNaN", 
    [69] = "Fucking.Ba[nn]Y...", 
    [70] = "d[oo]dLeZzzz...", 
    [71] = "VIP Sex Energy VIP", 
    [72] = "\240\159\165\145\240\157\149\146\240\157\149\167\240\157\149\146\240\157\149\148\240\157\149\146\240\157\149\149\240\157\149\160\240\159\165\145", 
    [73] = "\228\185\130...\240\157\148\161.\240\157\148\166.\240\157\148\168.\240\157\148\166.y...\228\185\130", 
    [74] = "\226\149\145\226\152\190 \196\166 \206\158 \226\136\128 \229\141\131 \206\163 \229\176\186\226\149\145", 
    [75] = "\229\189\161[\225\180\133\225\180\135\225\180\128\225\180\133 \225\180\139\201\170\202\159\202\159\225\180\135\202\128]\229\189\161", 
    [76] = "\202\128\225\180\135\225\180\152 \201\170\201\180s\225\180\128\201\180\225\180\135 \225\180\161\201\170\225\180\155\202\156 \225\180\128\225\180\161\225\180\152", 
    [77] = "\208\161\208\191\209\131\208\180\208\184 \208\156\209\131\208\189", 
    [78] = "\225\151\171\225\131\162\226\130\166\226\132\139\226\132\177\199\190\226\132\156", 
    [79] = "\226\152\162\196\142\226\130\179\195\145\199\164\196\146\226\132\159\226\152\162", 
    [80] = "\196\162\197\151\196\133\197\134\196\143_\226\130\165\196\133\239\174\144\197\167\206\190\197\151", 
    [81] = "F@$$$TiK...", 
    [82] = "...::::K[RAM]m[ER]::::...", 
    [83] = "\208\190\208\191\208\181\209\128 \208\190\208\186\208\176\209\143\208\189\208\189\209\139\208\185", 
    [84] = "\208\148\208\158\208\157\208\144\208\162 \208\161 PAYPAL", 
    [85] = "shelzi228", 
    [86] = "\209\132\208\176\209\128\209\136", 
    [87] = "\209\130\208\176\208\189\209\134\209\131\209\142 \208\187\208\181\208\183\208\179\208\184\208\189\208\186\209\131", 
    [88] = "OPER\209\131\208\191\208\190\208\187\208\189\208\190\208\188\208\190\209\135\208\181\208\189\208\189\209\139\208\185", 
    [89] = "2 \208\190\209\133\208\187\208\176\208\182\208\180\208\181\208\189\208\189\209\139\209\133 \209\143\208\185\209\134\208\176", 
    [90] = "\208\188\208\176\208\183\208\184\208\186 \208\190\208\186\208\176\209\143\208\189\208\189\209\139\208\185", 
    [91] = "Ballin' Maut", 
    [92] = "Balin`Shprot", 
    [93] = "MILLIONAR Balin", 
    [94] = "\208\154\208\160\208\144\208\168 \208\162\208\149\208\161\208\162 \208\156\208\144\208\160\208\154 2", 
    [95] = "\226\128\139HVH RACING", 
    [96] = "\208\186\208\187\209\131\208\177\208\189\208\184\209\135\208\189\208\190-\208\178\208\184\209\136\208\189\208\181\208\178\209\139\208\185 \209\129\208\187\208\190\208\189\209\143\209\128\208\176", 
    [97] = "\209\143\208\177\208\187\208\190\209\135\208\189\209\139\208\185 \208\179\208\184\208\191\208\190\208\191\208\190\209\130\208\176\208\188", 
    [98] = "\208\186\209\128\208\190\208\187 \209\128\208\182\208\176\209\135\208\189\209\139\208\185 \208\176\208\177\209\128\208\184\208\186\208\190\209\129\208\190\208\178\209\139\208\185", 
    [99] = "\208\144\208\179\209\128\208\181\209\129\209\129\208\184\208\178\208\189\209\139\208\185 \208\186\208\176\209\128\208\177\209\142\209\128\208\176\209\130\208\190\209\128", 
    [100] = "tw1x^zz1^aced1v1", 
    [101] = "s1mple", 
    [102] = "\234\167\129\226\132\179a\226\178\166\226\177\148\201\170\226\132\163a\225\186\149\226\177\148\201\170\226\156\158\234\167\130", 
    [103] = "\226\128\162\225\180\174\225\180\172\225\180\176\202\153\225\180\143\202\143\227\131\132", 
    [104] = "\234\167\129\224\166\148\224\167\163\226\152\172\226\156\158\240\157\147\147\240\157\150\148\240\157\150\147\226\156\158\226\152\172\224\166\148\224\167\163\234\167\130", 
    [105] = "\226\136\134\226\153\163\239\184\143JOKER\226\153\165\239\184\143\226\136\134", 
    [106] = "SpraY", 
    [107] = "\234\167\129\224\188\186\226\130\166\208\135\226\130\166\226\132\145\226\130\179\224\188\187\234\167\130", 
    [108] = "\226\158\162 I\225\180\141\225\180\141\225\180\143\202\128\225\180\155\225\180\128\202\159", 
    [109] = "\226\149\190\226\148\129\226\149\164\227\131\135\226\149\166\239\184\187 \226\130\179\226\130\173-\226\157\185\226\157\188 \240\157\147\176\240\157\147\184\240\157\147\173", 
    [110] = "\239\184\187\227\131\135\226\149\144\228\184\128GOD_SK", 
    [111] = "\240\159\133\188*\240\159\133\176\239\184\143*\240\159\134\133*\240\159\133\180*\240\159\134\129*\240\159\133\184*\240\159\133\178*\240\159\133\186", 
    [112] = "\224\188\186Le\205\165ge\205\163n\205\171d\224\188\187\225\180\179\225\181\146\225\181\136", 
    [113] = "\234\167\129\226\156\170\226\153\149BOT\226\153\149\226\156\170\234\167\130", 
    [114] = "\240\159\148\165\240\157\147\150\240\157\147\161\240\157\147\144\240\157\147\162\240\157\147\164\240\159\148\165", 
    [115] = "T\195\152XIC", 
    [116] = "\240\157\149\181\240\157\150\134\240\157\148\179\240\157\150\142\240\157\150\142 \226\156\170", 
    [117] = "\240\159\133\180\240\159\134\137\240\159\134\137 \240\159\133\189\240\159\133\190\239\184\143\240\159\133\190\239\184\143\240\159\133\177\239\184\143\240\159\134\130", 
    [118] = "\234\167\129\224\188\186J\204\189\205\147o\204\189\205\147s\204\189\205\147I\204\189\205\147\224\188\187\234\167\130", 
    [119] = "\226\153\161 AWP \226\128\147 senpai \226\151\149\226\128\191\226\151\149 [\227\131\132]", 
    [120] = "\227\131\133 [OnI-ChaN] FreSH[x]\226\152\170\239\184\143", 
    [121] = "\234\167\129\225\180\179\225\181\146\225\181\136Slayer\234\167\130", 
    [122] = "\224\188\186Le\205\165ge\205\163n\205\171d\224\188\187", 
    [123] = "\226\156\170\226\130\166\208\135\226\130\166\226\132\145\226\130\179\224\188\187\239\184\187\227\131\135\226\149\144\228\184\128", 
    [124] = ".S!ckBoY^", 
    [125] = "\240\157\149\190\240\157\150\153\240\157\150\154\240\157\150\151\240\157\150\146\240\157\149\189\240\157\150\138\240\157\150\135\240\157\150\138\240\157\150\145\240\157\150\145", 
    [126] = "\226\153\165\239\184\143\240\157\147\154\240\157\147\174\240\157\147\157\240\157\147\157\240\157\148\130\240\157\147\162\226\153\165\239\184\143", 
    [127] = "Snax", 
    [128] = "\234\167\129\224\166\148\224\167\163\226\152\172\226\156\158\240\157\147\181\240\157\147\174\240\157\147\176\240\157\147\174\240\157\147\183\240\157\147\173\203\161\225\181\146\225\181\155\225\181\137 \202\184\225\181\146\225\181\152\226\156\158\226\152\172\224\166\148\224\167\163\234\167\130", 
    [129] = "\226\153\149\209\149\208\189\209\148 \194\162\206\177\226\132\147\226\132\147 \208\188\209\148 \208\189\206\177\194\162", 
    [130] = "\226\156\170AnARcHY_", 
    [131] = "bl1tz", 
    [132] = "Carry Potter", 
    [133] = "\226\156\170TaCt1CaL", 
    [134] = "vk.com/vampire", 
    [135] = "\225\151\176E\225\151\176E \225\148\149E\225\145\142\225\148\149E", 
    [136] = "\226\128\157*\194\176\226\128\162.\226\152\133..Angel_Of_The_Night..\226\152\133.\226\128\162\194\176*\226\128\157\203\156", 
    [137] = "\195\177\198\164\195\188\206\178\194\163\207\175 \206\168\208\189\211\185\198\164\209\140 \207\175\194\163\225\131\156\209\143 \194\163\225\131\156\194\163\207\175 j\194\163\194\167\201\165\194\167", 
    [138] = "\196\153\206\178\195\163\197\130 \200\155\195\189\195\164 \226\136\154 \197\153\195\184\197\163", 
    [139] = "\229\191\141\227\129\179 1 \208\163\208\159\208\144\208\155 \227\129\179\229\191\141", 
    [140] = "MaJIeHkuu_Ho_OnacHekuu", 
    [141] = "\226\128\162\219\169\219\158\219\169[\204\178\204\133\208\159\204\178\204\133\208\190\204\178\204\133\208\155\204\178\204\133\208\174\204\178\204\133\208\177\204\178\204\133\208\144\204\178\204\133\208\161(\217\191)\204\178\204\133\208\167\204\178\204\133\208\184\204\133\208\162\204\178\204\178\208\144\208\154\204\178\204\133]\219\169\219\158\219\169\226\128\162", 
    [142] = "Y\208\177\208\152u\208\166\208\176_\208\154\209\128\208\152\208\191\208\149r\208\158\208\178", 
    [143] = "\208\162\208\181\208\191\208\181\209\128\209\140 \209\143 - \208\174\209\130\209\131\208\177\208\181\209\128 \208\158\208\188\208\187\208\181\209\130 (\226\151\163\226\151\162)", 
    [144] = "\226\146\182a\197\180\195\158 \239\184\187\227\131\135 \228\184\128 PUTIN", 
    [145] = "VAAAAAAAC \208\178 \209\135\208\176\209\130!!! (\227\129\165 \226\151\149\226\128\191\226\151\149 )", 
    [146] = "\227\129\165 \228\187\142\233\151\169\228\187\142\233\149\191\228\184\171 \228\187\168\228\186\148\233\151\169\228\186\186", 
    [147] = "+Yeb@shu_v_k@shu+", 
    [148] = "\194\163\225\131\156\195\191 \207\175\209\143", 
    [149] = "AHHAHAHHAHAHH LIFEHACK \226\153\165\239\184\143\226\153\165\239\184\143\226\153\165\239\184\143\226\153\165\239\184\143\226\153\165\239\184\143", 
    [150] = "\208\159\209\131\208\155\208\184_\208\158\209\130_\208\145\208\176\208\145\209\131\208\155\208\184", 
    [151] = "\208\159\208\176\208\160\208\181\208\157\209\140 \208\145\208\181\208\151 \209\129\208\162\209\128\208\144\209\133\208\144", 
    [152] = "\208\157.\208\149.\208\161.\208\158.\208\154.\208\160.\208\163.\208\168.\208\152.\208\156.\208\171.\208\153", 
    [153] = "KpyToI_4elOBeK", 
    [154] = "^^Stell^^::.[Pro_Game_Xom9k]", 
    [155] = "3Jlou_\208\151AdrOT", 
    [156] = "\195\177\195\188\209\171\194\164\198\164 \195\177\195\188\198\186\209\171\195\165 \207\175\195\191\198\186 \201\177\194\164\208\189\194\164\200\185\209\143", 
    [157] = "\209\143 \196\183\194\164\208\189\201\165\195\165\206\187 \207\175\206\178\194\164\194\163\195\188 \201\177\195\165\201\177\196\183\194\163 \206\178 \198\164\194\164\207\175", 
    [158] = "\226\146\182a\197\180\195\158 \239\184\187\227\131\135 \228\184\128", 
    [159] = "\208\186\208\190\208\188\209\129\208\190\208\188\208\190\208\187\209\140\209\129\208\186\208\184\208\185 \209\134\209\139\208\179\208\176\208\189", 
    [160] = "\208\189\208\190\209\129\208\176\209\130\209\139\208\185 \208\189\208\190\209\129 \209\128\208\176\208\185\208\183\208\181\208\189\208\176", 
    [161] = "\208\176\209\136\208\186\209\131\208\180\208\184\209\136\208\186\208\176 \209\129\208\190 \208\178\208\186\209\131\209\129\208\190\208\188 \209\131\209\133\208\176", 
    [162] = "pepper roni (\208\191\208\184\209\134\209\134\208\176) \209\129\208\190 \208\178\208\186\209\131\209\129\208\190\208\188 \209\129\208\188\208\181\209\130\208\176\208\189\209\139", 
    [163] = "METAN HVH", 
    [164] = "\208\168\208\146\208\149\208\148\208\161\208\154\208\152\208\153 \208\161\208\162\208\158\208\155 \208\147\208\160\208\152\208\147\208\158\208\160\208\152\208\175 \208\155\208\149\208\159\208\161\208\144", 
    [165] = "\208\144\208\144\208\144\208\144\208\144 \208\154\208\171\208\151\208\155\208\144\208\160 \208\154\208\163\208\162\208\144\208\154 \208\145\208\144\208\161 \208\144\208\168\208\144\208\155\208\144\208\156\208\144\208\157\208\144\208\144\208\144 \208\145\208\152\208\155\208\175\208\175\208\175 \208\173\208\163\208\163\208\163", 
    [166] = "Z V", 
    [167] = "\208\161\208\155\208\171\208\168\208\163 ZOV", 
    [168] = "\208\162\208\174\208\164\208\175\208\175\208\175\208\154 (\208\159\208\144\208\162\208\160\208\152\208\154)", 
    [169] = "GuGu_Zha_IIIagu", 
    [170] = "GyGaBait", 
    [171] = "ebaWu_V_KaWu (Z)", 
    [172] = "\208\156\208\144\208\156\208\152\208\157\208\158 \208\159\208\160\208\158\208\162\208\152\208\146\208\158\208\160\208\149\208\167\208\152\208\149", 
    [173] = "Nell\209\143\209\135\208\186\208\176 UwU", 
    [174] = "\208\164\208\184\208\187\209\140\208\188 \194\171\208\163\208\187\209\139\208\177\208\186\208\176\194\187", 
    [175] = "\208\154\208\190\209\130\208\187\208\181\209\130\208\190\209\129\209\139 \208\184\208\183 z\209\139\209\128\208\176", 
    [176] = "\208\154\208\176\208\186\208\176\208\190 \208\177\208\190\208\177\208\181\209\128", 
    [177] = "\208\164\208\176\208\187\209\140\209\136\208\184\208\178\208\176\209\143 \209\131\209\130\208\186\208\176", 
    [178] = "\208\160\209\139\209\129\208\186\208\176\208\189\208\184\208\181 \208\189\208\184\208\182\208\189\208\181\208\185 \209\135\208\176\209\129\209\130\208\184 \209\130\208\181\208\187\208\176", 
    [179] = "\208\179\209\131\209\129\208\181\208\185\208\189 \208\179\208\176\208\183", 
    [180] = "\209\130\209\131\208\176\208\187\208\181\209\130\208\189\209\139\208\185 \209\131\209\130\209\142\208\179", 
    [181] = "\208\147\208\176\208\183\208\190\208\178\208\176\208\189\208\184\209\143 \208\189\208\176 \209\131\208\180\208\176\209\135\209\131", 
    [182] = "\209\129\208\191\208\184\209\128\208\176\208\187\209\140 \208\188\208\176\208\189\209\139", 
    [183] = "\208\159\208\190\208\180\208\186\208\190\208\178\208\176 \209\129\209\128\208\176\208\186\208\190\209\130\208\176\208\189\208\176", 
    [184] = "\208\148\209\131\208\191\208\187\208\190 \209\133\208\190\208\188\209\143\208\186\208\176", 
    [185] = "\208\145\208\181\208\187\209\140\209\135\208\184\208\185 \208\176\209\131\208\187", 
    [186] = "\208\175\208\151\208\171\208\154 \208\162\208\149\208\155\208\144", 
    [187] = "\209\130\209\142\208\187\209\140\208\191\208\176\208\189\208\190\208\178\209\139\208\181 \208\179\208\190\209\128\209\139 \209\128\208\176\208\180\208\190\209\129\209\130\208\184", 
    [188] = "\208\161\209\139\209\128 \208\177\209\139\208\177 \209\128\209\139\209\128", 
    [189] = "\208\168\208\184\208\188\208\191\208\176\208\189Z\208\181 (\208\190\208\177\208\184\208\180\208\186\208\176)", 
    [190] = "\208\155\208\190\208\182\208\189\209\139\208\181 \208\190\209\130\209\129\209\130\208\176\208\178\208\176\208\189\208\184\209\143", 
    [191] = "\208\146\208\177\208\184\208\178 / \208\178\209\139\208\177\208\184\208\178 \208\183\209\131\208\177\208\190\208\178 \208\179.\208\163\209\128\209\142\208\191\208\184\208\189\209\129\208\186", 
    [192] = "\208\147\209\131\209\129\208\181\208\185\208\189 \208\179\208\176\208\183\209\131\208\185 \208\189\208\176\209\133", 
    [193] = "\208\151\208\181\208\189\208\184\209\134\208\176 \208\190\208\186\208\190", 
    [194] = "Zorix(csgo)", 
    [195] = "\208\159\208\184\208\180\208\181\209\128 \208\191\208\176\208\185\208\180\208\181\209\128", 
    [196] = "\208\151\209\131\208\177\209\139 \208\188\209\131\208\180\209\128\208\190\209\129\209\130\208\184", 
    [197] = "\208\169\208\181\208\186\208\190\209\130\208\189\208\190\208\181 \209\130\208\181\209\128\208\181\208\177\208\190\208\189\209\140\208\186\208\176\208\189\209\140\208\181", 
    [198] = "ZELTR1X", 
    [199] = "ZOLDY1337", 
    [200] = "K1neXj.", 
    [201] = "Evolvex", 
    [202] = "ANGELS HVH", 
    [203] = "\208\168\208\181\209\129\209\130\208\176\209\143 \208\191\209\143\209\130\208\186\208\176", 
    [204] = "\208\156\208\190\208\183\208\190\208\187\208\184\209\129\209\130\209\139\208\185 \209\136\208\176\208\187\208\190\208\191\208\176\208\185", 
    [205] = "\209\130\209\142\209\128\208\181\208\188\209\129\208\186\208\184\208\185 \209\131\208\183\209\131\209\128\208\191\208\176\209\130\208\190\209\128", 
    [206] = "\208\161\209\130\208\190\209\143\208\186 \208\191\209\139\209\133\209\130\209\131\208\189", 
    [207] = "\208\157\208\176\209\130\208\190\208\191\209\130\209\139\209\136\208\184", 
    [208] = "\208\157\208\176\208\177\209\128\208\176\208\187 \208\180\208\190\208\187\208\179\208\190\208\178", 
    [209] = "\208\151\208\176\208\177\208\184\208\178 \208\186\208\176\208\187\209\140\209\143\208\189\208\190\208\178", 
    [210] = "\208\162\209\131\209\128\208\189\208\184\209\135\208\186\208\190\208\178\208\176\209\143 \208\183\208\176\208\177\208\184\208\178\208\186\208\176", 
    [211] = "\208\162\209\128\208\181\208\189\208\184\209\128\208\190\208\178\208\186\208\176 \208\191\208\190\208\180 \208\180\208\190\208\182\208\180\208\181\208\188", 
    [212] = "\208\148\209\128\208\190\209\135\209\131 \209\129\209\130\208\190\209\143", 
    [213] = "\208\153\208\190\208\182\208\184\208\186 \208\182\209\131\209\133\208\187\209\139\208\185", 
    [214] = "\208\149\209\133\208\184\208\180\208\189\208\176\209\143 \209\133\208\176\209\128\209\143", 
    [215] = "\208\154\208\176\208\185\209\132\208\181\209\134\208\186\208\184\208\185 \208\186\209\131\208\188\208\176\209\128\209\135\208\184\208\186", 
    [216] = "\208\154\208\144\208\160\208\162\208\158\208\164\208\149\208\155\208\172", 
    [217] = "SANCHEZJ X FIPP", 
    [218] = "\208\147\208\149\208\158\208\160\208\147\208\152\208\153 \208\164\208\144\208\156\208\163\208\162\208\152\208\155\208\158\208\146", 
    [219] = "\208\144\208\151\208\144\208\151\208\144\208\151\208\144\208\151\208\144 \208\144\208\151\208\155\208\144\208\147\208\158\208\160", 
    [220] = "\208\160\208\181\208\177\208\181\208\189\208\190\208\186 \208\191\208\190\208\180\208\186\208\184\208\180\209\139\209\136\209\140", 
    [221] = "\208\148\208\149\208\162\208\152 \208\146 \208\159\208\158\208\148\208\146\208\144\208\155\208\149", 
    [222] = "\208\161\208\162\208\152\208\146\208\144\208\165\208\144", 
    [223] = "\208\164\209\128\208\190\209\129\209\130 \209\129\208\189\208\181\208\185\208\186 \208\184 \208\191\208\176\209\128\208\189\208\184\209\136\208\176", 
    [224] = "\208\162\208\152\208\156\208\158\208\164\208\149\208\153 \208\152 \208\149\208\147\208\158 \208\148\208\160\208\163\208\147 \208\159\208\172\208\175\208\157\208\171\208\153 \208\149\208\147\208\158\208\160", 
    [225] = "\208\151\208\176\208\177\208\187\208\190\208\186\208\184\209\128\208\190\208\178\208\176\208\189\208\189\209\139\208\185 \209\129\208\186\208\176\208\185\208\191", 
    [226] = "\208\148\208\158\208\154\208\162\208\158\208\160 \208\145\208\160\208\144\208\163\208\157? \209\129\208\187\209\131\209\136\208\176\209\142.", 
    [227] = "\208\144\208\160\208\158\208\156\208\144\208\162 \208\151\208\152\208\160\208\144\208\159\208\162\208\158\208\160\208\161\208\144 \208\161\208\161\208\171\208\162 \208\146 \208\160\208\144\208\154\208\158\208\146\208\152\208\157\208\163", 
    [228] = "\208\161\208\154\208\144\208\144\208\144\208\153", 
    [229] = "\208\148\208\190\208\186\209\130\208\190\209\128 \208\177\208\176\208\177\209\131\208\189", 
    [230] = "\208\189\208\184\209\130\209\128\208\176\209\130 \209\132\208\176\208\177\209\131\209\128\208\184\209\130\208\176", 
    [231] = "\209\135\208\181\209\128\208\189\208\190\208\179\208\190\208\187\208\190\208\178\208\186\208\176))", 
    [232] = "\208\161\209\129\209\139\208\186\208\176\208\189\209\140\208\181 \208\178 \209\130\208\176\208\183\208\184\208\186", 
    [233] = "\208\187\208\184\208\186\209\130\208\190\209\132\208\176\209\130 \208\189\208\176\209\130\209\128\208\184\209\143", 
    [234] = "\208\156\209\139\209\130\209\140\208\181 \208\178 \208\177\208\184\208\180\208\190\208\189\208\181", 
    [235] = "\208\189\208\184\208\191\208\190\209\128\209\130\208\176\208\188 \208\178 \209\128\208\176\208\186\208\190\208\178\208\184\208\189\208\181", 
    [236] = "\208\178\209\139\208\179\209\131\208\187\208\184\208\178\208\176\209\130\209\140 \208\186\208\190\208\187\208\177\208\176\209\129\209\131 \208\178\208\188\208\181\209\129\209\130\208\190 \209\129\208\190\208\177\208\176\208\186\208\184 \208\189\208\176 \208\177\208\176\208\187\208\186\208\190\208\189\208\181", 
    [237] = "\208\147\208\184\208\191\208\191\208\190\208\191\208\190\209\130\208\176\208\188 \209\129\209\139\209\128\208\189\209\139\208\185", 
    [238] = "\208\183\209\131\208\191\208\184\209\132\208\176\208\187\209\140\208\189\209\139\208\185 \208\189\208\176\208\183\208\176\208\187\209\140\208\189\209\139\208\185 \209\129\208\191\209\128\208\181\208\185 \208\180\208\187\209\143 \208\189\208\190\208\179\209\130\208\181\208\185", 
    [239] = "\208\159\208\184\208\180\208\190\209\128\209\129\208\186\208\184\208\181 \209\129\209\139\209\128\208\189\208\184\208\186\208\184", 
    [240] = "\208\179\208\190\208\179\208\184 \208\189\208\176 \209\131\209\128\208\190\208\179\208\184", 
    [241] = "GoGiMan777", 
    [242] = "\208\154\208\176\209\128\208\176\208\188\208\181\208\187\209\140\208\189\209\139\208\181 \208\189\208\190\208\179\208\190\209\130\208\190\209\135\208\186\208\184", 
    [243] = "\208\180\208\181\209\128\208\181\208\178\209\143\208\189\208\189\208\190\208\181 \209\143\208\177\208\187\208\190\208\186\208\190", 
    [244] = "\208\176\209\128\208\177\209\131\208\183\208\189\209\139\208\181 \209\129\208\187\208\176\208\189\209\134\209\139", 
    [245] = "hey? MACARENAA", 
    [246] = "\209\130\209\128\208\184\209\134\208\181\209\128\208\176\208\191\209\130\208\190\209\128\209\129", 
    [247] = "\208\165\208\190\209\128\208\190\209\136\208\176\209\143 \208\190\208\180\208\181\208\182\208\180\208\176", 
    [248] = "LXNER \209\128\208\181\208\191\208\184\209\128", 
    [249] = "\208\156\208\190\208\180\208\189\209\139\208\185 \208\191\209\128\208\184\208\179\208\190\208\178\208\190\209\128", 
    [250] = "\209\129\209\130\209\131\208\180\208\181\208\189\209\130", 
    [251] = "\208\160\208\181\208\187\208\184\208\183 sqwore", 
    [252] = "\209\133\208\176\208\185\208\191\208\181\209\128\208\191\208\190\208\191 \209\129\208\176\208\188\208\176\209\128\208\176", 
    [253] = "18\208\180\208\178\208\176\208\180\209\134\208\181\209\130\208\184\208\189", 
    [254] = "\208\166\208\184\209\130\209\128\209\131\209\129 \208\190\209\130 \208\183\209\131\208\180\208\176", 
    [255] = "\208\166\208\184\209\130\209\128\208\184\208\189\208\190\208\178\209\139\208\185 \208\186\208\176\209\136\208\181\208\187\209\140", 
    [256] = "\208\162\208\176\208\189\208\180\209\131\208\188 \208\178\208\181\209\128\208\180\208\181 \209\132\208\190\209\128\209\130\208\181", 
    [257] = "\208\162\208\144\208\145\208\163\208\157 \208\147\208\158\208\161\208\162\208\149\208\153", 
    [258] = "\208\158\208\155\208\149\208\147 \208\162\208\152\208\157\208\172\208\154\208\158\208\164\208\164", 
    [259] = "SAILOR MOON \208\160\208\158\208\145\208\149\208\160\208\162 \208\161 \208\144\208\160\208\145\208\163\208\151\208\158\208\156", 
    [260] = "\208\154\208\158\208\151\208\144\208\165\208\161\208\162\208\144\208\157 \208\171\208\171\208\171\208\171\208\171\208\144\208\144\208\144\208\144\208\144\208\144\208\144", 
    [261] = "\208\146\208\181\208\187\208\184\208\188\208\184\209\128 \209\129\208\191\208\184\209\128\208\184\208\180\208\190\208\189\208\190\208\178", 
    [262] = "\208\146\208\176\209\133\208\184\208\180 \208\177\208\176\208\177\208\181\208\178", 
    [263] = "\208\161\209\131\209\128\208\184\208\186\208\176\209\130\208\189\209\139\208\185 \209\130\209\131\209\136\208\186\208\176\208\189\209\135\208\184\208\186", 
    [264] = "\208\144\208\183\208\184\208\183 \209\136\208\176\208\178\208\181\209\128\209\136\209\143\208\189", 
    [265] = "\208\178\208\184\208\187\209\140\208\178\208\181\209\130\208\190\208\178\209\139\208\185 \208\190\209\129\209\140\208\188\208\184\208\189\208\190\208\179", 
    [266] = "\208\186\208\190\208\187\208\177\208\176\209\129\208\176 \209\129 \208\187\209\139\209\129\209\139\208\188 \208\188\209\131\208\182\208\184\208\186\208\190\208\188", 
    [267] = "\208\180\208\181\208\189\209\140\208\179\208\184 \208\184 \208\191\208\176\209\133\209\131\209\135\208\184\208\181 \208\189\208\190\208\179\208\184", 
    [268] = "\208\154\208\176\209\128\208\176\209\129\209\140 \209\129\208\190 \209\129\209\130\209\128\208\176\208\183\208\176\208\188\208\184", 
    [269] = "\208\160\208\171\208\145\208\144 \208\156\208\158\208\149\208\153 \208\156\208\149\208\167\208\162\208\152", 
    [270] = "\208\175\208\175\208\175\208\175\208\175\208\175\208\175\208\175\208\175\208\175\208\175\208\175\208\175\208\175\208\175\208\151\208\172", 
    [271] = "\208\162\209\131\208\189\208\181\209\134 \208\190\209\130 \209\133\208\176\208\187\208\184\208\186\208\184", 
    [272] = "\208\154\208\176\208\188\208\177\208\176\208\187\208\176 \208\178 \208\178\208\176\208\189\208\189\208\181", 
    [273] = "\208\186\208\176\208\187\209\140\209\143\208\189\208\184\208\183\208\176\209\134\208\184\209\143 \208\191\209\128\208\190\209\136\208\187\208\176 \209\131\209\129\208\191\208\181\209\136\208\189\208\190\240\159\140\185", 
    [274] = "\209\136\208\184\209\136\208\186\208\176 \208\178 \208\188\209\139\209\136\208\186\208\181", 
    [275] = "\208\159\208\187\208\190\209\130\208\189\208\190\208\181 \209\143\208\177\208\187\208\190\209\135\208\186\208\190", 
    [276] = "\208\187\208\190\208\191\208\176\209\129\209\130\208\184 \208\188\208\184\208\186\209\128\208\190\209\132\208\190\208\189\208\176", 
    [277] = "\208\154\209\131\208\188\208\176\209\128\208\189\208\176\209\143 \209\129\208\181\209\129\209\129\208\184\209\143", 
    [278] = "\208\186\208\187\208\176\208\178\208\184\208\176\209\130\209\131\209\128\208\176 \208\184\208\189\209\132\208\190\209\128\208\188\208\176\209\130\208\184\208\186\208\176", 
    [279] = "\208\159\209\128\208\190\208\177\208\184\209\128\208\186\208\176 \208\177\208\184\208\190\208\187\208\190\208\179\208\184\209\135\208\186\208\184", 
    [280] = "\208\183\208\181\208\187\208\181\208\189\208\190\208\181 \208\189\208\181\208\177\208\190 \208\178 \208\183\208\176\208\186\208\176\209\130\208\181", 
    [281] = "\209\130\208\181\208\188\208\189\208\190\208\181 \208\190\208\183\208\176\209\128\208\181\208\189\208\184\208\181 \209\130\208\181\208\191\208\187\208\176", 
    [282] = "\208\191\208\181\208\189\209\143\209\137\208\181\208\181 \209\129\209\135\208\176\209\129\209\130\209\140\208\181", 
    [283] = "\209\129\208\190 \209\129\208\186\208\184\209\130\209\131\208\187\209\140\208\186\208\190\208\185 \208\178 \208\188\208\188\209\131\208\187\209\142", 
    [284] = "\208\177\208\190\208\179\208\176\209\130\209\139\208\181 \208\178\208\190\208\187\208\190\209\129\209\139 \208\186\208\184\209\128\208\186\208\190\209\128\208\190\208\178\208\176", 
    [285] = "\208\152\208\179\209\128\208\176\209\142 \208\186\208\176\208\186 fifty", 
    [286] = "\208\186\208\190\209\128\208\190\208\178\208\176 \209\128\208\184\208\188\208\183\208\176\208\186\209\129\208\176", 
    [287] = "\208\160\208\176\208\188\208\190\208\189\209\139 \208\190\209\130 \209\129\208\181\209\128\208\181\208\179\208\184", 
    [288] = "\208\191\209\131\209\130\208\184\208\187\209\140\209\132\208\176\209\130 \208\179\209\131\208\187\209\140\208\183\208\176\208\189\209\130\208\184\209\143 (\208\191\209\128\208\184\208\178\208\181\209\130)", 
    [289] = "\209\128\208\176\209\132\209\139 \208\190\209\130 Raffaello", 
    [290] = "\208\186\209\128\208\176\209\129\208\189\208\176\209\143 \208\188\208\176\209\136\208\184\208\189\208\176 \209\129 \208\180\208\181\209\128\208\181\208\178\208\190\208\188 \208\190\209\130 \208\191\208\184\209\130\208\190\208\187\209\140\208\180\209\139", 
    [291] = "\208\159\209\128\208\184\208\186\208\190\208\187\209\140\208\189\209\139\208\185 \208\191\209\131\208\180\208\184\208\189\208\179 \208\190\209\130 \208\191\208\190\208\189\209\135\208\184\208\186\208\176", 
    [292] = "\208\186\208\190\208\182\208\176\208\189\208\176\209\143 \209\129\209\130\208\181\208\189\208\176", 
    [293] = "\208\191\208\190\208\180\209\129\209\130\208\190\208\187\209\140\208\189\209\139\208\181 \208\191\208\190\208\187\209\131\208\191\208\190\208\186\208\181\209\128\209\139", 
    [294] = "\208\176\208\188\209\129\209\130\208\181\209\128\208\180\208\176\208\188 \208\179\208\184\208\187\209\140\208\179\208\190\208\189\208\176", 
    [295] = "\208\151\208\178\208\190\208\189\208\190\208\186 \208\189\208\176 \209\131\209\128\208\190\208\186", 
    [296] = "\208\162\208\176\208\177\209\131\209\128\208\181\209\130 \208\190\209\135\208\186\208\184 \209\131\209\129\209\139", 
    [297] = "\208\167\208\184\209\130\208\176\209\142 \209\128\208\181\208\191\209\135\208\176\208\179\209\131", 
    [298] = "\208\167\208\152\208\159\208\161\208\152 \208\158\208\162 \208\160\208\149\208\157\208\149\208\147\208\144\208\162\208\144 \208\162\208\144\208\162\208\144\208\160\208\161\208\154\208\158\208\147\208\158", 
    [299] = "\208\162\208\144\208\162\208\144\208\160\208\161\208\154\208\152\208\153 MALIK163ONMYNECK", 
    [300] = "\208\157\208\158\208\146\208\171\208\153 \208\160\208\149\208\159\208\152\208\160", 
    [301] = "\208\146\208\163\208\156\208\159\208\152\208\160", 
    [302] = "\208\189\208\190\209\129\208\176\209\130\208\190\208\181 \209\131\208\181\208\177\208\184\209\137\208\181", 
    [303] = "\209\136\208\181\209\129\209\130\208\190\208\181 \209\135\209\131\208\178\209\129\209\130\208\178\208\190", 
    [304] = "\208\182\208\190\208\191\208\189\209\139\208\185 \208\191\209\128\208\181\208\180\208\184\208\186\209\130", 
    [305] = "\208\167\208\152\208\162\208\149\208\160\208\171 \208\152\208\156\208\149\208\174\208\162 6 \208\167\208\163\208\146\208\162\208\161\208\146\208\158", 
    [306] = "\208\162\208\160\208\149\208\162\208\152\208\153 \208\147\208\155\208\144\208\151 \208\157\208\144 \208\159\208\160\208\144\208\146\208\158\208\153 \208\169\208\149\208\154\208\149", 
    [307] = "\208\159\208\158\208\148\208\145\208\158\208\160\208\158\208\148\208\158\208\154 \208\146 \208\160\208\144\208\151\208\146\208\144\208\155 \208\161 \208\157\208\158\208\161\208\158\208\160\208\158\208\147\208\158\208\156", 
    [308] = "\208\147\208\157\208\152\208\155\208\158\208\153 \208\163\208\162\208\174\208\147", 
    [309] = "\208\159\208\172\208\175\208\157\208\144\208\175 \208\148\208\171\208\157\208\175", 
    [310] = "\208\145\208\149\208\168\208\149\208\157\208\171\208\153 \208\154\208\144\208\160\208\162\208\158\208\164\208\149\208\155\208\172", 
    [311] = "\208\159\209\140\209\143\208\189\209\139\208\185 \208\191\209\139\208\187\208\181\209\129\208\190\209\129", 
    [312] = "UWU GANG", 
    [313] = "\208\153\208\190\208\177\208\189\209\131\209\130\208\184\208\185 \208\181\208\182\208\184\208\186", 
    [314] = "\208\149\208\182\208\184\208\186 \208\178 \209\130\209\131\208\188\208\176\208\189\208\181", 
    [315] = "\208\156\208\176\208\189\209\131\208\187 \208\178 \208\183\208\190\208\190\208\191\208\176\209\128\208\186\208\181", 
    [316] = "\209\130\208\181\208\188\208\189\209\139\208\185 \208\178\208\176\208\187\208\181\209\130", 
    [317] = "\208\189\209\142\209\133\208\189\209\131\208\187 \208\191\208\190\208\180\208\188\209\139\209\133\208\176\209\128\208\184\208\186", 
    [318] = "\209\131\209\136\208\176\209\129\209\130\208\190 \208\177\208\190\208\187\209\140\209\136\208\184\208\181 \208\177\209\128\208\190\208\178\208\184", 
    [319] = "\208\191\208\190\209\133\208\190\208\182\209\131 \208\189\208\176 \209\143\208\189\208\180\208\181\208\186\209\129 \208\177\209\128\208\176\209\131\208\183\208\181\209\128", 
    [320] = "\208\161\208\187\208\190\208\189 \208\189\208\176 \208\186\209\128\208\190\208\186\208\190\208\180\208\184\208\187\208\181", 
    [321] = "\208\184\208\189\208\180\209\142\208\186 \208\178 \208\188\208\176\209\129\208\187\208\181", 
    [322] = "\208\177\209\131\209\128\208\180\209\142\208\186 \209\129 \208\191\209\128\208\184\208\186\208\190\208\187\208\190\208\188", 
    [323] = "\208\186\208\184\208\181\208\178\209\129\208\186\208\176\209\143 \208\186\208\190\209\130\208\187\208\181\209\130\208\176", 
    [324] = "\209\136\208\184\208\187\208\190 \208\189\208\176 \208\188\209\139\208\187\208\190", 
    [325] = "\208\145\208\176\208\177\209\131 \208\189\208\176 \208\186\208\176\208\188\208\181\208\189\209\140", 
    [326] = "\209\134\209\131\208\186\208\181\209\128\208\177\208\181\209\128\208\179 \208\191\208\176\208\189\208\183\208\181\209\128\209\132\208\176\209\131\209\129\209\130 1337", 
    [327] = "\208\183\208\176\208\191\208\190\209\128\208\190\208\182\209\140\208\181 9000", 
    [328] = "\208\156\208\190\209\129\208\186\208\178\208\184\209\135 65", 
    [329] = "\209\143 \209\135\209\130\208\190 \208\191\208\190\209\133\208\190\208\182 \208\189\208\176 \208\176\208\177\208\190\208\189\208\181\208\189\209\130\208\176", 
    [330] = "\208\161\208\181\209\128\208\181\208\179\208\176 \208\180\209\131\209\128\208\189\209\139\208\185", 
    [331] = "\208\184\208\178\208\176\208\189 \208\189\208\176\208\178\208\184", 
    [332] = "\208\158\209\130\208\178\208\181\209\130 \208\189\208\176 \209\130\208\190\208\188 \208\186\208\190\208\189\209\134\208\181", 
    [333] = "\208\161\208\178\208\181\209\130 \208\178 \208\189\208\176\209\135\208\176\208\187\208\181 \208\181\208\187\208\186\208\184", 
    [334] = "\209\129\208\181\209\128\208\179\208\181\208\185 \209\132\208\176\208\186\208\181\208\187", 
    [335] = "\209\133\209\131\208\185\208\191\208\176\209\129\209\130\209\128\208\184\208\191\209\129", 
    [336] = "\209\133\209\131\208\185\208\191\208\176\209\135\208\184\208\191\209\129", 
    [337] = "\208\165\209\131\208\185\208\191\208\176\209\129\208\190\208\187\209\140", 
    [338] = "\208\165\209\131\208\185\208\191\208\176\208\177\209\131\209\128\208\179\208\181\209\128", 
    [339] = "\208\160\208\184\209\129 \209\129 \208\186\208\176\209\129\209\139\208\188\208\176\208\186\208\190\208\188", 
    [340] = "\208\161\208\186\208\176\208\187\208\181\208\189\208\176\209\136 \208\188\208\190\209\130\209\139\208\179\208\176", 
    [341] = "\208\161\208\186\208\176\208\187\208\181\208\189\208\176\209\136 \209\130\208\176\208\186\209\139\209\136", 
    [342] = "\209\135\208\184\209\132\208\184\209\128\208\190\208\186 \209\129 \208\179\208\190\209\128\209\143\209\137\208\184\208\188 \208\186\208\190\209\130\208\190\208\188", 
    [343] = "\208\158\208\189\208\176 \209\129 \208\154\208\176\208\183\208\176\209\133\209\129\209\130\208\176\208\189\208\176", 
    [344] = "\208\157\208\176\209\129\208\178\208\176\208\185 \208\189\208\181 \208\186\208\184\208\180\208\176\208\181\208\188 \209\141\209\130\208\190 \209\133\208\176\209\128\208\176\208\188 \209\133\208\176\209\128\208\176\208\188", 
    [345] = "\209\131\209\129\208\176\209\130\208\190\208\181 \208\191\208\190\208\183\208\190\209\128\208\184\209\137\208\181", 
    [346] = "\208\163\209\130\209\128\208\181\208\189\208\189\208\184\208\185 \208\189\208\176\208\188\208\176\208\183 \208\191\208\190\208\180 \208\186\208\176\208\189\209\131\208\189 \208\189\208\190\208\178\208\190\208\179\208\190 \208\179\208\190\208\180\208\176", 
    [347] = "\208\188\209\139 \208\189\208\181 \208\180\208\181\208\187\208\176\208\181\208\188 \209\130\209\128\208\176\208\191 \208\188\209\139 \208\180\208\181\208\187\208\176\208\181\208\188 \208\177\208\190\208\187\209\140\209\136\208\184\208\181 \208\189\208\190\208\179\209\130\208\184", 
    [348] = "\209\131\208\183\208\177\208\181\208\186 \209\128\209\131\209\129\209\129\208\186\208\184\208\185", 
    [349] = "\208\157\208\176 \208\189\208\190\209\129\209\131 \208\179\208\181\209\128\208\190\208\184\208\189", 
    [350] = "\208\151\208\176\208\178\208\184\209\129\208\184\208\188\209\139\208\185 \209\129\208\176\208\188\208\190\208\178\208\176\209\128", 
    [351] = "\209\129\208\184\208\189\208\184\208\181 \208\178\208\190\208\187\208\190\209\129\209\139 \208\191\208\190\208\186\208\190\209\128\208\184\208\187\208\184 \208\189\208\181\208\177\208\190", 
    [352] = "ZV \209\136\208\188\208\176\208\187\209\140 \208\178 \208\191\208\187\208\181\209\135\208\181", 
    [353] = "\208\148\208\181\209\132\208\181\208\186\209\130\208\189\209\139\208\185 \208\191\208\181\209\128\209\132\208\190\209\128\208\176\209\130\208\190\209\128", 
    [354] = "\209\129\208\176\208\188\208\190\208\178\209\139\209\128\208\176\208\182\208\176\209\142\209\137\208\184\208\185 \208\189\208\184\208\186\209\129\208\178\208\176\209\128", 
    [355] = "\208\189\208\176\209\129\209\130\208\190\209\143\209\137\208\184\208\185 \208\191\209\131\208\177\208\181\209\128\209\130\208\176\208\189\209\130", 
    [356] = "Gloria damn", 
    [357] = "\208\176\208\189\209\130\208\190\208\187\208\190\208\179\208\184\209\143 \208\176\208\189\209\130\208\190\208\189\208\176", 
    [358] = "gloria fuck", 
    [359] = "cocki \209\143\208\186\208\184", 
    [360] = "\208\186\208\184\209\130\208\176\208\185\209\129\208\186\208\184\208\185 \209\128\208\181\208\191", 
    [361] = "\209\134\209\131\209\132\208\176\208\189\208\183\209\142 \209\132\208\176\208\188\208\181\209\128\208\179\208\181 (\209\133\208\178\209\133)", 
    [362] = "\208\186\209\131\209\130\208\176\208\187\208\177\209\139\208\186 \209\136\209\131\209\128\208\176\208\177\208\183\208\184\208\186", 
    [363] = "\209\130\209\131\208\191\208\190\208\185 \209\131\209\128\208\190\208\180", 
    [364] = "\209\129\209\131\208\188\208\186\208\176 \209\129\208\190 \208\178\208\186\209\131\209\129\208\190\208\188 \208\178\208\184\209\130\208\176\208\187\209\140\208\186\208\184", 
    [365] = "\209\135\208\181\209\128\208\181\208\191\208\176 \208\178 \208\176\209\132\208\179\208\176\208\189\208\184\209\129\209\130\208\176\208\189\208\181 \208\191\209\140\209\142\209\130 \208\188\208\184\208\186\209\128\208\190\209\132\208\190\208\189", 
    [366] = "\208\191\208\184\209\130\209\140 \208\181\208\180\209\131 \208\181\209\129\209\130\209\140 \208\178\208\190\208\180\209\131", 
    [367] = "\208\182\208\181\208\187\209\130\208\190\208\178\208\190\208\187\208\190\209\129\209\139\208\185 \208\191\208\176\209\129\208\191\208\190\209\128\209\130", 
    [368] = "\208\191\208\184\208\183\208\180\208\181\209\134 \208\188\208\181\208\189\209\143 \209\128\208\176\209\129\208\191\208\181\209\128\208\187\208\190 \208\189\208\176\209\133\209\131\208\185 \209\135\208\181\208\187", 
    [369] = "\208\151\208\176\208\187\208\190\208\179 \209\131\209\129\208\191\208\181\209\133\208\190\208\178", 
    [370] = "\208\160\209\139\208\177\208\176 \208\178 \208\186\208\187\209\143\209\128\208\181", 
    [371] = "\208\147\209\128\208\190\208\188\208\190\209\132\208\190\208\189", 
    [372] = "\208\168\209\131\208\177\208\176 \208\191\208\190\208\180 \209\129\208\181\208\187\208\181\208\180\208\186\208\190\208\185", 
    [373] = "\208\156\208\176\208\189\209\131\208\176\208\187 \208\191\208\190 \208\188\208\176\208\189\209\131\208\187\208\176\208\188", 
    [374] = "\208\157\208\152\208\154\208\158\208\147\208\148\208\144 \208\157\208\149 \208\159\208\160\208\158\208\152\208\147\208\160\208\171\208\146\208\144\208\162\208\172", 
    [375] = "\208\159\209\143\209\130\209\140\208\180\208\181\209\129\209\143\209\130", 
    [376] = "\209\129\208\181\208\188\209\140\209\129\208\190\209\130 \208\180\208\181\209\129\209\143\209\130\209\140", 
    [377] = "\208\179\209\128\209\143\208\188 \208\176\209\128\208\177\209\131\209\129\208\176", 
    [378] = "\208\178\208\181\209\129 \209\133\208\176\209\135\208\176", 
    [379] = "1\209\133\208\177\208\181\209\130", 
    [380] = "yamete kudasai ^^", 
    [381] = "\208\159\209\128\208\184\208\181\209\133\208\176\208\187\208\176 \209\135\208\184\209\133\209\131\208\176\209\133\209\131\208\176", 
    [382] = "\209\135\208\184\209\133\208\189\209\131\208\187 \208\177\208\181\208\183 \209\129\208\187\208\181\208\183", 
    [383] = "\208\176\208\187\209\140\208\191\208\181\208\189\208\184\209\129\209\130 \208\178 \208\191\208\181\209\129\208\186\208\181", 
    [384] = "\208\145\208\176\208\189\208\176\208\189\208\190\208\178\209\139\208\185 \209\128\208\176\208\185", 
    [385] = "\208\150\208\181\208\187\209\130\208\190\208\186 \208\189\208\176 \209\135\208\184\208\187\208\184\208\191\208\184\208\183\208\180\209\128\208\184\208\186\208\181", 
    [386] = "\208\147\208\190\208\178\208\190\209\128\209\143\209\137\208\184\208\185 \208\191\208\190\209\128\209\130\209\129\208\184\208\179\208\176\209\128", 
    [387] = "\208\159\208\181\209\128\208\181\208\178\208\181\209\128\208\189\209\131\209\130\208\176\209\143 \208\186\208\176\208\189\208\176\209\128\208\181\208\185\208\186\208\176", 
    [388] = "\208\182\208\181\209\129\209\130\208\186\208\184\208\185 \208\186\208\184\208\189\208\190\209\130\208\181\208\176\209\130\209\128", 
    [389] = "\208\151\208\184\208\188\208\189\208\181\208\181 \208\187\208\181\209\130\208\190", 
    [390] = "\209\130\209\128\208\181\209\130\208\184\208\185 \208\191\208\190\208\180\208\177\208\190\209\128\208\190\208\180\208\190\208\186", 
    [391] = "\208\155\209\140\209\142 \208\187\208\184\208\188\208\190\208\189\208\176\208\180 \208\188\208\184\208\188\208\190 \209\128\209\130\208\176", 
    [392] = "\208\159\208\181\209\128\208\181\208\183\208\176\209\128\209\143\208\182\208\176\209\142 \208\186\208\181\209\132\208\184\209\128", 
    [393] = "\208\186\208\176\209\136\208\187\209\143\209\142 \209\133\209\141\209\136\208\181\208\188", 
    [394] = "\208\156\208\190\208\187\208\190\208\186\208\190 2 \208\187\208\184\209\130\209\128\208\176", 
    [395] = "\208\186\208\190\208\187\208\177\208\176\209\129\208\176 \209\129 \208\186\208\176\208\191\209\131\209\129\209\130\208\190\208\185 \208\180\208\176 \208\181\209\137\208\181 \208\184 \209\129 \208\191\208\181\209\135\208\181\208\189\209\140\208\181\208\188", 
    [396] = "\208\180\208\176 \208\184 \208\178 \208\191\209\128\208\184\208\186\209\131\209\129\208\186\209\131 cock\208\176 \208\186\208\190\208\187\208\176", 
    [397] = "\208\165\208\184\209\130\209\128\209\139\208\185 \208\186\209\129\208\184\208\188\208\184", 
    [398] = "\208\157\208\190\208\178\208\190\208\188\208\190\208\180\208\189\209\139\208\185 vertu", 
    [399] = "\208\184\208\189\209\130\208\181\209\128\208\189\208\181\209\130 \208\186\208\176\208\177\208\181\208\187\209\140", 
    [400] = "\208\162\208\181\208\187\208\181\209\132\208\190\208\189\208\189\209\139\208\185 \209\136\208\189\209\131\209\128", 
    [401] = "\209\136\208\189\209\131\209\128 \208\180\208\187\209\143 \208\177\209\128\208\184\209\130\209\140\209\143", 
    [402] = "\208\145\208\176\209\128\208\176\208\177\208\176\209\136\208\186\208\176 \208\177\208\181\208\183 \208\186\208\176\209\130\209\131\209\136\208\181\208\186", 
    [403] = "\208\156\208\190\208\186\209\128\208\190\208\181 \208\177\208\181\208\187\209\140\208\181", 
    [404] = "\209\143\208\185\209\134\208\190 \209\129\208\190 \209\129\209\130\209\128\208\184\208\191\209\129\208\190\208\188 \208\178 \209\131\209\133\208\181", 
    [405] = "\208\188\208\190\208\184 \208\188\209\139\209\129\208\187\208\181 \208\189\208\176 \208\188\209\139\208\187\208\181 \208\190\208\189\208\184 so low", 
    [406] = "\208\146 \208\167\208\149\208\160\208\157\208\158\208\156 \208\161\208\159\208\152\208\161\208\154\208\149", 
    [407] = "\209\130\208\184\208\186\208\184 \209\130\208\190\208\186\208\184 \208\190\209\130 \208\177\209\131\209\128\208\188\208\176\208\187\208\180\209\139", 
    [408] = "\209\131\209\136\208\176\209\129\209\130\209\139\208\185 \209\136\208\190\208\186\208\190\208\187\208\176\208\180", 
    [409] = "\208\188\209\139\209\136\208\186\208\176 \208\187\208\190\208\179\208\184YECH", 
    [410] = "MinYEAT", 
    [411] = "\208\156\208\152\208\157\208\172\208\149\208\162", 
    [412] = "\208\147\208\176\209\128\208\184\208\186 \208\180\208\190 \209\135\208\181\208\187\209\142\209\129\209\130\208\184", 
    [413] = "\208\158\208\177\208\184\208\180\209\135\208\181\208\178\209\139\208\185 \209\136\208\186\208\190\208\187\209\140\208\189\208\184\208\186", 
    [414] = "\208\159\208\144\208\145\208\144\208\154\208\144 \208\163\208\155\208\171\208\145\208\144\208\154\208\144", 
    [415] = "\208\163\208\165-\208\162\208\171-\208\150-\208\153\208\158!", 
    [416] = "\208\149\209\130\208\184\208\182\208\184 \208\191\208\176\209\129\209\129\208\176\209\130\208\184\208\182\208\184", 
    [417] = "\208\168\208\184\208\187\208\190 \208\178 \209\128\209\139\208\187\208\190", 
    [418] = "\208\155\208\176\208\185\209\132 \208\178 \208\186\208\176\208\185\209\132", 
    [419] = "\208\154\208\144\208\153\208\164 \208\155\208\144\208\153\208\164", 
    [420] = "Zahar bobr", 
    [421] = "\208\146\208\181\209\128\208\176 \208\178 \208\183\208\176\208\188\208\176\209\143", 
    [422] = "15 \208\179\208\190\208\180 \209\141\209\130\208\190 \208\178\208\176\208\182\208\189\208\190", 
    [423] = "\208\154\208\190\208\187\209\143 \209\133\208\181\208\185\209\130\208\181\209\128", 
    [424] = "\208\191\208\184\209\129\209\142\208\189\208\184\209\129\209\130\209\139\208\185 \209\132\208\176\208\186\209\131\208\187\209\140\209\130\208\181\209\130", 
    [425] = "\208\178\209\129\208\181\208\188 \209\129\208\191\208\176\209\130\209\140", 
    [426] = "\208\178\208\181\208\187\209\140\208\178\208\181\209\130\208\190\208\178\209\139\208\185 \208\190\209\129\209\140\208\188\208\184\208\189\208\190\208\179", 
    [427] = "\208\188\209\143\209\129\208\189\208\190\208\185 \208\188\208\181\208\180\208\178\208\181\208\180", 
    [428] = "first day with neverlose.cc", 
    [429] = "https://vk.com/avtopodborkazahstan", 
    [430] = "\208\163\209\129\208\191\208\181\209\136\208\189\209\139\208\185 \208\176\208\178\209\130\208\190\208\188\208\190\208\177\208\184\208\187\208\184\209\129\209\130", 
    [431] = "\208\176\208\178\209\130\208\190\208\191\208\190\208\180\208\177\208\190\209\128 KZ", 
    [432] = "\208\145\208\176\208\183\208\190\208\178\208\176\209\143 \208\184 \208\191\208\190\208\187\208\189\208\176\209\143", 
    [433] = "\208\188\208\176\208\185 \208\176\208\187\208\188\208\176\208\185\208\180\209\139!", 
    [434] = "\208\144\209\129\209\130\209\139 \209\130\208\176\208\183\208\176, \209\129\209\130\208\176\208\186\208\176\208\189\208\180\208\176\209\128\209\139 \209\129\208\176\209\131"
};
do
    local l_v1446_18, l_v1598_15, l_v1599_15, l_v1600_14, l_v1601_15, l_v1602_17 = v1446, v1598, v1599, v1600, v1601, v1602;
    l_v1601_15 = function()
        -- upvalues: l_v1599_15 (ref)
        if l_v1599_15 == nil then
            return;
        else
            common.set_name(l_v1599_15);
            l_v1599_15 = nil;
            return;
        end;
    end;
    l_v1602_17 = function()
        -- upvalues: l_v1601_15 (ref)
        l_v1601_15();
    end;
    v1603 = nil;
    v1604 = function()
        -- upvalues: l_v1599_15 (ref), l_v1598_15 (ref), l_v1446_18 (ref), l_v1602_17 (ref)
        if l_v1599_15 == nil then
            l_v1599_15 = l_v1598_15:string();
        end;
        common.set_name(l_v1446_18.input:get());
        events.shutdown(l_v1602_17, true);
    end;
    v1605 = function()
        -- upvalues: l_v1601_15 (ref), l_v1602_17 (ref)
        l_v1601_15();
        events.shutdown(l_v1602_17, false);
    end;
    v1606 = function()
        -- upvalues: l_v1600_14 (ref), l_v1446_18 (ref)
        local v3390 = l_v1600_14[math.random(1, #l_v1600_14)];
        l_v1446_18.input:set(v3390);
    end;
    l_v1446_18.set_button:set_callback(v1604);
    l_v1446_18.reset_button:set_callback(v1605);
    l_v1446_18.generate_button:set_callback(v1606);
end;
v924 = nil;
v925 = {
    [1] = "crash", 
    [2] = "flush", 
    [3] = "buildmodelforworld", 
    [4] = "envmap", 
    [5] = "demos", 
    [6] = "+mat_texture_list", 
    [7] = "cc_random", 
    [8] = "kdtree_test", 
    [9] = "spincycle", 
    [10] = "-mat_texture_list", 
    [11] = "ai_test_los", 
    [12] = "cl_soundscape_printdebuginfo"
};
for v3391 = 1, #v925 do
    v1017 = v925[v3391];
    do
        local l_v3391_0 = v3391;
        cvar[v1017]:set_callback(function()
            -- upvalues: l_v3391_0 (ref)
            print("\aFF4040FFerror CV" .. l_v3391_0);
            return false;
        end);
    end;
end;
common.add_notify("dumped and fixed by zadyma.", "fuck trapsody $$")