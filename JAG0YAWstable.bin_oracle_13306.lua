local l_ffi_0 = require("ffi");

local l_clipboard_0 = (function()
    local ffi = require("ffi")
    local user32 = ffi.load("user32")
    local kernel32 = ffi.load("kernel32")
    ffi.cdef[[
        typedef int BOOL;
        typedef unsigned long HANDLE;
        typedef void* LPVOID;
        typedef void* HGLOBAL;
        typedef char* LPCSTR;
        BOOL OpenClipboard(void* hWndNewOwner);
        BOOL CloseClipboard();
        BOOL EmptyClipboard();
        HANDLE SetClipboardData(unsigned int uFormat, HANDLE hMem);
        HANDLE GetClipboardData(unsigned int uFormat);
        HGLOBAL GlobalAlloc(unsigned int uFlags, size_t dwBytes);
        LPVOID GlobalLock(HGLOBAL hMem);
        BOOL GlobalUnlock(HGLOBAL hMem);
        size_t GlobalSize(HGLOBAL hMem);
    ]]
    return {
        set = function(text)
            user32.OpenClipboard(nil)
            user32.EmptyClipboard()
            local len = #text + 1
            local hMem = kernel32.GlobalAlloc(0x0002, len)
            local pMem = kernel32.GlobalLock(hMem)
            ffi.copy(pMem, text, len)
            kernel32.GlobalUnlock(hMem)
            user32.SetClipboardData(1, hMem)
            user32.CloseClipboard()
        end,
        get = function()
            user32.OpenClipboard(nil)
            local hMem = user32.GetClipboardData(1)
            if hMem == nil then user32.CloseClipboard() return "" end
            local pMem = kernel32.GlobalLock(hMem)
            local text = ffi.string(pMem)
            kernel32.GlobalUnlock(hMem)
            user32.CloseClipboard()
            return text
        end
    }
end)();

local _ = {};


local l_gradient_0 = (function()
    return {
        text_animate = function(text, speed, colors)
            return {
                animate = function(self) end,
                get_animated_text = function(self)
                    return "\aFF0000FF" .. text
                end
            }
        end
    }
end)();

local l_smoothy_0 = (function()
    local smoothy = {}
    
    smoothy.new = function(initial)
        local obj = {
            value = initial or 0,
            target = initial or 0
        }
        
        local mt = {
            __call = function(self, speed, target)
                local target_val = target
                if type(target) == "boolean" then
                    target_val = target and 1 or 0
                end
                
                if target_val == nil then target_val = self.target end
                self.target = target_val
                
                if (self.value == 0 or self.value == nil) and type(target_val) == "userdata" then
                     self.value = target_val
                end

                if type(self.value) == "number" and type(target_val) == "number" then
                     self.value = self.value + (target_val - self.value) * speed
                elseif type(self.value) == "userdata" and self.value.x and target_val.x then
                     self.value = vector(
                        self.value.x + (target_val.x - self.value.x) * speed,
                        self.value.y + (target_val.y - self.value.y) * speed,
                        self.value.z + (target_val.z - self.value.z) * speed
                     )
                elseif type(self.value) == "userdata" and self.value.r and target_val.r then
                     self.value = color(
                        self.value.r + (target_val.r - self.value.r) * speed,
                        self.value.g + (target_val.g - self.value.g) * speed,
                        self.value.b + (target_val.b - self.value.b) * speed,
                        self.value.a + (target_val.a - self.value.a) * speed
                     )
                end
                
                return self.value
            end
        }
        setmetatable(obj, mt)
        return obj
    end
    
    return smoothy
end)();


local l_defensive_0 = (function()
    local v0 = {
        cmd = 0, 
        defensive = 0, 
        check = 0
    };
    events.createmove_run(function(v1)
        -- upvalues: v0 (ref)
        if v1.command_number == v0.cmd then
            local l_m_nTickBase_0 = entity.get_local_player().m_nTickBase;
            v0.defensive = math.abs(l_m_nTickBase_0 - v0.check);
            v0.check = math.max(l_m_nTickBase_0, v0.check or 0);
            v0.cmd = 0;
        end;
    end);
    events.createmove(function(v3)
        -- upvalues: v0 (ref)
        v0.cmd = v3.command_number;
    end);
    events.level_init(function()
        -- upvalues: v0 (ref)
        local l_v0_0 = v0;
        local l_v0_1 = v0;
        local v6 = 0;
        l_v0_1.defensive = 0;
        l_v0_0.check = v6;
    end);
    return function(v7)
        -- upvalues: v0 (ref)
        if v7 ~= nil then
            return v0.defensive;
        else
            return v0.defensive > 1 and v0.defensive < 14;
        end;
    end;
end)();

local _ = {};

if not files then
    files = {
        create_folder = function(dir) end,
        read = function(file) return nil end
    }
end
if not common then
    common = {
        get_username = function() return "User" end
    }
end

l_ffi_0.cdef("\n    int VirtualProtect(void* lpAddress, unsigned long dwSize, unsigned long flNewProtect, unsigned long* lpflOldProtect);\n    void* VirtualAlloc(void* lpAddress, unsigned long dwSize, unsigned long  flAllocationType, unsigned long flProtect);\n    int VirtualFree(void* lpAddress, unsigned long dwSize, unsigned long dwFreeType);\n    typedef uintptr_t (__thiscall* GetClientEntity_4242425_t)(void*, int);\n\n\ttypedef struct {\n\t} SYSTEMTIME, *LPSYSTEMTIME;\n\tvoid GetSystemTime(LPSYSTEMTIME lpSystemTime);\n\tvoid GetLocalTime(LPSYSTEMTIME lpSystemTime);\n\n\tbool DeleteUrlCacheEntryA(const char* lpszUrlName);\n\tvoid* __stdcall URLDownloadToFileA(void* LPUNKNOWN, const char* LPCSTR, const char* LPCSTR2, int a, int LPBINDSTATUSCALLBACK);\n\n    typedef void*(__thiscall* get_client_entity_t)(void*, int);\n\n    typedef struct\n    {\n        float x;\n        float y;\n        float z;\n    } Vector_t;\n\n    typedef struct {\n        char  pad_0000[20];\n        int m_nOrder; //0x0014\n        int m_nSequence; //0x0018\n        float m_flPrevCycle; //0x001C\n        float m_flWeight; //0x0020\n        float m_flWeightDeltaRate; //0x0024\n        float m_flPlaybackRate; //0x0028\n        float m_flCycle; //0x002C\n        void *m_pOwner; //0x0030\n        char  pad_0038[4]; //0x0034\n    } CAnimationLayer;\n");
local v31 = {
    round = function(v7, v8)
        local v9 = 10 ^ (v8 or 0);
        return math.floor(v7 * v9 + 0.5) / v9;
    end, 
    in_air = function(v10)
        if v10 == nil then
            return;
        else
            local l_m_fFlags_0 = v10.m_fFlags;
            if bit.band(l_m_fFlags_0, 1) == 0 then
                return true;
            else
                return false;
            end;
        end;
    end, 
    on_ground = function(v12)
        if v12 == nil then
            return;
        else
            local l_m_fFlags_1 = v12.m_fFlags;
            if bit.band(l_m_fFlags_1, 1) == 1 then
                return true;
            else
                return false;
            end;
        end;
    end, 
    is_crouching = function(v14)
        if v14 == nil then
            return;
        else
            local l_m_fFlags_2 = v14.m_fFlags;
            if bit.band(l_m_fFlags_2, 4) == 4 then
                return true;
            else
                return false;
            end;
        end;
    end, 
    get_velocity = function(v16)
        if v16 == nil then
            return;
        else
            return (v16.m_vecVelocity:length());
        end;
    end, 
    normalize_yaw = function(v17)
        while v17 > 180 do
            v17 = v17 - 360;
        end;
        while v17 < -180 do
            v17 = v17 + 360;
        end;
        return v17;
    end, 
    calc_shit = function(v18, v19)
        if v18 == 0 and v19 == 0 then
            return 0;
        else
            return math.deg(math.atan2(v19, v18));
        end;
    end, 
    get_nearest_enemy = function(_, v21)
        local v22 = entity.get_local_player();
        if not v22 or not v22:is_alive() then
            return;
        else
            local v23 = render.camera_position();
            local v24 = render.camera_angles();
            local v25 = vector():angles(v24);
            local l_huge_0 = math.huge;
            local v27 = nil;
            for v28 = 1, #v21 do
                local v29 = entity.get(v21[v28]);
                local v30 = v29:get_hitbox_position(1):dist_to_ray(v23, v25);
                if v30 < l_huge_0 then
                    l_huge_0 = v30;
                    v27 = v29;
                end;
            end;
            if not v27 then
                return;
            else
                return v27;
            end;
        end;
    end
};
v31.calc_angle = function(v32, v33, v34, v35)
    -- upvalues: v31 (ref)
    local v36 = v33 - v35;
    local v37 = v32 - v34;
    local v38 = math.atan(v36 / v37);
    v38 = v31.normalize_yaw(v38 * 180 / math.pi);
    if v37 >= 0 then
        v38 = v31.normalize_yaw(v38 + 180);
    end;
    return v38;
end;
v31.angle_vector = function(v39, v40)
    local v41 = math.sin(math.rad(v40));
    local v42 = math.cos(math.rad(v40));
    local v43 = math.sin(math.rad(v39));
    local v44 = math.cos(math.rad(v39));
    return v44 * v42, v44 * v41, -v43;
end;
v31.get_damage = function(_, v46, v47, v48, v49)
    local v50 = {};
    local v51 = {};
    local v52 = {};
    local l_x_0 = v46:get_hitbox_position(1).x;
    local l_y_0 = v46:get_hitbox_position(1).y;
    v52[0] = v46:get_hitbox_position(1).z;
    v51[0] = l_y_0;
    v50[0] = l_x_0;
    l_x_0 = v50[0] + 40;
    l_y_0 = v51[0];
    v52[1] = v52[0];
    v51[1] = l_y_0;
    v50[1] = l_x_0;
    l_x_0 = v50[0];
    l_y_0 = v51[0] + 40;
    v52[2] = v52[0];
    v51[2] = l_y_0;
    v50[2] = l_x_0;
    l_x_0 = v50[0] - 40;
    l_y_0 = v51[0];
    v52[3] = v52[0];
    v51[3] = l_y_0;
    v50[3] = l_x_0;
    l_x_0 = v50[0];
    l_y_0 = v51[0] - 40;
    v52[4] = v52[0];
    v51[4] = l_y_0;
    v50[4] = l_x_0;
    l_x_0 = v50[0];
    l_y_0 = v51[0];
    v52[5] = v52[0] + 40;
    v51[5] = l_y_0;
    v50[5] = l_x_0;
    l_x_0 = v50[0];
    l_y_0 = v51[0];
    v52[6] = v52[0] - 40;
    v51[6] = l_y_0;
    v50[6] = l_x_0;
    l_x_0 = {
        damage = 0
    };
    for v55 = 0, 6 do
        if l_x_0.damage == 0 or l_x_0.damage == nil then
            local v56, v57 = utils.trace_bullet(v46, vector(v50[v55], v51[v55], v52[v55]), vector(v47, v48, v49));
            l_x_0.trace = v57;
            l_x_0.damage = v56;
        end;
    end;
    return l_x_0.damage;
end;
local v58 = (function()
    if panorama then
        return panorama.loadstring("    return {\n        OpenExternalBrowserURL: function(url){\n            void SteamOverlayAPI.OpenExternalBrowserURL(url)\n        }\n    }\n")()
    else
        return {
            OpenExternalBrowserURL = function(url) end
        }
    end
end)();
local promouser = "zadyma."
local v59 = {
    urlmon = nil,
    wininet = nil
};
pcall(function() v59.urlmon = l_ffi_0.load("UrlMon") end)
pcall(function() v59.wininet = l_ffi_0.load("WinInet") end)
l_ffi_0.argument = function(v60, v61)
    return function(...)
        -- upvalues: v60 (ref), v61 (ref)
        return v60(v61, ...);
    end;
end;

if not utils then
    utils = {
        create_interface = function(dll, interface) return nil end,
        trace_bullet = function() return 0, {fraction=0} end
    }
end

local v62 = l_ffi_0.typeof("uintptr_t**");
local v63_ptr = utils.create_interface("engine.dll", "IEngineSoundClient003")
local v63 = nil
if v63_ptr and v63_ptr ~= 0 then
    v63 = l_ffi_0.cast(v62, v63_ptr);
end


if v63 then
    local _ = l_ffi_0.argument(l_ffi_0.cast("void*(__thiscall*)(void*, const char*, float, int, int, float)", v63[0][12]), v63);
end

v31.lerp = function(v65, v66, v67)
    return v65 + (v66 - v65) * v67;
end;
v31.gram_create = function(v68, v69)
    local v70 = {};
    for v71 = 1, v69 do
        v70[v71] = v68;
    end;
    return v70;
end;
v31.Download = function(v72, v73)
    -- upvalues: v59 (ref)
    -- Disabled to prevent crashes
    -- v59.wininet.DeleteUrlCacheEntryA(v72);
    -- v59.urlmon.URLDownloadToFileA(nil, v72, v73, 0, 0);
end;
v31.gradient_text = function(v74, v75, v76, v77, v78, v79, v80, v81, v82)
    local v83 = "";
    local v84 = #v82 - 1;
    local v85 = (v78 - v74) / v84;
    local v86 = (v79 - v75) / v84;
    local v87 = (v80 - v76) / v84;
    local v88 = (v81 - v77) / v84;
    for v89 = 1, v84 + 1 do
        v83 = v83 .. ("\a%02x%02x%02x%02x%s"):format(v74, v75, v76, v77, v82:sub(v89, v89));
        v74 = v74 + v85;
        v75 = v75 + v86;
        v76 = v76 + v87;
        v77 = v77 + v88;
    end;
    return v83;
end;
v31.colored_single_text = function(v90, v91, v92, v93, v94, v95, v96, v97, v98)
    local _ = "";
    return (("\a%02x%02x%02x%02x%s\a%02x%02x%02x%02x"):format(v90, v91, v92, v93, v94, v95, v96, v97, v98));
end;
v31.vectordistance = function(v100, v101, v102, v103, v104, v105)
    return math.sqrt(math.pow(v100 - v103, 2) + math.pow(v101 - v104, 2) + math.pow(v102 - v105, 2));
end;
v31.colored_text = function(v106, v107, v108, v109, v110)
    local _ = "";
    return (("\a%02x%02x%02x%02x%s"):format(v106, v107, v108, v109, v110));
end;
v31.colored_text2 = function(...)
    local v112 = {
        ...
    };
    local v113 = "";
    for _, v115 in pairs(v112) do
        local v116 = v115[1];
        local v117 = "";
        if v116:find("icon_") then
            v116 = ui.get_icon(v116:gsub("icon_", ""));
        end;
        if not v116 then
            v116 = "nil";
        end;
        if v115[2] == nil then
            v115[2] = "DEFAULT";
        end;
        if type(v115[2]) == "userdata" then
            v115[2] = v115[2]:to_hex();
            v117 = ("\a%s"):format(v115[2]);
        else
            v117 = "\a" .. v115[2];
        end;
        v113 = v113 .. v117 .. v116;
    end;
    return v113;
end;
v31.screen_size = render.screen_size();
files.create_folder("nl\\jagoyaw\\");
files.create_folder("nl\\jagoyaw\\fonts");
local v118 = {
    [1] = {
        link = "https://github.com/vektus1337/FONTS/raw/refs/heads/main/pixel.ttf", 
        dir = "nl\\jagoyaw\\fonts\\pixel.ttf"
    }, 
    [2] = {
        link = "https://github.com/vektus1337/FONTS/raw/refs/heads/main/lucida_console.ttf", 
        dir = "nl\\jagoyaw\\fonts\\lucida_console.ttf"
    }
};
-- Disabled download loop just to be sure that niggerpaste not crash
-- for _, v120 in pairs(v118) do
--     if not files.read(v120.dir) then
--         v31.Download(v120.link, v120.dir);
--     end;
-- end;
local v353 = (function()
    local v121 = 0;
    local l_pow_0 = math.pow;
    local l_sin_0 = math.sin;
    local l_cos_0 = math.cos;
    local l_pi_0 = math.pi;
    local l_sqrt_0 = math.sqrt;
    local l_abs_0 = math.abs;
    local l_asin_0 = math.asin;
    local function v132(v129, v130)
        -- upvalues: v121 (ref)
        v121 = v121 + g_GlobalVars.frametime * v129 * 0.01;
        local v131 = math.max(0, math.min(1, v121 % 2 - 0.5));
        if not v130 then
            return v131;
        else
            return v131, (print(v131));
        end;
    end;
    local function v137(v133, v134, v135, v136)
        return v135 * v133 / v136 + v134;
    end;
    local function v142(v138, v139, v140, v141)
        -- upvalues: l_pow_0 (ref)
        v138 = v138 / v141;
        return v140 * l_pow_0(v138, 2) + v139;
    end;
    local function v147(v143, v144, v145, v146)
        v143 = v143 / v146;
        return -v145 * v143 * (v143 - 2) + v144;
    end;
    local function v152(v148, v149, v150, v151)
        -- upvalues: l_pow_0 (ref)
        v148 = v148 / v151 * 2;
        if v148 < 1 then
            return v150 / 2 * l_pow_0(v148, 2) + v149;
        else
            return -v150 / 2 * ((v148 - 1) * (v148 - 3) - 1) + v149;
        end;
    end;
    local function v157(v153, v154, v155, v156)
        -- upvalues: v147 (ref), v142 (ref)
        if v153 < v156 / 2 then
            return v147(v153 * 2, v154, v155 / 2, v156);
        else
            return v142(v153 * 2 - v156, v154 + v155 / 2, v155 / 2, v156);
        end;
    end;
    local function v162(v158, v159, v160, v161)
        -- upvalues: l_pow_0 (ref)
        v158 = v158 / v161;
        return v160 * l_pow_0(v158, 3) + v159;
    end;
    local function v167(v163, v164, v165, v166)
        -- upvalues: l_pow_0 (ref)
        v163 = v163 / v166 - 1;
        return v165 * (l_pow_0(v163, 3) + 1) + v164;
    end;
    local function v172(v168, v169, v170, v171)
        v168 = v168 / v171 * 2;
        if v168 < 1 then
            return v170 / 2 * v168 * v168 * v168 + v169;
        else
            v168 = v168 - 2;
            return v170 / 2 * (v168 * v168 * v168 + 2) + v169;
        end;
    end;
    local function v177(v173, v174, v175, v176)
        -- upvalues: v167 (ref), v162 (ref)
        if v173 < v176 / 2 then
            return v167(v173 * 2, v174, v175 / 2, v176);
        else
            return v162(v173 * 2 - v176, v174 + v175 / 2, v175 / 2, v176);
        end;
    end;
    local function v182(v178, v179, v180, v181)
        -- upvalues: l_pow_0 (ref)
        v178 = v178 / v181;
        return v180 * l_pow_0(v178, 4) + v179;
    end;
    local function v187(v183, v184, v185, v186)
        -- upvalues: l_pow_0 (ref)
        v183 = v183 / v186 - 1;
        return -v185 * (l_pow_0(v183, 4) - 1) + v184;
    end;
    local function v192(v188, v189, v190, v191)
        -- upvalues: l_pow_0 (ref)
        v188 = v188 / v191 * 2;
        if v188 < 1 then
            return v190 / 2 * l_pow_0(v188, 4) + v189;
        else
            v188 = v188 - 2;
            return -v190 / 2 * (l_pow_0(v188, 4) - 2) + v189;
        end;
    end;
    local function v197(v193, v194, v195, v196)
        -- upvalues: v187 (ref), v182 (ref)
        if v193 < v196 / 2 then
            return v187(v193 * 2, v194, v195 / 2, v196);
        else
            return v182(v193 * 2 - v196, v194 + v195 / 2, v195 / 2, v196);
        end;
    end;
    local function v202(v198, v199, v200, v201)
        -- upvalues: l_pow_0 (ref)
        v198 = v198 / v201;
        return v200 * l_pow_0(v198, 5) + v199;
    end;
    local function v207(v203, v204, v205, v206)
        -- upvalues: l_pow_0 (ref)
        v203 = v203 / v206 - 1;
        return v205 * (l_pow_0(v203, 5) + 1) + v204;
    end;
    local function v212(v208, v209, v210, v211)
        -- upvalues: l_pow_0 (ref)
        v208 = v208 / v211 * 2;
        if v208 < 1 then
            return v210 / 2 * l_pow_0(v208, 5) + v209;
        else
            v208 = v208 - 2;
            return v210 / 2 * (l_pow_0(v208, 5) + 2) + v209;
        end;
    end;
    local function v217(v213, v214, v215, v216)
        -- upvalues: v207 (ref), v202 (ref)
        if v213 < v216 / 2 then
            return v207(v213 * 2, v214, v215 / 2, v216);
        else
            return v202(v213 * 2 - v216, v214 + v215 / 2, v215 / 2, v216);
        end;
    end;
    local function v222(v218, v219, v220, v221)
        -- upvalues: l_cos_0 (ref), l_pi_0 (ref)
        return -v220 * l_cos_0(v218 / v221 * (l_pi_0 / 2)) + v220 + v219;
    end;
    local function v227(v223, v224, v225, v226)
        -- upvalues: l_sin_0 (ref), l_pi_0 (ref)
        return v225 * l_sin_0(v223 / v226 * (l_pi_0 / 2)) + v224;
    end;
    local function v232(v228, v229, v230, v231)
        -- upvalues: l_cos_0 (ref), l_pi_0 (ref)
        return -v230 / 2 * (l_cos_0(l_pi_0 * v228 / v231) - 1) + v229;
    end;
    local function v237(v233, v234, v235, v236)
        -- upvalues: v227 (ref), v222 (ref)
        if v233 < v236 / 2 then
            return v227(v233 * 2, v234, v235 / 2, v236);
        else
            return v222(v233 * 2 - v236, v234 + v235 / 2, v235 / 2, v236);
        end;
    end;
    local function v242(v238, v239, v240, v241)
        -- upvalues: l_pow_0 (ref)
        if v238 == 0 then
            return v239;
        else
            return v240 * l_pow_0(2, 10 * (v238 / v241 - 1)) + v239 - v240 * 0.001;
        end;
    end;
    local function v247(v243, v244, v245, v246)
        -- upvalues: l_pow_0 (ref)
        if v243 == v246 then
            return v244 + v245;
        else
            return v245 * 1.001 * (-l_pow_0(2, -10 * v243 / v246) + 1) + v244;
        end;
    end;
    local function v252(v248, v249, v250, v251)
        -- upvalues: l_pow_0 (ref)
        if v248 == 0 then
            return v249;
        elseif v248 == v251 then
            return v249 + v250;
        else
            v248 = v248 / v251 * 2;
            if v248 < 1 then
                return v250 / 2 * l_pow_0(2, 10 * (v248 - 1)) + v249 - v250 * 5.0E-4;
            else
                v248 = v248 - 1;
                return v250 / 2 * 1.0005 * (-l_pow_0(2, -10 * v248) + 2) + v249;
            end;
        end;
    end;
    local function v257(v253, v254, v255, v256)
        -- upvalues: v247 (ref), v242 (ref)
        if v253 < v256 / 2 then
            return v247(v253 * 2, v254, v255 / 2, v256);
        else
            return v242(v253 * 2 - v256, v254 + v255 / 2, v255 / 2, v256);
        end;
    end;
    local function v262(v258, v259, v260, v261)
        -- upvalues: l_sqrt_0 (ref), l_pow_0 (ref)
        v258 = v258 / v261;
        return -v260 * (l_sqrt_0(1 - l_pow_0(v258, 2)) - 1) + v259;
    end;
    local function v267(v263, v264, v265, v266)
        -- upvalues: l_sqrt_0 (ref), l_pow_0 (ref)
        v263 = v263 / v266 - 1;
        return v265 * l_sqrt_0(1 - l_pow_0(v263, 2)) + v264;
    end;
    local function v272(v268, v269, v270, v271)
        -- upvalues: l_sqrt_0 (ref)
        v268 = v268 / v271 * 2;
        if v268 < 1 then
            return -v270 / 2 * (l_sqrt_0(1 - v268 * v268) - 1) + v269;
        else
            v268 = v268 - 2;
            return v270 / 2 * (l_sqrt_0(1 - v268 * v268) + 1) + v269;
        end;
    end;
    local function v277(v273, v274, v275, v276)
        -- upvalues: v267 (ref), v262 (ref)
        if v273 < v276 / 2 then
            return v267(v273 * 2, v274, v275 / 2, v276);
        else
            return v262(v273 * 2 - v276, v274 + v275 / 2, v275 / 2, v276);
        end;
    end;
    local function v285(v278, v279, v280, v281, v282, v283)
        -- upvalues: l_abs_0 (ref), l_pi_0 (ref), l_asin_0 (ref), l_pow_0 (ref), l_sin_0 (ref)
        if v278 == 0 then
            return v279;
        else
            v278 = v278 / v281;
            if v278 == 1 then
                return v279 + v280;
            else
                if not v283 then
                    v283 = v281 * 0.3;
                end;
                local v284 = nil;
                if not v282 or v282 < l_abs_0(v280) then
                    v282 = v280;
                    v284 = v283 / 4;
                else
                    v284 = v283 / (2 * l_pi_0) * l_asin_0(v280 / v282);
                end;
                v278 = v278 - 1;
                return -(v282 * l_pow_0(2, 10 * v278) * l_sin_0((v278 * v281 - v284) * (2 * l_pi_0) / v283)) + v279;
            end;
        end;
    end;
    local function v293(v286, v287, v288, v289, v290, v291)
        -- upvalues: l_abs_0 (ref), l_pi_0 (ref), l_asin_0 (ref), l_pow_0 (ref), l_sin_0 (ref)
        if v286 == 0 then
            return v287;
        else
            v286 = v286 / v289;
            if v286 == 1 then
                return v287 + v288;
            else
                if not v291 then
                    v291 = v289 * 0.3;
                end;
                local v292 = nil;
                if not v290 or v290 < l_abs_0(v288) then
                    v290 = v288;
                    v292 = v291 / 4;
                else
                    v292 = v291 / (2 * l_pi_0) * l_asin_0(v288 / v290);
                end;
                return v290 * l_pow_0(2, -10 * v286) * l_sin_0((v286 * v289 - v292) * (2 * l_pi_0) / v291) + v288 + v287;
            end;
        end;
    end;
    local function v301(v294, v295, v296, v297, v298, v299)
        -- upvalues: l_abs_0 (ref), l_pi_0 (ref), l_asin_0 (ref), l_pow_0 (ref), l_sin_0 (ref)
        if v294 == 0 then
            return v295;
        else
            v294 = v294 / v297 * 2;
            if v294 == 2 then
                return v295 + v296;
            else
                if not v299 then
                    v299 = v297 * 0.44999999999999996;
                end;
                if not v298 then
                    v298 = 0;
                end;
                local v300 = nil;
                if not v298 or v298 < l_abs_0(v296) then
                    v298 = v296;
                    v300 = v299 / 4;
                else
                    v300 = v299 / (2 * l_pi_0) * l_asin_0(v296 / v298);
                end;
                if v294 < 1 then
                    v294 = v294 - 1;
                    return -0.5 * (v298 * l_pow_0(2, 10 * v294) * l_sin_0((v294 * v297 - v300) * (2 * l_pi_0) / v299)) + v295;
                else
                    v294 = v294 - 1;
                    return v298 * l_pow_0(2, -10 * v294) * l_sin_0((v294 * v297 - v300) * (2 * l_pi_0) / v299) * 0.5 + v296 + v295;
                end;
            end;
        end;
    end;
    local function v308(v302, v303, v304, v305, v306, v307)
        -- upvalues: v293 (ref), v285 (ref)
        if v302 < v305 / 2 then
            return v293(v302 * 2, v303, v304 / 2, v305, v306, v307);
        else
            return v285(v302 * 2 - v305, v303 + v304 / 2, v304 / 2, v305, v306, v307);
        end;
    end;
    local function v314(v309, v310, v311, v312, v313)
        if not v313 then
            v313 = 1.70158;
        end;
        v309 = v309 / v312;
        return v311 * v309 * v309 * ((v313 + 1) * v309 - v313) + v310;
    end;
    local function v320(v315, v316, v317, v318, v319)
        if not v319 then
            v319 = 1.70158;
        end;
        v315 = v315 / v318 - 1;
        return v317 * (v315 * v315 * ((v319 + 1) * v315 + v319) + 1) + v316;
    end;
    local function v326(v321, v322, v323, v324, v325)
        if not v325 then
            v325 = 1.70158;
        end;
        v325 = v325 * 1.525;
        v321 = v321 / v324 * 2;
        if v321 < 1 then
            return v323 / 2 * (v321 * v321 * ((v325 + 1) * v321 - v325)) + v322;
        else
            v321 = v321 - 2;
            return v323 / 2 * (v321 * v321 * ((v325 + 1) * v321 + v325) + 2) + v322;
        end;
    end;
    local function v332(v327, v328, v329, v330, v331)
        -- upvalues: v320 (ref), v314 (ref)
        if v327 < v330 / 2 then
            return v320(v327 * 2, v328, v329 / 2, v330, v331);
        else
            return v314(v327 * 2 - v330, v328 + v329 / 2, v329 / 2, v330, v331);
        end;
    end;
    local function v337(v333, v334, v335, v336)
        v333 = v333 / v336;
        if v333 < 0.36363636363636365 then
            return v335 * (7.5625 * v333 * v333) + v334;
        elseif v333 < 0.7272727272727273 then
            v333 = v333 - 0.5454545454545454;
            return v335 * (7.5625 * v333 * v333 + 0.75) + v334;
        elseif v333 < 0.9090909090909091 then
            v333 = v333 - 0.8181818181818182;
            return v335 * (7.5625 * v333 * v333 + 0.9375) + v334;
        else
            v333 = v333 - 0.9545454545454546;
            return v335 * (7.5625 * v333 * v333 + 0.984375) + v334;
        end;
    end;
    local function v342(v338, v339, v340, v341)
        -- upvalues: v337 (ref)
        return v340 - v337(v341 - v338, 0, v340, v341) + v339;
    end;
    local function v347(v343, v344, v345, v346)
        -- upvalues: v342 (ref), v337 (ref)
        if v343 < v346 / 2 then
            return v342(v343 * 2, 0, v345, v346) * 0.5 + v344;
        else
            return v337(v343 * 2 - v346, 0, v345, v346) * 0.5 + v345 * 0.5 + v344;
        end;
    end;
    local function v352(v348, v349, v350, v351)
        -- upvalues: v337 (ref), v342 (ref)
        if v348 < v351 / 2 then
            return v337(v348 * 2, v349, v350 / 2, v351);
        else
            return v342(v348 * 2 - v351, v349 + v350 / 2, v350 / 2, v351);
        end;
    end;
    return {
        clamped_speed = v132, 
        visualize_state = VisualizeState, 
        linear = v137, 
        quad_in = v142, 
        quad_out = v147, 
        quad_in_out = v152, 
        quad_out_in = v157, 
        cubic_in = v162, 
        cubic_out = v167, 
        cubic_in_out = v172, 
        cubic_out_in = v177, 
        quart_in = v182, 
        quart_out = v187, 
        quart_in_out = v192, 
        quart_out_in = v197, 
        quint_in = v202, 
        quint_out = v207, 
        quint_in_out = v212, 
        quint_out_in = v217, 
        sine_in = v222, 
        sine_out = v227, 
        sine_in_out = v232, 
        sine_out_in = v237, 
        expo_in = v242, 
        expo_out = v247, 
        expo_in_out = v252, 
        expo_out_in = v257, 
        circ_in = v262, 
        circ_out = v267, 
        circ_in_out = v272, 
        circ_out_in = v277, 
        elastic_in = v285, 
        elastic_out = v293, 
        elastic_in_out = v301, 
        elastic_out_in = v308, 
        back_in = v314, 
        back_out = v320, 
        back_in_out = v326, 
        back_out_in = v332, 
        bounce_in = v342, 
        bounce_out = v337, 
        bounce_in_out = v347, 
        bounce_out_in = v352
    };
end)();
local v354 = {
    username = promouser,
    lua_name = "jag0yaw", 
    lua_version = "Stable"
};
local v355 = {
    list = {}
};
v355.push = function(v356)
    -- upvalues: v355 (ref)
    assert(v356.element, "Element is nil");
    assert(v356.index, "Index is nil");
    assert(type(v356.index) == "string", "Invalid type of index");
    v355.list[v356.index] = {};
    v355.list[v356.index].element = v356.element;
    v355.list[v356.index].flags = v356.flags or "";
    v355.list[v356.index].visible_state = function()
        -- upvalues: v356 (ref)
        if not v356.conditions then
            return true;
        else
            for _, v358 in pairs(v356.conditions) do
                if not v358() then
                    return false;
                end;
            end;
            return true;
        end;
    end;
    v355.list[v356.index].element:set_callback(v355.visibility_handle);
    v355.visibility_handle();
end;
v355.get = function(v359)
    -- upvalues: v355 (ref)
    return v355.list[v359] and v355.list[v359].element:get();
end;
v355.get_element = function(v360)
    -- upvalues: v355 (ref)
    return v355.list[v360] and v355.list[v360].element;
end;
v355.delete = function(v361)
    -- upvalues: v355 (ref)
    v355.get(v361):destroy();
    v355.list[v361] = nil;
end;
v355.contains = function(v362, v363)
    -- upvalues: v355 (ref)
    v362 = v355.get(v362);
    if type(v362) ~= "table" then
        return false;
    else
        for v364 = 1, #v362 do
            if v362[v364] == v363 then
                return true;
            end;
        end;
        return false;
    end;
end;
v355.visibility_handle = function(v365)
    -- upvalues: v355 (ref)
    if not v365 and ui.get_alpha() == 0 then
        return;
    else
        for _, v367 in pairs(v355.list) do
            v367.element:visibility(v367.visible_state());
        end;
        return;
    end;
