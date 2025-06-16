if not script_key and not script_id and not settings then return warn("something is missing buddy") end

settings = getgenv().settings

local succ, err = pcall(function()
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/%s.lua"):format(script_id))()
end)

if err then
    warn(("Ozas Hub failed to load.\nError:%s"):format(tostring(err)))
end

local qot = queue_on_teleport and queue_on_teleport or function(...) return (...) end

qot([[loadstring(game:HttpGet("https://raw.githubusercontent.com/10tempest01/ozas-hub/refs/heads/main/Loader.lua"))()]])

-- 341763419876126879146871246789 1249871 247968 
