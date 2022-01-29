for k, v in pairs(Config.EventsList) do 
    AddEventHandler(v.Events, function(source)
        SendLogs(v.Message, source)
    end)
end


function SendLogs(message, source)
    local Content = {
        {
            ["color"] = 14357713,
            ["title"] = Config.Discord.Title,
            ["description"] = message,
            ["footer"] = {
                ["text"] = GetPlayerName(source),
                ["icon_url"] = Config.Discord.Logo,
            },
        }
    }
    PerformHttpRequest(Config.Discord.Webhook, function(err, text, headers) end, 'POST', json.encode({username = Config.Discord.Name, avatar_url = Config.Discord.Logo, embeds = Content}), { ['Content-Type'] = 'application/json' })
end

RegisterNetEvent('EventsLogs:test')
AddEventHandler('EventsLogs:test', function(source)
    print('HEHEHEA')
end)
RegisterCommand("EventsLogs", function(source) 
    TriggerEvent("EventsLogs:test", source)
end, false)