end;
local v368 = {
    code = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
};
v368.encode = function(v369)
    -- upvalues: v368 (ref)
    return (v369:gsub(".", function(v370)
        local v371 = "";
        local v372 = v370:byte();
        for v373 = 8, 1, -1 do
            v371 = v371 .. (v372 % 2 ^ v373 - v372 % 2 ^ (v373 - 1) > 0 and "1" or "0");
        end;
        return v371;
    end) .. "0000"):gsub("%d%d%d?%d?%d?%d?", function(v374)
        -- upvalues: v368 (ref)
        if #v374 < 6 then
            return "";
        else
            local v375 = 0;
            for v376 = 1, 6 do
                v375 = v375 + (v374:sub(v376, v376) == "1" and 2 ^ (6 - v376) or 0);
            end;
            return v368.code:sub(v375 + 1, v375 + 1);
        end;
    end) .. ({
        [1] = "", 
        [2] = "==", 
        [3] = "="
    })[#v369 % 3 + 1];
end;
v368.decode = function(v377)
    -- upvalues: v368 (ref)
    return (string.gsub(v377, "[^" .. v368.code .. "=]", ""):gsub(".", function(v378)
        -- upvalues: v368 (ref)
        if v378 == "=" then
            return "";
        else
            local v379 = "";
            local v380 = v368.code:find(v378) - 1;
            for v381 = 6, 1, -1 do
                v379 = v379 .. (v380 % 2 ^ v381 - v380 % 2 ^ (v381 - 1) > 0 and "1" or "0");
            end;
            return v379;
        end;
    end):gsub("%d%d%d?%d?%d?%d?%d?%d?", function(v382)
        if #v382 ~= 8 then
            return "";
        else
            local v383 = 0;
            for v384 = 1, 8 do
                v383 = v383 + (v382:sub(v384, v384) == "1" and 2 ^ (8 - v384) or 0);
            end;
            return string.char(v383);
        end;
    end));
end;
v368.export = function()
    -- upvalues: v355 (ref), l_clipboard_0 (ref), v368 (ref)
    local v385 = {};
    for v386, v387 in pairs(v355.list) do
        if v387.flags == "c" then
            v385[v386] = {
                [1] = v355.list[v386].element:get().r, 
                [2] = v355.list[v386].element:get().g, 
                [3] = v355.list[v386].element:get().b, 
                [4] = v355.list[v386].element:get().a
            };
        elseif v387.flags ~= "-" then
            v385[v386] = v355.list[v386].element:get();
        end;
    end;
    l_clipboard_0.set(v368.encode(json.stringify(v385)));
end;
v368.import = function(v388)
    -- upvalues: v368 (ref), v355 (ref)
    local v389 = json.parse(v368.decode(v388));
    for v390, v391 in pairs(v389) do
        if v355.list[v390] then
            if v355.list[v390].flags == "c" then
                v355.get_element(v390):set(color(v391[1], v391[2], v391[3], v391[4]));
            else
                v355.get_element(v390):set(v391);
            end;
        end;
    end;
    v355.visibility_handle();
end;
local v392 = {
    plr_conditions = {
        [1] = "Global", 
        [2] = "Standing", 
        [3] = "Moving", 
        [4] = "Crouching T", 
        [5] = "Crouching CT", 
        [6] = "Slowwalk", 
        [7] = "Air duck", 
        [8] = "Air", 
        [9] = "Legit aa"
    }, 
    plr_conditions_to_int = {
        ["Legit aa"] = 9, 
        Air = 8, 
        ["Air duck"] = 7, 
        Slowwalk = 6, 
        ["Crouching CT"] = 5, 
        ["Crouching T"] = 4, 
        Moving = 3, 
        Standing = 2, 
        Global = 1
    }
};
local v393 = {
    pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
    yaw = {
        mode = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
        base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
        offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
        avoid_backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
        hidden_aa = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden")
    }, 
    yaw_modifier = {
        mode = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
        offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset")
    }, 
    body_yaw = {
        bodyyaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
        inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
        left_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
        right_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
        fake_options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
        desync_freestand = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding")
    }, 
    freestanding = {
        switch = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
        disable_yaw_modifiers = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"), 
        body_freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding")
    }, 
    leg_movement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"), 
    slowwalk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
    fakeduck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
    fakelag = {
        switch = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"), 
        limit = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"), 
        variability = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Variability")
    }, 
    auto_peek = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"), 
    hide_shots = {
        switch = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
        options = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options")
    }, 
    doubletap = {
        switch = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
        lag_options = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
        fakelag_limit = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit")
    }, 
    autoscope = ui.find("Aimbot", "Ragebot", "Accuracy", "Auto Scope"), 
    hitchance = {
        value = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance")
    }, 
    minimum_damage = {
        value = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage")
    }, 
    body_aim = {
        mode = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
        disablers = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim", "Disablers")
    }, 
    safe_point = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"), 
    hitbox_safety = ui.find("Aimbot", "Ragebot", "Safety", "Ensure Hitbox Safety"), 
    thirdperson = ui.find("Visuals", "World", "Main", "Force Thirdperson"), 
    override_zoom = {
        force_viewmodel = ui.find("Visuals", "World", "Main", "Override Zoom", "Force Viewmodel"), 
        scope_overlay = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay")
    }, 
    fake_latency = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"), 
    weapon_actions = ui.find("Miscellaneous", "Main", "Other", "Weapon Actions"), 
    dormant_aim = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot")
};
local v397 = {
    update_log = {}, 
    handle_updatelog = function(v394)
        local v395 = "";
        for v396 = 1, #v394 do
            v395 = v395 .. " - " .. v394[v396] .. (v396 ~= #v394 and "\n" or "");
        end;
        return v395;
    end
};
local v398 = {
    main = {
        info = ui.create(ui.get_icon("house"), ui.get_icon("house") .. " Home"), 
        config_system = ui.create(ui.get_icon("house"), ui.get_icon("folder") .. " Config System"), 
        config_system2 = ui.create(ui.get_icon("house"), ui.get_icon("folder") .. " Author's config", 2), 
        links = ui.create(ui.get_icon("house"), ui.get_icon("tag") .. " Links", 2)
    }, 
    anti_aim = {
        switch = ui.create(ui.get_icon("shield-halved"), ui.get_icon("user-shield") .. "  Anti Aim"), 
        builder = ui.create(ui.get_icon("shield-halved"), ui.get_icon("user-shield") .. " Condition"), 
        main = ui.create(ui.get_icon("shield-halved"), ui.get_icon("user-shield") .. "  Enhancements"), 
        settings = ui.create(ui.get_icon("shield-halved"), ui.get_icon("user-shield") .. " Builder", 2)
    }, 
    settings = {
        selection = ui.create(ui.get_icon("gears"), ui.get_icon("layer-group") .. " Selection"), 
        aimbot = ui.create(ui.get_icon("gears"), ui.get_icon("crosshairs") .. " Ragebot"), 
        visuals = ui.create(ui.get_icon("gears"), ui.get_icon("paintbrush") .. " Visuals", 1), 
        world_visuals = ui.create(ui.get_icon("gears"), ui.get_icon("earth-europe") .. " World Visuals", 2), 
        misc = ui.create(ui.get_icon("gears"), ui.get_icon("gears") .. " Miscellaneous", 2)
    }
};
v397.side_bar = {};
v397.side_bar.values = {
    timer = 0
};
v397.side_bar.run = function()
    -- upvalues: l_gradient_0 (ref)
    local v399 = l_gradient_0.text_animate("JAGOYAW", -1.4, {
        color(255, 255, 255), 
        color(163, 153, 198, 255)
    });
    v399:animate();
    ui.sidebar(v399:get_animated_text(), "crown");
end;
v398.main.info:label(string.format("Welcome Back, \a%s%s!", ui.get_style("Link Active"):to_hex(), promouser));
v398.main.info:label(string.format("Current Build \a858585FF\194\187 \a%s%s", ui.get_style("Link Active"):to_hex(), v354.lua_version));
network.get("https://neverlose.cc/static/avatars/aspyr.png", {}, function(v400)
     -- upvalues: v398 (ref)
     if v400 == "" then
         return;
     else
         v398.main.info:texture(render.load_image(v400, vector(255, 255)), vector(255, 255));
         return;
     end;
end);
v398.main.config_system:button("                          " .. ui.get_icon("file-export") .. " Export Config                         ", function()
    -- upvalues: v368 (ref), v354 (ref)
    local l_status_0, _ = pcall(v368.export);
    if l_status_0 then
        common.add_notify(v354.lua_name, "Succesfully exported settings to clipboard");
    else
        common.add_notify(v354.lua_name, "Error while exporting settings to clipboard");
    end;
end, true);
v398.main.config_system:button("                         " .. ui.get_icon("file-import") .. "  Import Config                         ", function()
    -- upvalues: l_clipboard_0 (ref), v368 (ref), v354 (ref)
    local v403 = l_clipboard_0.get();
    local l_status_1, _ = pcall(v368.import, v403);
    if l_status_1 then
        common.add_notify(v354.lua_name, "Succesfully imported settings from clipboard");
    else
        common.add_notify(v354.lua_name, "Error while importing config");
    end;
end, true);
v398.main.config_system2:button("                           " .. ui.get_icon("circle-check") .. "  Default Config                        ", function()
    -- upvalues: v368 (ref), v354 (ref)
    local l_status_2, _ = pcall(v368.import, "eyJTdGF0aWNfTWFudWFsX1lhdyI6ZmFsc2UsImFuaW1hdGlvbl9icmVha2VycyI6W10sImFudGlhaW1fcHJlc2V0cyI6IkV4cGVyaW1lbnRhbCIsImFudGlhaW1fc2V0dGluZ3MiOnRydWUsImFudGlhaW1fdHdlYWtzIjpbIldhcm11cCBBbnRpIEFpbSIsIkF2b2lkIEJhY2tzdGFiIiwiRmFzdCBMYWRkZXIgQ2xpbWIiLCJTYWZlIEhlYWQiXSwiYXJyb3dzX2NvbG9yIjpbMTQyLjAsMTY1LjAsMjI5LjAsMjU1LjBdLCJhcnJvd3Nfc3R5bGUiOiJEaXNhYmxlZCIsImFycm93c19zd2l0Y2giOmZhbHNlLCJhc3BlY3RfcmF0aW8iOnRydWUsImFzcGVjdF9yYXRpb192YWx1ZSI6MTQuMCwiYXV0b191bm11dGUiOnRydWUsImF2YXRhcl9zaWRlIjoiTGVmdCIsImNsYW50YWciOnRydWUsImNsYW50YWdfdGV4dCI6IiIsImNvbnNvbGVfY29sb3IiOlsyNTUuMCwyNTUuMCwyNTUuMCwyNTUuMF0sImNyb3NzaGFpcl9sYWJlbDEiOjMyNDc4MjgzMTkuMCwiY3Jvc3NoYWlyX3N0eWxlIjoiTW9kZXJuIiwiY3VzdG9tX2NvbnNvbGVfY29sb3IiOnRydWUsImN1c3RvbV9zY29wZV9jb2xvciI6WzE0Mi4wLDE2NS4wLDIyOS4wLDI1NS4wXSwiY3VzdG9tX3Njb3BlX2luYWNjdXJhY3kiOmZhbHNlLCJjdXN0b21fc2NvcGVfbGVuZ2h0IjoxMC4wLCJjdXN0b21fc2NvcGVfb2Zmc2V0Ijo3MC4wLCJjdXN0b21fc2NvcGVfc3dpdGNoIjp0cnVlLCJkZWJ1Z19pbmZvIjpmYWxzZSwiZGVidWdfaW5mb19jb2xvciI6WzE0Mi4wLDE2NS4wLDIyOS4wLDI1NS4wXSwiZGVmZW5zaXZlX2FuaXRpYW1fc3RhdGUiOiJBbHdheXMgb24iLCJkZWZlbnNpdmVfYW50aWFpbV9kaXNhYmxlcnMiOlsiTWFudWFsIFlhdyJdLCJkZWZlbnNpdmVfYW50aWFpbV9lbmFibGVBaXIiOmZhbHNlLCJkZWZlbnNpdmVfYW50aWFpbV9lbmFibGVBaXIgZHVjayI6ZmFsc2UsImRlZmVuc2l2ZV9hbnRpYWltX2VuYWJsZUNyb3VjaGluZyBDVCI6ZmFsc2UsImRlZmVuc2l2ZV9hbnRpYWltX2VuYWJsZUNyb3VjaGluZyBUIjpmYWxzZSwiZGVmZW5zaXZlX2FudGlhaW1fZW5hYmxlR2xvYmFsIjp0cnVlLCJkZWZlbnNpdmVfYW50aWFpbV9lbmFibGVMZWdpdCBhYSI6ZmFsc2UsImRlZmVuc2l2ZV9hbnRpYWltX2VuYWJsZU1vdmluZyI6ZmFsc2UsImRlZmVuc2l2ZV9hbnRpYWltX2VuYWJsZVNsb3d3YWxrIjpmYWxzZSwiZGVmZW5zaXZlX2FudGlhaW1fZW5hYmxlU3RhbmRpbmciOmZhbHNlLCJkZWZlbnNpdmVfY29uZGl0aW9ucyI6WyJTdGFuZGluZyIsIkNyb3VjaGluZyIsIkFpciBkdWNrIiwiQWlyIl0sImRlZmVuc2l2ZV9vbl9oaWRlc2hvdHMiOmZhbHNlLCJkZWZlbnNpdmVfcGl0Y2hfY3VzdG9tX3ZhbHVlQWlyIjowLjAsImRlZmVuc2l2ZV9waXRjaF9jdXN0b21fdmFsdWVBaXIgZHVjayI6MC4wLCJkZWZlbnNpdmVfcGl0Y2hfY3VzdG9tX3ZhbHVlQ3JvdWNoaW5nIENUIjowLjAsImRlZmVuc2l2ZV9waXRjaF9jdXN0b21fdmFsdWVDcm91Y2hpbmcgVCI6MC4wLCJkZWZlbnNpdmVfcGl0Y2hfY3VzdG9tX3ZhbHVlR2xvYmFsIjotODkuMCwiZGVmZW5zaXZlX3BpdGNoX2N1c3RvbV92YWx1ZUxlZ2l0IGFhIjowLjAsImRlZmVuc2l2ZV9waXRjaF9jdXN0b21fdmFsdWVNb3ZpbmciOjAuMCwiZGVmZW5zaXZlX3BpdGNoX2N1c3RvbV92YWx1ZVNsb3d3YWxrIjowLjAsImRlZmVuc2l2ZV9waXRjaF9jdXN0b21fdmFsdWVTdGFuZGluZyI6MC4wLCJkZWZlbnNpdmVfcGl0Y2hfbW9kZUFpciI6IkN1c3RvbSIsImRlZmVuc2l2ZV9waXRjaF9tb2RlQWlyIGR1Y2siOiJDdXN0b20iLCJkZWZlbnNpdmVfcGl0Y2hfbW9kZUNyb3VjaGluZyBDVCI6IkN1c3RvbSIsImRlZmVuc2l2ZV9waXRjaF9tb2RlQ3JvdWNoaW5nIFQiOiJDdXN0b20iLCJkZWZlbnNpdmVfcGl0Y2hfbW9kZUdsb2JhbCI6IkN1c3RvbSIsImRlZmVuc2l2ZV9waXRjaF9tb2RlTGVnaXQgYWEiOiJDdXN0b20iLCJkZWZlbnNpdmVfcGl0Y2hfbW9kZU1vdmluZyI6IkN1c3RvbSIsImRlZmVuc2l2ZV9waXRjaF9tb2RlU2xvd3dhbGsiOiJDdXN0b20iLCJkZWZlbnNpdmVfcGl0Y2hfbW9kZVN0YW5kaW5nIjoiQ3VzdG9tIiwiZGVmZW5zaXZlX3NldHRpbmdzIjp0cnVlLCJkZWZlbnNpdmVfeWF3X2N1c3RvbV92YWx1ZUFpciI6MC4wLCJkZWZlbnNpdmVfeWF3X2N1c3RvbV92YWx1ZUFpciBkdWNrIjowLjAsImRlZmVuc2l2ZV95YXdfY3VzdG9tX3ZhbHVlQ3JvdWNoaW5nIENUIjowLjAsImRlZmVuc2l2ZV95YXdfY3VzdG9tX3ZhbHVlQ3JvdWNoaW5nIFQiOjAuMCwiZGVmZW5zaXZlX3lhd19jdXN0b21fdmFsdWVHbG9iYWwiOjE4MC4wLCJkZWZlbnNpdmVfeWF3X2N1c3RvbV92YWx1ZUxlZ2l0IGFhIjowLjAsImRlZmVuc2l2ZV95YXdfY3VzdG9tX3ZhbHVlTW92aW5nIjowLjAsImRlZmVuc2l2ZV95YXdfY3VzdG9tX3ZhbHVlU2xvd3dhbGsiOjAuMCwiZGVmZW5zaXZlX3lhd19jdXN0b21fdmFsdWVTdGFuZGluZyI6MC4wLCJkZWZlbnNpdmVfeWF3X21vZGVBaXIiOiJDdXN0b20iLCJkZWZlbnNpdmVfeWF3X21vZGVBaXIgZHVjayI6IkN1c3RvbSIsImRlZmVuc2l2ZV95YXdfbW9kZUNyb3VjaGluZyBDVCI6IkN1c3RvbSIsImRlZmVuc2l2ZV95YXdfbW9kZUNyb3VjaGluZyBUIjoiQ3VzdG9tIiwiZGVmZW5zaXZlX3lhd19tb2RlR2xvYmFsIjoiU3BpbiIsImRlZmVuc2l2ZV95YXdfbW9kZUxlZ2l0IGFhIjoiQ3VzdG9tIiwiZGVmZW5zaXZlX3lhd19tb2RlTW92aW5nIjoiQ3VzdG9tIiwiZGVmZW5zaXZlX3lhd19tb2RlU2xvd3dhbGsiOiJDdXN0b20iLCJkZWZlbnNpdmVfeWF3X21vZGVTdGFuZGluZyI6IkN1c3RvbSIsImRtZ19pbmRpY2F0b3IiOnRydWUsImRtZ19pbmRpY2F0b3JfY29sb3IiOlsxNDIuMCwxNjUuMCwyMjkuMCwyNTUuMF0sImRtZ19pbmRpY2F0b3JfZm9udCI6IlNtYWxsIiwiZG91YmxldGFwX29wdGlvbnMiOltdLCJkb3VibGV0YXBfc3dpdGNoIjpmYWxzZSwiZmFrZV9sYWciOiJEZWZhdWx0IiwiZmFrZV9sYXRlbmN5X292ZXJyaWRlIjpmYWxzZSwiZmFrZV9sYXRlbmN5X292ZXJyaWRlX3ZhbHVlIjowLjAsImZha2VfbGltaXRfaml0dGVyX0FpciI6NjAuMCwiZmFrZV9saW1pdF9qaXR0ZXJfQWlyIGR1Y2siOjYwLjAsImZha2VfbGltaXRfaml0dGVyX0Nyb3VjaGluZyBDVCI6NjAuMCwiZmFrZV9saW1pdF9qaXR0ZXJfQ3JvdWNoaW5nIFQiOjYwLjAsImZha2VfbGltaXRfaml0dGVyX0dsb2JhbCI6NjAuMCwiZmFrZV9saW1pdF9qaXR0ZXJfTGVnaXQgYWEiOjYwLjAsImZha2VfbGltaXRfaml0dGVyX01vdmluZyI6NjAuMCwiZmFrZV9saW1pdF9qaXR0ZXJfU2xvd3dhbGsiOjYwLjAsImZha2VfbGltaXRfaml0dGVyX1N0YW5kaW5nIjo2MC4wLCJmYWtlX2xpbWl0X2xlZnRfQWlyIjo2MC4wLCJmYWtlX2xpbWl0X2xlZnRfQWlyIGR1Y2siOjYwLjAsImZha2VfbGltaXRfbGVmdF9Dcm91Y2hpbmcgQ1QiOjYwLjAsImZha2VfbGltaXRfbGVmdF9Dcm91Y2hpbmcgVCI6NjAuMCwiZmFrZV9saW1pdF9sZWZ0X0dsb2JhbCI6NjAuMCwiZmFrZV9saW1pdF9sZWZ0X0xlZ2l0IGFhIjo2MC4wLCJmYWtlX2xpbWl0X2xlZnRfTW92aW5nIjo2MC4wLCJmYWtlX2xpbWl0X2xlZnRfU2xvd3dhbGsiOjYwLjAsImZha2VfbGltaXRfbGVmdF9TdGFuZGluZyI6NjAuMCwiZmFrZV9saW1pdF9yYW5kb21fQWlyIjo2MC4wLCJmYWtlX2xpbWl0X3JhbmRvbV9BaXIgZHVjayI6NjAuMCwiZmFrZV9saW1pdF9yYW5kb21fQ3JvdWNoaW5nIENUIjo2MC4wLCJmYWtlX2xpbWl0X3JhbmRvbV9Dcm91Y2hpbmcgVCI6NjAuMCwiZmFrZV9saW1pdF9yYW5kb21fR2xvYmFsIjo2MC4wLCJmYWtlX2xpbWl0X3JhbmRvbV9MZWdpdCBhYSI6NjAuMCwiZmFrZV9saW1pdF9yYW5kb21fTW92aW5nIjo2MC4wLCJmYWtlX2xpbWl0X3JhbmRvbV9TbG93d2FsayI6NjAuMCwiZmFrZV9saW1pdF9yYW5kb21fU3RhbmRpbmciOjYwLjAsImZha2VfbGltaXRfcmlnaHRfQWlyIjo2MC4wLCJmYWtlX2xpbWl0X3JpZ2h0X0FpciBkdWNrIjo2MC4wLCJmYWtlX2xpbWl0X3JpZ2h0X0Nyb3VjaGluZyBDVCI6NjAuMCwiZmFrZV9saW1pdF9yaWdodF9Dcm91Y2hpbmcgVCI6NjAuMCwiZmFrZV9saW1pdF9yaWdodF9HbG9iYWwiOjYwLjAsImZha2VfbGltaXRfcmlnaHRfTGVnaXQgYWEiOjYwLjAsImZha2VfbGltaXRfcmlnaHRfTW92aW5nIjo2MC4wLCJmYWtlX2xpbWl0X3JpZ2h0X1Nsb3d3YWxrIjo2MC4wLCJmYWtlX2xpbWl0X3JpZ2h0X1N0YW5kaW5nIjo2MC4wLCJmYWtlX2xpbWl0X3R5cGVfQWlyIjoiU3RhdGljIiwiZmFrZV9saW1pdF90eXBlX0FpciBkdWNrIjoiU3RhdGljIiwiZmFrZV9saW1pdF90eXBlX0Nyb3VjaGluZyBDVCI6IlN0YXRpYyIsImZha2VfbGltaXRfdHlwZV9Dcm91Y2hpbmcgVCI6IlN0YXRpYyIsImZha2VfbGltaXRfdHlwZV9HbG9iYWwiOiJTdGF0aWMiLCJmYWtlX2xpbWl0X3R5cGVfTGVnaXQgYWEiOiJTdGF0aWMiLCJmYWtlX2xpbWl0X3R5cGVfTW92aW5nIjoiU3RhdGljIiwiZmFrZV9saW1pdF90eXBlX1Nsb3d3YWxrIjoiU3RhdGljIiwiZmFrZV9saW1pdF90eXBlX1N0YW5kaW5nIjoiU3RhdGljIiwiZmFrZV9vcHRpb25zX0FpciI6W10sImZha2Vfb3B0aW9uc19BaXIgZHVjayI6W10sImZha2Vfb3B0aW9uc19Dcm91Y2hpbmcgQ1QiOltdLCJmYWtlX29wdGlvbnNfQ3JvdWNoaW5nIFQiOltdLCJmYWtlX29wdGlvbnNfR2xvYmFsIjpbXSwiZmFrZV9vcHRpb25zX0xlZ2l0IGFhIjpbXSwiZmFrZV9vcHRpb25zX01vdmluZyI6W10sImZha2Vfb3B0aW9uc19TbG93d2FsayI6W10sImZha2Vfb3B0aW9uc19TdGFuZGluZyI6W10sImZha2VsYWdfZGlzYWJsZXJzIjpbIkRvdWJsZSBUYXAiLCJIaWRlIFNob3RzIiwiU3RhbmRpbmciXSwiZnJlZXN0YW5kaW5nX2tleSI6ZmFsc2UsImZyZWVzdGFuZGluZ19rZXkxIjp0cnVlLCJmcmVlc3RhbmRpbmdfa2V5MiI6dHJ1ZSwiZnJlZXN0YW5kaW5nX2tleTMiOlsiU2xvdyBXYWxrIiwiSW4gQWlyIiwiQ3JvdWNoaW5nIl0sImZyZWVzdGFuZGluZ19tb2RlX0FpciI6Ik9mZiIsImZyZWVzdGFuZGluZ19tb2RlX0FpciBkdWNrIjoiT2ZmIiwiZnJlZXN0YW5kaW5nX21vZGVfQ3JvdWNoaW5nIENUIjoiT2ZmIiwiZnJlZXN0YW5kaW5nX21vZGVfQ3JvdWNoaW5nIFQiOiJPZmYiLCJmcmVlc3RhbmRpbmdfbW9kZV9HbG9iYWwiOiJPZmYiLCJmcmVlc3RhbmRpbmdfbW9kZV9MZWdpdCBhYSI6Ik9mZiIsImZyZWVzdGFuZGluZ19tb2RlX01vdmluZyI6Ik9mZiIsImZyZWVzdGFuZGluZ19tb2RlX1Nsb3d3YWxrIjoiT2ZmIiwiZnJlZXN0YW5kaW5nX21vZGVfU3RhbmRpbmciOiJPZmYiLCJncmVuYWRlX3Rocm93X2ZpeCI6dHJ1ZSwiaGl0Y2hhbmNlX2FpciI6NTAuMCwiaGl0Y2hhbmNlX2Fpcl93ZWFwb25zIjpbXSwiaGl0Y2hhbmNlX2NvbmRpdGlvbiI6IkluIGFpciIsImhpdGNoYW5jZV9ub3Njb3BlIjo1MC4wLCJoaXRjaGFuY2Vfbm9zY29wZV93ZWFwb25zIjpbXSwiaGl0Y2hhbmNlX3N3aXRjaCI6ZmFsc2UsImhpdG1hcmtlciI6ZmFsc2UsImhpdG1hcmtlcl9kYW1hZ2VfY29sb3IiOlsyNTUuMCwyNTUuMCwyNTUuMCwyNTUuMF0sImhpdG1hcmtlcl9wbHVzX2NvbG9yIjpbMjU1LjAsMjU1LjAsMjU1LjAsMjU1LjBdLCJoaXRtYXJrZXJfdHlwZSI6W10sImluZGljYXRvcnNfY29sb3IiOlsyNTUuMCwyNTUuMCwyNTUuMCwyNTUuMF0sImluZGljYXRvcnNfY29sb3IyIjpbMTQyLjAsMTY1LjAsMjI5LjAsMjU1LjBdLCJpbmRpY2F0b3JzX2ZvbnQiOiJTbWFsbCIsImluZGljYXRvcnNfaGVpZ2h0IjoyMy4wLCJpbmRpY2F0b3JzX3N3aXRjaCI6dHJ1ZSwiaW52ZXJ0ZXJfQWlyIjpmYWxzZSwiaW52ZXJ0ZXJfQWlyIGR1Y2siOmZhbHNlLCJpbnZlcnRlcl9Dcm91Y2hpbmcgQ1QiOmZhbHNlLCJpbnZlcnRlcl9Dcm91Y2hpbmcgVCI6ZmFsc2UsImludmVydGVyX0dsb2JhbCI6ZmFsc2UsImludmVydGVyX0xlZ2l0IGFhIjpmYWxzZSwiaW52ZXJ0ZXJfTW92aW5nIjpmYWxzZSwiaW52ZXJ0ZXJfU2xvd3dhbGsiOmZhbHNlLCJpbnZlcnRlcl9TdGFuZGluZyI6ZmFsc2UsImxlZ2l0YWFfYXRfdGFyZ2V0cyI6ZmFsc2UsImxlZ2l0YWFfaml0dGVyIjpmYWxzZSwibGVnaXRhYV9rZXkiOmZhbHNlLCJsb2dzX25vdGlmeSI6dHJ1ZSwibG9nc19ub3RpZnlfY29sb3JfaGl0IjpbMTQyLjAsMTY1LjAsMjI5LjAsMjU1LjBdLCJsb2dzX25vdGlmeV9jb2xvcl9taXNzIjpbMTQyLjAsMTY1LjAsMjI5LjAsMjU1LjBdLCJtYW51YWxfeWF3IjoiQXQgVGFyZ2V0Iiwibm9fZmFsbF9kYW1hZ2UiOmZhbHNlLCJwcmVzZXRfZW5hYmxlX0FpciI6ZmFsc2UsInByZXNldF9lbmFibGVfQWlyIGR1Y2siOmZhbHNlLCJwcmVzZXRfZW5hYmxlX0Nyb3VjaGluZyBDVCI6ZmFsc2UsInByZXNldF9lbmFibGVfQ3JvdWNoaW5nIFQiOmZhbHNlLCJwcmVzZXRfZW5hYmxlX0dsb2JhbCI6ZmFsc2UsInByZXNldF9lbmFibGVfTGVnaXQgYWEiOmZhbHNlLCJwcmVzZXRfZW5hYmxlX01vdmluZyI6ZmFsc2UsInByZXNldF9lbmFibGVfU2xvd3dhbGsiOmZhbHNlLCJwcmVzZXRfZW5hYmxlX1N0YW5kaW5nIjpmYWxzZSwicmFnZWJvdF9sb2dzIjp0cnVlLCJyZW1vdmVfdG9wX2JhciI6ZmFsc2UsInJldm9sdmVyX2hlbHBlciI6ZmFsc2UsInNuYXBsaW5lc19YREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREIjpmYWxzZSwic25hcGxpbmVzX1hERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERfY29sb3IiOlsxMi4wLDEyLjAsMTIuMCwyNTUuMF0sInN0YXRpY19yYWdkb2xscyI6ZmFsc2UsInRhc2tiYXJfbm90aWZ5IjpmYWxzZSwidGVsZXBvcnRfaW5haXIiOmZhbHNlLCJ0cmFzaCI6ZmFsc2UsInRyYXNoX3dhcm11cCI6ZmFsc2UsInVpX2NvbG9yIjpbMTQyLjAsMTY1LjAsMjI5LjAsMjU1LjBdLCJ1aV9lbGVtZW50cyI6WyJXYXRlcm1hcmsiLCJLZXliaW5kcyJdLCJ1aV9zdHlsZSI6Ik1vZGVybiIsInZpZXdtb2RlbCI6dHJ1ZSwidmlld21vZGVsX2ZvdiI6NTMuMCwidmlld21vZGVsX3giOjEuMCwidmlld21vZGVsX3kiOi01LjAsInZpZXdtb2RlbF96IjotMS4wLCJ3YXJtdXBfY3Jhenltb2RlIjpmYWxzZSwid2F0ZXJtYXJrX25hbWUiOiJDaGVhdCIsIndhdGVybWFya19uYW1lX3JlZiI6IiIsInlhd19hZGRfbGVmdF9BaXIiOjAuMCwieWF3X2FkZF9sZWZ0X0FpciBkdWNrIjowLjAsInlhd19hZGRfbGVmdF9Dcm91Y2hpbmcgQ1QiOjAuMCwieWF3X2FkZF9sZWZ0X0Nyb3VjaGluZyBUIjowLjAsInlhd19hZGRfbGVmdF9HbG9iYWwiOi0yNi4wLCJ5YXdfYWRkX2xlZnRfTGVnaXQgYWEiOi0xODAuMCwieWF3X2FkZF9sZWZ0X01vdmluZyI6MC4wLCJ5YXdfYWRkX2xlZnRfU2xvd3dhbGsiOjAuMCwieWF3X2FkZF9sZWZ0X1N0YW5kaW5nIjowLjAsInlhd19hZGRfcmlnaHRfQWlyIjowLjAsInlhd19hZGRfcmlnaHRfQWlyIGR1Y2siOjAuMCwieWF3X2FkZF9yaWdodF9Dcm91Y2hpbmcgQ1QiOjAuMCwieWF3X2FkZF9yaWdodF9Dcm91Y2hpbmcgVCI6MC4wLCJ5YXdfYWRkX3JpZ2h0X0dsb2JhbCI6NjAuMCwieWF3X2FkZF9yaWdodF9MZWdpdCBhYSI6LTE4MC4wLCJ5YXdfYWRkX3JpZ2h0X01vdmluZyI6MC4wLCJ5YXdfYWRkX3JpZ2h0X1Nsb3d3YWxrIjowLjAsInlhd19hZGRfcmlnaHRfU3RhbmRpbmciOjAuMCwieWF3X2FkZF90eXBlX0FpciI6IlN0YXRpYyIsInlhd19hZGRfdHlwZV9BaXIgZHVjayI6IlN0YXRpYyIsInlhd19hZGRfdHlwZV9Dcm91Y2hpbmcgQ1QiOiJTdGF0aWMiLCJ5YXdfYWRkX3R5cGVfQ3JvdWNoaW5nIFQiOiJTdGF0aWMiLCJ5YXdfYWRkX3R5cGVfR2xvYmFsIjoiU3RhdGljIiwieWF3X2FkZF90eXBlX0xlZ2l0IGFhIjoiU3RhdGljIiwieWF3X2FkZF90eXBlX01vdmluZyI6IlN0YXRpYyIsInlhd19hZGRfdHlwZV9TbG93d2FsayI6IlN0YXRpYyIsInlhd19hZGRfdHlwZV9TdGFuZGluZyI6IlN0YXRpYyIsInlhd19kZWxheV9BaXIiOjAuMCwieWF3X2RlbGF5X0FpciBkdWNrIjowLjAsInlhd19kZWxheV9Dcm91Y2hpbmcgQ1QiOjAuMCwieWF3X2RlbGF5X0Nyb3VjaGluZyBUIjowLjAsInlhd19kZWxheV9HbG9iYWwiOjAuMCwieWF3X2RlbGF5X0xlZ2l0IGFhIjowLjAsInlhd19kZWxheV9Nb3ZpbmciOjAuMCwieWF3X2RlbGF5X1Nsb3d3YWxrIjowLjAsInlhd19kZWxheV9TdGFuZGluZyI6MC4wLCJ5YXdfbW9kaWZpZXJfQWlyIjoiRGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXJfQWlyIGR1Y2siOiJEaXNhYmxlZCIsInlhd19tb2RpZmllcl9Dcm91Y2hpbmcgQ1QiOiJEaXNhYmxlZCIsInlhd19tb2RpZmllcl9Dcm91Y2hpbmcgVCI6IkRpc2FibGVkIiwieWF3X21vZGlmaWVyX0dsb2JhbCI6Ik9mZnNldCIsInlhd19tb2RpZmllcl9MZWdpdCBhYSI6IkRpc2FibGVkIiwieWF3X21vZGlmaWVyX01vdmluZyI6IkRpc2FibGVkIiwieWF3X21vZGlmaWVyX1Nsb3d3YWxrIjoiRGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXJfU3RhbmRpbmciOiJEaXNhYmxlZCIsInlhd19tb2RpZmllcl9yYW5kb21pemVfQWlyIjpmYWxzZSwieWF3X21vZGlmaWVyX3JhbmRvbWl6ZV9BaXIgZHVjayI6ZmFsc2UsInlhd19tb2RpZmllcl9yYW5kb21pemVfQ3JvdWNoaW5nIENUIjpmYWxzZSwieWF3X21vZGlmaWVyX3JhbmRvbWl6ZV9Dcm91Y2hpbmcgVCI6ZmFsc2UsInlhd19tb2RpZmllcl9yYW5kb21pemVfR2xvYmFsIjp0cnVlLCJ5YXdfbW9kaWZpZXJfcmFuZG9taXplX0xlZ2l0IGFhIjpmYWxzZSwieWF3X21vZGlmaWVyX3JhbmRvbWl6ZV9Nb3ZpbmciOmZhbHNlLCJ5YXdfbW9kaWZpZXJfcmFuZG9taXplX1Nsb3d3YWxrIjpmYWxzZSwieWF3X21vZGlmaWVyX3JhbmRvbWl6ZV9TdGFuZGluZyI6ZmFsc2UsInlhd19tb2RpZmllcl9yYW5kb21pemVfdmFsdWVfQWlyIjowLjAsInlhd19tb2RpZmllcl9yYW5kb21pemVfdmFsdWVfQWlyIGR1Y2siOjAuMCwieWF3X21vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZV9Dcm91Y2hpbmcgQ1QiOjAuMCwieWF3X21vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZV9Dcm91Y2hpbmcgVCI6MC4wLCJ5YXdfbW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlX0dsb2JhbCI6MC4wLCJ5YXdfbW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlX0xlZ2l0IGFhIjowLjAsInlhd19tb2RpZmllcl9yYW5kb21pemVfdmFsdWVfTW92aW5nIjowLjAsInlhd19tb2RpZmllcl9yYW5kb21pemVfdmFsdWVfU2xvd3dhbGsiOjAuMCwieWF3X21vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZV9TdGFuZGluZyI6MC4wLCJ5YXdfbW9kaWZpZXJfdmFsdWVfQWlyIjowLjAsInlhd19tb2RpZmllcl92YWx1ZV9BaXIgZHVjayI6MC4wLCJ5YXdfbW9kaWZpZXJfdmFsdWVfQ3JvdWNoaW5nIENUIjowLjAsInlhd19tb2RpZmllcl92YWx1ZV9Dcm91Y2hpbmcgVCI6MC4wLCJ5YXdfbW9kaWZpZXJfdmFsdWVfR2xvYmFsIjowLjAsInlhd19tb2RpZmllcl92YWx1ZV9MZWdpdCBhYSI6MC4wLCJ5YXdfbW9kaWZpZXJfdmFsdWVfTW92aW5nIjowLjAsInlhd19tb2RpZmllcl92YWx1ZV9TbG93d2FsayI6MC4wLCJ5YXdfbW9kaWZpZXJfdmFsdWVfU3RhbmRpbmciOjAuMH0=");
    if l_status_2 then
        common.add_notify(v354.lua_name, "Succesfully loaded default config");
    else
        common.add_notify(v354.lua_name, "Error while loading default config");
    end;
end, true);
v398.main.config_system2:button("                      " .. ui.get_icon("circle-check") .. "  Experimental Config                 ", function()
    -- upvalues: v368 (ref), v354 (ref)
    local l_status_3, _ = pcall(v368.import, "eyJTdGF0aWNfTWFudWFsX1lhdyI6dHJ1ZSwiYW5pbWF0aW9uX2JyZWFrZXJzIjpbIlN0YXRpYyBsZWdzIGluIGFpciIsIkJhY2t3YXJkIGxlZ3MiXSwiYW50aWFpbV9wcmVzZXRzIjoiQ3VycmVudCBNZXRhIiwiYW50aWFpbV9zZXR0aW5ncyI6dHJ1ZSwiYW50aWFpbV90d2Vha3MiOlsiQXZvaWQgQmFja3N0YWIiLCJGYXN0IExhZGRlciBDbGltYiIsIlNhZmUgSGVhZCJdLCJhcnJvd3NfY29sb3IiOlsxNDIuMCwxNjUuMCwyMjkuMCwyNTUuMF0sImFycm93c19zdHlsZSI6IlNpbXBsZSIsImFzcGVjdF9yYXRpbyI6dHJ1ZSwiYXNwZWN0X3JhdGlvX3ZhbHVlIjoxNC4wLCJhdXRvX3VubXV0ZSI6dHJ1ZSwiYXZhdGFyX3NpZGUiOiJMZWZ0IiwiY2xhbnRhZyI6dHJ1ZSwiY2xhbnRhZ190ZXh0IjoiIiwiY29uc29sZV9jb2xvciI6WzEyMy4wLDEyMy4wLDEyMy4wLDI1NS4wXSwiY3Jvc3NoYWlyX2xhYmVsMSI6MzI0NzgyODMxOS4wLCJjcm9zc2hhaXJfc3R5bGUiOiJNb2Rlcm4iLCJjdXN0b21fY29uc29sZV9jb2xvciI6dHJ1ZSwiY3VzdG9tX3Njb3BlX2NvbG9yIjpbMTM3LjAsMTYxLjAsMjU1LjAsMjU1LjBdLCJjdXN0b21fc2NvcGVfaW5hY2N1cmFjeSI6ZmFsc2UsImN1c3RvbV9zY29wZV9sZW5naHQiOjEwLjAsImN1c3RvbV9zY29wZV9vZmZzZXQiOjcwLjAsImN1c3RvbV9zY29wZV9zd2l0Y2giOnRydWUsImRlYnVnX2luZm8iOnRydWUsImRlYnVnX2luZm9fY29sb3IiOlsxNzYuMCwxOTIuMCwyNTIuMCwyNTUuMF0sImRlZmVuc2l2ZV9hbnRpYWltX2Rpc2FibGVycyI6WyJNYW51YWwgWWF3Il0sImRlZmVuc2l2ZV9hbnRpYWltX2VuYWJsZUFpciI6dHJ1ZSwiZGVmZW5zaXZlX2FudGlhaW1fZW5hYmxlQWlyIGR1Y2siOnRydWUsImRlZmVuc2l2ZV9hbnRpYWltX2VuYWJsZUNyb3VjaGluZyBDVCI6ZmFsc2UsImRlZmVuc2l2ZV9hbnRpYWltX2VuYWJsZUNyb3VjaGluZyBUIjpmYWxzZSwiZGVmZW5zaXZlX2FudGlhaW1fZW5hYmxlR2xvYmFsIjp0cnVlLCJkZWZlbnNpdmVfYW50aWFpbV9lbmFibGVMZWdpdCBhYSI6ZmFsc2UsImRlZmVuc2l2ZV9hbnRpYWltX2VuYWJsZU1vdmluZyI6dHJ1ZSwiZGVmZW5zaXZlX2FudGlhaW1fZW5hYmxlU2xvd3dhbGsiOmZhbHNlLCJkZWZlbnNpdmVfYW50aWFpbV9lbmFibGVTdGFuZGluZyI6dHJ1ZSwiZGVmZW5zaXZlX2FudGlhaW1fc3RhdGVBaXIiOiJBbHdheXMgb24iLCJkZWZlbnNpdmVfYW50aWFpbV9zdGF0ZUFpciBkdWNrIjoiQWx3YXlzIG9uIiwiZGVmZW5zaXZlX2FudGlhaW1fc3RhdGVDcm91Y2hpbmcgQ1QiOiJBbHdheXMgb24iLCJkZWZlbnNpdmVfYW50aWFpbV9zdGF0ZUNyb3VjaGluZyBUIjoiQWx3YXlzIG9uIiwiZGVmZW5zaXZlX2FudGlhaW1fc3RhdGVHbG9iYWwiOiJBbHdheXMgb24iLCJkZWZlbnNpdmVfYW50aWFpbV9zdGF0ZUxlZ2l0IGFhIjoiQWx3YXlzIG9uIiwiZGVmZW5zaXZlX2FudGlhaW1fc3RhdGVNb3ZpbmciOiJBbHdheXMgb24iLCJkZWZlbnNpdmVfYW50aWFpbV9zdGF0ZVNsb3d3YWxrIjoiQWx3YXlzIG9uIiwiZGVmZW5zaXZlX2FudGlhaW1fc3RhdGVTdGFuZGluZyI6IkFsd2F5cyBvbiIsImRlZmVuc2l2ZV9jb25kaXRpb25zIjpbIlN0YW5kaW5nIiwiQ3JvdWNoaW5nIiwiQWlyIGR1Y2siLCJBaXIiXSwiZGVmZW5zaXZlX29uX2hpZGVzaG90cyI6dHJ1ZSwiZGVmZW5zaXZlX3BpdGNoX2N1c3RvbV92YWx1ZUFpciI6LTU1LjAsImRlZmVuc2l2ZV9waXRjaF9jdXN0b21fdmFsdWVBaXIgZHVjayI6MC4wLCJkZWZlbnNpdmVfcGl0Y2hfY3VzdG9tX3ZhbHVlQ3JvdWNoaW5nIENUIjowLjAsImRlZmVuc2l2ZV9waXRjaF9jdXN0b21fdmFsdWVDcm91Y2hpbmcgVCI6MC4wLCJkZWZlbnNpdmVfcGl0Y2hfY3VzdG9tX3ZhbHVlR2xvYmFsIjotODkuMCwiZGVmZW5zaXZlX3BpdGNoX2N1c3RvbV92YWx1ZUxlZ2l0IGFhIjowLjAsImRlZmVuc2l2ZV9waXRjaF9jdXN0b21fdmFsdWVNb3ZpbmciOjAuMCwiZGVmZW5zaXZlX3BpdGNoX2N1c3RvbV92YWx1ZVNsb3d3YWxrIjowLjAsImRlZmVuc2l2ZV9waXRjaF9jdXN0b21fdmFsdWVTdGFuZGluZyI6LTg5LjAsImRlZmVuc2l2ZV9waXRjaF9tb2RlQWlyIjoiQ3VzdG9tIiwiZGVmZW5zaXZlX3BpdGNoX21vZGVBaXIgZHVjayI6IkN1c3RvbSIsImRlZmVuc2l2ZV9waXRjaF9tb2RlQ3JvdWNoaW5nIENUIjoiQ3VzdG9tIiwiZGVmZW5zaXZlX3BpdGNoX21vZGVDcm91Y2hpbmcgVCI6IkN1c3RvbSIsImRlZmVuc2l2ZV9waXRjaF9tb2RlR2xvYmFsIjoiQ3VzdG9tIiwiZGVmZW5zaXZlX3BpdGNoX21vZGVMZWdpdCBhYSI6IkN1c3RvbSIsImRlZmVuc2l2ZV9waXRjaF9tb2RlTW92aW5nIjoiQ3VzdG9tIiwiZGVmZW5zaXZlX3BpdGNoX21vZGVTbG93d2FsayI6IkN1c3RvbSIsImRlZmVuc2l2ZV9waXRjaF9tb2RlU3RhbmRpbmciOiJDdXN0b20iLCJkZWZlbnNpdmVfc2V0dGluZ3MiOnRydWUsImRlZmVuc2l2ZV95YXdfY3VzdG9tX3ZhbHVlQWlyIjoxODAuMCwiZGVmZW5zaXZlX3lhd19jdXN0b21fdmFsdWVBaXIgZHVjayI6MTgwLjAsImRlZmVuc2l2ZV95YXdfY3VzdG9tX3ZhbHVlQ3JvdWNoaW5nIENUIjowLjAsImRlZmVuc2l2ZV95YXdfY3VzdG9tX3ZhbHVlQ3JvdWNoaW5nIFQiOjAuMCwiZGVmZW5zaXZlX3lhd19jdXN0b21fdmFsdWVHbG9iYWwiOjE4MC4wLCJkZWZlbnNpdmVfeWF3X2N1c3RvbV92YWx1ZUxlZ2l0IGFhIjowLjAsImRlZmVuc2l2ZV95YXdfY3VzdG9tX3ZhbHVlTW92aW5nIjoxODAuMCwiZGVmZW5zaXZlX3lhd19jdXN0b21fdmFsdWVTbG93d2FsayI6MC4wLCJkZWZlbnNpdmVfeWF3X2N1c3RvbV92YWx1ZVN0YW5kaW5nIjoxODAuMCwiZGVmZW5zaXZlX3lhd19tb2RlQWlyIjoiU3BpbiIsImRlZmVuc2l2ZV95YXdfbW9kZUFpciBkdWNrIjoiU3BpbiIsImRlZmVuc2l2ZV95YXdfbW9kZUNyb3VjaGluZyBDVCI6IkN1c3RvbSIsImRlZmVuc2l2ZV95YXdfbW9kZUNyb3VjaGluZyBUIjoiQ3VzdG9tIiwiZGVmZW5zaXZlX3lhd19tb2RlR2xvYmFsIjoiU3BpbiIsImRlZmVuc2l2ZV95YXdfbW9kZUxlZ2l0IGFhIjoiQ3VzdG9tIiwiZGVmZW5zaXZlX3lhd19tb2RlTW92aW5nIjoiQ3VzdG9tIiwiZGVmZW5zaXZlX3lhd19tb2RlU2xvd3dhbGsiOiJDdXN0b20iLCJkZWZlbnNpdmVfeWF3X21vZGVTdGFuZGluZyI6IlNpZGV3YXlzIiwiZG1nX2luZGljYXRvciI6ZmFsc2UsImRtZ19pbmRpY2F0b3JfY29sb3IiOlsxMzcuMCwxNjEuMCwyNTUuMCwyNTUuMF0sImRtZ19pbmRpY2F0b3JfZm9udCI6IlNtYWxsIiwiZG91YmxldGFwX29wdGlvbnMiOltdLCJkb3VibGV0YXBfc3dpdGNoIjpmYWxzZSwiZmFrZV9sYWciOiJNYXhpbXVtIiwiZmFrZV9sYXRlbmN5X292ZXJyaWRlIjpmYWxzZSwiZmFrZV9sYXRlbmN5X292ZXJyaWRlX3ZhbHVlIjowLjAsImZha2VfbGltaXRfaml0dGVyX0FpciI6NjAuMCwiZmFrZV9saW1pdF9qaXR0ZXJfQWlyIGR1Y2siOjYwLjAsImZha2VfbGltaXRfaml0dGVyX0Nyb3VjaGluZyBDVCI6NjAuMCwiZmFrZV9saW1pdF9qaXR0ZXJfQ3JvdWNoaW5nIFQiOjYwLjAsImZha2VfbGltaXRfaml0dGVyX0dsb2JhbCI6NjAuMCwiZmFrZV9saW1pdF9qaXR0ZXJfTGVnaXQgYWEiOjYwLjAsImZha2VfbGltaXRfaml0dGVyX01vdmluZyI6NjAuMCwiZmFrZV9saW1pdF9qaXR0ZXJfU2xvd3dhbGsiOjYwLjAsImZha2VfbGltaXRfaml0dGVyX1N0YW5kaW5nIjo2MC4wLCJmYWtlX2xpbWl0X2xlZnRfQWlyIjo2MC4wLCJmYWtlX2xpbWl0X2xlZnRfQWlyIGR1Y2siOjYwLjAsImZha2VfbGltaXRfbGVmdF9Dcm91Y2hpbmcgQ1QiOjYwLjAsImZha2VfbGltaXRfbGVmdF9Dcm91Y2hpbmcgVCI6NjAuMCwiZmFrZV9saW1pdF9sZWZ0X0dsb2JhbCI6NjAuMCwiZmFrZV9saW1pdF9sZWZ0X0xlZ2l0IGFhIjo2MC4wLCJmYWtlX2xpbWl0X2xlZnRfTW92aW5nIjo2MC4wLCJmYWtlX2xpbWl0X2xlZnRfU2xvd3dhbGsiOjYwLjAsImZha2VfbGltaXRfbGVmdF9TdGFuZGluZyI6NjAuMCwiZmFrZV9saW1pdF9yYW5kb21fQWlyIjo2MC4wLCJmYWtlX2xpbWl0X3JhbmRvbV9BaXIgZHVjayI6NjAuMCwiZmFrZV9saW1pdF9yYW5kb21fQ3JvdWNoaW5nIENUIjo2MC4wLCJmYWtlX2xpbWl0X3JhbmRvbV9Dcm91Y2hpbmcgVCI6NjAuMCwiZmFrZV9saW1pdF9yYW5kb21fR2xvYmFsIjo2MC4wLCJmYWtlX2xpbWl0X3JhbmRvbV9MZWdpdCBhYSI6NjAuMCwiZmFrZV9saW1pdF9yYW5kb21fTW92aW5nIjo2MC4wLCJmYWtlX2xpbWl0X3JhbmRvbV9TbG93d2FsayI6NjAuMCwiZmFrZV9saW1pdF9yYW5kb21fU3RhbmRpbmciOjYwLjAsImZha2VfbGltaXRfcmlnaHRfQWlyIjo2MC4wLCJmYWtlX2xpbWl0X3JpZ2h0X0FpciBkdWNrIjo2MC4wLCJmYWtlX2xpbWl0X3JpZ2h0X0Nyb3VjaGluZyBDVCI6NjAuMCwiZmFrZV9saW1pdF9yaWdodF9Dcm91Y2hpbmcgVCI6NjAuMCwiZmFrZV9saW1pdF9yaWdodF9HbG9iYWwiOjYwLjAsImZha2VfbGltaXRfcmlnaHRfTGVnaXQgYWEiOjYwLjAsImZha2VfbGltaXRfcmlnaHRfTW92aW5nIjo2MC4wLCJmYWtlX2xpbWl0X3JpZ2h0X1Nsb3d3YWxrIjo2MC4wLCJmYWtlX2xpbWl0X3JpZ2h0X1N0YW5kaW5nIjo2MC4wLCJmYWtlX2xpbWl0X3R5cGVfQWlyIjoiU3RhdGljIiwiZmFrZV9saW1pdF90eXBlX0FpciBkdWNrIjoiU3RhdGljIiwiZmFrZV9saW1pdF90eXBlX0Nyb3VjaGluZyBDVCI6IlN0YXRpYyIsImZha2VfbGltaXRfdHlwZV9Dcm91Y2hpbmcgVCI6IlN0YXRpYyIsImZha2VfbGltaXRfdHlwZV9HbG9iYWwiOiJTdGF0aWMiLCJmYWtlX2xpbWl0X3R5cGVfTGVnaXQgYWEiOiJTdGF0aWMiLCJmYWtlX2xpbWl0X3R5cGVfTW92aW5nIjoiU3RhdGljIiwiZmFrZV9saW1pdF90eXBlX1Nsb3d3YWxrIjoiU3RhdGljIiwiZmFrZV9saW1pdF90eXBlX1N0YW5kaW5nIjoiU3RhdGljIiwiZmFrZV9vcHRpb25zX0FpciI6W10sImZha2Vfb3B0aW9uc19BaXIgZHVjayI6W10sImZha2Vfb3B0aW9uc19Dcm91Y2hpbmcgQ1QiOltdLCJmYWtlX29wdGlvbnNfQ3JvdWNoaW5nIFQiOltdLCJmYWtlX29wdGlvbnNfR2xvYmFsIjpbXSwiZmFrZV9vcHRpb25zX0xlZ2l0IGFhIjpbXSwiZmFrZV9vcHRpb25zX01vdmluZyI6W10sImZha2Vfb3B0aW9uc19TbG93d2FsayI6W10sImZha2Vfb3B0aW9uc19TdGFuZGluZyI6W10sImZha2VsYWdfZGlzYWJsZXJzIjpbIkRvdWJsZSBUYXAiLCJIaWRlIFNob3RzIiwiU3RhbmRpbmciXSwiZnJlZXN0YW5kaW5nX2tleSI6ZmFsc2UsImZyZWVzdGFuZGluZ19rZXkxIjp0cnVlLCJmcmVlc3RhbmRpbmdfa2V5MiI6dHJ1ZSwiZnJlZXN0YW5kaW5nX2tleTMiOlsiU2xvdyBXYWxrIiwiSW4gQWlyIiwiQ3JvdWNoaW5nIl0sImZyZWVzdGFuZGluZ19tb2RlX0FpciI6Ik9mZiIsImZyZWVzdGFuZGluZ19tb2RlX0FpciBkdWNrIjoiT2ZmIiwiZnJlZXN0YW5kaW5nX21vZGVfQ3JvdWNoaW5nIENUIjoiT2ZmIiwiZnJlZXN0YW5kaW5nX21vZGVfQ3JvdWNoaW5nIFQiOiJPZmYiLCJmcmVlc3RhbmRpbmdfbW9kZV9HbG9iYWwiOiJPZmYiLCJmcmVlc3RhbmRpbmdfbW9kZV9MZWdpdCBhYSI6Ik9mZiIsImZyZWVzdGFuZGluZ19tb2RlX01vdmluZyI6Ik9mZiIsImZyZWVzdGFuZGluZ19tb2RlX1Nsb3d3YWxrIjoiT2ZmIiwiZnJlZXN0YW5kaW5nX21vZGVfU3RhbmRpbmciOiJPZmYiLCJncmVuYWRlX3Rocm93X2ZpeCI6ZmFsc2UsImhpdGNoYW5jZV9haXIiOjUwLjAsImhpdGNoYW5jZV9haXJfd2VhcG9ucyI6W10sImhpdGNoYW5jZV9jb25kaXRpb24iOiJObyBzY29wZSIsImhpdGNoYW5jZV9ub3Njb3BlIjo1NS4wLCJoaXRjaGFuY2Vfbm9zY29wZV93ZWFwb25zIjpbIkF1dG8iLCJTY291dCIsIk90aGVyIl0sImhpdGNoYW5jZV9zd2l0Y2giOmZhbHNlLCJoaXRtYXJrZXIiOmZhbHNlLCJoaXRtYXJrZXJfZGFtYWdlX2NvbG9yIjpbMjM4LjAsNzAuMCw3MC4wLDI1NS4wXSwiaGl0bWFya2VyX3BsdXNfY29sb3IiOlsyMzEuMCw4NS4wLDg1LjAsMjU1LjBdLCJoaXRtYXJrZXJfdHlwZSI6WyIrIiwiZGFtYWdlIl0sImluZGljYXRvcnNfY29sb3IiOlsyNTUuMCwyNTUuMCwyNTUuMCwyNTUuMF0sImluZGljYXRvcnNfY29sb3IyIjpbMTM3LjAsMTYxLjAsMjU1LjAsMjU1LjBdLCJpbmRpY2F0b3JzX2ZvbnQiOiJTbWFsbCIsImluZGljYXRvcnNfaGVpZ2h0IjoyMy4wLCJpbmRpY2F0b3JzX3N3aXRjaCI6dHJ1ZSwiaW52ZXJ0ZXJfQWlyIjpmYWxzZSwiaW52ZXJ0ZXJfQWlyIGR1Y2siOmZhbHNlLCJpbnZlcnRlcl9Dcm91Y2hpbmcgQ1QiOmZhbHNlLCJpbnZlcnRlcl9Dcm91Y2hpbmcgVCI6ZmFsc2UsImludmVydGVyX0dsb2JhbCI6ZmFsc2UsImludmVydGVyX0xlZ2l0IGFhIjpmYWxzZSwiaW52ZXJ0ZXJfTW92aW5nIjpmYWxzZSwiaW52ZXJ0ZXJfU2xvd3dhbGsiOmZhbHNlLCJpbnZlcnRlcl9TdGFuZGluZyI6ZmFsc2UsImxlZ2l0YWFfYXRfdGFyZ2V0cyI6ZmFsc2UsImxlZ2l0YWFfaml0dGVyIjpmYWxzZSwibGVnaXRhYV9rZXkiOmZhbHNlLCJsb2dzX25vdGlmeSI6dHJ1ZSwibG9nc19ub3RpZnlfY29sb3JfaGl0IjpbMTM3LjAsMTYxLjAsMjU1LjAsMjU1LjBdLCJsb2dzX25vdGlmeV9jb2xvcl9taXNzIjpbMTM3LjAsMTYxLjAsMjU1LjAsMjU1LjBdLCJtYW51YWxfYXJyb3dzIjp0cnVlLCJtYW51YWxfeWF3IjoiQXQgVGFyZ2V0Iiwibm9fZmFsbF9kYW1hZ2UiOnRydWUsInByZXNldF9lbmFibGVfQWlyIjpmYWxzZSwicHJlc2V0X2VuYWJsZV9BaXIgZHVjayI6ZmFsc2UsInByZXNldF9lbmFibGVfQ3JvdWNoaW5nIENUIjpmYWxzZSwicHJlc2V0X2VuYWJsZV9Dcm91Y2hpbmcgVCI6ZmFsc2UsInByZXNldF9lbmFibGVfR2xvYmFsIjpmYWxzZSwicHJlc2V0X2VuYWJsZV9MZWdpdCBhYSI6ZmFsc2UsInByZXNldF9lbmFibGVfTW92aW5nIjpmYWxzZSwicHJlc2V0X2VuYWJsZV9TbG93d2FsayI6ZmFsc2UsInByZXNldF9lbmFibGVfU3RhbmRpbmciOmZhbHNlLCJyYWdlYm90X2xvZ3MiOnRydWUsInJhZ2Vib3RfbG9nc19kZWZhdWx0X2NvbG9yIjpbMjU1LjAsMjU1LjAsMjU1LjAsMjU1LjBdLCJyYWdlYm90X2xvZ3NfaGl0X2NvbG9yIjpbMTI0LjAsMjU1LjAsMTIwLjAsMjU1LjBdLCJyYWdlYm90X2xvZ3NfbWlzc19jb2xvciI6WzI1NS4wLDExNS4wLDExNS4wLDI1NS4wXSwicmFnZWJvdF9sb2dzX21pc3NtYXRjaF9jb2xvciI6WzI1NS4wLDE1OS4wLDk0LjAsMjU1LjBdLCJyYWdlYm90X2xvZ3Nfc3R5bGUiOiJTaW1wbGUiLCJyZW1vdmVfdG9wX2JhciI6ZmFsc2UsInJldm9sdmVyX2hlbHBlciI6ZmFsc2UsInNuYXBsaW5lc19YREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREREIjpmYWxzZSwic25hcGxpbmVzX1hERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERERfY29sb3IiOlsxMi4wLDEyLjAsMTIuMCwyNTUuMF0sInN0YXRpY19yYWdkb2xscyI6ZmFsc2UsInRhc2tiYXJfbm90aWZ5Ijp0cnVlLCJ0ZWxlcG9ydF9pbmFpciI6ZmFsc2UsInRyYXNoIjpmYWxzZSwidHJhc2hfd2FybXVwIjpmYWxzZSwidWlfY29sb3IiOlsxMzcuMCwxNjEuMCwyNTUuMCwyNTUuMF0sInVpX2VsZW1lbnRzIjpbIldhdGVybWFyayIsIktleWJpbmRzIl0sInVpX3N0eWxlIjoiTW9kZXJuIiwidmlld21vZGVsIjp0cnVlLCJ2aWV3bW9kZWxfZm92Ijo1My4wLCJ2aWV3bW9kZWxfeCI6MS4wLCJ2aWV3bW9kZWxfeSI6LTUuMCwidmlld21vZGVsX3oiOi0xLjAsIndhcm11cF9jcmF6eW1vZGUiOnRydWUsIndhdGVybWFya19uYW1lIjoiQ2hlYXQiLCJ3YXRlcm1hcmtfbmFtZV9yZWYiOiIiLCJ5YXdfYWRkX2xlZnRfQWlyIjowLjAsInlhd19hZGRfbGVmdF9BaXIgZHVjayI6MC4wLCJ5YXdfYWRkX2xlZnRfQ3JvdWNoaW5nIENUIjowLjAsInlhd19hZGRfbGVmdF9Dcm91Y2hpbmcgVCI6MC4wLCJ5YXdfYWRkX2xlZnRfR2xvYmFsIjowLjAsInlhd19hZGRfbGVmdF9MZWdpdCBhYSI6LTE4MC4wLCJ5YXdfYWRkX2xlZnRfTW92aW5nIjowLjAsInlhd19hZGRfbGVmdF9TbG93d2FsayI6MC4wLCJ5YXdfYWRkX2xlZnRfU3RhbmRpbmciOjAuMCwieWF3X2FkZF9yaWdodF9BaXIiOjAuMCwieWF3X2FkZF9yaWdodF9BaXIgZHVjayI6MC4wLCJ5YXdfYWRkX3JpZ2h0X0Nyb3VjaGluZyBDVCI6MC4wLCJ5YXdfYWRkX3JpZ2h0X0Nyb3VjaGluZyBUIjowLjAsInlhd19hZGRfcmlnaHRfR2xvYmFsIjowLjAsInlhd19hZGRfcmlnaHRfTGVnaXQgYWEiOi0xODAuMCwieWF3X2FkZF9yaWdodF9Nb3ZpbmciOjAuMCwieWF3X2FkZF9yaWdodF9TbG93d2FsayI6MC4wLCJ5YXdfYWRkX3JpZ2h0X1N0YW5kaW5nIjowLjAsInlhd19hZGRfdHlwZV9BaXIiOiJTdGF0aWMiLCJ5YXdfYWRkX3R5cGVfQWlyIGR1Y2siOiJTdGF0aWMiLCJ5YXdfYWRkX3R5cGVfQ3JvdWNoaW5nIENUIjoiU3RhdGljIiwieWF3X2FkZF90eXBlX0Nyb3VjaGluZyBUIjoiU3RhdGljIiwieWF3X2FkZF90eXBlX0dsb2JhbCI6IlN0YXRpYyIsInlhd19hZGRfdHlwZV9MZWdpdCBhYSI6IlN0YXRpYyIsInlhd19hZGRfdHlwZV9Nb3ZpbmciOiJTdGF0aWMiLCJ5YXdfYWRkX3R5cGVfU2xvd3dhbGsiOiJTdGF0aWMiLCJ5YXdfYWRkX3R5cGVfU3RhbmRpbmciOiJTdGF0aWMiLCJ5YXdfZGVsYXlfQWlyIjowLjAsInlhd19kZWxheV9BaXIgZHVjayI6MC4wLCJ5YXdfZGVsYXlfQ3JvdWNoaW5nIENUIjowLjAsInlhd19kZWxheV9Dcm91Y2hpbmcgVCI6MC4wLCJ5YXdfZGVsYXlfR2xvYmFsIjowLjAsInlhd19kZWxheV9MZWdpdCBhYSI6MC4wLCJ5YXdfZGVsYXlfTW92aW5nIjowLjAsInlhd19kZWxheV9TbG93d2FsayI6MC4wLCJ5YXdfZGVsYXlfU3RhbmRpbmciOjAuMCwieWF3X21vZGlmaWVyX0FpciI6IkRpc2FibGVkIiwieWF3X21vZGlmaWVyX0FpciBkdWNrIjoiRGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXJfQ3JvdWNoaW5nIENUIjoiRGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXJfQ3JvdWNoaW5nIFQiOiJEaXNhYmxlZCIsInlhd19tb2RpZmllcl9HbG9iYWwiOiJEaXNhYmxlZCIsInlhd19tb2RpZmllcl9MZWdpdCBhYSI6IkRpc2FibGVkIiwieWF3X21vZGlmaWVyX01vdmluZyI6IkRpc2FibGVkIiwieWF3X21vZGlmaWVyX1Nsb3d3YWxrIjoiRGlzYWJsZWQiLCJ5YXdfbW9kaWZpZXJfU3RhbmRpbmciOiJEaXNhYmxlZCIsInlhd19tb2RpZmllcl9yYW5kb21pemVfQWlyIjpmYWxzZSwieWF3X21vZGlmaWVyX3JhbmRvbWl6ZV9BaXIgZHVjayI6ZmFsc2UsInlhd19tb2RpZmllcl9yYW5kb21pemVfQ3JvdWNoaW5nIENUIjpmYWxzZSwieWF3X21vZGlmaWVyX3JhbmRvbWl6ZV9Dcm91Y2hpbmcgVCI6ZmFsc2UsInlhd19tb2RpZmllcl9yYW5kb21pemVfR2xvYmFsIjp0cnVlLCJ5YXdfbW9kaWZpZXJfcmFuZG9taXplX0xlZ2l0IGFhIjpmYWxzZSwieWF3X21vZGlmaWVyX3JhbmRvbWl6ZV9Nb3ZpbmciOmZhbHNlLCJ5YXdfbW9kaWZpZXJfcmFuZG9taXplX1Nsb3d3YWxrIjpmYWxzZSwieWF3X21vZGlmaWVyX3JhbmRvbWl6ZV9TdGFuZGluZyI6ZmFsc2UsInlhd19tb2RpZmllcl9yYW5kb21pemVfdmFsdWVfQWlyIjowLjAsInlhd19tb2RpZmllcl9yYW5kb21pemVfdmFsdWVfQWlyIGR1Y2siOjAuMCwieWF3X21vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZV9Dcm91Y2hpbmcgQ1QiOjAuMCwieWF3X21vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZV9Dcm91Y2hpbmcgVCI6MC4wLCJ5YXdfbW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlX0dsb2JhbCI6MzEuMCwieWF3X21vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZV9MZWdpdCBhYSI6MC4wLCJ5YXdfbW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlX01vdmluZyI6MC4wLCJ5YXdfbW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlX1Nsb3d3YWxrIjowLjAsInlhd19tb2RpZmllcl9yYW5kb21pemVfdmFsdWVfU3RhbmRpbmciOjAuMCwieWF3X21vZGlmaWVyX3ZhbHVlX0FpciI6MC4wLCJ5YXdfbW9kaWZpZXJfdmFsdWVfQWlyIGR1Y2siOjAuMCwieWF3X21vZGlmaWVyX3ZhbHVlX0Nyb3VjaGluZyBDVCI6MC4wLCJ5YXdfbW9kaWZpZXJfdmFsdWVfQ3JvdWNoaW5nIFQiOjAuMCwieWF3X21vZGlmaWVyX3ZhbHVlX0dsb2JhbCI6LTI4LjAsInlhd19tb2RpZmllcl92YWx1ZV9MZWdpdCBhYSI6MC4wLCJ5YXdfbW9kaWZpZXJfdmFsdWVfTW92aW5nIjotMjguMCwieWF3X21vZGlmaWVyX3ZhbHVlX1Nsb3d3YWxrIjowLjAsInlhd19tb2RpZmllcl92YWx1ZV9TdGFuZGluZyI6MC4wfQ==");
    if l_status_3 then
        common.add_notify(v354.lua_name, "Succesfully loaded Experimental config");
    else
        common.add_notify(v354.lua_name, "Error while loading Experimental config");
    end;
end, true);
v398.main.links:button("  " .. ui.get_icon("unlock") .. "  GitHub  ", function()
    -- upvalues: v58 (ref)
    v58.OpenExternalBrowserURL("https://github.com/aspyr1g");
end, true);
v398.main.links:button("  " .. ui.get_icon("badge-check") .. "  Youtube  ", function()
    -- upvalues: v58 (ref)
    v58.OpenExternalBrowserURL("https://youtube.com/channel/UCW4y8iJYvrVVvcMrVbPnn_g");
end, true);
v398.main.links:button("                                 " .. ui.get_icon("discord") .. "  Discord                               ", function()
    -- upvalues: v58 (ref)
    v58.OpenExternalBrowserURL("https://discord.com/invite/Sj4TG5w3tK");
end, true);
v397.gears = {};
v355.push({
    flags = "", 
    index = "antiaim_settings", 
    element = v398.anti_aim.switch:switch(ui.get_icon("users") .. "   Master switch"), 
    conditions = {}
});
v355.push({
    flags = "", 
    index = "antiaim_presets", 
    element = v398.anti_aim.switch:combo(ui.get_icon("gear") .. "    Anti Aim Mode", {
        [1] = "Current Meta", 
        [2] = "Experimental", 
        [3] = "Custom"
    }), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("antiaim_settings");
        end
    }
});
v355.push({
    flags = "", 
    index = "defensive_settings", 
    element = v398.anti_aim.switch:switch(ui.get_icon("shield-halved") .. "    Defensive settings"), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("antiaim_settings");
        end
    }
});
v397.gears.defensive_settings = v355.get_element("defensive_settings"):create();
v355.push({
    flags = "", 
    index = "defensive_conditions", 
    element = v397.gears.defensive_settings:selectable("Conditions", {
        [1] = "Standing", 
        [2] = "Moving", 
        [3] = "Crouching", 
        [4] = "Slowwalk", 
        [5] = "Air duck", 
        [6] = "Air"
    }), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("antiaim_settings");
        end, 
        [2] = function()
            -- upvalues: v355 (ref)
            return v355.get("defensive_settings");
        end
    }
});
v355.push({
    flags = "", 
    index = "defensive_on_hideshots", 
    element = v397.gears.defensive_settings:switch("On hideshots\ndef"), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("antiaim_settings");
        end, 
        [2] = function()
            -- upvalues: v355 (ref)
            return v355.get("defensive_settings");
        end
    }
});
v355.push({
    flags = "", 
    index = "defensive_antiaim_disablers", 
    element = v397.gears.defensive_settings:selectable("Disablers\ndef", {
        [1] = "Freestanding", 
        [2] = "Manual Yaw"
    }), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("antiaim_settings");
        end, 
        [2] = function()
            -- upvalues: v355 (ref)
            return v355.get("defensive_settings");
        end
    }
});
v355.push({
    flags = "-", 
    index = "defensive_condition_selector", 
    element = v397.gears.defensive_settings:combo("\nAnti Aim Condition", v392.plr_conditions), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("antiaim_settings");
        end, 
        [2] = function()
            -- upvalues: v355 (ref)
            return v355.get("defensive_settings");
        end
    }
});
for _, v411 in pairs(v392.plr_conditions) do
    do
        local l_v411_0 = v411;
        local function v413()
            -- upvalues: v355 (ref), l_v411_0 (ref)
            return v355.get("antiaim_settings") and v355.get("defensive_settings") and v355.get("defensive_condition_selector") == l_v411_0;
        end;
        v355.push({
            flags = "", 
            element = v397.gears.defensive_settings:switch("Enable Defensive Anti Aim\n" .. l_v411_0), 
            index = "defensive_antiaim_enable" .. l_v411_0, 
            conditions = {
                [1] = v413
            }
        });
        v355.push({
            flags = "", 
            element = v397.gears.defensive_settings:combo("Anti Aim Mode\ndef" .. l_v411_0, {
                [1] = "Always on", 
                [2] = "Hittable only"
            }), 
            index = "defensive_antiaim_state" .. l_v411_0, 
            conditions = {
                [1] = v413, 
                [2] = function()
                    -- upvalues: v355 (ref)
                    return v355.get("antiaim_settings");
                end, 
                [3] = function()
                    -- upvalues: v355 (ref)
                    return v355.get("defensive_settings");
                end
            }
        });
        v355.push({
            flags = "", 
            element = v397.gears.defensive_settings:combo("Pitch mode\n" .. l_v411_0, {
                [1] = "Custom", 
                [2] = "Random"
            }), 
            index = "defensive_pitch_mode" .. l_v411_0, 
            conditions = {
                [1] = v413, 
                [2] = function()
                    -- upvalues: v355 (ref), l_v411_0 (ref)
                    return v355.get("defensive_antiaim_enable" .. l_v411_0);
                end
            }
        });
        v355.push({
            flags = "", 
            element = v397.gears.defensive_settings:slider("Value\npitch" .. l_v411_0, -89, 89, 0), 
            index = "defensive_pitch_custom_value" .. l_v411_0, 
            conditions = {
                [1] = v413, 
                [2] = function()
                    -- upvalues: v355 (ref), l_v411_0 (ref)
                    return v355.get("defensive_pitch_mode" .. l_v411_0) == "Custom";
                end, 
                [3] = function()
                    -- upvalues: v355 (ref), l_v411_0 (ref)
                    return v355.get("defensive_antiaim_enable" .. l_v411_0);
                end
            }
        });
        v355.push({
            flags = "", 
            element = v397.gears.defensive_settings:combo("Yaw mode\n" .. l_v411_0, {
                [1] = "Custom", 
                [2] = "Spin", 
                [3] = "Sideways"
            }), 
            index = "defensive_yaw_mode" .. l_v411_0, 
            conditions = {
                [1] = v413, 
                [2] = function()
                    -- upvalues: v355 (ref), l_v411_0 (ref)
                    return v355.get("defensive_antiaim_enable" .. l_v411_0);
                end
            }
        });
        v355.push({
            flags = "", 
            element = v397.gears.defensive_settings:slider("Value\nyaw" .. l_v411_0, -180, 180, 0), 
            index = "defensive_yaw_custom_value" .. l_v411_0, 
            conditions = {
                [1] = v413, 
                [2] = function()
                    -- upvalues: v355 (ref), l_v411_0 (ref)
                    return v355.get("defensive_yaw_mode" .. l_v411_0) == "Custom" or v355.get("defensive_yaw_mode" .. l_v411_0) == "Spin";
                end, 
                [3] = function()
                    -- upvalues: v355 (ref), l_v411_0 (ref)
                    return v355.get("defensive_antiaim_enable" .. l_v411_0);
                end
            }
        });
    end;
