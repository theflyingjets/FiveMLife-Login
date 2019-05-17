RegisterNetEvent("life:checkPlayerData")
AddEventHandler("life:checkPlayerData",function (source, playerId)

     playerId = GetPlayerIdentifier(source)
     playerName = GetPlayerName(source)     
     findPlayer = MySQL.Sync.fetchScalar("SELECT COUNT(1) FROM players WHERE `id` = @identifier", {['@identifier'] = playerId})
     print(findPlayer)
     
     if (findPlayer <= 0) then
            TriggerEvent('life:makePlayerData')
            print("No Data")
        else
            TriggerEvent('life:getPlayerData', source)
            print("Have Data")
    end
end)

AddEventHandler("life:makePlayerData",function()
    MySQL.Async.fetchAll('INSERT INTO players (id, name) VALUES (@id, @name)', {
        ["@id"] = playerId, ["@name"] = playerName
    }, function()
        print("Insert Data........")
    end)
end)

AddEventHandler("life:getPlayerData",function(source)
    print("Getting Data.........")
    print(source)
    -- TriggerClientEvent("life:Spawn")
    TriggerClientEvent("life:Spawn", source)
end)

AddEventHandler("life:test",function()
    print("Testing call")
end)
