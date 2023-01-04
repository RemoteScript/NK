--//Settings

local Settings = {
    Region = "Midnight", -- Dive starting region
    LeaveAtRegion = "Midnight", -- nil for completing until Dreams, put your desired area if you want to leave at specify area example "Shallows"
    Difficulty = 400,
    Special = true, 
    NextRegion = flase, -- Keep it true so you can synced all the items from the dive
    AutoSell = true,
    TempFarm = true, -- Pillar Farm and SYNC farm
    RarityFilter = "Alpha" -- Examples: "Pristine" Ignores Pristine and above, "Legendary" Ignores Legendary and above. Filters: Pristine, Experimental, Legendary, Alpha, Omega, Core
}

--//Services
local HttpService = game:GetService("HttpService");

function saveSettings()
    local savedTable = HttpService:JSONEncode(Settings);

    writefile("NK_Settings.json", savedTable);
    Settings = HttpService:JSONDecode(readfile("NK_Settings.json"));
end

-- Call saveSettings function
saveSettings();

-- Load the code from the specified URL
loadstring(game:HttpGet("https://raw.githubusercontent.com/RemoteScript/NK/main/Main.lua"))();