end;
v355.push({
    flags = "", 
    index = "manual_yaw", 
    element = v398.anti_aim.switch:combo(ui.get_icon("arrows-repeat") .. "    Manual Yaw", {
        [1] = "At Target", 
        [2] = "Backward", 
        [3] = "Left", 
        [4] = "Right", 
        [5] = "Forward"
    }), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("antiaim_settings");
        end
    }
});
v397.gears.manual = v355.get_element("manual_yaw"):create();
v355.push({
    flags = "", 
    index = "Static_Manual_Yaw", 
    element = v397.gears.manual:switch("Static Manual Yaw"), 
    conditions = {}
});
v355.push({
    flags = "", 
    index = "antiaim_tweaks", 
    element = v398.anti_aim.switch:selectable(ui.get_icon("layer-group") .. "    Anti Aim Tweaks", {
        [1] = "Warmup Anti Aim", 
        [2] = "Avoid Backstab", 
        [3] = "Fast Ladder Climb", 
        [4] = "Safe Head"
    }), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("antiaim_settings");
        end
    }
});
v397.gears.tweaks = v355.get_element("antiaim_tweaks"):create();
v355.push({
    flags = "", 
    index = "warmup_crazymode", 
    element = v397.gears.tweaks:switch("Crazy Warmup Anti Aim"), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.contains("antiaim_tweaks", "Warmup Anti Aim");
        end
    }
});
v355.push({
    flags = "", 
    index = "fake_lag", 
    element = v398.anti_aim.switch:combo(ui.get_icon("street-view") .. "    Fakelag Mode", {
        [1] = "Default", 
        [2] = "Maximum", 
        [3] = "Fluctuate"
    }), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("antiaim_settings");
        end
    }
});
v355.push({
    flags = "", 
    index = "fakelag_disablers", 
    element = v398.anti_aim.switch:selectable(ui.get_icon("eye-slash") .. "   Fakelag Disablers", {
        [1] = "Double Tap", 
        [2] = "Hide Shots", 
        [3] = "Standing"
    }), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("antiaim_settings");
        end
    }
});
v355.push({
    flags = "", 
    index = "animation_breakers", 
    element = v398.anti_aim.switch:selectable(ui.get_icon("person-running") .. "     Player Animation", {
        [1] = "Zero pitch on land", 
        [2] = "Static legs in air", 
        [3] = "Moon walk in air", 
        [4] = "Backward legs", 
        [5] = "Moon walk"
    }), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("antiaim_settings");
        end
    }
});
v355.push({
    flags = "-", 
    index = "condition_selector", 
    element = v398.anti_aim.builder:combo("Active Condition", v392.plr_conditions), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("antiaim_settings");
        end, 
        [2] = function()
            -- upvalues: v355 (ref)
            return v355.get("antiaim_presets") == "Custom";
        end
    }
});
v355.push({
    flags = "", 
    index = "hitchance_switch", 
    element = v398.settings.aimbot:switch(ui.get_icon("crosshairs-simple") .. "     Custom Hitchances")
});
v397.gears.hitchances = v355.get_element("hitchance_switch"):create();
v355.push({
    flags = "", 
    index = "hitchance_condition", 
    element = v397.gears.hitchances:combo("Condition", {
        [1] = "In air", 
        [2] = "No scope"
    }), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("hitchance_switch");
        end
    }
});
v355.push({
    flags = "", 
    index = "hitchance_air_weapons", 
    element = v397.gears.hitchances:selectable("Weapons", {
        [1] = "Scout", 
        [2] = "Revolver", 
        [3] = "Other"
    }), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("hitchance_switch");
        end, 
        [2] = function()
            -- upvalues: v355 (ref)
            return v355.get("hitchance_condition") == "In air";
        end
    }
});
v355.push({
    flags = "", 
    index = "hitchance_noscope_weapons", 
    element = v397.gears.hitchances:selectable("Weapons", {
        [1] = "Auto", 
        [2] = "Scout", 
        [3] = "Other"
    }), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("hitchance_switch");
        end, 
        [2] = function()
            -- upvalues: v355 (ref)
            return v355.get("hitchance_condition") == "No scope";
        end
    }
});
v355.push({
    flags = "", 
    index = "hitchance_air", 
    element = v397.gears.hitchances:slider("Hitchance", 0, 100, 50, 1, "%"), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("hitchance_switch");
        end, 
        [2] = function()
            -- upvalues: v355 (ref)
            return v355.get("hitchance_condition") == "In air";
        end
    }
});
v355.push({
    flags = "", 
    index = "hitchance_noscope", 
    element = v397.gears.hitchances:slider("Hitchance", 0, 100, 50, 1, "%"), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("hitchance_switch");
        end, 
        [2] = function()
            -- upvalues: v355 (ref)
            return v355.get("hitchance_condition") == "No scope";
        end
    }
});
v355.push({
    flags = "", 
    index = "doubletap_switch", 
    element = v398.settings.aimbot:switch(ui.get_icon("wand-magic-sparkles") .. "    Doubletap Options"), 
    conditions = {}
});
v397.gears.doubletap = v355.get_element("doubletap_switch"):create();
v355.push({
    flags = "", 
    index = "doubletap_options", 
    element = v397.gears.doubletap:selectable("", {
        [1] = "Faster Double tap", 
        [2] = "Adaptive Recharge", 
        [3] = "Predict Double Tap Damage"
    }), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("doubletap_switch");
        end
    }
});
v355.push({
    flags = "", 
    index = "ragebot_logs", 
    element = v398.settings.aimbot:switch(ui.get_icon("list-ol") .. "    Log Aimbot Shots")
});
v397.gears.ragebot_logs = v355.get_element("ragebot_logs"):create();
v355.push({
    flags = "", 
    index = "ragebot_logs_style", 
    element = v397.gears.ragebot_logs:combo("Style", {
        [1] = "Highlight", 
        [2] = "Simple"
    }), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("ragebot_logs");
        end
    }
});
v355.push({
    flags = "c", 
    index = "ragebot_logs_default_color", 
    element = v397.gears.ragebot_logs:color_picker("Default Color", color(210, 210, 210)), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("ragebot_logs");
        end, 
        [2] = function()
            -- upvalues: v355 (ref)
            return v355.get("ragebot_logs_style") == "Highlight";
        end
    }
});
v355.push({
    flags = "c", 
    index = "ragebot_logs_hit_color", 
    element = v397.gears.ragebot_logs:color_picker("Hit Color", color(143, 255, 0)), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("ragebot_logs");
        end
    }
});
v355.push({
    flags = "c", 
    index = "ragebot_logs_miss_color", 
    element = v397.gears.ragebot_logs:color_picker("Miss Color", color(255, 115, 115)), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("ragebot_logs");
        end
    }
});
v355.push({
    flags = "c", 
    index = "ragebot_logs_missmatch_color", 
    element = v397.gears.ragebot_logs:color_picker("Missmatch Color", color(255, 159, 94)), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("ragebot_logs");
        end
    }
});
v355.push({
    flags = "", 
    index = "teleport_inair", 
    element = v398.settings.aimbot:switch(ui.get_icon("transporter-3") .. "     Teleport in air"), 
    conditions = {}
});
v355.push({
    flags = "", 
    index = "fake_latency_override", 
    element = v398.settings.aimbot:switch(ui.get_icon("lock-open") .. "    Unlock Fake Latency"), 
    conditions = {}
});
v397.gears.fake_latency_override = v355.get_element("fake_latency_override"):create();
v355.push({
    flags = "", 
    index = "fake_latency_override_value", 
    element = v397.gears.fake_latency_override:slider("Value", 0, 200, 0), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("fake_latency_override");
        end
    }
});
v355.push({
    flags = "", 
    index = "grenade_throw_fix", 
    element = v398.settings.aimbot:switch(ui.get_icon("bomb") .. "     Grenade Throw Fix"), 
    conditions = {}
});
v355.push({
    flags = "", 
    index = "legitaa_key", 
    element = v398.anti_aim.switch:switch(ui.get_icon("arrow-up-left-from-circle") .. "     Legit Anti Aim"), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("antiaim_settings");
        end
    }
});
v397.gears.Legit = v355.get_element("legitaa_key"):create();
v355.push({
    flags = "", 
    index = "legitaa_at_targets", 
    element = v397.gears.Legit:switch("At-Target"), 
    conditions = {}
});
v355.push({
    flags = "", 
    index = "legitaa_jitter", 
    element = v397.gears.Legit:switch("Jitter Mode"), 
    conditions = {}
});
v355.push({
    flags = "", 
    index = "freestanding_key", 
    element = v398.anti_aim.switch:switch(ui.get_icon("arrows-turn-to-dots") .. "     Freestanding"), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("antiaim_settings");
        end
    }
});
v397.gears.Freestanding = v355.get_element("freestanding_key"):create();
v355.push({
    flags = "", 
    index = "freestanding_key1", 
    element = v397.gears.Freestanding:switch("Disable Yaw Modifiers"), 
    conditions = {}
});
v355.push({
    flags = "", 
    index = "freestanding_key2", 
    element = v397.gears.Freestanding:switch("Body Freestanding"), 
    conditions = {}
});
v355.push({
    flags = "", 
    index = "freestanding_key3", 
    element = v397.gears.Freestanding:selectable("Disablers", {
        [1] = "Slow Walk", 
        [2] = "In Air", 
        [3] = "Crouching"
    }), 
    conditions = {}
});
for v414 = 1, #v392.plr_conditions do
    local v415 = v392.plr_conditions[v414];
    do
        local l_v414_0 = v414;
        do
            local l_v415_0 = v415;
            local function v418()
                -- upvalues: v355 (ref), l_v415_0 (ref)
                return v355.get("antiaim_presets") == "Custom" and l_v415_0 == v355.get("condition_selector") and v355.get("antiaim_settings");
            end;
            v355.push({
                flags = "", 
                element = v398.anti_aim.builder:switch("Enable condition"), 
                index = "preset_enable_" .. l_v415_0, 
                conditions = {
                    [1] = v418, 
                    [2] = function()
                        -- upvalues: l_v414_0 (ref)
                        return l_v414_0 ~= 1;
                    end
                }
            });
            v418 = function()
                -- upvalues: v355 (ref), l_v415_0 (ref), l_v414_0 (ref)
                return v355.get("antiaim_presets") == "Custom" and l_v415_0 == v355.get("condition_selector") and v355.get("antiaim_settings") and (l_v414_0 == 1 or v355.get("preset_enable_" .. l_v415_0));
            end;
            v355.push({
                flags = "", 
                element = v398.anti_aim.settings:combo("Yaw Add Type", {
                    [1] = "Static", 
                    [2] = "Jitter", 
                    [3] = "Random"
                }), 
                index = "yaw_add_type_" .. l_v415_0, 
                conditions = {
                    [1] = v418, 
                    [2] = function()
                        -- upvalues: v355 (ref), l_v415_0 (ref)
                        return v355.get("yaw_delay_" .. l_v415_0) == 0;
                    end
                }
            });
            v355.push({
                flags = "", 
                element = v398.anti_aim.settings:slider("Yaw Add Left", -180, 180, 0), 
                index = "yaw_add_left_" .. l_v415_0, 
                conditions = {
                    [1] = v418
                }
            });
            v355.push({
                flags = "", 
                element = v398.anti_aim.settings:slider("Yaw Add Right", -180, 180, 0), 
                index = "yaw_add_right_" .. l_v415_0, 
                conditions = {
                    [1] = v418
                }
            });
            v355.push({
                flags = "", 
                element = v398.anti_aim.settings:slider("Delay", 0, 20, 0, 1, function(v419)
                    if v419 == 0 then
                        return "Off";
                    else
                        return v419;
                    end;
                end), 
                index = "yaw_delay_" .. l_v415_0, 
                conditions = {
                    [1] = v418
                }
            });
            v355.push({
                flags = "", 
                element = v398.anti_aim.settings:combo("Yaw Modifier", {
                    [1] = "Disabled", 
                    [2] = "Center", 
                    [3] = "Offset", 
                    [4] = "Random", 
                    [5] = "Spin", 
                    [6] = "3-Way", 
                    [7] = "5-Way"
                }), 
                index = "yaw_modifier_" .. l_v415_0, 
                conditions = {
                    [1] = v418, 
                    [2] = function()
                        -- upvalues: v355 (ref), l_v415_0 (ref)
                        return v355.get("yaw_delay_" .. l_v415_0) == 0;
                    end
                }
            });
            v355.push({
                flags = "", 
                element = v398.anti_aim.settings:slider("Modifier Degree", -180, 180, 0), 
                index = "yaw_modifier_value_" .. l_v415_0, 
                conditions = {
                    [1] = v418, 
                    [2] = function()
                        -- upvalues: v355 (ref), l_v415_0 (ref)
                        return v355.get("yaw_modifier_" .. l_v415_0) ~= "Disabled";
                    end, 
                    [3] = function()
                        -- upvalues: v355 (ref), l_v415_0 (ref)
                        return v355.get("yaw_delay_" .. l_v415_0) == 0;
                    end
                }
            });
            v355.push({
                flags = "", 
                element = v398.anti_aim.settings:switch("Randomize Degree"), 
                index = "yaw_modifier_randomize_" .. l_v415_0, 
                conditions = {
                    [1] = v418, 
                    [2] = function()
                        -- upvalues: v355 (ref), l_v415_0 (ref)
                        return v355.get("yaw_modifier_" .. l_v415_0) ~= "Disabled";
                    end, 
                    [3] = function()
                        -- upvalues: v355 (ref), l_v415_0 (ref)
                        return v355.get("yaw_delay_" .. l_v415_0) == 0;
                    end
                }
            });
            local v420 = v355.get_element("yaw_modifier_randomize_" .. l_v415_0):create();
            v355.push({
                flags = "", 
                element = v420:slider("Value\nrandomize modifier", 0, 180, 0), 
                index = "yaw_modifier_randomize_value_" .. l_v415_0, 
                conditions = {
                    [1] = v418, 
                    [2] = function()
                        -- upvalues: v355 (ref), l_v415_0 (ref)
                        return v355.get("yaw_modifier_" .. l_v415_0) ~= "Disabled";
                    end, 
                    [3] = function()
                        -- upvalues: v355 (ref), l_v415_0 (ref)
                        return v355.get("yaw_delay_" .. l_v415_0) == 0;
                    end, 
                    [4] = function()
                        -- upvalues: v355 (ref), l_v415_0 (ref)
                        return v355.get("yaw_modifier_randomize_" .. l_v415_0);
                    end
                }
            });
            v355.push({
                flags = "", 
                element = v398.anti_aim.settings:combo("Fake Limit Type", {
                    [1] = "Static", 
                    [2] = "Jitter", 
                    [3] = "Random"
                }), 
                index = "fake_limit_type_" .. l_v415_0, 
                conditions = {
                    [1] = v418
                }
            });
            v355.push({
                flags = "", 
                element = v398.anti_aim.settings:slider("Fake Limit Left", 0, 60, 60), 
                index = "fake_limit_left_" .. l_v415_0, 
                conditions = {
                    [1] = v418
                }
            });
            v355.push({
                flags = "", 
                element = v398.anti_aim.settings:slider("Fake Limit Right", 0, 60, 60), 
                index = "fake_limit_right_" .. l_v415_0, 
                conditions = {
                    [1] = v418
                }
            });
            v355.push({
                flags = "", 
                element = v398.anti_aim.settings:slider("Jitter Value", 0, 60, 60), 
                index = "fake_limit_jitter_" .. l_v415_0, 
                conditions = {
                    [1] = v418, 
                    [2] = function()
                        -- upvalues: v355 (ref), l_v415_0 (ref)
                        return v355.get("fake_limit_type_" .. l_v415_0) == "Jitter";
                    end
                }
            });
            v355.push({
                flags = "", 
                element = v398.anti_aim.settings:slider("Random Min Value", 0, 60, 60), 
                index = "fake_limit_random_" .. l_v415_0, 
                conditions = {
                    [1] = v418, 
                    [2] = function()
                        -- upvalues: v355 (ref), l_v415_0 (ref)
                        return v355.get("fake_limit_type_" .. l_v415_0) == "Random";
                    end
                }
            });
            v355.push({
                flags = "", 
                element = v398.anti_aim.settings:selectable("Fake Options", {
                    [1] = "Avoid overlap", 
                    [2] = "Jitter", 
                    [3] = "Randomize Jitter", 
                    [4] = "Anti Bruteforce"
                }), 
                index = "fake_options_" .. l_v415_0, 
                conditions = {
                    [1] = v418
                }
            });
            v355.push({
                flags = "", 
                element = v398.anti_aim.settings:combo("Freestanding Desync", {
                    [1] = "Off", 
                    [2] = "Peek Fake", 
                    [3] = "Peek Real"
                }), 
                index = "freestanding_mode_" .. l_v415_0, 
                conditions = {
                    [1] = v418
                }
            });
            v355.push({
                flags = "", 
                element = v398.anti_aim.settings:switch("Inverter"), 
                index = "inverter_" .. l_v415_0, 
                conditions = {
                    [1] = v418
                }
            });
        end;
    end;
