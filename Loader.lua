if not script_key and not script_id and not settings then return game.Players.LocalPlayer:Kick("Failed to load. You might be using an old loader, please get the new one in the #script channel.") end

getgenv().ozas_hub_settings = ozas_hub_settings
getgenv().script_key = script_key
getgenv().script_id = script_id

local succ, err = pcall(function()
    loadstring(game:HttpGet(("https://api.luarmor.net/files/v3/loaders/%s.lua"):format(script_id)))()
end)

if err then
    warn(("Ozas Hub failed to load.\n Error:%s"):format(tostring(err)))
end

local qot = (queue_on_teleport and queue_on_teleport) or (queueonteleport and queueonteleport) or (function(...) return (...) end)

qot(([[
    print("testttt")
    repeat task.wait() until game:IsLoaded()

    ozas_hub_settings=%s
    script_key=%s
    script_id=%s

    loadstring(game:HttpGet("https://raw.githubusercontent.com/10tempest01/ozas-hub/refs/heads/main/Loader.lua"))()
]]):format(ozas_hub_settings, script_key, script_id))
