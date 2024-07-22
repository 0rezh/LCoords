main = RageUI.CreateMenu("Menu Coordonnées", GetPlayerName(PlayerId()))
local prefix = ("%s:"):format(GetCurrentResourceName())

local function setClipboard(value)
    SendNUIMessage({
        action = 'setClipboard',
        data = value
    })
end

function RageUI.PoolMenus:AdminMenu()
    main:IsVisible(function(Items)
        local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
            local h = GetEntityHeading(PlayerPedId())
            Items:AddSeparator("~b~↓~s~ Copier les coordonnées ~b~↓~s~")
            Items:Line()
            Items:AddButton(("vec2(x, y)"), nil, {RightLabel = Config.RightLabel}, function(onSelected)
                if (onSelected) then
                    lib.setClipboard(("vec2(%s, %s)"):format(x, y))
                end
            end)
            Items:AddButton(("vec3(x, y, z)"), nil, {RightLabel = Config.RightLabel}, function(onSelected)
                if (onSelected) then
                    lib.setClipboard(("vec3(%s, %s, %s)"):format(x, y, z))
                end
            end)
            Items:AddButton(("vec4(x, y, z, h)"), nil, {RightLabel = Config.RightLabel}, function(onSelected) 
                if (onSelected) then
                    lib.setClipboard(("vec4(%s, %s, %s, %s)"):format(x, y, z, h))
                end
            end)
            Items:AddButton(("{x = x, y = y, z = z}"), nil, {RightLabel = Config.RightLabel}, function(onSelected) 
                if (onSelected) then
                    lib.setClipboard(("{x = %s, y = %s, z = %s}"):format(x, y, z))
                end
            end)
            Items:AddButton(("{x = x, y = y, z = z, h = h}"), nil, {RightLabel = Config.RightLabel}, function(onSelected) 
                if (onSelected) then
                    lib.setClipboard(("{x = %s, y = %s, z = %s, h = %s}"):format(x, y, z, h))
                end
            end)
            Items:AddButton(("{x, y, z}"), nil, {RightLabel = Config.RightLabel}, function(onSelected) 
                if (onSelected) then
                    lib.setClipboard(("{%s, %s, %s}"):format(x, y, z))
                end
            end)
            Items:AddButton(("{x, y, z, h}"), nil, {RightLabel = Config.RightLabel}, function(onSelected) 
                if (onSelected) then
                    lib.setClipboard(("{%s, %s, %s, %s}"):format(x, y, z, h))
                end
            end)
            Items:AddButton(("x, y, z"), nil, {RightLabel = Config.RightLabel}, function(onSelected)
                if (onSelected) then
                    lib.setClipboard(("%s, %s, %s"):format(x, y, z))
                end
            end)
            Items:AddButton(("x, y, z, h"), nil, {RightLabel = Config.RightLabel}, function(onSelected)
                if (onSelected) then
                    lib.setClipboard(("%s, %s, %s, %s"):format(x, y, z, h))
                end
            end)
            Items:AddButton(("x"), nil, {RightLabel = Config.RightLabel}, function(onSelected)
                if (onSelected) then
                    lib.setClipboard(("%s"):format(x))
                end
            end)
            Items:AddButton(("y"), nil, {RightLabel = Config.RightLabel}, function(onSelected)
                if (onSelected) then
                    lib.setClipboard(("%s"):format(y))
                end
            end)
            Items:AddButton(("z"), nil, {RightLabel = Config.RightLabel}, function(onSelected)
                if (onSelected) then
                    lib.setClipboard(("%s"):format(z))
                end
            end)
    end, function() end)
end


RegisterCommand(Config.CommandName, function(source, args)
    ESX.TriggerServerCallback(prefix .. "checkPermission", function(auth, permm)
        if (auth) then
            RageUI.Visible(main, not RageUI.Visible(main))
        else
            ShowNotification("Permission", "Tu n'as pas la permission de faire ceci", "ban", "#C53030")
        end
    end)
end, false)

RegisterKeyMapping(Config.CommandName, "Ouvrir le menu de coordonnées", "keyboard", Config.KeyMapping)