end;
v355.get_element("yaw_add_right_Legit aa"):set(-180);
v355.get_element("yaw_add_left_Legit aa"):set(-180);
v355.push({
    flags = "", 
    index = "ui_elements", 
    element = v398.settings.visuals:selectable(ui.get_icon("book-open-cover") .. "     Interface", {
        [1] = "Watermark", 
        [2] = "Keybinds", 
        [3] = "Spectators"
    }), 
    conditions = {}
});
v397.gears.ui_elements = v355.get_element("ui_elements"):create();
v355.push({
    flags = "", 
    index = "ui_style", 
    element = v397.gears.ui_elements:combo("Interface Style", {
        [1] = "Modern", 
        [2] = "Default", 
        [3] = "Glow"
    }), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return #v355.get("ui_elements") ~= 0;
        end
    }
});
v355.push({
    flags = "", 
    index = "watermark_name", 
    element = v397.gears.ui_elements:combo("Watermark Name", {
        [1] = "Cheat", 
        [2] = "Custom"
    }), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.contains("ui_elements", "Watermark");
        end
    }
});
v355.push({
    flags = "", 
    index = "watermark_name_ref", 
    element = v397.gears.ui_elements:input("Name"), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("watermark_name") == "Custom";
        end, 
        [2] = function()
            -- upvalues: v355 (ref)
            return v355.contains("ui_elements", "Watermark");
        end
    }
});
v355.push({
    flags = "", 
    index = "avatar_side", 
    element = v397.gears.ui_elements:combo("Avatars side", {
        [1] = "Left", 
        [2] = "Right"
    }), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.contains("ui_elements", "Spectators");
        end
    }
});
v355.push({
    flags = "c", 
    index = "ui_color", 
    element = v397.gears.ui_elements:color_picker("Color", color(142, 165, 229, 255)), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return #v355.get("ui_elements") ~= 0;
        end
    }
});
v355.push({
    flags = "", 
    index = "indicators_switch", 
    element = v398.settings.visuals:switch(ui.get_icon("images") .. "     Extraneous Indicators"), 
    conditions = {}
});
v397.gears.indicators = v355.get_element("indicators_switch"):create();
v355.push({
    flags = "", 
    index = "crosshair_style", 
    element = v397.gears.indicators:combo("Options", {
        [1] = "Disabled", 
        [2] = "Modern", 
        [3] = "Old", 
        [4] = "Acatel", 
        [5] = "Lite", 
        [6] = "Original"
    }), 
    conditions = {}
});
v355.push({
    flags = "", 
    index = "crosshair_label1", 
    element = v397.gears.indicators:label("\adaeb6effTo hide specific keybinds disable \"Show in Hotkeys\" in binding menu"), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("crosshair_style") == "Modern";
        end
    }
});
v355.push({
    flags = "c", 
    index = "indicators_color", 
    element = v397.gears.indicators:color_picker("Main Color", color(142, 165, 229, 255)), 
    conditions = {}
});
v355.push({
    flags = "c", 
    index = "indicators_color2", 
    element = v397.gears.indicators:color_picker("Watermark Color", color(142, 165, 229, 255)), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("crosshair_style") == "Modern";
        end
    }
});
v355.push({
    flags = "", 
    index = "indicators_font", 
    element = v397.gears.indicators:combo("Font", {
        [1] = "Small", 
        [2] = "Normal", 
        [3] = "Bold"
    }), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("crosshair_style") == "Modern";
        end
    }
});
v355.push({
    flags = "", 
    index = "indicators_height", 
    element = v397.gears.indicators:slider("Height\nindicators", -400, 400, 0), 
    conditions = {}
});
v355.push({
    flags = "", 
    index = "dmg_indicator", 
    element = v397.gears.indicators:switch("Damage Indicator")
});
v355.push({
    flags = "c", 
    index = "dmg_indicator_color", 
    element = v397.gears.indicators:color_picker("Accent color"), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("dmg_indicator");
        end
    }
});
v355.push({
    flags = "", 
    index = "dmg_indicator_font", 
    element = v397.gears.indicators:combo("Damage Font", {
        [1] = "Small", 
        [2] = "Normal", 
        [3] = "Bold"
    }), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("dmg_indicator");
        end
    }
});
v355.push({
    flags = "", 
    index = "manual_arrows", 
    element = v398.settings.visuals:switch(ui.get_icon("arrow-right") .. "      Manual Arrows"), 
    conditions = {}
});
v397.gears.manual_arrows = v355.get_element("manual_arrows"):create();
v355.push({
    flags = "", 
    index = "arrows_style", 
    element = v397.gears.manual_arrows:combo("Style\nmanual", {
        [1] = "Simple", 
        [2] = "Team Skeet"
    }), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("manual_arrows");
        end
    }
});
v355.push({
    flags = "c", 
    index = "arrows_color", 
    element = v397.gears.manual_arrows:color_picker("Color\nmanual", color(142, 165, 229, 255)), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("manual_arrows");
        end, 
        [2] = function()
            -- upvalues: v355 (ref)
            return v355.get("arrows_style") ~= "Disabled";
        end
    }
});
v355.push({
    flags = "", 
    index = "logs_notify", 
    element = v398.settings.visuals:switch(ui.get_icon("crosshairs") .. "     Logs under crosshair")
});
v397.gears.logs_notify = v355.get_element("logs_notify"):create();
v355.push({
    flags = "c", 
    index = "logs_notify_color_hit", 
    element = v397.gears.logs_notify:color_picker("Hit Color"), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("logs_notify");
        end
    }
});
v355.push({
    flags = "c", 
    index = "logs_notify_color_miss", 
    element = v397.gears.logs_notify:color_picker("Miss Color"), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("logs_notify");
        end
    }
});
v355.push({
    flags = "", 
    index = "snaplines_XDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD", 
    element = v398.settings.world_visuals:switch(ui.get_icon("lines-leaning") .. "      Snaplines")
});
v397.gears.snaplines = v355.get_element("snaplines_XDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD");
v355.push({
    flags = "c", 
    index = "snaplines_XDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD_color", 
    element = v397.gears.snaplines:color_picker("Color"), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("snaplines_XDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD");
        end
    }
});
v355.push({
    flags = "", 
    index = "custom_scope_switch", 
    element = v398.settings.visuals:switch(ui.get_icon("magnifying-glass-plus") .. "     Custom Zoom"), 
    conditions = {}
});
v397.gears.custom_scope = v355.get_element("custom_scope_switch"):create();
v355.push({
    flags = "", 
    index = "custom_scope_lenght", 
    element = v397.gears.custom_scope:slider("Line", 0, 500, 10), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("custom_scope_switch");
        end
    }
});
v355.push({
    flags = "", 
    index = "custom_scope_offset", 
    element = v397.gears.custom_scope:slider("Gap", 0, 500, 70), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("custom_scope_switch");
        end
    }
});
v355.push({
    flags = "c", 
    index = "custom_scope_color", 
    element = v397.gears.custom_scope:color_picker("Color", color(142, 165, 229, 255)), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("custom_scope_switch");
        end
    }
});
v355.push({
    flags = "", 
    index = "custom_scope_inaccuracy", 
    element = v397.gears.custom_scope:switch("Spread Based"), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("custom_scope_switch");
        end
    }
});
v355.push({
    flags = "", 
    index = "remove_top_bar", 
    element = v397.gears.custom_scope:switch("Remove Top Bar"), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("custom_scope_switch");
        end
    }
});
v355.push({
    flags = "", 
    index = "hitmarker", 
    element = v398.settings.world_visuals:switch(ui.get_icon("marker") .. "     Hit Markers"), 
    conditions = {}
});
v397.gears.hitmarkers = v355.get_element("hitmarker"):create();
v355.push({
    flags = "", 
    index = "hitmarker_type", 
    element = v397.gears.hitmarkers:selectable("Hitmarkers Type", {
        [1] = "+", 
        [2] = "damage"
    }), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("hitmarker");
        end
    }
});
v355.push({
    flags = "c", 
    index = "hitmarker_plus_color", 
    element = v397.gears.hitmarkers:color_picker("Hitmarker Color", color(88, 255, 209, 255)), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("hitmarker");
        end
    }
});
v355.push({
    flags = "c", 
    index = "hitmarker_damage_color", 
    element = v397.gears.hitmarkers:color_picker("Damage Hitmarker Color", color(88, 255, 209, 255)), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("hitmarker");
        end
    }
});
v355.push({
    flags = "", 
    index = "static_ragdolls", 
    element = v398.settings.world_visuals:switch(ui.get_icon("child") .. "       Static Ragdolls"), 
    conditions = {}
});
v355.push({
    flags = "", 
    index = "clantag", 
    element = v398.settings.misc:switch(ui.get_icon("tags") .. "    Clantag Spammer"), 
    conditions = {}
});
v397.gears.clantag = v355.get_element("clantag"):create();
v355.push({
    flags = "", 
    index = "clantag_text", 
    element = v397.gears.clantag:input("Text"), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("clantag");
        end
    }
});
v355.push({
    flags = "", 
    index = "no_fall_damage", 
    element = v398.settings.misc:switch(ui.get_icon("person-falling") .. "     No Fall Damage")
});
v355.push({
    flags = "", 
    index = "auto_unmute", 
    element = v398.settings.misc:switch(ui.get_icon("volume") .. "    Auto Unmute")
});
v355.push({
    flags = "", 
    index = "trash", 
    element = v398.settings.misc:switch(ui.get_icon("skull") .. "     Killsay"), 
    conditions = {}
});
v397.gears.trash = v355.get_element("trash"):create();
v355.push({
    flags = "", 
    index = "custom_console_color", 
    element = v398.settings.misc:switch(ui.get_icon("intercom") .. "     Custom Console")
});
v397.gears.custom_console = v355.get_element("custom_console_color"):create();
v355.push({
    flags = "c", 
    index = "console_color", 
    element = v397.gears.custom_console:color_picker("Color"), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("custom_console_color");
        end
    }
});
v355.push({
    flags = "", 
    index = "trash_warmup", 
    element = v397.gears.trash:switch("Disable On Warmup"), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("trash");
        end
    }
});
v355.push({
    flags = "", 
    index = "revolver_helper", 
    element = v398.settings.misc:switch(ui.get_icon("gun") .. "    Revolver Helper")
});
v355.push({
    flags = "", 
    index = "debug_info", 
    element = v398.settings.visuals:switch(ui.get_icon("circle-info") .. "     Debug Panel"), 
    conditions = {}
});
v397.gears.debug_panel = v355.get_element("debug_info"):create();
v355.push({
    flags = "c", 
    index = "debug_info_color", 
    element = v397.gears.debug_panel:color_picker("Color", color(142, 165, 229, 255)), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("debug_info");
        end
    }
});
v355.push({
    flags = "", 
    index = "viewmodel", 
    element = v398.settings.misc:switch(ui.get_icon("hand") .. "    Viewmodel Changer"), 
    conditions = {}
});
v397.gears.viewmodel = v355.get_element("viewmodel"):create();
v355.push({
    flags = "", 
    index = "viewmodel_fov", 
    element = v397.gears.viewmodel:slider("FOV", -100, 100, 68), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("viewmodel");
        end
    }
});
v355.push({
    flags = "", 
    index = "viewmodel_x", 
    element = v397.gears.viewmodel:slider("X", -100, 100, 2.5), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("viewmodel");
        end
    }
});
v355.push({
    flags = "", 
    index = "viewmodel_y", 
    element = v397.gears.viewmodel:slider("Y", -100, 100, 0), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("viewmodel");
        end
    }
});
v355.push({
    flags = "", 
    index = "viewmodel_z", 
    element = v397.gears.viewmodel:slider("Z", -100, 100, -1.5), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("viewmodel");
        end
    }
});
v355.push({
    flags = "", 
    index = "aspect_ratio", 
    element = v398.settings.misc:switch(ui.get_icon("tv-retro") .. "    Aspect Ratio"), 
    conditions = {}
});
v397.gears.aspect_ratio = v355.get_element("aspect_ratio"):create();
v355.push({
    flags = "", 
    index = "aspect_ratio_value", 
    element = v397.gears.aspect_ratio:slider("Value", 0, 20, 0, 0.1, function(v421)
        if v421 == 0 then
            return "Off";
        else
            return;
        end;
    end), 
    conditions = {
        [1] = function()
            -- upvalues: v355 (ref)
            return v355.get("aspect_ratio");
        end
    }
});
v31.dragging_fn = function(v422, v423, v424)
    -- upvalues: v398 (ref)
    return (function()
        -- upvalues: v398 (ref)
        local v425 = {};
        local v426 = nil;
        local v427 = nil;
        local v428 = nil;
        local v429 = nil;
        local v430 = nil;
        local v431 = nil;
        local _ = nil;
        local v433 = nil;
        local v434 = nil;
        local v435 = nil;
        local v436 = nil;
        local v437 = {};
        local v438 = {};
        local v450 = {
            __index = {
                drag = function(v439, ...)
                    -- upvalues: v425 (ref)
                    local v440, v441 = v439:get();
                    local v442, v443 = v425.drag(v440, v441, ...);
                    if v440 ~= v442 or v441 ~= v443 then
                        v439:set(v442, v443);
                    end;
                    return v442, v443;
                end, 
                set = function(v444, v445, v446)
                    local v447 = render.screen_size();
                    v444.x_reference:set(v445 / v447.x * v444.res);
                    v444.y_reference:set(v446 / v447.y * v444.res);
                end, 
                get = function(v448)
                    local v449 = render.screen_size();
                    return v448.x_reference:get() / v448.res * v449.x, v448.y_reference:get() / v448.res * v449.y;
                end
            }
        };
        v425.new = function(v451, v452, v453, v454)
            -- upvalues: v398 (ref), v450 (ref)
            if not v454 then
                v454 = 10000;
            end;
            local v455 = render.screen_size();
            local v456 = v398.main.info:slider(v451 .. " window position", 0, v454, v452 / v455.x * v454);
            local v457 = v398.main.info:slider(v451 .. " window position y", 0, v454, v453 / v455.y * v454);
            v456:visibility(false);
            v457:visibility(false);
            return setmetatable({
                name = v451, 
                x_reference = v456, 
                y_reference = v457, 
                res = v454
            }, v450);
        end;
        v425.drag = function(v458, v459, v460, v461, _, v463, _)
            -- upvalues: v426 (ref), v427 (ref), v428 (ref), v429 (ref), v437 (ref), v431 (ref), v430 (ref), v434 (ref), v433 (ref), v436 (ref), v435 (ref), v438 (ref)
            if globals.framecount ~= v426 then
                v427 = ui.get_alpha() > 0;
                local l_x_1 = v437.x;
                v429 = v437.y;
                v428 = l_x_1;
                v437 = ui.get_mouse_position();
                v431 = v430;
                v430 = common.is_button_down(1) == true;
                v434 = v433;
                v433 = {};
                v436 = v435;
                v435 = false;
                v438 = render.screen_size();
            end;
            if v427 and v431 ~= nil and (not v431 or v436) and v430 and v458 < v428 and v459 < v429 and v428 < v458 + v460 and v429 < v459 + v461 then
                v435 = true;
                local v466 = v458 + v437.x - v428;
                v459 = v459 + v437.y - v429;
                v458 = v466;
                if not v463 then
                    v458 = math.max(0, math.min(v438.x - v460, v458));
                    v459 = math.max(0, math.min(v438.y - v461, v459));
                end;
            end;
            table.insert(v433, {
                [1] = v458, 
                [2] = v459, 
                [3] = v460, 
                [4] = v461
            });
            return v458, v459, v460, v461;
        end;
        return v425;
    end)().new(v422, v423, v424);
