ESX = exports["es_extended"]:getSharedObject()
local prefix = ("%s:"):format(GetCurrentResourceName())

ESX.RegisterServerCallback(prefix.."checkPermission", function(source, cb)
    local perm = ESX.GetPlayerFromId(source).getGroup()
    local allowed = false
    for _,v in pairs(Config.perms) do
        if (perm == v) then allowed = true end
    end
    cb(allowed, perm)
end)