RegisterCommand("debug", function (source)
    TriggerServerEvent('life:checkPlayerData')
    TriggerEvent("chatMessage", "[Main Debuger]", {255,0,0}, "debug......")
end, false)

AddEventHandler('playerSpawned', function(spawn)
    msg("Welcome to the server player")
    TriggerEvent('life:SpawnFreeze')
    TriggerServerEvent('life:checkPlayerData')
end)

function msg (text)
    TriggerEvent("chatMessage", "[Spawn Manager]", {255,0,0}, text)
end

function alert(msg) 
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function notify(string)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(string)
    DrawNotification(true, false)
end

RegisterNetEvent('life:SpawnFreeze')
AddEventHandler('life:SpawnFreeze', function()
  Citizen.CreateThread(function()
    local ped = GetPlayerPed(PlayerId())
    SetPlayerInvincible(PlayerId(), true)
    FreezeEntityPosition(ped, true) 
    SetEntityCoords(ped, -1400.11,-1530.36, 181.1)
  end)
end)

RegisterNetEvent('life:Spawn')
AddEventHandler('life:Spawn', function()
    msg("Spawn works")
    TriggerServerEvent('life:test')
end)