end;
local v467 = {
    vars = {
        bestenemy = 0, 
        second_condition = "Normal", 
        custom_jitter_side = false, 
        player_condition = "global", 
        player_state = 1, 
        desync_value = 0, 
        best_value = false, 
        antiaim_state = {
            [1] = "global", 
            [2] = "Normal"
        }
    }
};
v467.player_state = function()
    -- upvalues: v31 (ref), v355 (ref), v393 (ref), v467 (ref), v392 (ref)
    local v468 = entity.get_local_player();
    if v468 == nil then
        return;
    else
        local l_m_iTeamNum_0 = v468.m_iTeamNum;
        local v470 = v31.on_ground(v468) and not common.is_button_down(32);
        local v471 = v355.get("legitaa_key");
        local v472 = v31.get_velocity(v468);
        local v473 = v31.is_crouching(v468) and v470;
        local l_m_fFlags_3 = v468.m_fFlags;
        local v475 = v393.slowwalk:get() and v470 and v472 > 2 and not v473;
        local v476 = v31.in_air(v468) and not v470 and l_m_fFlags_3 == 262;
        local v477 = v31.in_air(v468) and not v470;
        local v478 = v393.fakeduck:get() and v470;
        if v476 then
            v467.vars.player_state = 7;
        elseif v477 then
            v467.vars.player_state = 8;
        end;
        if v470 and v472 > 2 and l_m_fFlags_3 ~= 256 and l_m_fFlags_3 ~= 263 and not v478 then
            v467.vars.player_state = 3;
        end;
        if v470 and v472 < 2 and l_m_fFlags_3 ~= 256 and l_m_fFlags_3 ~= 263 and not v478 then
            v467.vars.player_state = 2;
        end;
        if l_m_iTeamNum_0 == 3 and v473 or l_m_iTeamNum_0 == 3 and v478 then
            v467.vars.player_state = 5;
        end;
        if l_m_iTeamNum_0 == 2 and v473 or l_m_iTeamNum_0 == 2 and v478 then
            v467.vars.player_state = 4;
        end;
        if v475 and not v478 then
            v467.vars.player_state = 6;
        end;
        if v471 then
            v467.vars.player_state = 9;
        end;
        v467.vars.player_condition = v392.plr_conditions[v467.vars.player_state];
        v467.vars.antiaim_state = {
            [1] = v467.vars.player_condition, 
            [2] = v467.vars.second_condition
        };
        return;
    end;
end;
v467.get_best_side = function(v479)
    -- upvalues: v467 (ref), v31 (ref)
    local v480 = entity.get_local_player();
    if not v480 then
        return;
    else
        local v481 = v480:get_eye_position();
        local v482 = entity.get_players(true);
        v467.vars.bestenemy = v31.get_nearest_enemy(v480, v482);
        local v483 = v467.vars.bestenemy ~= nil and entity.get(v467.vars.bestenemy) or nil;
        if v467.vars.bestenemy ~= nil and v467.vars.bestenemy ~= 0 and v483:is_alive() and v479 ~= nil then
            local l_x_2 = v483:get_hitbox_position(0).x;
            local l_y_1 = v483:get_hitbox_position(0).y;
            local _ = v483:get_hitbox_position(0).z;
            local v487 = v31.calc_angle(v481.x, v481.y, l_x_2, l_y_1);
            local v488, v489, _ = v31.angle_vector(0, v487 + 90);
            local v491 = v481.x + v488 * 10;
            local v492 = v481.y + v489 * 10;
            local v493, v494, _ = v31.angle_vector(0, v487 - 90);
            local v496 = v481.x + v493 * 10;
            local v497 = v481.y + v494 * 10;
            local v498, v499, _ = v31.angle_vector(0, v487 + 90);
            local v501 = v481.x + v498 * 100;
            local v502 = v481.y + v499 * 100;
            local v503, v504, _ = v31.angle_vector(0, v487 - 90);
            local v506 = v481.x + v503 * 100;
            local v507 = v481.y + v504 * 100;
            local v508 = v31.get_damage(v480, v483, v491, v492, v481.z);
            local v509 = v31.get_damage(v480, v483, v496, v497, v481.z);
            local v510 = v31.get_damage(v480, v483, v501, v502, v481.z);
            local v511 = v31.get_damage(v480, v483, v506, v507, v481.z);
            if v479 == "Freestanding" or v479 == "Reversed Freestanding" then
                if v511 < v510 or v509 < v508 or v508 < v510 then
                    local l_vars_0 = v467.vars;
                    if v479 == "Freestanding" then

                    end;
                    l_vars_0.best_value = true;
                elseif v510 < v511 or v508 < v509 or v509 < v511 then
                    v467.vars.best_value = v479 == "Freestanding";
                end;
            end;
        else
            v467.vars.best_value = true;
        end;
        return v467.vars.best_value;
    end;
end;
v467.legitaa = {};
v467.legitaa.vars = {
    classnames = {
        [1] = "CWorld", 
        [2] = "CCSPlayer", 
        [3] = "CFuncBrush"
    }
};
v467.legitaa.handle = function(v513)
    -- upvalues: v467 (ref)
    local v514 = entity.get_local_player();
    local v515 = 100;
    local v516 = entity.get_entities("CPlantedC4")[1];
    local v517 = v516 ~= nil and v516.m_vecOrigin or {};
    if v517.x ~= nil then
        v515 = v517:dist(v514.m_vecOrigin);
    end;
    local v518 = v514.m_iTeamNum == 3 and v515 < 66;
    local v519 = v514:get_eye_position();
    local v520 = render.camera_angles();
    local v521 = math.sin(math.rad(v520.x));
    local v522 = math.cos(math.rad(v520.x));
    local v523 = math.sin(math.rad(v520.y));
    local v524 = {
        [1] = v522 * math.cos(math.rad(v520.y)), 
        [2] = v522 * v523, 
        [3] = -v521
    };
    local v525 = utils.trace_line(v519, vector(v519.x + v524[1] * 8192, v519.y + v524[2] * 8192, v519.z + v524[3] * 8192));
    local v526 = true;
    if v525.entity ~= nil then
        for v527 = 0, #v467.legitaa.vars.classnames do
            if v525.entity:get_classname() == v467.legitaa.vars.classnames[v527] then
                v526 = false;
            end;
        end;
    end;
    local v528 = false;
    local v529 = v514:get_player_weapon();
    if v514.m_bInBombZone and v529 and v529:get_classname() == "CC4" then
        v528 = true;
    end;
    if not v526 and not v518 and not v528 then
        v513.in_use = 0;
    end;
end;
v467.set_antiaim = function(v530)
    -- upvalues: v393 (ref), v355 (ref), v467 (ref), v392 (ref)
    local v531 = entity.get_local_player();
    if not v531 then
        return;
    else
        local l_sv_maxusrcmdprocessticks_0 = cvar.sv_maxusrcmdprocessticks;
        local v533 = v531.m_flPoseParameter[11] * 120 - 60;
        v393.freestanding.body_freestanding:override(v355.get("freestanding_key2"));
        v393.freestanding.disable_yaw_modifiers:override(v355.get("freestanding_key1"));
        if v355.get("fake_lag") == "Fluctuate" then
            if math.random(1, 12.9) == 1 then
                v393.fakelag.limit:override(0);
            else
                v393.fakelag.limit:override(15);
            end;
        elseif v355.get("fake_lag") == "Maximum" then
            v393.fakelag.limit:override(15);
        elseif v355.get("fake_lag") == "Custom" or v355.get("fake_lag") == "Default" then

        end;
        if v355.contains("fakelag_disablers", "Hide Shots") and v393.hide_shots.switch:get() then
            v393.fakelag.switch:override(false);
        elseif v355.contains("fakelag_disablers", "Double Tap") and v393.doubletap.switch:get() then
            v393.fakelag.switch:override(false);
        elseif v355.contains("fakelag_disablers", "Standing") and v467.vars.player_state == 2 then
            v393.fakelag.switch:override(false);
        else
            v393.fakelag.switch:override(true);
        end;
        local function v536(v534, v535)
            -- upvalues: v530 (ref), v467 (ref), v533 (ref)
            if v530.choked_commands == 0 then
                v467.vars.desync_value = v533;
            end;
            return v467.vars.desync_value > 0 and v534 or v535;
        end;
        local function v540(v537)
            -- upvalues: v393 (ref)
            local l_mode_0 = v537.mode;
            local l_settings_0 = v537.settings;
            if l_mode_0 == "hidden" then
                v393.yaw.offset:override(l_settings_0[1]);
                v393.yaw_modifier.mode:override(l_settings_0[2]);
                v393.yaw_modifier.offset:override(l_settings_0[3]);
                v393.body_yaw.left_limit:override(l_settings_0[4]);
                v393.body_yaw.right_limit:override(l_settings_0[5]);
                v393.body_yaw.fake_options:override(l_settings_0[6]);
                v393.body_yaw.desync_freestand:override(l_settings_0[7]);
                v393.body_yaw.inverter:override(l_settings_0[8]);
            else
                v393.yaw.offset:set(l_settings_0[1]);
                v393.yaw_modifier.mode:set(l_settings_0[2]);
                v393.yaw_modifier.offset:set(l_settings_0[3]);
                v393.body_yaw.left_limit:set(l_settings_0[4]);
                v393.body_yaw.right_limit:set(l_settings_0[5]);
                v393.body_yaw.fake_options:set(l_settings_0[6]);
                v393.body_yaw.desync_freestand:set(l_settings_0[7]);
                v393.body_yaw.inverter:set(l_settings_0[8]);
            end;
        end;
        local v541 = v467.vars.antiaim_state[1] == "Legit aa";
        if v541 then
            v467.legitaa.handle(v530);
        end;
        local _ = "Backward";
        local v543 = "At Target";
        local v544 = "Down";
        local l_player_condition_0 = v467.vars.player_condition;
        local v546 = false;
        if v541 then
            if not v355.get("legitaa_at_targets") then
                v543 = "Local View";
            end;
            v544 = "Disabled";
            v393.freestanding.switch:override(false);
        elseif l_player_condition_0 == "Slowwalk" and v355.contains("freestanding_key3", "Slow Walk") or (l_player_condition_0 == "Air duck" or l_player_condition_0 == "Air") and v355.contains("freestanding_key3", "In Air") or (l_player_condition_0 == "Crouching CT" or l_player_condition_0 == "Crouching T") and v355.contains("freestanding_key3", "Crouching") then
            v393.freestanding.switch:override(false);
        else
            local v547 = v355.get("freestanding_key");
            v393.freestanding.switch:override(v547);
            v546 = v547;
        end;
        if v355.contains("antiaim_tweaks", "Avoid Backstab") then
            v393.yaw.avoid_backstab:override(true);
        else
            v393.yaw.avoid_backstab:override();
        end;
        if v355.get("defensive_settings") then
            v393.hide_shots.options:override(v355.get("defensive_on_hideshots") and "Break LC" or nil);
            if l_player_condition_0 == "Standing" and v355.contains("defensive_conditions", "Standing") or l_player_condition_0 == "Moving" and v355.contains("defensive_conditions", "Moving") or (l_player_condition_0 == "Crouching CT" or l_player_condition_0 == "Crouching T") and v355.contains("defensive_conditions", "Crouching") or l_player_condition_0 == "Slowwalk" and v355.contains("defensive_conditions", "Slowwalk") or l_player_condition_0 == "Air" and v355.contains("defensive_conditions", "Air") or l_player_condition_0 == "Air duck" and v355.contains("defensive_conditions", "Air duck") then
                v393.doubletap.lag_options:override("Always On");
            else
                v393.doubletap.lag_options:override();
            end;
            local v548 = true;
            local v549 = v355.get("defensive_antiaim_enable" .. v467.vars.antiaim_state[1]) and v392.plr_conditions[v467.vars.player_state] or v392.plr_conditions[1];
            if not v355.get("defensive_antiaim_enable" .. v549) or v546 and v355.contains("defensive_antiaim_disablers", "Freestanding") or v355.get("manual_yaw") ~= "At Target" and v355.contains("defensive_antiaim_disablers", "Manual Yaw") or v355.get("defensive_antiaim_state" .. v549) == "Hittable only" and entity.get_threat(true) == nil then
                v548 = false;
            end;
            if v548 then
                v393.yaw.hidden_aa:set(true);
                local v550 = 0;
                local v551 = 0;
                if v355.get("defensive_pitch_mode" .. v549) == "Custom" then
                    v550 = v355.get("defensive_pitch_custom_value" .. v549);
                else
                    v550 = ({
                        [1] = -89, 
                        [2] = -45, 
                        [3] = 0, 
                        [4] = 45, 
                        [5] = 89
                    })[v530.command_number % 5 + 1];
                end;
                local v552 = v355.get("defensive_yaw_mode" .. v549);
                if v552 == "Custom" then
                    v551 = v355.get("defensive_yaw_custom_value" .. v549);
                elseif v552 == "Spin" then
                    v551 = math.fmod(globals.realtime * math.abs(v355.get("defensive_yaw_custom_value" .. v549) / 30) * 360, 360);
                elseif v552 == "Sideways" then
                    v551 = v530.command_number % 4 >= 2 and 90 or -90;
                end;
                rage.antiaim:override_hidden_pitch(v550);
                rage.antiaim:override_hidden_yaw_offset(v551);
            else
                v393.yaw.hidden_aa:set(false);
            end;
        else
            v393.hide_shots.options:override();
            v393.doubletap.lag_options:override();
            v393.yaw.hidden_aa:set(false);
        end;
        v393.pitch:set(v544);
        v393.yaw.base:set(v543);
        v393.body_yaw.bodyyaw:set(true);
        if v355.contains("antiaim_tweaks", "Warmup Anti Aim") and not v355.get("warmup_crazymode") and entity.get_game_rules().m_bWarmupPeriod and not v541 then
            v540({
                settings = {
                    [1] = 0, 
                    [2] = "Disabled", 
                    [3] = 0, 
                    [4] = 58, 
                    [5] = 58, 
                    [6] = nil, 
                    [7] = "Off", 
                    [8] = false, 
                    [9] = "Disabled", 
                    [6] = {}
                }
            });
        elseif v355.contains("antiaim_tweaks", "Warmup Anti Aim") and v355.get("warmup_crazymode") and entity.get_game_rules().m_bWarmupPeriod and not v541 then
            v540({
                settings = {
                    [1] = nil, 
                    [2] = "Center", 
                    [3] = nil, 
                    [4] = nil, 
                    [5] = nil, 
                    [6] = "Jitter", 
                    [7] = "Off", 
                    [8] = false, 
                    [9] = "Disabled", 
                    [1] = math.random(-180, 180), 
                    [3] = math.random(-180, 180), 
                    [4] = math.random(-180, 180), 
                    [5] = math.random(-180, 180)
                }
            });
        else
            v467.vars.second_condition = "Normal";
            l_sv_maxusrcmdprocessticks_0:int(16);
            if v355.get("antiaim_presets") == "Custom" then
                v393.body_yaw.inverter:set(false);
                local v553 = v355.get("preset_enable_" .. v467.vars.antiaim_state[1]) and v392.plr_conditions[v467.vars.player_state] or v392.plr_conditions[1];
                local v554 = v355.get("yaw_add_left_" .. v553);
                local v555 = v355.get("yaw_add_right_" .. v553);
                local v556 = v355.get("yaw_add_type_" .. v553);
                local v557 = v536(v554, v555);
                if v556 == "Jitter" then
                    v557 = utils.random_int(0, 1) == 1 and v555 or v554;
                elseif v556 == "Random" then
                    v557 = utils.random_int(v555, v554);
                end;
                local v558 = v355.get("fake_limit_right_" .. v553);
                local v559 = v355.get("fake_limit_left_" .. v553);
                local v560 = v355.get("fake_limit_type_" .. v553);
                if v560 == "Jitter" then
                    if utils.random_int(0, 1) == 0 then
                        v558 = v355.get("fake_limit_jitter_" .. v553);
                        v559 = v355.get("fake_limit_jitter_" .. v553);
                    end;
                elseif v560 == "Random" then
                    v558 = utils.random_int(v558, v355.get("fake_limit_random_" .. v553));
                    v559 = utils.random_int(v559, v355.get("fake_limit_random_" .. v553));
                end;
                local v561 = v355.get("yaw_modifier_" .. v553);
                local v562 = v355.get("yaw_modifier_value_" .. v553);
                if v355.get("yaw_modifier_randomize_" .. v553) then
                    local v563 = v355.get("yaw_modifier_randomize_value_" .. v553);
                    v562 = v562 + utils.random_int(-v563, v563);
                end;
                local v564 = v355.get("fake_options_" .. v553);
                local v565 = v355.get("inverter_" .. v553);
                local v566 = v355.get("yaw_delay_" .. v553);
                if v566 > 0 then
                    if v530.choked_commands == 0 then
                        v467.vars.custom_jitter_side = v566 <= v530.command_number % v566 * 2;
                    end;
                    local l_custom_jitter_side_0 = v467.vars.custom_jitter_side;
                    v557 = l_custom_jitter_side_0 and v554 or v555;
                    v561 = "Disabled";
                    v562 = 0;
                    v559 = v559 * (l_custom_jitter_side_0 and -1 or 1);
                    v558 = v558 * (l_custom_jitter_side_0 and -1 or 1);
                    v564 = "Off";
                    v565 = false;
                end;
                v540({
                    settings = {
                        [1] = v557, 
                        [2] = v561, 
                        [3] = v562, 
                        [4] = v559, 
                        [5] = v558, 
                        [6] = v564, 
                        [7] = v355.get("freestanding_mode_" .. v553), 
                        [8] = v565
                    }
                });
            else
                local v568 = {
                    Standing = {
                        [1] = 0, 
                        [2] = "Disabled", 
                        [3] = 0, 
                        [4] = 0, 
                        [5] = 0, 
                        [6] = nil, 
                        [7] = "Off", 
                        [8] = false, 
                        [9] = "Disabled", 
                        [6] = {}
                    }, 
                    Moving = {
                        [1] = 0, 
                        [2] = "Disabled", 
                        [3] = 0, 
                        [4] = 0, 
                        [5] = 0, 
                        [6] = nil, 
                        [7] = "Off", 
                        [8] = false, 
                        [9] = "Disabled", 
                        [6] = {}
                    }, 
                    ["Crouching T"] = {
                        [1] = 0, 
                        [2] = "Disabled", 
                        [3] = 0, 
                        [4] = 0, 
                        [5] = 0, 
                        [6] = nil, 
                        [7] = "Off", 
                        [8] = false, 
                        [9] = "Disabled", 
                        [6] = {}
                    }, 
                    ["Crouching CT"] = {
                        [1] = 0, 
                        [2] = "Disabled", 
                        [3] = 0, 
                        [4] = 0, 
                        [5] = 0, 
                        [6] = nil, 
                        [7] = "Off", 
                        [8] = false, 
                        [9] = "Disabled", 
                        [6] = {}
                    }, 
                    Slowwalk = {
                        [1] = 0, 
                        [2] = "Disabled", 
                        [3] = 0, 
                        [4] = 0, 
                        [5] = 0, 
                        [6] = nil, 
                        [7] = "Off", 
                        [8] = false, 
                        [9] = "Disabled", 
                        [6] = {}
                    }, 
                    ["Air duck"] = {
                        [1] = 0, 
                        [2] = "Disabled", 
                        [3] = 0, 
                        [4] = 0, 
                        [5] = 0, 
                        [6] = nil, 
                        [7] = "Off", 
                        [8] = false, 
                        [9] = "Disabled", 
                        [6] = {}
                    }, 
                    Air = {
                        [1] = 0, 
                        [2] = "Disabled", 
                        [3] = 0, 
                        [4] = 0, 
                        [5] = 0, 
                        [6] = nil, 
                        [7] = "Off", 
                        [8] = false, 
                        [9] = "Disabled", 
                        [6] = {}
                    }, 
                    ["Legit aa"] = {
                        [1] = 0, 
                        [2] = "Disabled", 
                        [3] = 0, 
                        [4] = 0, 
                        [5] = 0, 
                        [6] = nil, 
                        [7] = "Off", 
                        [8] = false, 
                        [9] = "Disabled", 
                        [6] = {}
                    }, 
                    Global = {
                        [1] = 0, 
                        [2] = "Disabled", 
                        [3] = 0, 
                        [4] = 0, 
                        [5] = 0, 
                        [6] = nil, 
                        [7] = "Off", 
                        [8] = false, 
                        [9] = "Disabled", 
                        [6] = {}
                    }
                };
                if not v541 then
                    if v355.get("antiaim_presets") == "Current Meta" then
                        local v569 = -28 + utils.random_int(-31, 31);
                        v568.Standing = {
                            [1] = 12, 
                            [2] = "5-Way", 
                            [3] = nil, 
                            [4] = 58, 
                            [5] = 58, 
                            [6] = "Jitter", 
                            [7] = "Off", 
                            [8] = false, 
                            [3] = v569
                        };
                        v568.Moving = {
                            [1] = 12, 
                            [2] = "Offset", 
                            [3] = -28, 
                            [4] = 58, 
                            [5] = 58, 
                            [6] = "Jitter", 
                            [7] = "Off", 
                            [8] = false
                        };
                        v568["Crouching T"] = {
                            [1] = 12, 
                            [2] = "Disabled", 
                            [3] = 0, 
                            [4] = 60, 
                            [5] = 60, 
                            [6] = nil, 
                            [7] = "Peek Fake", 
                            [8] = false, 
                            [6] = {
                                [1] = "Avoid overlap", 
                                [2] = "Jitter"
                            }
                        };
                        v568["Crouching CT"] = {
                            [1] = 12, 
                            [2] = "Disabled", 
                            [3] = 0, 
                            [4] = 60, 
                            [5] = 60, 
                            [6] = nil, 
                            [7] = "Peek Fake", 
                            [8] = false, 
                            [6] = {
                                [1] = "Avoid overlap", 
                                [2] = "Jitter"
                            }
                        };
                        v568.Slowwalk = {
                            [1] = 12, 
                            [2] = "5-Way", 
                            [3] = nil, 
                            [4] = 58, 
                            [5] = 58, 
                            [6] = "Jitter", 
                            [7] = "Off", 
                            [8] = false, 
                            [3] = v569
                        };
                        v568["Air duck"] = {
                            [1] = 12, 
                            [2] = "5-Way", 
                            [3] = nil, 
                            [4] = 58, 
                            [5] = 58, 
                            [6] = "Jitter", 
                            [7] = "Off", 
                            [8] = false, 
                            [3] = v569
                        };
                        v568.Air = {
                            [1] = 12, 
                            [2] = "5-Way", 
                            [3] = nil, 
                            [4] = 58, 
                            [5] = 58, 
                            [6] = "Jitter", 
                            [7] = "Off", 
                            [8] = false, 
                            [3] = v569
                        };
                    elseif v355.get("antiaim_presets") == "Experimental" then
                        if v530.choked_commands == 0 then
                            v467.vars.custom_jitter_side = v530.command_number % 14 >= 6;
                        end;
                        local l_custom_jitter_side_1 = v467.vars.custom_jitter_side;
                        v568.Standing = {
                            [1] = nil, 
                            [2] = "Disabled", 
                            [3] = 0, 
                            [4] = nil, 
                            [5] = nil, 
                            [6] = "Select", 
                            [7] = "Off", 
                            [8] = false, 
                            [9] = "Disabled", 
                            [1] = l_custom_jitter_side_1 and -30 or 38, 
                            [4] = l_custom_jitter_side_1 and 58 or -58, 
                            [5] = l_custom_jitter_side_1 and -58 or 58
                        };
                        v568.Moving = {
                            [1] = nil, 
                            [2] = "Disabled", 
                            [3] = 0, 
                            [4] = nil, 
                            [5] = nil, 
                            [6] = "Select", 
                            [7] = "Off", 
                            [8] = false, 
                            [9] = "Disabled", 
                            [1] = l_custom_jitter_side_1 and 35 or -41, 
                            [4] = l_custom_jitter_side_1 and -58 or 58, 
                            [5] = l_custom_jitter_side_1 and 58 or -58
                        };
                        v568["Crouching T"] = {
                            [1] = nil, 
                            [2] = "Disabled", 
                            [3] = 0, 
                            [4] = nil, 
                            [5] = nil, 
                            [6] = "Select", 
                            [7] = "Off", 
                            [8] = false, 
                            [9] = "Disabled", 
                            [1] = l_custom_jitter_side_1 and -28 or 52, 
                            [4] = l_custom_jitter_side_1 and 58 or -58, 
                            [5] = l_custom_jitter_side_1 and -58 or 58
                        };
                        v568["Crouching CT"] = {
                            [1] = nil, 
                            [2] = "Disabled", 
                            [3] = 0, 
                            [4] = nil, 
                            [5] = nil, 
                            [6] = "Select", 
                            [7] = "Off", 
                            [8] = false, 
                            [9] = "Disabled", 
                            [1] = l_custom_jitter_side_1 and -28 or 52, 
                            [4] = l_custom_jitter_side_1 and 58 or -58, 
                            [5] = l_custom_jitter_side_1 and -58 or 58
                        };
                        v568.Slowwalk = {
                            [1] = nil, 
                            [2] = "Disabled", 
                            [3] = 0, 
                            [4] = nil, 
                            [5] = nil, 
                            [6] = "Select", 
                            [7] = "Off", 
                            [8] = false, 
                            [9] = "Disabled", 
                            [1] = l_custom_jitter_side_1 and -34 or 38, 
                            [4] = l_custom_jitter_side_1 and 58 or -58, 
                            [5] = l_custom_jitter_side_1 and -58 or 58
                        };
                        v568["Air duck"] = {
                            [1] = nil, 
                            [2] = "Disabled", 
                            [3] = 0, 
                            [4] = nil, 
                            [5] = nil, 
                            [6] = "Select", 
                            [7] = "Off", 
                            [8] = false, 
                            [9] = "Disabled", 
                            [1] = l_custom_jitter_side_1 and -12 or 12, 
                            [4] = l_custom_jitter_side_1 and 58 or -58, 
                            [5] = l_custom_jitter_side_1 and -58 or 58
                        };
                        v568.Air = {
                            [1] = nil, 
                            [2] = "Disabled", 
                            [3] = 0, 
                            [4] = nil, 
                            [5] = nil, 
                            [6] = "Select", 
                            [7] = "Off", 
                            [8] = false, 
                            [9] = "Disabled", 
                            [1] = l_custom_jitter_side_1 and -30 or 30, 
                            [4] = l_custom_jitter_side_1 and 58 or -58, 
                            [5] = l_custom_jitter_side_1 and -58 or 58
                        };
                    end;
                    v568["Legit aa"] = {
                        [1] = -180, 
                        [2] = "Disabled", 
                        [3] = 0, 
                        [4] = 60, 
                        [5] = 60, 
                        [6] = "Off", 
                        [7] = "Peek Fake", 
                        [8] = false, 
                        [9] = "Opposite"
                    };
                end;
                v540({
                    mode = "hidden", 
                    settings = v568[v467.vars.antiaim_state[1]]
                });
            end;
        end;
        if v541 then
            v540({
                settings = {
                    [1] = -180, 
                    [2] = "Center", 
                    [3] = nil, 
                    [4] = 58, 
                    [5] = 58, 
                    [6] = nil, 
                    [7] = "Off", 
                    [8] = false, 
                    [9] = "Disabled", 
                    [3] = v355.get("legitaa_jitter") and v536(44, 44) or 0, 
                    [6] = v355.get("legitaa_jitter") and "Jitter" or "Select"
                }
            });
        end;
        if v355.contains("antiaim_tweaks", "Safe Head") then
            local v571 = v531:get_player_weapon();
            local v572 = entity.get_threat();
            if v467.vars.player_condition == "Air duck" and v571 and v572 and string.find(v571:get_classname(), "Knife") then
                local v573 = v531:get_eye_position();
                local v574 = v572:get_eye_position();
                local v575 = v573.z - v574.z;
                if v575 < 90 and v575 > -40 then
                    v540({
                        settings = {
                            [1] = 0, 
                            [2] = "Disabled", 
                            [3] = 0, 
                            [4] = 0, 
                            [5] = 0, 
                            [6] = nil, 
                            [7] = "Off", 
                            [8] = false, 
                            [6] = {}
                        }
                    });
                    v393.yaw.hidden_aa:set(false);
                end;
            end;
        end;
        if not v541 then
            if v355.get("manual_yaw") == "Left" then
                if v355.get("Static_Manual_Yaw") then
                    v393.yaw_modifier.offset:override(0);
                    v393.body_yaw.fake_options:override("");
                    v393.body_yaw.left_limit:override(58);
                    v393.body_yaw.right_limit:override(58);
                end;
                v393.yaw.offset:override(-90);
            elseif v355.get("manual_yaw") == "Right" then
                if v355.get("Static_Manual_Yaw") then
                    v393.yaw_modifier.offset:override(0);
                    v393.body_yaw.fake_options:override("");
                    v393.body_yaw.left_limit:override(58);
                    v393.body_yaw.right_limit:override(58);
                end;
                v393.yaw.offset:override(90);
            elseif v355.get("manual_yaw") == "Forward" then
                if v355.get("Static_Manual_Yaw") then
                    v393.yaw_modifier.offset:override(0);
                    v393.body_yaw.fake_options:override("");
                    v393.body_yaw.left_limit:override(58);
                    v393.body_yaw.right_limit:override(58);
                end;
                v393.yaw.offset:override(180);
            elseif v355.get("manual_yaw") == "At Target" then
                v393.yaw.mode:set("Backward");
                v393.yaw.base:set("At Target");
            elseif v355.get("manual_yaw") == "Backward" then
                v393.yaw.mode:set("Backward");
                v393.yaw.base:set("Local View");
            end;
        end;
        return;
    end;
