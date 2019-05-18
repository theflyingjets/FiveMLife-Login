AddEventHandler('playerSpawned', function(spawn)
    TriggerEvent('life:SpawnFreeze')
    TriggerServerEvent('life:checkPlayerData')
end)

function msg (text)
    TriggerEvent("chatMessage", "[Spawn Manager]", {255,0,0}, text)
end

RegisterNetEvent('life:SpawnFreeze')
AddEventHandler('life:SpawnFreeze', function()
    local ped = GetPlayerPed(PlayerId())
    SetPlayerInvincible(PlayerId(), true)
    FreezeEntityPosition(ped, true)
    SetEntityCoords(ped, -1400.11,-1530.36, 250.0)
end)

RegisterNetEvent('life:Spawn')
AddEventHandler('life:Spawn', function()
    local ped = GetPlayerPed(PlayerId())
    SetPlayerInvincible(PlayerId(), false)
    FreezeEntityPosition(ped, false) 
    SetEntityCoords(ped, -1400.11,-1530.36, 1.0)
    msg("Welcome to the server ", ped)
    TriggerEvent("life:closeUI")
end)

RegisterNetEvent('life:openUI')
AddEventHandler('life:openUI', function()
        SetNuiFocus(true, true)
        SendNUIMessage({
          action = "open"
    })
end)

RegisterNetEvent('life:closeUI')
AddEventHandler('life:closeUI', function()
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = "close"
    })
  end)

  RegisterNUICallback('create', function(data, cb)
    TriggerServerEvent("life:CreateCharacter", data)
    cb('ok')
end)