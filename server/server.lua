local prefix = ("%s:"):format(GetCurrentResourceName())

lib.addCommand(Config.CommandName, {restricted = Config.AceAllowed}, function(source)
    if not DoesPlayerExist(source) then
       return
    end

    TriggerClientEvent(("%sopenCoordsMenu"):format(prefix), source)
end)