end;
local v576 = {
    indicators = {}
};
v576.indicators.activity = 0;
v576.indicators.antiaim_states = {
    [1] = "STANDING", 
    [2] = "STANDING", 
    [3] = "MOVING", 
    [4] = "CROUCHING", 
    [5] = "CROUCHING", 
    [6] = "WALKING", 
    [7] = "AIR DUCK", 
    [8] = "AIR", 
    [9] = "LEGIT AA"
};
v576.indicators.time_to_ticks = function(v577)
    return math.floor(0.5 + v577 / globals.tickinterval);
end;
v576.indicators.get_bind = function(v578)
    local v579 = false;
    local v580 = 0;
    local v581 = ui.get_binds();
    for v582 = 1, #v581 do
        if v581[v582].name == v578 and v581[v582].active then
            v579 = true;
            v580 = v581[v582].value;
        end;
    end;
    return {
        [1] = v579, 
        [2] = v580
    };
end;
v576.indicators.gram_create = function(v583, v584)
    local v585 = {};
    for v586 = 1, v584 do
        v585[v586] = v583;
    end;
    return v585;
end;
v576.indicators.vars = {
    scope_adder = 0, 
    dt_color2 = 0, 
    dt_color = 0, 
    modern = {
        scope = 0, 
        state = l_smoothy_0.new(), 
        dt = {
            0, 
            l_smoothy_0.new()
        }, 
        hs = {
            0, 
            l_smoothy_0.new()
        }, 
        values = {}
    }, 
    values = v31.gram_create(0, 15), 
    charge = l_smoothy_0.new(0), 
    menu = l_smoothy_0.new(0), 
    pulse = l_smoothy_0.new(0)
};
for v587 = 1, 15 do
    v576.indicators.vars[v587] = {
        alpha_modulate = l_smoothy_0.new(0), 
        scope_adder = l_smoothy_0.new(0), 
        width = l_smoothy_0.new(0)
    };
