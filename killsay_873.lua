local sidebar = ui.sidebar("Killsay", "alicorn")
local killsay = ui.create("Killsay")
local enabled = killsay:switch("Killsay", false)
local phraselist = killsay:combo("Trashtalk Mode", "Femboy", "Normal")
local delay_slider = killsay:slider("delay in seconds", 1, 5, 2)

local femboy_phrases = {
    "daddy loves my soft tummy rolls so much x3 nuzzles against u so cutely o-o 💕",
    "o-omg!! b-b-b-BULGE?? so big and scary but i love it!! kisses cutely uwu 😳",
    "ur strong hands on my chubby tummy make me melt~ nuzzles into ur chest o///o",
    "daddy's good kitten with tummy pudge just for u~ paws at u so shyly nya~ 💖",
    "e-eep!! ur bulge is pressing against my soft belly rolls!! blushes so hard x3",
    "thank u daddy for loving my cute little stomach chub~ cuddles u tightly uwu 🥺",
    "nuzzles my chonky tummy against ur bulge so cutely~ o-oh my!! so warm~ 😩💕",
    "daddy makes my tummy rolls jiggle when u grab me~ kisses ur chest shyly o-o",
    "b-baka!! don't stare at my pudge like that!! *blushes and nuzzles closer* x3",
    "ur big strong daddy bulge vs my soft tummy rolls = perfection uwu nya~ 💦",
    "melting into a puddle from daddy's love for my chubby bits~ kisses cutely~ 🐱",
    "o-owu!! tummy pudge squishes so nice against u~ nuzzles forever pls daddy 💕",
    "daddy's favorite chonk kitten here to nuzzle and blush for u always~ 😳 x3",
    "my stomach rolls are all urs daddy~ paws at ur bulge cutely o///o uwu 🥰",
    "neverlose daddy owns this shy chubby kitten forever nuzzles kisses x3 💖"
}

local normal_phrases = {
    "do you have half angry config for gamesense?",
    "The problem is that i only inject cheats on my main that have names that start with N and end with ovolinehook",
    "lamborgigni owner",
    "i cant lose on office it my home",
    "main new= can buy.. hvh win? dont think im can, im load rage ♕",
    "♛All Family in novo♛",
    "rich my main",
    "dumb dog, you awake the DRAGON HVH MACHINE, now you lose game ♕",
    "♛ my hvh team is ready go 1x1 2x2 3x3 4x4 5x5 (◣_◢)",
    "again noname on my steam account. i see again activity.",
    "noname listen to me ! my steam account is not your property.",
    "Poor acc dont comment please ♛",
    "try to test me? (◣_◢) my middle name is genuine pin ♛",
    "dont NN",
    "♛ e m o d r a i n s ♛",
    "HVH Legenden 2022 RIP Lil Peep & Xxxtentacion & Juice WRLD",
    "i novo user, no novo no talk",
    "our life motto is WIN > ACC",
    "fuck your family and friends, keep the steam level up ♚",
    "hvh till you die, but we live forever (◣_◢)",
    "you dont need friends when you have novolinehook",
    "I Am Legend",
    "hehehe, u grab my fall guys character? i grab ur bank details. ♛",
    "Get dealt with little boy, so simple, don't ever approach members of my team like that ever again. ♛",
    "one day, you will be forgot. but not me. my hvh ability will go down in the history books for young to learn ♛",
    "you listen cardi b? well, i am carder b, listen me dog ♛",
    "when me and my stack hit the hvh streets, well, it was a gangbang…",
    "its always NN never ready for the hvh streets (◣︵◢)",
    "163 FNAY ON MY NECK",
    "My have cheat its novo",
    "no kitty lua no talking (◣_◢)",
    "you pay sub for 25?mynixwarecost3 and i order 3 pizza when im destroy you in hvh (◣_◢)",
    "3 days and no nixware cfg im think is you stupid?♛",
    "if you grew up in hell, then ofc you are going to sin (◣_◢)",
    "when dogs dont want head aims only do body aims nothing for team in 5v5 only go for baims",
    "may god forgive you but gamesense resolver wont",
    "u guys make fun while i make wins ♚",
    "THE demon inside of me is freestanding",
    "I'VE BEEN PASTING SINCE 2018, CLOXY DONT TRY ME (◣_◢)"
}

events.player_death:set(function(e)
    if not enabled:get() then return end
    
    local me = entity.get_local_player()
    if not me then return end
    
    local attacker = entity.get(e.attacker, true)
    if not attacker then return end
    
    if attacker:get_index() ~= me:get_index() then return end
    local msg = femboy_phrases[math.random(1, #femboy_phrases)]
    local delay_seconds = delay_slider:get()
    local msg1 = normal_phrases[math.random(1, #normal_phrases)]

    if phraselist:get() == 'Femboy' then
        utils.execute_after(delay_seconds, utils.console_exec, "say " .. msg)
    elseif phraselist:get() == 'Normal' then
        utils.execute_after(delay_seconds, utils.console_exec, "say " .. msg1)
    end
end)