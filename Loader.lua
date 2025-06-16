if not script_key then
    return game.Players.LocalPlayer:Kick("Failed to load, script_key not found")
end

local supported = {
    [3808081382] = "adcc551b780178b0b9a84b76f9c0ac72" --> TSB
}

if not supported[game.GameId] then
    return warn("This game is not supported by Ozas Hub.")
end

script_id = supported[game.GameId]

task.spawn(function()
    local succ, err = pcall(function()
        loadstring(game:HttpGet(("https://api.luarmor.net/files/v3/loaders/%s.lua"):format(script_id)))()
    end)

    if err then
        warn(("Failed to load.\n Error:%s"):format(tostring(err)))
    end
end)

local qot = (queue_on_teleport and queue_on_teleport) or (queueonteleport and queueonteleport) or (function(...) return (...) end)

if execute_on_teleport then
    queue_on_teleport(([[repeat task.wait() until game:IsLoaded();getgenv().execute_on_teleport=%s;script_key='%s';loadstring(game:HttpGet("https://raw.githubusercontent.com/10tempest01/ozas-hub/refs/heads/main/Loader.lua"))()]]):format((execute_on_teleport and "true") or "false", script_key))
end