end;
local v588 = {
    font = {
        size = 11, 
        font = render.load_font("Verdana Bold", 11)
    }, 
    font7 = {
        size = 13, 
        font = render.load_font("Arial", 13, "a")
    }, 
    fontdx = {
        font = render.load_font("nl\\jagoyaw\\fonts\\pixel.ttf", 10, "o")
    }, 
    console = {
        size = 10, 
        font = render.load_font("nl\\jagoyaw\\fonts\\lucida_console.ttf", 10, "d")
    }
};
v576.indicators.vars2 = {
    values = {}, 
    elements = {
        [1] = {
            text = function()
                -- upvalues: v355 (ref), l_gradient_0 (ref)
                color_ref = v355.get("indicators_color");
                l_gradient_0.text_animate("jago", -4, {
                    color(255, 255, 255), 
                    color(color_ref.r, color_ref.g, color_ref.b, 255)
                }):animate();
                return l_gradient_0.text_animate("jago", -4, {
                    color(255, 255, 255), 
                    color(color_ref.r, color_ref.g, color_ref.b, 255)
                }):get_animated_text();
            end, 
            active = function()
                return true;
            end, 
            color = color()
        }, 
        [2] = {
            text = "dt", 
            active = function()
                -- upvalues: v393 (ref)
                if v393.doubletap.switch:get() then
                    return true;
                else
                    return false;
                end;
            end, 
            color = color()
        }, 
        [3] = {
            text = "fs", 
            active = function()
                -- upvalues: v393 (ref), v355 (ref)
                if v393.freestanding.switch:get() or v355.get("freestanding_key") then
                    return true;
                else
                    return false;
                end;
            end, 
            color = color()
        }, 
        [4] = {
            text = "hide", 
            active = function()
                -- upvalues: v393 (ref)
                if v393.hide_shots.switch:get() then
                    return true;
                else
                    return false;
                end;
            end, 
            color = color()
        }, 
        [5] = {
            text = "duck", 
            active = function()
                -- upvalues: v393 (ref)
                if v393.fakeduck:get() then
                    return true;
                else
                    return false;
                end;
            end, 
            color = color()
        }, 
        [6] = {
            text = "dmg", 
            active = function()
                local v589 = ui.get_binds();
                for v590 = 1, #v589 do
                    local v591 = v589[v590];
                    if v591.name == "Min. Damage" and v591.active then
                        return true;
                    end;
                end;
                return false;
            end, 
            color = color()
        }
    }
};
v576.indicators.draw = function()
    -- upvalues: v31 (ref), v393 (ref), v588 (ref), v355 (ref), v467 (ref), v353 (ref), v576 (ref), v354 (ref), l_smoothy_0 (ref), l_defensive_0 (ref)
    local v592 = 25;
    local v593 = 4;
    local v594 = render.screen_size();
    local v595 = v594.x / 2;
    local v596 = v594.y / 2;
    local _ = common.is_button_down(32);
    local v598 = entity.get_local_player();
    if not v598 then
        return;
    else
        local _ = v598.m_bIsScoped;
        local _ = math.sin(math.abs(-math.pi + globals.curtime * 1.4285714285714286 % (math.pi * 2))) * 255;
        local _ = v598.m_fFlags;
        local v602 = entity.get_local_player();
        local _ = v31.on_ground(v602);
        local _ = 0;
        local v605 = 0;
        local v606 = v393.doubletap.switch:get();
        local _ = v393.doubletap.lag_options:override();
        local _ = v393.hide_shots.switch:get();
        local v609 = v393.body_aim.mode:get();
        local v610 = v393.safe_point:get();
        local _ = v602.m_flPoseParameter[11] * 120 - 60;
        local _ = rage.exploit:get();
        local v613 = v602.m_flPoseParameter[11] * 120 - 60 > 0;
        local v614 = v602.m_flPoseParameter[11] * 120 - 60;
        local v615 = "";
        local _ = "";
        if v614 > 55 then
            v615 = color(155, 11, 32, 255);
        else
            v615 = color(220, 135, 49, 255);
        end;
        local _ = render.measure_text(v588.font7.font, nil, "JAG0 YAW");
        local v618 = render.measure_text(v588.font7.font, nil, "JAG0 YAW");
        if not v598:is_alive() then
            return;
        else
            if v355.get("crosshair_style") == "Original" and v355.get("indicators_switch") then
                local v619 = v355.get("indicators_color");
                local v620 = v355.get("indicators_height");
                v596 = v596 + v620;
                render.text(v588.font7.font, vector(v595 + 12 + v592 / 2 - v618.x / 2 + 1, v596 + 20 + v593 + 1), color(0, 0, 0, 255), nil, tostring(math.abs(math.floor(v614)) .. "\194\176"));
                render.text(v588.font7.font, vector(v595 + 12 + v592 / 2 - v618.x / 2, v596 + 20 + v593), color(v619.r, v619.g, v619.b, 255), nil, tostring(math.abs(math.floor(v614)) .. "\194\176"));
                render.gradient(vector(v594.x / 2, v594.y / 2 + v620 + 39), vector(v594.x / 2 + math.abs(v614 * 110 / 100), v594.y / 2 + v620 + 40), v619, color(v619.r, v619.g, v619.b, 0), v619, color(v619.r, v619.g, v619.b, 0));
                render.gradient(vector(v594.x / 2, v594.y / 2 + v620 + 39), vector(v594.x / 2 + -math.abs(v614 * 110 / 100), v594.y / 2 + v620 + 40), v619, color(v619.r, v619.g, v619.b, 0), v619, color(v619.r, v619.g, v619.b, 0));
                local _ = render.measure_text(v588.font7.font, nil, "JAG0WALK");
                local v622 = render.measure_text(v588.font7.font, nil, "LEGIT AA");
                local v623 = render.measure_text(v588.font7.font, nil, "AUTO-DIR");
                local v624 = render.measure_text(v588.font7.font, nil, "JAG0YAW");
                local _ = render.measure_text(v588.font7.font, nil, "DMG");
                if v467.vars.antiaim_state[1] == "Legit aa" then
                    render.text(v588.font7.font, vector(v595 + 1 - v622.x / 2, v596 + 39 + v593 + 1), color(0, 0, 0, 255), nil, "LEGIT AA");
                    render.text(v588.font7.font, vector(v595 - v622.x / 2, v596 + 39 + v593), color(v619.r, v619.g, v619.b, 255), nil, "LEGIT AA");
                elseif v393.yaw.base:get() == 5 then
                    render.text(v588.font7.font, vector(v595 - 6 + v623.x / 2, v596 + 39 + v593 + 1), color(0, 0, 0, 255), nil, "FREESTAND");
                    render.text(v588.font7.font, vector(v595 - 7 + v623.x / 2, v596 + 39 + v593), color(v619.r, v619.g, v619.b, 255), nil, "FREESTAND");
                else
                    render.text(v588.font7.font, vector(v595 + 1 - v624.x / 2, v596 + 40 + v593), color(0, 0, 0, 255), nil, "JAGOYAW");
                    render.text(v588.font7.font, vector(v595 - v624.x / 2, v596 + 39 + v593), color(v619.r, v619.g, v619.b, 255), nil, "JAGOYAW");
                end;
            elseif v355.get("crosshair_style") == "Old" and v355.get("indicators_switch") then
                local v626 = 0;
                local l_m_bIsScoped_1 = v602.m_bIsScoped;
                local v628 = v355.get("indicators_height");
                local v629 = {
                    [1] = v594.x / 2, 
                    [2] = v594.y / 2 + v628
                };
                local v630 = v355.get("indicators_color");
                local v631 = "JAGO";
                local v632 = "";
                for v633 = 1, #v631 do
                    local v634 = v633 ~= #v631 and "  " or "";
                    v632 = v632 .. v631:sub(v633, v633) .. v634;
                end;
                local _ = render.measure_text(2, "o", v632);
                local l_v614_0 = v614;
                local v637 = l_v614_0 > 0 and {
                    [1] = v630.r, 
                    [2] = v630.g, 
                    [3] = v630.b
                } or {
                    [1] = 255, 
                    [2] = 255, 
                    [3] = 255
                };
                local v638 = l_v614_0 < 0 and {
                    [1] = v630.r, 
                    [2] = v630.g, 
                    [3] = v630.b
                } or {
                    [1] = 255, 
                    [2] = 255, 
                    [3] = 255
                };
                local v639 = v31.gradient_text(v637[1], v637[2], v637[3], 255, v638[1], v638[2], v638[3], 255, v632);
                local v640 = v353.quad_in_out(v576.indicators.vars.dt_color, 0, 1, 1);
                local v641 = v353.quad_in_out(v576.indicators.vars.dt_color2, 0, 1, 1);
                local v642 = {
                    [1] = 255 - 255 * v640 * (1 - v641), 
                    [2] = 255 * v640 - 100 * v641, 
                    [3] = 0 + 60 * v641
                };
                local v643 = globals.frametime * 4;
                local v644 = rage.exploit:get() == 1;
                v576.indicators.vars.dt_color = math.clamp(v576.indicators.vars.dt_color + (v644 and v643 or -v643), 0, 1);
                v576.indicators.vars.dt_color2 = math.clamp(v576.indicators.vars.dt_color2 + (v393.hide_shots.switch:get() and v393.doubletap.switch:get() and v644 and v643 or -v643), 0, 1);
                local v645 = globals.frametime * 3;
                local v646 = v353.quad_in_out(v576.indicators.vars.scope_adder, 0, 1, 1);
                v576.indicators.vars.scope_adder = math.clamp(v576.indicators.vars.scope_adder + (l_m_bIsScoped_1 and v645 or -v645), 0, 1);
                local l_v646_0 = v646;
                local v648 = 20 - 20 * l_v646_0;
                local v649 = 20 + 10 * l_v646_0;
                local v650 = tostring(math.floor(math.abs(l_v614_0)));
                local v651 = render.measure_text(2, "o", v650);
                render.text(2, vector(v629[1] - 3 + (v651.x / 2 * l_v646_0 + 4 - 4 * l_v646_0) + l_v646_0 * 6, v629[2] - 8), color(240, 240, 240, 230), "c", v650);
                render.gradient(vector(v629[1] + l_v646_0 * 3, v629[2] - 3), vector(v629[1] + l_v646_0 * 3 + v649 * (math.abs(l_v614_0) / 60), v629[2] - 3 + 1), color(v630.r, v630.g, v630.b, v630.a), color(v630.r, v630.g, v630.b, 0), color(v630.r, v630.g, v630.b, v630.a), color(v630.r, v630.g, v630.b, 0));
                render.gradient(vector(v629[1] + l_v646_0 * 4, v629[2] - 3), vector(v629[1] + l_v646_0 * 4 + -(v648 * (math.abs(l_v614_0) / 60)), v629[2] - 3 + 1), color(v630.r, v630.g, v630.b, v630.a), color(v630.r, v630.g, v630.b, 0), color(v630.r, v630.g, v630.b, v630.a), color(v630.r, v630.g, v630.b, 0));
                v626 = v626 + 2;
                local v652 = {
                    [1] = {
                        [1] = true, 
                        [2] = v639, 
                        [3] = {
                            [1] = 255, 
                            [2] = 255, 
                            [3] = 255, 
                            [4] = 255
                        }
                    }, 
                    [2] = {
                        [1] = nil, 
                        [2] = "ROLL", 
                        [1] = v467.vars.antiaim_state[2] == "Sideways Roll" or v467.vars.antiaim_state[2] == "Roll", 
                        [3] = {
                            [1] = 160, 
                            [2] = 160, 
                            [3] = 160, 
                            [4] = 255
                        }
                    }, 
                    [3] = {
                        [1] = nil, 
                        [2] = "DT", 
                        [1] = v393.doubletap.switch:get(), 
                        [3] = {
                            [1] = nil, 
                            [2] = nil, 
                            [3] = nil, 
                            [4] = 255, 
                            [1] = v642[1], 
                            [2] = v642[2], 
                            [3] = v642[3]
                        }
                    }, 
                    [4] = {
                        [1] = nil, 
                        [2] = "OS", 
                        [1] = v393.hide_shots.switch:get(), 
                        [3] = {
                            [1] = nil, 
                            [2] = nil, 
                            [3] = nil, 
                            [4] = 255, 
                            [1] = 225 - 70 * v641, 
                            [2] = 170 - 70 * v641, 
                            [3] = 160 - 70 * v641
                        }
                    }, 
                    [5] = {
                        [1] = nil, 
                        [2] = "FS", 
                        [1] = v393.freestanding.switch:get() or v355.get("freestanding_key"), 
                        [3] = {
                            [1] = 255, 
                            [2] = 255, 
                            [3] = 255, 
                            [4] = 255
                        }
                    }, 
                    [6] = {
                        [1] = nil, 
                        [2] = "SP", 
                        [1] = v393.safe_point:get() == "Force", 
                        [3] = {
                            [1] = 120, 
                            [2] = 200, 
                            [3] = 120, 
                            [4] = 255
                        }
                    }, 
                    [7] = {
                        [1] = nil, 
                        [2] = "FB", 
                        [1] = v393.body_aim.mode:get() == "Force", 
                        [3] = {
                            [1] = 170, 
                            [2] = 50, 
                            [3] = 255, 
                            [4] = 255
                        }
                    }
                };
                for v653, v654 in ipairs(v652) do
                    local v655 = render.measure_text(2, "o", v654[2]);
                    local v656 = globals.frametime * 5;
                    local v657 = v353.quad_in_out(v576.indicators.vars.values[v653], 0, 1, 1);
                    local v658 = v655.x / 2 * v646 + 2 * v646;
                    if v653 == 2 then
                        v626 = v626 + 1;
                    end;
                    v658 = math.ceil(v658);
                    v576.indicators.vars.values[v653] = math.clamp(v576.indicators.vars.values[v653] + (v654[1] and v656 or -v656), 0, 1);
                    render.text(2, vector(v629[1] + 1 + v658, v629[2] + v626), color(v654[3][1], v654[3][2], v654[3][3], v654[3][4] * v657), "c", v654[2]);
                    v626 = v626 + 8 * v657;
                end;
            elseif v355.get("crosshair_style") == "Acatel" and v355.get("indicators_switch") == true then
                local _ = render.measure_text(2, nil, "JAG0YAW");
                local v660 = v355.get("indicators_color");
                v596 = v596 + v355.get("indicators_height");
                render.text(v588.fontdx.font, vector(v595 + 3, v596 + 15), color(), nil, "JAG0YAW " .. v31.colored_text(v660.r, v660.g, v660.b, 255, v354.lua_version:upper()));
                if #entity.get_players(true) == 0 then
                    render.text(v588.fontdx.font, vector(v595 + 3, v596 + 23), color(244, 208, 63, 255), nil, "DORMANCY:" .. v31.colored_text(255, 255, 255, 255, "0"));
                else
                    render.text(v588.fontdx.font, vector(v595 + 3, v596 + 23), color(165, 177, 217, 255), nil, "FAKE");
                    render.text(v588.fontdx.font, vector(v595 + 25, v596 + 23), color(165, 177, 217, 255), nil, "YAW:");
                    render.text(v588.fontdx.font, vector(v595 + 40, v596 + 23), color(165, 177, 217, 255), nil, "" .. v31.colored_text(255, 255, 255, 255, v613 and " R" or " L"));
                end;
                if v606 and not v393.fakeduck:get() and v393.auto_peek:get() then
                    local v661 = rage.exploit:get();
                    local v662 = math.floor(v661 * 1000 / 10) .. "x";
                    local v663 = {
                        [1] = 255, 
                        [2] = 0, 
                        [3] = 0
                    };
                    if v661 == 1 then
                        v662 = "100x";
                        v663 = {
                            [1] = 84, 
                            [2] = 255, 
                            [3] = 40
                        };
                    end;
                    render.text(v588.fontdx.font, vector(v595 + 3, v596 + 31), color(255, 255, 255, 255), nil, "IDEALTICK " .. v31.colored_text(v663[1], v663[2], v663[3], 255, v662));
                    v605 = v605 + 8;
                elseif v606 then
                    local v664 = rage.exploit:get();
                    local v665 = "DT";
                    local v666 = {
                        [1] = 255, 
                        [2] = 0, 
                        [3] = 0
                    };
                    if v664 == 1 then
                        v666 = {
                            [1] = 84, 
                            [2] = 255, 
                            [3] = 40
                        };
                    end;
                    if v393.fakeduck:get() then
                        v665 = "DT (FAKE DUCK)";
                    end;
                    render.text(v588.fontdx.font, vector(v595 + 3, v596 + 31), color(v666[1], v666[2], v666[3], 255), nil, v665);
                    v605 = v605 + 8;
                elseif v393.hide_shots.switch:get() then
                    render.text(v588.fontdx.font, vector(v595 + 3, v596 + 31), color(227, 167, 176, 255), nil, "ONSHOT");
                    v605 = v605 + 8;
                elseif v393.fakeduck:get() then
                    render.text(v588.fontdx.font, vector(v595 + 3, v596 + 31), color(255, 255, 255, 255), nil, "FAKE DUCK");
                    v605 = v605 + 8;
                end;
                local v667 = render.measure_text(2, nil, "BAIM");
                render.text(v588.fontdx.font, vector(v595 + 3, v596 + 31 + v605), color(255, 255, 255, v609 == "Force" and 255 or 100), nil, "BAIM");
                local v668 = render.measure_text(2, nil, "SP");
                render.text(v588.fontdx.font, vector(v595 + 5 + v667.x, v596 + 31 + v605), color(255, 255, 255, v610 == "Force" and 255 or 100), nil, "SP");
                render.text(v588.fontdx.font, vector(v595 + 5 + v667.x + v668.x, v596 + 31 + v605), color(255, 255, 255, v393.freestanding.switch:get() and 255 or 100), nil, "FS");
            elseif v355.get("crosshair_style") == "Lite" and v355.get("indicators_switch") then
                local l_elements_0 = v576.indicators.vars2.elements;
                local l_values_0 = v576.indicators.vars2.values;
                local l_m_bIsScoped_2 = v602.m_bIsScoped;
                local v672 = 7;
                local v673 = -1;
                local v674 = 1;
                local v675 = v594 / 2 + vector(0, v355.get("indicators_height"));
                local v676 = vector();
                for v677 = 1, #l_elements_0 do
                    local v678 = l_elements_0[v677];
                    if not l_values_0[v677] then
                        l_values_0[v677] = l_smoothy_0.new();
                    end;
                    if not l_values_0.scope then
                        l_values_0.scope = l_smoothy_0.new();
                    end;
                    local v679 = v678.active();
                    l_values_0.scope(0.4, l_m_bIsScoped_2);
                    l_values_0[v677](0.1, v679);
                    local l_value_0 = l_values_0[v677].value;
                    if l_value_0 > 0 then
                        local l_value_1 = l_values_0.scope.value;
                        local v682 = type(v678.text) == "function" and v678.text() or v678.text;
                        local v683 = render.measure_text(v674, nil, v682);
                        local v684 = type(v678.color) == "function" and v678.color() or v678.color;
                        local v685 = math.floor(-(v683.x / 2) * (1 - l_value_1) + v672 * l_value_1);
                        render.text(v674, v675 + vector(v685, 11) + v676, v684:alpha_modulate(255 * l_value_0), nil, v682);
                        v676.y = v676.y + (v683.y + v673) * l_value_0;
                    end;
                end;
            elseif v355.get("crosshair_style") == "Modern" and v355.get("indicators_switch") then
                if not v602 or not v602:is_alive() then
                    return;
                else
                    local v686 = v594 / 2 + vector(0, v355.get("indicators_height"));
                    local v687 = vector();
                    local v688 = v355.get("indicators_color");
                    local v689 = v355.get("indicators_color2");
                    v688.a = 255;
                    v689.a = 255;
                    local v690 = ({
                        Small = 2, 
                        Bold = 4, 
                        Normal = 1
                    })[v355.get("indicators_font")];
                    local v691 = v690 ~= 2 and 2 or 0;
                    local l_frametime_0 = globals.frametime;
                    v576.indicators.vars.modern.scope = math.clamp(v576.indicators.vars.modern.scope + (v598.m_bIsScoped and l_frametime_0 * 6 or -l_frametime_0 * 6), 0, 1);
                    local v693 = v353.quad_in_out(v576.indicators.vars.modern.scope, 0, 1, 1);
                    local v694 = "JAGOYAW";
                    local v695 = string.upper(v354.lua_version);
                    local v696 = math.abs(math.sin(globals.curtime * 1.5)) * 255;
                    local v697 = string.format("\a%s%s \a%s%s", v688:to_hex(), v694, v689:alpha_modulate(v696):to_hex(), v695);
                    local v698 = render.measure_text(v690, "", v697);
                    local v699 = vector(math.floor(-(v698.x / 2) * (1 - v693) + 2 * v693), 0);
                    render.text(v690, v686 + v699, color(), "", v697);
                    v687.y = v687.y + v698.y - 2 + v691;
                    v694 = v467.vars.player_condition;
                    v695 = v355.get("manual_yaw");
                    if v695 ~= "At Target" then
                        v694 = string.format("MANUAL %s", string.upper(v695));
                    end;
                    v696 = string.format("- %s -", string.upper(v694));
                    v697 = render.measure_text(v690, "", v696);
                    v698 = math.clamp(v576.indicators.vars.modern.state(0.05, v697.x), 0, v697.x);
                    v699 = vector(math.floor(-(v697.x / 2) * (1 - v693) * (v698 / v697.x) + 2 * v693));
                    render.push_clip_rect(v686 + v699 + v687, v686 + v699 + v687 + vector(v698, v697.y));
                    render.text(v690, v686 + v687 + v699, v688, "", v696);
                    render.pop_clip_rect();
                    v687.y = v687.y + v697.y - 3 + v691;
                    v694 = false;
                    v695 = v602:get_player_weapon();
                    if v695 then
                        v694 = (v695.m_flNextPrimaryAttack or 0) > globals.curtime;
                    end;
                    v695 = v393.doubletap.switch:get();
                    v696 = rage.exploit:get();
                    v697 = v393.auto_peek:get();
                    v576.indicators.vars.modern.dt[1] = math.clamp(v576.indicators.vars.modern.dt[1] + (v695 and l_frametime_0 * 2.5 or -l_frametime_0 * 2.5), 0, 1);
                    v698 = v353.quart_in_out(v576.indicators.vars.modern.dt[1], 0, 1, 1);
                    if v698 > 0 then
                        v699 = string.format("\a%s%s %s", v688:alpha_modulate(120):to_hex(), v697 and "IDEAL TICK" or "DT", v696 == 0 and string.format("\a%s%s", color(255, 0, 0, 60):to_hex(), "WAITING") or v696 == 1 and (l_defensive_0() and string.format("\a%s%s", color(192, 255, 145, 120):to_hex(), "ACTIVE") or string.format("\a%s%s", color(127, 255, 255, 120):to_hex(), "READY")) or string.format("\a%s%s", color(255, 50, 50, 120):lerp(color(203, 239, 172, 120), v696):to_hex(), "CHARGING"));
                        local v700 = string.format("\a%s%s %s", v688:to_hex(), v697 and "IDEAL TICK" or "DT", v696 == 0 and string.format("\a%s%s", color(255, 0, 0, 120):to_hex(), "WAITING") or v696 == 1 and (l_defensive_0() and string.format("\a%s%s", color(192, 255, 145, 255):to_hex(), "ACTIVE") or string.format("\a%s%s", color(127, 255, 255, 255):to_hex(), "READY")) or string.format("\a%s%s", color(255, 50, 50, 255):lerp(color(203, 239, 172, 255), v696):to_hex(), "CHARGING"));
                        local v701 = render.measure_text(v690, "", v699);
                        local v702 = math.clamp(v576.indicators.vars.modern.dt[2](0.05, v701.x), 0, v701.x) * v698;
                        local v703 = vector(math.floor(-(v701.x / 2) * (1 - v693) * (v702 / v701.x) + 2 * v693));
                        render.push_clip_rect(v686 + v703 + v687, v686 + v703 + v687 + vector(v702, v701.y));
                        render.text(v690, v686 + v687 + v703, color(), "", v699);
                        render.pop_clip_rect();
                        render.push_clip_rect(v686 + v703 + v687, v686 + v703 + v687 + vector(v702 * v696, v701.y));
                        render.text(v690, v686 + v687 + v703, color(), "", v700);
                        render.pop_clip_rect();
                        v687.y = v687.y + math.floor(0.5 + (v701.y - 3) * v698) + v691;
                    end;
                    v697 = v393.hide_shots.switch:get();
                    v576.indicators.vars.modern.hs[1] = math.clamp(v576.indicators.vars.modern.hs[1] + (v697 and l_frametime_0 * 2.5 or -l_frametime_0 * 2.5), 0, 1);
                    v698 = v353.quart_in_out(v576.indicators.vars.modern.hs[1], 0, 1, 1);
                    if v698 > 0 then
                        v699 = string.format("\a%s%s %s", v688:alpha_modulate(120):to_hex(), "HIDE", v695 and string.format("\a%s%s", color(255, 0, 0, 60):to_hex(), "INACTIVE") or v696 == 1 and (v694 and string.format("\a%s%s", color(192, 255, 145, 120):to_hex(), "ACTIVE") or string.format("\a%s%s", color(127, 255, 255, 120):to_hex(), "READY")) or string.format("\a%s%s", color(255, 50, 50, 120):lerp(color(203, 239, 172, 120), v696):to_hex(), "CHARGING"));
                        local v704 = string.format("\a%s%s %s", v688:to_hex(), "HIDE", v695 and string.format("\a%s%s", color(255, 50, 50, 120):to_hex(), "INACTIVE") or v696 == 1 and (v694 and string.format("\a%s%s", color(192, 255, 145, 255):to_hex(), "ACTIVE") or string.format("\a%s%s", color(127, 255, 255, 255):to_hex(), "READY")) or string.format("\a%s%s", color(255, 50, 50, 255):lerp(color(203, 239, 172, 255), v696):to_hex(), "CHARGING"));
                        local v705 = render.measure_text(v690, "", v699);
                        local v706 = math.clamp(v576.indicators.vars.modern.hs[2](0.05, v705.x), 0, v705.x) * v698;
                        local v707 = vector(math.floor(-(v705.x / 2) * (1 - v693) * (v706 / v705.x) + 2 * v693));
                        render.push_clip_rect(v686 + v707 + v687, v686 + v707 + v687 + vector(v706, v705.y));
                        render.text(v690, v686 + v687 + v707, color(), "", v699);
                        render.pop_clip_rect();
                        render.push_clip_rect(v686 + v707 + v687, v686 + v707 + v687 + vector(v706 * v696, v705.y));
                        render.text(v690, v686 + v687 + v707, color(), "", v704);
                        render.pop_clip_rect();
                        v687.y = v687.y + math.floor(0.5 + (v705.y - 3) * v698) + v691;
                    end;
                    v697 = false;
                    v698 = false;
                    v699 = ui.get_binds();
                    for v708 = 1, #v699 do
                        local v709 = v699[v708];
                        if v709.active then
                            if v709.name == "Min. Damage" then
                                v697 = true;
                            elseif v709.name == "Hit Chance" then
                                v698 = true;
                            end;
                        end;
                    end;
                    local v710 = {
                        [1] = {
                            [1] = "FREESTAND", 
                            [2] = v393.freestanding.switch:get() or v355.get("freestanding_key"), 
                            [3] = v688
                        }, 
                        [2] = {
                            [1] = "DMG", 
                            [2] = v697, 
                            [3] = v688
                        }, 
                        [3] = {
                            [1] = "HC", 
                            [2] = v698, 
                            [3] = v688
                        }, 
                        [4] = {
                            [1] = "BAIM", 
                            [2] = v393.body_aim.mode:get() == "Force", 
                            [3] = v688
                        }, 
                        [5] = {
                            [1] = "SAFE", 
                            [2] = v393.safe_point:get() == "Force", 
                            [3] = v688
                        }, 
                        [6] = {
                            [1] = "PING", 
                            [2] = nil, 
                            [3] = nil, 
                            [4] = 1, 
                            [2] = v393.fake_latency:get() > 0, 
                            [3] = v688
                        }, 
                        [7] = {
                            "DORMANT", 
                            v393.dormant_aim:get(), 
                            color(200, 130)
                        }
                    };
                    for v711 = 1, #v710 do
                        local v712 = v710[v711];
                        if not v576.indicators.vars.modern.values[v711] then
                            v576.indicators.vars.modern.values[v711] = {
                                0, 
                                l_smoothy_0.new()
                            };
                        end;
                        v576.indicators.vars.modern.values[v711][1] = math.clamp(v576.indicators.vars.modern.values[v711][1] + (v712[2] and l_frametime_0 * 2.5 or -l_frametime_0 * 2.5), 0, 1);
                        local v713 = v353.quart_in_out(v576.indicators.vars.modern.values[v711][1], 0, 1, 1);
                        if v713 > 0 then
                            local v714 = string.format("\a%s%s", v712[3]:to_hex(), v712[1]);
                            local v715 = render.measure_text(v690, "", v714);
                            local v716 = math.clamp(v576.indicators.vars.modern.values[v711][2](0.05, v715.x), 0, v715.x) * v713;
                            local v717 = vector(math.floor(-(v715.x / 2) * (1 - v693) * (v716 / v715.x) + 2 * v693));
                            render.push_clip_rect(v686 + v717 + v687, v686 + v717 + v687 + vector(v716, v715.y));
                            render.text(v690, v686 + v687 + v717, color(), "", v714);
                            render.pop_clip_rect();
                            v687.y = v687.y + math.floor(0.5 + (v715.y - 3 + (v711 + 1 == #v710 and 1 or 0)) * v713) + v691;
                        end;
                    end;
                end;
            end;
            return;
        end;
    end;
end;
v576.dmg_dragging = v31.dragging_fn("jago_dmgindicator", v31.screen_size.x / 2 + 10, v31.screen_size.y / 2 - 20);
v576.draw_indicator = function()
    -- upvalues: v576 (ref), v355 (ref), v393 (ref)
    if not entity.get_local_player() or not entity.get_local_player():is_alive() then
        return;
    else
        local v718 = vector(v576.dmg_dragging:get()):ceil();
        local v719 = v355.get("dmg_indicator_color");
        local _ = color();
        local v721 = ({
            Small = 2, 
            Bold = 4, 
            Normal = 1
        })[v355.get("dmg_indicator_font")];
        local v722 = render.measure_text(v721, nil, v393.minimum_damage.value:get());
        if ui.get_alpha() > 0.5 then
            render.rect_outline(vector(v718.x - 2, v718.y - 1), vector(v718.x + v722.x + 2, v718.y + v722.y + 2), color(255, 120), 1, 3);
        end;
        render.text(v721, v718, v719, "", v393.minimum_damage.value:get());
        v576.dmg_dragging:drag(v722.x + 2, v722.y + 2);
        return;
    end;
end;
v576.arrows = {
    fractions = {
        forward = 0, 
        right = 0, 
        left = 0
    }, 
    styles = {
        [1] = {
            left = render.load_image("<svg width=\"124\" height=\"149\" viewBox=\"0 0 124 149\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M111.382 1.24609L3.79564 67.7161C-1.27136 70.8461 -1.26336 78.2164 3.80864 81.3362L111.351 147.479C118.454 151.848 126.666 143.794 122.436 136.607L88.2884 78.5858C86.8173 76.0863 86.8143 72.9864 88.2804 70.484L122.489 12.0961C126.705 4.90008 118.477 -3.13791 111.382 1.24609Z\" fill=\"white\"/></svg>", vector(12, 12)), 
            right = render.load_image("<svg width=\"124\" height=\"150\" viewBox=\"0 0 124 150\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M12.3725 148.088L119.959 81.618C125.026 78.488 125.018 71.1177 119.946 67.9979L12.4039 1.8547C5.30078 -2.51406 -2.91145 5.53994 1.31827 12.7267L35.4662 70.7483C36.9373 73.2478 36.9403 76.3477 35.4742 78.8501L1.26514 137.238C-2.9505 144.434 5.27804 152.472 12.3725 148.088Z\" fill=\"white\"/></svg>", vector(12, 12)), 
            forward = render.load_image("<svg width=\"149\" height=\"124\" viewBox=\"0 0 149 124\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M147.471 111.382L81.0005 3.79564C77.8705 -1.27136 70.5002 -1.26336 67.3804 3.80864L1.23721 111.351C-3.13155 118.454 4.92245 126.666 12.1092 122.436L70.1308 88.2884C72.6303 86.8173 75.7302 86.8143 78.2326 88.2804L136.621 122.489C143.817 126.705 151.855 118.477 147.471 111.382Z\" fill=\"white\"/></svg>", vector(12, 12))
        }
    }
};
v576.arrows.draw = function()
    -- upvalues: v355 (ref), v576 (ref)
    local v723 = entity.get_local_player();
    if not v723 or not v723:is_alive() then
        return;
    else
        local v724 = render.screen_size() / 2;
        local l_frametime_1 = globals.frametime;
        local v726 = v355.get("arrows_style");
        local v727 = v355.get("arrows_color");
        if v726 == "Simple" then
            local v728 = v355.get("manual_yaw");
            local l_fractions_0 = v576.arrows.fractions;
            l_fractions_0.left = math.clamp(l_fractions_0.left + (v728 == "Left" and l_frametime_1 * 7 or -l_frametime_1 * 7), 0, 1);
            l_fractions_0.right = math.clamp(l_fractions_0.right + (v728 == "Right" and l_frametime_1 * 7 or -l_frametime_1 * 7), 0, 1);
            l_fractions_0.forward = math.clamp(l_fractions_0.forward + (v728 == "Forward" and l_frametime_1 * 7 or -l_frametime_1 * 7), 0, 1);
            local l_left_0 = l_fractions_0.left;
            local l_right_0 = l_fractions_0.right;
            local l_forward_0 = l_fractions_0.forward;
            if l_left_0 > 0 then
                render.texture(v576.arrows.styles[1].left, v724 - vector(47, 6), vector(12, 12), v727:alpha_modulate(255 * l_left_0));
            end;
            if l_right_0 > 0 then
                render.texture(v576.arrows.styles[1].right, v724 + vector(35, -6), vector(12, 12), v727:alpha_modulate(255 * l_right_0));
            end;
            if l_forward_0 > 0 then
                render.texture(v576.arrows.styles[1].forward, v724 - vector(6, 47), vector(12, 12), v727:alpha_modulate(255 * l_forward_0));
            end;
        elseif v726 == "Team Skeet" then
            local v733 = false;
            local v734 = color(0, 0, 0, 75);
            local v735 = not v733 and v727 or v734;
            local v736 = v733 and v727 or v734;
            local v737 = v355.get("manual_yaw");
            render.rect(vector(v724.x - 48, v724.y - 10), vector(v724.x - 46, v724.y + 9), v735);
            render.rect(vector(v724.x + 47, v724.y - 10), vector(v724.x + 49, v724.y + 9), v736);
            render.poly(v737 == "Left" and v727 or v734, vector(v724.x - 50, v724.y - 10), vector(v724.x - 50, v724.y + 9), vector(v724.x - 66, v724.y));
            render.poly(v737 == "Right" and v727 or v734, vector(v724.x + 52, v724.y - 10), vector(v724.x + 52, v724.y + 9), vector(v724.x + 66, v724.y));
        end;
        return;
    end;
end;
v576.base_render = {
    box_filled = function(v738, v739, v740, v741, v742, v743)
        render.rect(vector(v738, v739), vector(v738 + v740, v739 + v741), v742, v743 == nil and 0 or v743, false);
    end, 
    gradient_box_filled = function(v744, v745, v746, v747, v748, v749, v750)
        render.gradient(vector(v744, v745), vector(v744 + v746, v745 + v747), v749, v749, v748 and v750 or v749, v748 and v749 or v750, 0);
    end, 
    circle = function(v751, v752, v753, v754, v755, v756, _, v758)
        render.circle_outline(vector(v751, v752), v756, v753, v754, v755, v758);
    end
};
v576.global_render = {
    box = function(v759, v760, v761, v762)
        -- upvalues: v576 (ref)
        v576.base_render.box_filled(v759, v760 + 2, v761, 18, color(17, 17, 17):alpha_modulate(120 * (v762.a / 255)), 4);
        v576.base_render.box_filled(v759 + 3, v760 + 1, v761 - 6, 1, v762);
        v576.base_render.circle(v759 + 3, v760 + 4, 3, 180, 0.25, v762, 75, 1);
        v576.base_render.circle(v759 + v761 - 3, v760 + 4, 3, -90, 0.25, v762, 75, 1);
        v576.base_render.gradient_box_filled(v759, v760 + 4, 1, 12, false, v762, v762:alpha_modulate(0));
        v576.base_render.gradient_box_filled(v759 + v761 - 1, v760 + 4, 1, 12, false, v762, v762:alpha_modulate(0));
    end
};
v576.watermark = {};
v576.watermark.draw = function()
    -- upvalues: v355 (ref), v354 (ref), v576 (ref)
    local v763 = v355.get("ui_color");
    local v764 = vector(render.screen_size().x, 0) + vector(-10, 10);
    local v765 = v355.get("watermark_name") == "Custom" and v355.get("watermark_name_ref") or v354.username;
    local v766 = globals.is_in_game and math.floor(utils.net_channel().avg_latency[1] * 1000) or 0;
    local v767 = common.get_system_time();
    local v768 = string.format("%02d:%02d", v767.hours, v767.minutes, v767.seconds);
    local v769 = string.format("%s | %s | delay: %dms | %s", v354.lua_name, v765, v766, v768);
    local v770 = render.measure_text(1, "", v769);
    v764.x = v764.x - v770.x - 5;
    local v771 = vector(v770.x + 10, 16);
    if v355.get("ui_style") == "Glow" then
        render.rect(v764 + vector(-10, 2), v764 + vector(-10, 2) + v771 + vector(0, 2), color(17, 150), 4);
        render.shadow(v764 + vector(-10, 2), v764 + vector(-10, 2) + v771 + vector(0, 2), v763:alpha_modulate(230), nil, nil, 4);
        render.text(1, vector(v764.x - 10 + 6, v764.y + v770.y / 2 - 1), color(), "", v769);
    elseif v355.get("ui_style") == "Default" then
        v576.global_render.box(v764.x - 10, v764.y, v771.x, v763:alpha_modulate(255));
        render.text(1, vector(v764.x - 10 + 6, v764.y + v770.y / 2 - 1), color(), "", v769);
    elseif v355.get("ui_style") == "Modern" then
        local v772 = render.screen_size();
        local _ = v772.x;
        local _ = v772.y;
        local _ = v763.r;
        local _ = v763.g;
        local _ = v763.b;
        local _ = v763.a;
        v769 = ("%s%s%s%s"):format(v354.lua_name .. " \226\128\162 ", v765, globals.is_in_game and (" \226\128\162 delay: %d%s"):format(v766, "ms") or "", ((" \226\128\162 %02d:%02d:%02d"):format(v767.hours % 12, v767.minutes, v767.seconds)));
        local v779 = render.measure_text(1, nil, v769);
        render.rect(vector(v772.x - v779.x - 21, 11), vector(v772.x - 10, 32), color(v763.r, v763.g, v763.b, 25));
        render.blur(vector(v772.x - v779.x - 21, 11), vector(v772.x - 10, 32), 2, 1);
        render.gradient(vector(v772.x - v779.x - 22, 11), vector(v772.x - v779.x - 22 + 1, 32), color(v763.r, v763.g, v763.b, 100), color(v763.r, v763.g, v763.b, 100), v763, v763);
        render.gradient(vector(v772.x - 10, 11), vector(v772.x - 11, 32), color(v763.r, v763.g, v763.b, 100), color(v763.r, v763.g, v763.b, 100), v763, v763);
        render.rect(vector(v772.x - v779.x - 22, 31), vector(v772.x - 11, 32), v763);
        render.rect(vector(v772.x - v779.x - 22, 10), vector(v772.x - 10, 11), color(v763.r, v763.g, v763.b, 100));
        render.gradient(vector(v772.x - v779.x - 22, 32), vector(v772.x - 10, 35), color(v763.r, v763.g, v763.b, 75), color(v763.r, v763.g, v763.b, 75), color(v763.r, v763.g, v763.b, 0), color(v763.r, v763.g, v763.b, 0));
        render.text(1, vector(v772.x - v779.x - 15, 15), color(255, 255, 255, 255), nil, v769);
    end;
end;
v576.keybinds = {};
v576.keybinds.get_keys = function()
    local v780 = {};
    local v781 = ui.get_binds();
    for v782 = 1, #v781 do
        table.insert(v780, 1, v781[v782]);
    end;
    return v780;
end;
v576.keybinds.names = {
    ["Minimum Damage"] = "Damage override", 
    ["Yaw Base"] = "Yaw base", 
    ["Override Resolver"] = "Resolver override", 
    ["Safe Points"] = "Safe points", 
    ["Fake Duck"] = "Duck peek assist", 
    ["Auto Peek"] = "Quick peek assist", 
    ["Manual Yaw Base"] = "Yaw base", 
    ["Double Tap"] = "Double tap", 
    ["Slow Walk"] = "Slow motion", 
    ["Hide Shots"] = "On shot anti-aim", 
    ["Fake Ping"] = "Ping spike", 
    ["Body Aim"] = "Force body aim", 
    ["Edge Jump"] = "Jump at edge", 
    ["Enable Thirdperson"] = "Thirdperson"
};
v576.keybinds.upper_to_lower = function(v783)
    local v784 = string.sub(v783, 2, #v783);
    return string.sub(v783, 1, 1):upper() .. v784:lower();
end;
v576.keybinds.vars = {
    alpha = {
        [""] = 0
    }, 
    window = {
        alpha = 0, 
        width = 0
    }
};
v576.keybinds.dragging = v31.dragging_fn("jagoyaw_keybinds", v31.screen_size.x / 1.3, v31.screen_size.y / 2.5);
v576.keybinds.draw = function()
    -- upvalues: v355 (ref), v576 (ref), v353 (ref), v31 (ref)
    local v785 = globals.frametime * 5;
    local v786 = v355.get("ui_color");
    local v787 = vector(v576.keybinds.dragging:get()):ceil();
    local v788 = 80;
    local v789 = v576.keybinds.get_offset and v576.keybinds.get_offset() or 0;
    local v790 = v576.keybinds.get_keys();
    for v791 = 1, #v790 do
        local v792 = v790[v791];
        local v793 = v576.keybinds.names[v792.name] == nil and v576.keybinds.upper_to_lower(v792.name) or v576.keybinds.names[v792.name];
        local v794 = "";
        if v792.value == true then
            local l_mode_1 = v792.mode;
            if l_mode_1 == 2 then
                v794 = "toggled";
            elseif l_mode_1 == 1 then
                v794 = "holding";
            end;
        else
            v794 = v792.value;
        end;
        if v576.keybinds.vars.alpha[v793] == nil then
            v576.keybinds.vars.alpha[v793] = 0;
        end;
        local v796 = v353.quad_in_out(v576.keybinds.vars.alpha[v793], 0, 1, 1);
        v576.keybinds.vars.alpha[v793] = math.clamp(v576.keybinds.vars.alpha[v793] + (v792.active and v785 or -v785), 0, 1);
        local v797 = render.measure_text(1, nil, v794);
        local v798 = render.measure_text(1, nil, v793);
        render.text(1, vector(v787.x + 4, v787.y + 21 + v789), color(255, 255 * v796), "", v793);
        render.text(1, vector(v787.x + (v576.keybinds.vars.window.width - v797.x - 10), v787.y + 20 + v789), color(), "", string.format("[%s]", v794));
        v789 = v789 + 16 * v796;
        if v788 < v798.x + v797.x + 30 then
            v788 = v798.x + v797.x + 30;
        end;
    end;
    local v799 = vector(math.ceil(v576.keybinds.vars.window.width), 16);
    local v800 = v353.quad_in_out(v576.keybinds.vars.window.alpha, 0, 1, 1);
    v576.keybinds.vars.window.alpha = math.clamp(v576.keybinds.vars.window.alpha + ((not (ui.get_alpha() <= 0) or #v790 > 0) and v785 or -v785), 0, 1);
    v576.keybinds.vars.window.width = v31.lerp(v576.keybinds.vars.window.width, v788, v785 * 2);
    local v801 = 0;
    if v355.get("ui_style") == "Glow" then
        render.rect(v787, v787 + v799 + vector(0, 2), color(17, 150 * v800), 4);
        render.shadow(v787, v787 + v799 + vector(0, 2), v786:alpha_modulate(230 * v800), nil, nil, 4);
        local v802 = render.measure_text(1, nil, "keybinds");
        render.text(1, vector(v787.x + v799.x / 2, v787.y + v802.y - 3), color(255, v800 * 255), "c", "keybinds");
    elseif v355.get("ui_style") == "Default" then
        v576.global_render.box(v787.x, v787.y - 2, v799.x + 3, v786:alpha_modulate(v800 * 255));
        local v803 = render.measure_text(1, nil, "keybinds");
        render.text(1, vector(v787.x + 1 + v799.x / 2, v787.y + v803.y - 3), color(255, v800 * 255), "c", "keybinds");
    elseif v355.get("ui_style") == "Modern" then
        v799 = v799 + vector(0, 2);
        v801 = 2;
        render.rect(v787, v787 + v799 + vector(0, 2), v786:alpha_modulate(v800 * 25));
        render.blur(v787, v787 + v799 + vector(0, 2), 2, v800);
        render.gradient(v787, v787 + vector(1, v799.y + 2), v786:alpha_modulate(v800 * 100), v786:alpha_modulate(v800 * 100), v786:alpha_modulate(v800 * 255), v786:alpha_modulate(v800 * 255));
        render.gradient(v787 + vector(v799.x), v787 + vector(v799.x) + vector(-1, v799.y + 2), v786:alpha_modulate(v800 * 100), v786:alpha_modulate(v800 * 100), v786:alpha_modulate(v800 * 255), v786:alpha_modulate(v800 * 255));
        render.rect(v787 + vector(0, v799.y + 1), v787 + vector(v799.x, v799.y + 2), v786:alpha_modulate(v800 * 255));
        render.rect(v787 + vector(1), v787 + vector(v799.x - 1, 1), v786:alpha_modulate(v800 * 100));
        render.gradient(v787 + vector(0, v799.y + 2), v787 + vector(v799.x, v799.y + 2 + 3), v786:alpha_modulate(v800 * 75), v786:alpha_modulate(v800 * 75), v786:alpha_modulate(0), v786:alpha_modulate(0));
        render.text(1, vector(v787.x + 1 + v799.x / 2, v787.y + v799.y / 2 + 1), color(255, v800 * 255), "c", "keybinds");
    end;
    v576.keybinds.get_offset = function()
        -- upvalues: v801 (ref)
        return v801;
    end;
    v576.keybinds.dragging:drag(v799.x, (10 + 8 * #v790) * 2);
end;
v576.spectators = {};
v576.spectators.vars = {
    players = {}, 
    alpha = {
        [""] = 0
    }, 
    window = {
        alpha = 0, 
        width = 0
    }, 
    specs = {
        m_alpha = 0, 
        m_active = {}, 
        m_contents = {}, 
        unsorted = {}
    }
};
v576.spectators.get_spectators = function(_)
    if not globals.is_connected or not globals.is_in_game then
        return;
    else
        local v805 = entity.get_local_player();
        if not v805 then
            return;
        else
            local v806 = nil;
            if v805:is_alive() then
                v806 = v805:get_spectators();
            else
                local l_m_hObserverTarget_0 = v805.m_hObserverTarget;
                if not l_m_hObserverTarget_0 then
                    return;
                else
                    v806 = l_m_hObserverTarget_0:get_spectators();
                end;
            end;
            return v806;
        end;
    end;
end;
v576.spectators.dragging = v31.dragging_fn("jagoyaw_spectators", v31.screen_size.x / 1.5, v31.screen_size.y / 2.5);
v576.spectators.draw = function()
    -- upvalues: v576 (ref), v355 (ref), v353 (ref), v31 (ref)
    local v808 = entity.get_local_player();
    local v809 = v576.spectators.get_spectators();
    if not globals.is_connected or v809 == nil or v808 == nil then
        return;
    else
        for v810 = 1, 64 do
            v576.spectators.vars.specs.unsorted[v810] = {
                active = false, 
                idx = v810
            };
        end;
        for _, v812 in pairs(v809) do
            local v813 = v812:get_index();
            do
                local l_v812_0 = v812;
                do
                    local l_v813_0 = v813;
                    v576.spectators.vars.specs.unsorted[l_v813_0] = {
                        idx = l_v813_0, 
                        active = (function()
                            -- upvalues: l_v812_0 (ref), v808 (ref)
                            if l_v812_0 == v808 then
                                return false;
                            else
                                return true;
                            end;
                        end)(), 
                        avatar = (function()
                            -- upvalues: l_v812_0 (ref), v576 (ref), l_v813_0 (ref)
                            local v816 = l_v812_0:get_steam_avatar();
                            if v816 == nil then
                                return nil;
                            else
                                if v576.spectators.vars.specs.m_contents[l_v813_0] == nil or v576.spectators.vars.specs.m_contents[l_v813_0].conts ~= v816 then
                                    v576.spectators.vars.specs.m_contents[l_v813_0] = {
                                        conts = v816, 
                                        texture = v816
                                    };
                                end;
                                return v576.spectators.vars.specs.m_contents[l_v813_0].texture;
                            end;
                        end)()
                    };
                end;
            end;
        end;
        local v817 = ui.get_alpha() > 0;
        local v818 = false;
        local v819 = globals.frametime * 5;
        local v820 = v355.get("ui_color");
        local v821 = vector(v576.spectators.dragging:get()):ceil();
        local v822 = 80;
        for _, v824 in pairs(v576.spectators.vars.specs.unsorted) do
            local l_idx_0 = v824.idx;
            local v826 = "";
            local v827 = entity.get(l_idx_0);
            if v827 then
                v826 = string.sub(v827:get_name(), 1, 25);
            end;
            if not v576.spectators.vars.alpha[l_idx_0] then
                v576.spectators.vars.alpha[l_idx_0] = 0;
            end;
            local v828 = v353.quad_in_out(v576.spectators.vars.alpha[l_idx_0], 0, 1, 1);
            v576.spectators.vars.alpha[l_idx_0] = math.clamp(v576.spectators.vars.alpha[l_idx_0] + (v824.active and v819 or -v819), 0, 1);
            if v824.active then
                v818 = true;
                if v576.spectators.vars.specs.m_active[l_idx_0] == nil then
                    v576.spectators.vars.specs.m_active[l_idx_0] = {
                        offset = 0, 
                        alpha = 0, 
                        active = true
                    };
                end;
                local v829 = render.measure_text(1, nil, v826);
                v576.spectators.vars.specs.m_active[l_idx_0].active = true;
                v576.spectators.vars.specs.m_active[l_idx_0].offset = v829.x + 30;
                v576.spectators.vars.specs.m_active[l_idx_0].alpha = v828;
                v576.spectators.vars.specs.m_active[l_idx_0].avatar = v824.avatar;
                v576.spectators.vars.specs.m_active[l_idx_0].name = v826;
            elseif v576.spectators.vars.specs.m_active[l_idx_0] ~= nil then
                v576.spectators.vars.specs.m_active[l_idx_0].active = false;
                v576.spectators.vars.specs.m_active[l_idx_0].alpha = v828;
                if v576.spectators.vars.specs.m_active[l_idx_0].alpha <= 0 then
                    v576.spectators.vars.specs.m_active[l_idx_0] = nil;
                end;
            end;
            if v576.spectators.vars.specs.m_active[l_idx_0] ~= nil and v822 < v576.spectators.vars.specs.m_active[l_idx_0].offset then
                v822 = v576.spectators.vars.specs.m_active[l_idx_0].offset;
            end;
        end;
        if v817 and not v818 then
            local v830 = " ";
            local v831 = 0;
            v818 = true;
            if v822 < v831 and v831 then
                v822 = v831;
            end;
            v576.spectators.vars.specs.m_active[v830] = {
                active = true, 
                alpha = 0, 
                name = " ", 
                offset = v831
            };
        end;
        local v832 = v576.spectators.get_offset and v576.spectators.get_offset() or 0;
        for _, v834 in pairs(v576.spectators.vars.specs.m_active) do
            local v835 = render.measure_text(1, nil, v834.name);
            local v836 = {
                avatar = 5, 
                text = 20
            };
            if v355.get("avatar_side") == "Right" then
                v836 = {
                    text = 5, 
                    avatar = math.ceil(v576.spectators.vars.window.width) - 5 - 12
                };
            end;
            render.text(1, vector(v821.x + v836.text, v821.y + 21 + v832), color(255, v834.alpha * 255), "", v834.name);
            if v834.avatar ~= nil then
                render.texture(v834.avatar, vector(v821.x + v836.avatar, v821.y + 21 + v832), vector(12, 12), color(255, 255, 255, v834.alpha * 255));
            end;
            v832 = v832 + (v835.y + 3) * v834.alpha;
        end;
        local v837 = vector(math.ceil(v576.spectators.vars.window.width), 16);
        local v838 = v353.quad_in_out(v576.spectators.vars.window.alpha, 0, 1, 1);
        v576.spectators.vars.window.alpha = math.clamp(v576.spectators.vars.window.alpha + ((not (ui.get_alpha() <= 0) or #v809 > 0) and v819 or -v819), 0, 1);
        v576.spectators.vars.window.width = v31.lerp(v576.spectators.vars.window.width, v822, v819 * 2);
        local v839 = 0;
        if v355.get("ui_style") == "Glow" then
            render.rect(v821, v821 + v837 + vector(0, 2), color(17, 150 * v838), 4);
            render.shadow(v821, v821 + v837 + vector(0, 2), v820:alpha_modulate(230 * v838), nil, nil, 4);
            local v840 = render.measure_text(1, nil, "spectators");
            render.text(1, vector(v821.x + v837.x / 2, v821.y + v840.y - 3), color(255, v838 * 255), "c", "spectators");
        elseif v355.get("ui_style") == "Default" then
            v576.global_render.box(v821.x, v821.y - 2, v837.x + 3, v820:alpha_modulate(v838 * 255));
            local v841 = render.measure_text(1, nil, "spectators");
            render.text(1, vector(v821.x + 1 + v837.x / 2, v821.y + v841.y - 3), color(255, v838 * 255), "c", "spectators");
        elseif v355.get("ui_style") == "Modern" then
            v837 = v837 + vector(0, 2);
            v839 = 2;
            render.rect(v821, v821 + v837 + vector(0, 2), v820:alpha_modulate(v838 * 25));
            render.blur(v821, v821 + v837 + vector(0, 2), 2, v838);
            render.gradient(v821, v821 + vector(1, v837.y + 2), v820:alpha_modulate(v838 * 100), v820:alpha_modulate(v838 * 100), v820:alpha_modulate(v838 * 255), v820:alpha_modulate(v838 * 255));
            render.gradient(v821 + vector(v837.x), v821 + vector(v837.x) + vector(-1, v837.y + 2), v820:alpha_modulate(v838 * 100), v820:alpha_modulate(v838 * 100), v820:alpha_modulate(v838 * 255), v820:alpha_modulate(v838 * 255));
            render.rect(v821 + vector(0, v837.y + 1), v821 + vector(v837.x, v837.y + 2), v820:alpha_modulate(v838 * 255));
            render.rect(v821 + vector(1), v821 + vector(v837.x - 1, 1), v820:alpha_modulate(v838 * 100));
            render.gradient(v821 + vector(0, v837.y + 2), v821 + vector(v837.x, v837.y + 2 + 3), v820:alpha_modulate(v838 * 75), v820:alpha_modulate(v838 * 75), v820:alpha_modulate(0), v820:alpha_modulate(0));
            render.text(1, vector(v821.x + 1 + v837.x / 2, v821.y + v837.y / 2 + 1), color(255, v838 * 255), "c", "spectators");
        end;
        v576.spectators.get_offset = function()
            -- upvalues: v839 (ref)
            return v839;
        end;
        v576.spectators.dragging:drag(v837.x, (10 + 8 * #v809) * 2);
        return;
    end;
end;
v576.hitmarker = {};
v576.hitmarker.vars = {
    data = {}, 
    queue = {}
};
v576.hitmarker.on_bullet_impact = function(v842)
    -- upvalues: v355 (ref), v576 (ref)
    if not v355.get("hitmarker") then
        return;
    else
        if entity.get(v842.userid, true) == entity.get_local_player() then
            local l_x_4 = v842.x;
            local l_y_3 = v842.y;
            local l_z_1 = v842.z;
            table.insert(v576.hitmarker.vars.data, {
                [1] = l_x_4, 
                [2] = l_y_3, 
                [3] = l_z_1, 
                [4] = globals.realtime
            });
        end;
        return;
    end;
end;
v576.hitmarker.on_player_hurt = function(v846)
    -- upvalues: v355 (ref), v576 (ref), v31 (ref)
    if not v355.get("hitmarker") then
        return;
    else
        local v847 = 0;
        local v848 = 0;
        local v849 = 0;
        local v850 = 100;
        local l_realtime_0 = globals.realtime;
        if entity.get(v846.attacker, true) == entity.get_local_player() then
            local v852 = entity.get(v846.userid, true);
            if v852 ~= nil then
                local l_m_vecOrigin_0 = v852.m_vecOrigin;
                local l_dmg_health_0 = v846.dmg_health;
                local v855 = v852.m_iHealth - l_dmg_health_0;
                for v856 in ipairs(v576.hitmarker.vars.data) do
                    local v857 = v576.hitmarker.vars.data[v856];
                    if l_realtime_0 <= v857[4] + 4 then
                        local v858 = v857[1];
                        local v859 = v857[2];
                        local v860 = v857[3];
                        local v861 = v31.vectordistance(l_m_vecOrigin_0.x, l_m_vecOrigin_0.y, l_m_vecOrigin_0.z, v858, v859, v860);
                        if v861 < v850 then
                            v850 = v861;
                            v847 = v858;
                            v848 = v859;
                            v849 = v860;
                        end;
                    end;
                end;
                if v847 == 0 and v848 == 0 and v849 == 0 then
                    l_m_vecOrigin_0.z = l_m_vecOrigin_0.z + 50;
                    v847 = l_m_vecOrigin_0.x;
                    v848 = l_m_vecOrigin_0.y;
                    v849 = l_m_vecOrigin_0.z;
                end;
                for v862 in ipairs(v576.hitmarker.vars.data) do
                    v576.hitmarker.vars.data[v862] = {
                        [1] = 0, 
                        [2] = 0, 
                        [3] = 0, 
                        [4] = 0
                    };
                end;
                table.insert(v576.hitmarker.vars.queue, {
                    [1] = v847, 
                    [2] = v848, 
                    [3] = v849, 
                    [4] = l_realtime_0, 
                    [5] = l_dmg_health_0, 
                    [6] = v855
                });
            end;
        end;
        return;
    end;
end;
v576.hitmarker.on_player_spawned = function(v863)
    -- upvalues: v355 (ref), v576 (ref)
    if not v355.get("hitmarker") then
        return;
    else
        if entity.get(v863.userid, true) == entity.get_local_player() then
            for v864 in ipairs(v576.hitmarker.vars.data) do
                v576.hitmarker.vars.data[v864] = {
                    [1] = 0, 
                    [2] = 0, 
                    [3] = 0, 
                    [4] = 0
                };
            end;
            for v865 in ipairs(v576.hitmarker.vars.queue) do
                v576.hitmarker.vars.queue[v865] = {
                    [1] = 0, 
                    [2] = 0, 
                    [3] = 0, 
                    [4] = 0, 
                    [5] = 0, 
                    [6] = 0
                };
            end;
        end;
        return;
    end;
end;
v576.hitmarker.draw = function()
    -- upvalues: v355 (ref), v576 (ref)
    local v866 = 2;
    local l_realtime_1 = globals.realtime;
    local v868 = l_realtime_1 - v866 / 2 / 2;
    local v869 = v355.get("hitmarker_plus_color");
    local v870 = v355.get("hitmarker_damage_color");
    for v871 in ipairs(v576.hitmarker.vars.queue) do
        local v872 = v576.hitmarker.vars.queue[v871];
        if v868 < v872[4] + v866 and v872[1] ~= nil then
            local v873 = (v872[4] - l_realtime_1) * 50;
            local v874 = render.world_to_screen(vector(v872[1], v872[2], v872[3]));
            local v875 = render.world_to_screen(vector(v872[1], v872[2], v872[3] - v873));
            if v874 and v875 and v874.x ~= 0 and v875.x ~= 0 then
                local v876 = 255;
                if v872[4] - (l_realtime_1 - v866) < v866 / 2 then
                    v876 = math.floor((v872[4] - (l_realtime_1 - v866)) / (v866 / 2) * 255);
                    if v876 < 5 then
                        v872 = {
                            [1] = 0, 
                            [2] = 0, 
                            [3] = 0, 
                            [4] = 0, 
                            [5] = 0, 
                            [6] = 0
                        };
                    end;
                end;
                local v877 = 6;
                if v355.contains("hitmarker_type", "damage") then
                    local v878 = v870:alpha_modulate(v876);
                    render.text(1, vector(v875.x + 1, v875.y + 1), color(0, 0, 0, v876), "", "-" .. tostring(v872[5]));
                    render.text(1, vector(v875.x + 1, v875.y + 1), v878, "", "-" .. tostring(v872[5]));
                end;
                if v355.contains("hitmarker_type", "+") then
                    local v879 = v869:alpha_modulate(v876);
                    render.gradient(vector(v874.x - 1, v874.y - v877), vector(v874.x + 1, v874.y), v879, v879, v879, v879, 0);
                    render.gradient(vector(v874.x - v877, v874.y - 1), vector(v874.x, v874.y + 1), v879, v879, v879, v879, 0);
                    render.gradient(vector(v874.x - 1, v874.y + v877), vector(v874.x + 1, v874.y), v879, v879, v879, v879, 0);
                    render.gradient(vector(v874.x + v877, v874.y - 1), vector(v874.x, v874.y + 1), v879, v879, v879, v879, 0);
                end;
            end;
        end;
    end;
end;
v576.custom_scope = {};
v576.custom_scope.vars = {
    inaccuracy = 0
};
v576.custom_scope.draw = function()
    -- upvalues: v355 (ref), v576 (ref), v31 (ref), v393 (ref)
    if v355.get("custom_scope_switch") then
        local v880 = render.screen_size();
        local _ = 6;
        local v882 = entity.get_local_player();
        if not v882 then
            return;
        else
            local v883 = v882:get_player_weapon();
            if not v883 then
                return;
            else
                local v884 = v355.get("custom_scope_lenght");
                local v885 = v355.get("custom_scope_offset");
                local v886 = v355.get("custom_scope_color");
                local v887 = v883:get_inaccuracy(v883) * 100;
                local v888 = v355.get("custom_scope_inaccuracy");
                v576.custom_scope.vars.inaccuracy = v888 and v31.lerp(v576.custom_scope.vars.inaccuracy, v887, globals.frametime * 20) or 0;
                local v889 = math.floor(v576.custom_scope.vars.inaccuracy);
                local v890 = v885 * v880.y / 1080;
                local v891 = v884 * v880.y / 1080;
                local l_m_zoomLevel_0 = v883.m_zoomLevel;
                local l_m_bIsScoped_3 = v882.m_bIsScoped;
                local l_m_bResumeZoom_0 = v882.m_bResumeZoom;
                if v882:is_alive() and v883 ~= nil and l_m_zoomLevel_0 ~= nil and l_m_zoomLevel_0 > 0 and l_m_bIsScoped_3 and not l_m_bResumeZoom_0 then
                    v393.override_zoom.scope_overlay:set("Remove All");
                    render.gradient(vector(v880.x / 2 - v891 + 2 - v889, v880.y / 2), vector(v880.x / 2 - v891 + 2 + v891 - v890 - v889, v880.y / 2 + 1), v886, color(v886.r, v886.g, v886.b, 0), v886, color(v886.r, v886.g, v886.b, 0), 0);
                    render.gradient(vector(v880.x / 2 + v890 + v889, v880.y / 2), vector(v880.x / 2 + v890 + v891 - v890 - 1 + v889, v880.y / 2 + 1), color(v886.r, v886.g, v886.b, 0), v886, color(v886.r, v886.g, v886.b, 0), v886, 0);
                    if not v355.get("remove_top_bar") then
                        render.gradient(vector(v880.x / 2, v880.y / 2 - v891 + 2 - v889), vector(v880.x / 2 + 1, v880.y / 2 - v891 + 2 + v891 - v890 - v889), v886, v886, color(v886.r, v886.g, v886.b, 0), color(v886.r, v886.g, v886.b, 0), 0);
                    end;
                    render.gradient(vector(v880.x / 2, v880.y / 2 + v890 + v889), vector(v880.x / 2 + 1, v880.y / 2 + v890 + v891 - v890 - 1 + v889), color(v886.r, v886.g, v886.b, 0), color(v886.r, v886.g, v886.b, 0), v886, v886, 0);
                end;
            end;
        end;
    else
        v393.override_zoom.scope_overlay:set("Remove Overlay");
    end;
end;
local v900 = {
    hitchance_overrides = function()
        -- upvalues: v393 (ref), v355 (ref), v31 (ref)
        v393.hitchance.value:override();
        local v895 = entity.get_local_player();
        local v896 = v895:get_player_weapon();
        if not v896 then
            return;
        else
            local v897 = v896:get_weapon_index();
            if v355.get("hitchance_switch") and v31.in_air(v895) and v897 == 40 then
                v393.hitchance.value:override(v355.get("hitchance_air"));
            end;
            local l_m_bIsScoped_4 = v895.m_bIsScoped;
            local v899 = v31.on_ground(v895);
            if v355.get("hitchance_switch") and not l_m_bIsScoped_4 and v899 and (v897 == 11 or v897 == 38) then
                v393.hitchance.value:override(v355.get("hitchance_noscope"));
            end;
            return;
        end;
    end, 
    doubletap = {}
};
v900.doubletap.predict_dt_damage = function()
    -- upvalues: v393 (ref)
    v393.minimum_damage.value:override(nil);
    if rage.exploit:get() ~= 1 then
        return;
    else
        local v901 = ui.get_binds();
        for v902 = 1, #v901 do
            if v901[v902].active and v901[v902].name == "Min. Damage" then
                return;
            end;
        end;
        local v903 = entity.get_players(true);
        if not v903 then
            return;
        else
            for _, v905 in pairs(v903) do
                if v905 and v905:is_alive() then
                    local l_m_iHealth_0 = v905.m_iHealth;
                    if l_m_iHealth_0 >= 0 then
                        local v907 = entity.get_local_player();
                        if not v907:is_alive() then
                            return;
                        else
                            local v908 = v907:get_player_weapon();
                            if v908 == nil then
                                return;
                            else
                                local v909 = v908:get_weapon_index();
                                if v909 == nil then
                                    return;
                                elseif v909 == 11 or v909 == 38 then
                                    v393.minimum_damage.value:override(math.floor(l_m_iHealth_0 / 2 + 0.5));
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            return;
        end;
    end;
end;
v900.doubletap.can_shift_shot = function(v910)
    local v911 = entity.get_local_player();
    if v911 == nil then
        return;
    else
        local v912 = v911:get_player_weapon();
        if not v911 or not v912 then
            return false;
        else
            local l_m_nTickBase_0 = v911.m_nTickBase;
            local v914 = globals.tickinterval * (l_m_nTickBase_0 - v910);
            if v914 < v911.m_flNextAttack then
                return false;
            elseif v914 < v912.m_flNextPrimaryAttack then
                return false;
            else
                return true;
            end;
        end;
    end;
end;
v900.doubletap.recharge = function()
    -- upvalues: v900 (ref)
    local v915 = rage.exploit:get();
    if v900.doubletap.can_shift_shot(15) and v915 ~= 1 then
        rage.exploit:allow_charge(true);
        rage.exploit:force_charge();
    end;
end;
local v930 = {
    teleport_inair = function()
        -- upvalues: v393 (ref)
        if not v393.doubletap.switch:get() then
            return;
        else
            local _ = false;
            local v917 = false;
            local v918 = entity.get_local_player();
            local v919 = v918:get_player_weapon();
            if v919 == nil then
                return;
            else
                local v920 = v919:get_classname() == "CKnife";
                local function v924(v921)
                    -- upvalues: v918 (ref)
                    local v922, v923 = utils.trace_bullet(v921, v921:get_hitbox_position(3), v918:get_hitbox_position(3));
                    if v922 == 0 or v922 >= 50 or not v923.entity or v923.entity ~= v918 then
                        return false;
                    else
                        return true;
                    end;
                end;
                if not v920 then
                    for _, v926 in pairs(entity.get_players(true)) do
                        if v926 ~= v918 and v924(v926) then
                            v917 = true;
                        end;
                    end;
                end;
                local function v929(v927, v928)
                    return bit.band(v927.m_fFlags, bit.lshift(1, v928)) ~= 0;
                end;
                if v917 and not v929(v918, 0) then
                    rage.exploit:force_teleport();
                end;
                return;
            end;
        end;
    end
};
local function v934(v931)
    local v932 = entity.get_local_player();
    if v932 == nil then
        return;
    else
        local v933 = render.camera_angles();
        if v932.m_MoveType == 9 then
            if v931.forwardmove > 0 and v933.x < 45 then
                v931.view_angles.x = 89;
                v931.in_moveright = 1;
                v931.in_moveleft = 0;
                v931.in_forward = 0;
                v931.in_back = 1;
                if v931.sidemove == 0 then
                    v931.view_angles.y = v931.view_angles.y + 90;
                end;
                if v931.sidemove < 0 then
                    v931.view_angles.y = v931.view_angles.y + 150;
                end;
                if v931.sidemove > 0 then
                    v931.view_angles.y = v931.view_angles.y + 30;
                end;
            end;
            if v931.forwardmove < 0 then
                v931.view_angles.x = 89;
                v931.in_moveleft = 1;
                v931.in_moveright = 0;
                v931.in_forward = 1;
                v931.in_back = 0;
                if v931.sidemove == 0 then
                    v931.view_angles.y = v931.view_angles.y + 90;
                end;
                if v931.sidemove > 0 then
                    v931.view_angles.y = v931.view_angles.y + 150;
                end;
                if v931.sidemove < 0 then
                    v931.view_angles.y = v931.view_angles.y + 30;
                end;
            end;
        end;
        return;
    end;
end;
v930.killsay = {};
v930.killsay.phrases = {
    [1] = ", why so bad NN XD? get good at shoppy.gg/@vektus1337", 
    [2] = ", NN go watch some HvH Tutorials at www.youtube.com/vektus1337", 
    [3] = ", laff hurensohn go visit shoppy.gg/@vektus1337 XD make your mom proud", 
    [4] = ", get on my level, Free HvH Tutorials at youtube.com/vektus1337", 
    [5] = ", uff 1tab dog", 
    [6] = ", headshot bitch", 
    [7] = ", owned kid lafff", 
    [8] = ", why so bad? get good at shoppy.gg/@vektus1337", 
    [9] = ", shit wannabe keep watching my videos trying to play like me lachbombe", 
    [10] = ", HvH Tutorials at www.youtube.com/vektus1337 fucking faNN", 
    [11] = ", HHHHHHHHHHH nice 10 iq monkey with BOT playstyle go kys fucking freak", 
    [12] = ", hhhhhhh 1 shot by the NNblaster", 
    [13] = ", HEADSHOT lachflip umed?", 
    [14] = ", blasted lachkick HAHAHAHAHAHA", 
    [15] = ", laff you suck HAHAHAHAHAHA imagine being so shit like u XD", 
    [16] = ", 1tap laff sit fucking dog"
};
v930.killsay.get_phrase = function()
    -- upvalues: v930 (ref)
    return v930.killsay.phrases[utils.random_int(1, #v930.killsay.phrases)]:gsub("\"", "");
end;
v930.killsay.run = function(v935)
    -- upvalues: v355 (ref), v930 (ref)
    local l_m_bWarmupPeriod_0 = entity.get_game_rules().m_bWarmupPeriod;
    if v355.get("trash") and (not v355.get("trash_warmup") or not l_m_bWarmupPeriod_0) then
        local v937 = entity.get_local_player();
        local v938 = entity.get(v935.userid, true);
        local v939 = entity.get(v935.attacker, true);
        if v938 == v939 or v939 ~= v937 then
            return;
        else
            utils.console_exec("say \"" .. v938:get_name() .. v930.killsay.get_phrase() .. "\"");
        end;
    end;
end;
local v940 = {
    shots = {
        missed = 0, 
        hit = 0, 
        amount = 0
    }
};
v940.draw = function()
    -- upvalues: v355 (ref), v354 (ref), v467 (ref), v940 (ref)
    local v941 = entity.get_local_player();
    if not v941 or not v941:is_alive() then
        return;
    else
        local v942 = render.screen_size();
        local v943 = vector(10, v942.y * 0.42);
        local v944 = v355.get("debug_info_color");
        v944.a = 255;
        local v945 = 0;
        local v946 = string.upper(string.format("%s   [%s]   |   %s   |   %dms", v354.lua_name, v354.lua_version, v354.username, utils.net_channel().avg_latency[1] * 1000));
        local v947 = render.measure_text(2, "", v946);
        render.text(2, v943, v944, "", v946);
        v945 = v945 + v947.y + 1;
        local v948 = v944:alpha_modulate(0);
        render.gradient(v943 + vector(0, v945), v943 + vector(v947.x / 2, v945 + 1), v948, v944, v948, v944);
        render.gradient(v943 + vector(v947.x / 2, v945), v943 + vector(v947.x, v945 + 1), v944, v948, v944, v948);
        v945 = v945 + 2;
        local v949 = v944:to_hex();
        local v950 = entity.get_threat();
        local v951 = {
            string.format("condition: \a%s%s", v949, v467.vars.player_condition), 
            string.format("target: \a%s%s", v949, v950 and v950:get_name() or "none"), 
            string.format("exploit charge: \a%s%.1f", v949, rage.exploit:get()), 
            string.format("desync: \a%s%d\194\176", v949, math.abs(v941.m_flPoseParameter[11] * 120 - 60)), 
            string.format("shots hit: \a%s%d", v949, v940.shots.hit), 
            string.format("shots missed: \a%s%d", v949, v940.shots.missed), 
            string.format("hit ratio: \a%s%.1f%%", v949, v940.shots.hit / v940.shots.amount * 100)
        };
        for v952 = 1, #v951 do
            local v953 = string.upper(v951[v952]);
            local v954 = render.measure_text(2, "", v953);
            render.text(2, v943 + vector(0, v945), color(), "", v953);
            v945 = v945 + v954.y - 2;
        end;
        return;
    end;
end;
v930.clantag = {
    prev = "", 
    restore = false
};
v930.clantag.anim = function(v955, v956)
    local v957 = "               " .. v955 .. "                      ";
    local v958 = (globals.tickcount + to_ticks(utils.net_channel().latency[1])) / to_ticks(0.3);
    v958 = v956[math.floor(v958 % #v956) + 1] + 1;
    return string.sub(v957, v958, v958 + 15);
end;
v930.clantag.run_animation = function()
    -- upvalues: v355 (ref), v930 (ref)
    local v959 = string.sub(v355.get("clantag_text"), 1, 11);
    if not v959 or v959 == "" then
        v959 = "#JAG0YAW";
    end;
    local v960 = v930.clantag.anim(v959, {
        [1] = 0, 
        [2] = 1, 
        [3] = 2, 
        [4] = 3, 
        [5] = 4, 
        [6] = 5, 
        [7] = 6, 
        [8] = 7, 
        [9] = 8, 
        [10] = 9, 
        [11] = 10, 
        [12] = 11, 
        [13] = 11, 
        [14] = 11, 
        [15] = 11, 
        [16] = 11, 
        [17] = 11, 
        [18] = 11, 
        [19] = 11, 
        [20] = 12, 
        [21] = 13, 
        [22] = 14, 
        [23] = 15, 
        [24] = 16, 
        [25] = 17, 
        [26] = 18, 
        [27] = 19, 
        [28] = 20, 
        [29] = 21, 
        [30] = 22
    });
    if v960 ~= v930.clantag.prev then
        common.set_clan_tag(v960);
    end;
    v930.clantag.prev = v960;
    v930.clantag.restore = true;
end;
v930.clantag.on_render = function()
    -- upvalues: v930 (ref)
    local v961 = entity.get_local_player();
    if v961 and not v961:is_alive() and globals.tickcount % 2 == 0 then
        v930.clantag.run_animation();
    end;
end;
v930.clantag.on_run_command = function(v962)
    -- upvalues: v930 (ref)
    if v962.choked_commands == 0 then
        v930.clantag.run_animation();
    end;
end;
v930.clantag.reset = function()
    -- upvalues: v930 (ref)
    if v930.clantag.restore then
        common.set_clan_tag("\000");
        v930.clantag.restore = false;
    end;
end;
local v975 = {
    trace = function(v963)
        local v964 = entity.get_local_player();
        if v964 == nil or not v964:is_alive() then
            return;
        else
            local l_x_5 = v964.m_vecOrigin.x;
            local l_y_4 = v964.m_vecOrigin.y;
            local l_z_2 = v964.m_vecOrigin.z;
            local v968 = math.pi * 2;
            for v969 = 0, v968, v968 / 8 do
                local v970 = 10 * math.cos(v969) + l_x_5;
                local v971 = 10 * math.sin(v969) + l_y_4;
                local v972 = utils.trace_line(vector(v970, v971, l_z_2), vector(v970, v971, l_z_2 - v963), v964);
                local l_fraction_0 = v972.fraction;
                local _ = v972.entity;
                if l_fraction_0 ~= 1 then
                    return true;
                end;
            end;
            return false;
        end;
    end
};
v975.handle = function(v976)
    -- upvalues: v355 (ref), v975 (ref)
    if not v355.get("no_fall_damage") then
        return;
    else
        local v977 = entity.get_local_player();
        if v977 == nil or not v977:is_alive() then
            return;
        else
            if v977.m_vecVelocity.z >= -500 then
                no_damage = false;
            elseif v975.trace(15) then
                no_damage = false;
            elseif v975.trace(75) then
                no_damage = true;
            end;
            if v977.m_vecVelocity.z < -500 then
                if no_damage then
                    v976.in_duck = 1;
                else
                    v976.in_duck = 0;
                end;
            end;
            return;
        end;
    end;
end;
local v984 = {
    distance = function(v978, v979)
        if v978 == nil then
            return nil;
        elseif v979 == nil then
            return nil;
        else
            local v980 = v978:get_player_weapon();
            if v980 == nil then
                return nil;
            else
                local v981 = v980:get_weapon_index();
                if v981 == nil then
                    return nil;
                else
                    local v982 = v978:get_origin():dist((v979:get_origin()));
                    local v983 = v979.m_ArmorValue == 0;
                    if v981 ~= 64 or not v983 then
                        return 0;
                    elseif v982 < 585 and v982 > 511 then
                        return 1;
                    elseif v982 < 511 then
                        return 2;
                    else
                        return 0;
                    end;
                end;
            end;
        end;
    end
};
esp.enemy:new_text("Revolver helper", "DMG", function(v985)
    -- upvalues: v355 (ref), v984 (ref)
    if not v355.get("revolver_helper") then
        return;
    else
        local v986 = entity.get_local_player();
        if v986 == nil then
            return;
        else
            local v987 = v984.distance(v986, v985);
            if v987 == nil or v987 == 0 then
                return;
            elseif health < damage and wpn_id == 64 then
                return "DMG+";
            elseif damage < health and wpn_id == 64 then
                return "DMG-";
            else
                return;
            end;
        end;
    end;
end);
local v988 = {
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
};
v31.round = function(v989, v990)
    if v989 == nil then
        return 0;
    else
        local v991 = 10 ^ (v990 or 0);
        return math.floor(v989 * v991 + 0.5) / v991;
    end;
end;
local function v993(v992)
    print_raw(v992);
    print_dev(v992);
end;
v930.drawLogs = function(v994)
    -- upvalues: v988 (ref), v355 (ref), v993 (ref)
    local v995 = entity.get(v994.target);
    local l_m_iHealth_1 = v995.m_iHealth;
    local v997 = v995.m_flPoseParameter[11] * 120 - 60;
    v994.spread = v994.spread or 0;
    if v994.state == nil then
        if v988[v994.hitgroup] == v988[v994.wanted_hitgroup] and v994.damage == v994.wanted_damage then
            local v998 = v355.get("ragebot_logs_hit_color"):alpha_modulate(255):to_hex();
            if v355.get("ragebot_logs_style") == "Highlight" then
                local v999 = v355.get("ragebot_logs_default_color"):alpha_modulate(255):to_hex();
                v993(string.format("\a%s[\a%s+\a%s] Hit \a%s%s\a%s's \a%s%s\a%s for \a%s%d\a%s [remaining: \a%s%d\a%s, hc: \a%s%d\a%s%%, " .. "bt: \a%s%d\a%s, spread: \a%s%.3f\a%s\194\176, angle: \a%s%d\a%s\194\176]", v999, v998, v999, v998, v994.target:get_name(), v999, v998, v988[v994.hitgroup], v999, v998, v994.damage, v999, v998, l_m_iHealth_1, v999, v998, v994.hitchance, v999, v998, v994.backtrack, v999, v998, v994.spread, v999, v998, v997, v999));
            else
                v993(string.format("\a%s[+] Hit %s's %s for %d [remaining: %d, hc: %d%%, bt: %d, spread: %.3f\194\176, angle: %d\194\176]", v998, v994.target:get_name(), v988[v994.hitgroup], v994.damage, l_m_iHealth_1, v994.hitchance, v994.backtrack, v994.spread, v997));
            end;
        else
            local v1000 = v355.get("ragebot_logs_missmatch_color"):alpha_modulate(255):to_hex();
            if v355.get("ragebot_logs_style") == "Highlight" then
                local v1001 = v355.get("ragebot_logs_default_color"):alpha_modulate(255):to_hex();
                local v1002 = v355.get("ragebot_logs_hit_color"):alpha_modulate(255):to_hex();
                local v1003 = v355.get("ragebot_logs_miss_color"):alpha_modulate(255):to_hex();
                v993(string.format("\a%s[\a%s+\a%s\\\a%s-\a%s] Hit \a%s%s\a%s's \a%s%s\a%s for \a%s%d\a%s [aimed: \a%s%s\a%s:\a%s%d\a%s dmg, " .. "remaining: \a%s%d\a%s, hc: \a%s%d\a%s%%, bt: \a%s%d\a%s, spread: \a%s%.3f\a%s\194\176, angle: \a%s%d\a%s\194\176]", v1001, v1002, v1001, v1003, v1001, v1000, v994.target:get_name(), v1001, v1000, v988[v994.hitgroup], v1001, v1000, v994.damage, v1001, v1000, v988[v994.wanted_hitgroup], v1001, v1000, v994.wanted_damage, v1001, v1000, l_m_iHealth_1, v1001, v1000, v994.hitchance, v1001, v1000, v994.backtrack, v1001, v1000, v994.spread, v1001, v1000, v997, v1001));
            else
                v993(string.format("\a%s[+\\-] Hit %s's %s for %d [aimed: %s:%d dmg, remaining: %d, hc: %d%%, bt: %d, spread: %.3f\194\176, angle: %d\194\176]", v1000, v994.target:get_name(), v988[v994.hitgroup], v994.damage, v988[v994.wanted_hitgroup], v994.wanted_damage, l_m_iHealth_1, v994.hitchance, v994.backtrack, v994.spread, v997));
            end;
        end;
    else
        local v1004 = v355.get("ragebot_logs_miss_color"):alpha_modulate(255):to_hex();
        if v355.get("ragebot_logs_style") == "Highlight" then
            local v1005 = v355.get("ragebot_logs_default_color"):alpha_modulate(255):to_hex();
            v993(string.format("\a%s[\a%s-\a%s] Missed \a%s%s\a%s's \a%s%s\a%s due to \a%s%s\a%s [remaining: \a%s%d\a%s, hc: \a%s%d\a%s%%, " .. "bt: \a%s%d\a%s, spread: \a%s%.3f\a%s\194\176, angle: \a%s%d\a%s\194\176]", v1005, v1004, v1005, v1004, v994.target:get_name(), v1005, v1004, v988[v994.wanted_hitgroup], v1005, v1004, v994.state, v1005, v1004, l_m_iHealth_1, v1005, v1004, v994.hitchance, v1005, v1004, v994.backtrack, v1005, v1004, v994.spread, v1005, v1004, v997, v1005));
        else
            v993(string.format("\a%s[-] Missed %s's %s due to %s [remaining: %d, hc: %d%%, bt: %d, spread: %.3f\194\176, angle: %d\194\176]", v1004, v994.target:get_name(), v988[v994.wanted_hitgroup], v994.state, l_m_iHealth_1, v994.hitchance, v994.backtrack, v994.spread, v997));
        end;
    end;
end;
v576.notify = {
    cache = {}
};
v576.notify.draw = function()
    -- upvalues: v576 (ref), v353 (ref)
    local v1006 = render.screen_size();
    local v1007 = vector(v1006.x / 2, v1006.y * 0.85);
    local l_frametime_2 = globals.frametime;
    local l_realtime_2 = globals.realtime;
    local v1010 = #v576.notify.cache;
    local v1011 = 0;
    for v1012 = v1010, 1, -1 do
        local v1013 = v576.notify.cache[v1012];
        local v1014 = v353.sine_in_out(v1013.alpha, 0, 1, 1);
        v1013.alpha = math.clamp(v1013.alpha + (l_realtime_2 < v1013.time and (not (v1010 >= 7) or v1012 ~= 1) and l_frametime_2 * 5 or -l_frametime_2 * 5), 0, 1);
        if v1014 <= 0 or v1010 > 7 and v1012 == 1 then
            table.remove(v576.notify.cache, v1012);
        else
            local v1015 = v1013.clr:alpha_modulate(255 * v1014);
            local l_text_0 = v1013.text;
            local v1017 = {};
            for v1018 = 1, #l_text_0 do
                v1017[v1018] = v1018 % 2 == 0 and string.format("\a%s%s", v1015:to_hex(), l_text_0[v1018]) or string.format("\a%s%s", color(255, 255 * v1014):to_hex(), l_text_0[v1018]);
            end;
            l_text_0 = table.concat(v1017);
            local v1019 = render.measure_text(1, "c", l_text_0);
            local v1020 = v1007:clone() - vector(0, v1011);
            render.shadow(v1020 - vector(v1019.x / 2), v1020 + vector(v1019.x / 2 - 4), v1015, 30, 0, 0);
            render.text(1, v1020, color(), "c", l_text_0);
            v1011 = v1011 - (v1019.y + 4) * v1014;
        end;
    end;
end;
v576.notify.add = function(v1021, v1022, v1023)
    -- upvalues: v576 (ref)
    table.insert(v576.notify.cache, {
        alpha = 1.0E-4, 
        text = v1021, 
        clr = v1022, 
        time = globals.realtime + v1023
    });
end;
v576.notify.on_aim_ack = function(v1024)
    -- upvalues: v576 (ref), v988 (ref), v355 (ref)
    if not v1024.target then
        return;
    elseif v1024.state == nil then
        v576.notify.add({
            [1] = "Hit ", 
            [2] = nil, 
            [3] = " in the ", 
            [4] = nil, 
            [5] = " for ", 
            [6] = nil, 
            [7] = " damage (", 
            [8] = nil, 
            [9] = " health remaining)", 
            [2] = string.gsub(v1024.target:get_name(), "\n", ""), 
            [4] = v988[v1024.hitgroup], 
            [6] = v1024.damage, 
            [8] = v1024.target.m_iHealth
        }, v355.get("logs_notify_color_hit"), 5);
        return;
    else
        v576.notify.add({
            [1] = "Missed ", 
            [2] = nil, 
            [3] = "'s ", 
            [4] = nil, 
            [5] = " due to ", 
            [2] = string.gsub(v1024.target:get_name(), "\n", ""), 
            [4] = v988[v1024.wanted_hitgroup], 
            [6] = v1024.state
        }, v355.get("logs_notify_color_miss"), 5);
        return;
    end;
end;
local v1027 = {
    bind_argument = function(v1025, v1026)
        return function(...)
            -- upvalues: v1025 (ref), v1026 (ref)
            return v1025(v1026, ...);
        end;
    end
};
local v1028 = {
    end_time = 0, 
    ground_ticks = 1
};
v1028.handle = function(v1029)
    -- upvalues: v355 (ref), v393 (ref), v31 (ref), l_ffi_0 (ref), v1028 (ref)
    if not v1029 or v1029 ~= entity.get_local_player() then
        return;
    else
        if v355.contains("animation_breakers", "Backward legs") then
            v1029.m_flPoseParameter[0] = 1;
            v393.leg_movement:override("Sliding");
        end;
        if v355.contains("animation_breakers", "Static legs in air") then
            v1029.m_flPoseParameter[6] = 1;
        end;
        if v355.contains("animation_breakers", "Moon walk") then
            v1029.m_flPoseParameter[7] = -1;
            v393.leg_movement:override("Walking");
        end;
        if v355.contains("animation_breakers", "Moon walk in air") and v31.in_air(v1029) then
            l_ffi_0.cast("CAnimationLayer**", l_ffi_0.cast("uintptr_t", v1029[0]) + 10640)[0][6].m_flWeight = 1;
        end;
        if v355.contains("animation_breakers", "Zero pitch on land") then
            if bit.band(v1029.m_fFlags, 1) == 1 then
                v1028.ground_ticks = v1028.ground_ticks + 1;
            else
                v1028.ground_ticks = 0;
                v1028.end_time = globals.curtime + 1;
            end;
            if v1028.ground_ticks > 15 and v1028.end_time > globals.curtime then
                v1029.m_flPoseParameter[12] = 0.5;
            end;
        end;
        return;
    end;
end;
local v1030 = {
    engine_client = nil
};
local v1030_ptr = utils.create_interface("engine.dll", "VEngineClient014")
if v1030_ptr and v1030_ptr ~= 0 then
    v1030.engine_client = l_ffi_0.cast(l_ffi_0.typeof("void***"), v1030_ptr)
end

if v1030.engine_client then
    v1030.console_is_visible = v1027.bind_argument(l_ffi_0.cast("bool(__thiscall*)(void*)", v1030.engine_client[0][11]), v1030.engine_client);
else
    v1030.console_is_visible = function() return false end
end
v1030.material = {
    [1] = "vgui_white", 
    [2] = "vgui/hud/800corner1", 
    [3] = "vgui/hud/800corner2", 
    [4] = "vgui/hud/800corner3", 
    [5] = "vgui/hud/800corner4"
};
v1030.last = color(255);
v1030.change = function(v1031)
    -- upvalues: v1030 (ref)
    if v1030.last ~= v1031 then
        for _, v1033 in pairs(v1030.material) do
            materials.get_materials(v1033)[1]:alpha_modulate(v1031.a / 255);
            materials.get_materials(v1033)[1]:color_modulate(color(v1031.r, v1031.g, v1031.b));
        end;
        v1030.last = v1031;
    end;
end;
v1030.handle = function()
    -- upvalues: v355 (ref), v1030 (ref)
    local v1034 = v355.get("custom_console_color") and v1030.console_is_visible() and v355.get("console_color") or color(255);
    v1030.change(v1034);
end;
local v1040 = {
    draw = function()
        -- upvalues: v355 (ref)
        if not v355.get("snaplines_XDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD") then
            return;
        else
            local v1035 = entity.get_local_player();
            if v1035 == nil then
                return;
            else
                local v1036 = entity.get_threat();
                if v1036 == nil then
                    return;
                elseif v1036:is_dormant() then
                    return;
                else
                    local v1037 = v355.get("snaplines_XDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD_color");
                    local v1038 = v1035:get_origin() + vector(0, 0, 40);
                    local v1039 = v1036:get_origin() + vector(0, 0, 40);
                    render.line(render.world_to_screen(v1038), render.world_to_screen(v1039), v1037);
                    return;
                end;
            end;
        end;
    end
};
local v1041 = {
    toggle_mute = panorama.FriendsListAPI.ToggleMute, 
    is_muted = panorama.FriendsListAPI.IsSelectedPlayerMuted
};
v1041.handle = function()
    -- upvalues: v355 (ref), v1041 (ref)
    if not v355.get("auto_unmute") then
        return;
    else
        local _ = entity.get_players(false, true, function(v1042)
            -- upvalues: v1041 (ref)
            local l_steamid64_0 = v1042:get_player_info().steamid64;
            if v1041.is_muted(l_steamid64_0) then
                v1041.toggle_mute(l_steamid64_0);
            end;
        end);
        return;
    end;
end;
local function v1046()
    local v1045 = entity.get_local_player():get_player_weapon();
    if not v1045 or not string.find(v1045:get_classname(), "Grenade") then
        return false;
    elseif v1045.m_fThrowTime ~= 0 then
        return true;
    else
        return false;
    end;
end;
local function v1052(v1047)
    for _, v1049 in pairs(v1047) do
        if type(v1049) == "table" then
            for _, v1051 in pairs(v1049) do
                if v1051:get_override() ~= nil then
                    v1051:override();
                end;
                v1051:disabled(false);
            end;
        else
            if v1049:get_override() ~= nil then
                v1049:override();
            end;
            v1049:disabled(false);
        end;
    end;
end;
local v1053 = {
    values = {
        remove_overlay = false
    }
};
local v1054 = {
    state = false, 
    fraction = l_smoothy_0.new(), 
    size = l_smoothy_0.new(vector())
};
-- network.get("https://github.com/vektus1337/FONTS/blob/main/uk000.png?raw=true", {}, function(v1055)
--     -- upvalues: v1054 (ref)
--     if v1055 == "" then
--         return;
--     else
--         v1054.image = render.load_image(v1055, vector(255, 255));
--         return;
--     end;
-- end);
v1054.on_render = function()
    -- upvalues: v1054 (ref)
    if not v1054.state then
        return;
    else
        if not v1054.time_from_start then
            v1054.time_from_start = globals.curtime;
        end;
        local v1056 = globals.curtime - v1054.time_from_start < 3;
        local v1057 = render.screen_size();
        local v1058 = v1057 / 2;
        local v1059 = v1054.fraction(0.15, v1056 and 1 or 0);
        local v1060 = v1054.size(v1056 and 0.1 or 0.05, v1056 and v1057 / 3 or vector(-5)) - 1;
        if v1060.x > 1 then
            render.blur(vector(), v1057, 3, v1059);
            render.texture(v1054.image, v1058 - v1060 / 2, v1060, color());
        end;
        if v1060.x < -3 then
            v1054.state = false;
        end;
        return;
    end;
end;
v1053.on_render = function()
    -- upvalues: v1030 (ref), v1040 (ref), v397 (ref), v355 (ref), v940 (ref), v576 (ref), v1053 (ref), v393 (ref), v1041 (ref), v930 (ref), v1054 (ref), v354 (ref)
    v1030.handle();
    v1040.draw();
    v397.side_bar.run();
    local v1061 = true;
    if v355.get("debug_info") then
        v940.draw();
        v1061 = false;
    end;
    if v355.get("aspect_ratio") then
        cvar.r_aspectratio:float(v355.get("aspect_ratio_value") / 10);
    else
        cvar.r_aspectratio:float(0);
    end;
    if globals.is_in_game then
        if v355.contains("ui_elements", "Watermark") then
            v576.watermark.draw();
            v1061 = false;
        end;
        if v355.contains("ui_elements", "Keybinds") then
            v576.keybinds.draw();
        end;
        if v355.contains("ui_elements", "Spectators") then
            v576.spectators.draw();
        end;
    end;
    if v355.get("hitmarker") then
        v576.hitmarker.draw();
    end;
    if globals.is_in_game then
        v576.custom_scope.draw();
        v1053.values.remove_overlay = true;
    elseif v1053.values.remove_overlay then
        v393.override_zoom.scope_overlay:set("Remove Overlay");
        v1053.values.remove_overlay = false;
    end;
    if v355.get("crosshair_style") ~= "Disabled" then
        v576.indicators.draw();
        v1061 = false;
    end;
    if v355.get("manual_arrows") then
        v576.arrows.draw();
    end;
    if v355.get("dmg_indicator") and v355.get("indicators_switch") == true then
        v576.draw_indicator();
    end;
    v1041.handle();
    if v355.get("clantag") then
        v930.clantag.on_render();
    else
        v930.clantag.reset();
    end;
    if v355.get("logs_notify") then
        v576.notify.draw();
    end;
    v1054.on_render();
    if v1061 then
        render.text(1, vector(0, render.screen_size().y - 13), color(), "", string.format("jagoyaw - %s", v354.username));
    end;
end;
v1053.on_createmove = function(v1062)
    -- upvalues: v467 (ref), v355 (ref), v900 (ref), v934 (ref), v975 (ref), v1046 (ref), v393 (ref)
    v467.player_state();
    if v355.get("antiaim_settings") then
        v467.set_antiaim(v1062);
    end;
    v900.hitchance_overrides();
    if v355.get("viewmodel") then
        cvar.viewmodel_fov:int(v355.get("viewmodel_fov"), true);
        cvar.viewmodel_offset_x:float(v355.get("viewmodel_x"), true);
        cvar.viewmodel_offset_y:float(v355.get("viewmodel_y"), true);
        cvar.viewmodel_offset_z:float(v355.get("viewmodel_z"), true);
    else
        cvar.viewmodel_fov:int(68);
        cvar.viewmodel_offset_x:float(2.5);
        cvar.viewmodel_offset_y:float(0);
        cvar.viewmodel_offset_z:float(-1.5);
    end;
    if v355.contains("antiaim_tweaks", "Fast Ladder Climb") then
        v934(v1062);
    end;
    v975.handle(v1062);
    if v355.get("grenade_throw_fix") and v1046() then
        v393.weapon_actions:override({});
    else
        v393.weapon_actions:override();
    end;
end;
events.post_update_clientside_animation:set(function(v1063)
    -- upvalues: v1028 (ref)
    v1028.handle(v1063);
end);
events.shutdown:set(function()
    -- upvalues: v1052 (ref), v393 (ref)
    cvar.viewmodel_fov:int(68);
    cvar.viewmodel_offset_x:float(2.5);
    cvar.viewmodel_offset_y:float(0);
    cvar.viewmodel_offset_z:float(-1.5);
    v1052(v393);
end);
local v1064 = ui.find("Miscellaneous", "Main", "Other"):label("\adaeb6eff" .. ui.get_icon("brake-warning") .. "  Latency value has been overriden"):visibility(false);
local v1065 = false;
v1053.on_createmove_run = function(v1066)
    -- upvalues: v355 (ref), v900 (ref), v930 (ref), v393 (ref), v1065 (ref), v1064 (ref)
    if v355.contains("doubletap_options", "Adaptive recharge") then
        v900.doubletap.recharge();
    end;
    if v355.contains("doubletap_options", "Predict Double Tap Damage") then
        v900.doubletap.predict_dt_damage();
    end;
    local l_cl_ragdoll_physics_enable_0 = cvar.cl_ragdoll_physics_enable;
    local v1068 = v355.get("static_ragdolls") and 0 or 1;
    if l_cl_ragdoll_physics_enable_0 ~= v1068 then
        l_cl_ragdoll_physics_enable_0:int(v1068);
    end;
    if v355.get("teleport_inair") then
        v930.teleport_inair();
    end;
    if v355.get("fake_latency_override") then
        v393.fake_latency:override(v355.get("fake_latency_override_value"));
        if not v1065 then
            v393.fake_latency:disabled(true);
            v1064:visibility(true);
            v1065 = true;
        end;
    elseif v1065 then
        v393.fake_latency:override();
        v393.fake_latency:disabled(false);
        v1064:visibility(false);
        v1065 = false;
    end;
    if v355.get("clantag") then
        v930.clantag.on_run_command(v1066);
    end;
end;
events.player_hurt:set(function(v1069)
    -- upvalues: v576 (ref)
    v576.hitmarker.on_player_hurt(v1069);
end);
events.bullet_impact:set(function(v1070)
    -- upvalues: v576 (ref)
    v576.hitmarker.on_bullet_impact(v1070);
end);
events.player_spawned:set(function(v1071)
    -- upvalues: v576 (ref)
    v576.hitmarker.on_player_spawned(v1071);
end);
events.player_death:set(function(v1072)
    -- upvalues: v930 (ref)
    v930.killsay.run(v1072);
end);
events.createmove:set(v1053.on_createmove);
events.createmove_run:set(v1053.on_createmove_run);
events.render:set(v1053.on_render);
events.aim_ack:set(function(v1073)
    -- upvalues: v355 (ref), v930 (ref), v576 (ref), v940 (ref)
    if v355.get("ragebot_logs") then
        v930.drawLogs(v1073);
    end;
    if v355.get("logs_notify") then
        v576.notify.on_aim_ack(v1073);
    end;
    v940.shots.amount = v940.shots.amount + 1;
    if v1073.state == nil then
        v940.shots.hit = v940.shots.hit + 1;
    else
        v940.shots.missed = v940.shots.missed + 1;
    end;
end);
v355.visibility_handle(true);
utils.execute_after(1, function()
    -- upvalues: v1054 (ref)
    v1054.state = true;
end);

common.add_notify("officialy invited to diddy party", "u gonna get cracked hard asf u cant even walk anymore. <3")
common.add_notify("dumped by zadyma.", "fixed by Tokolyi Bakfista")