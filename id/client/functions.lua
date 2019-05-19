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

function msg (text)
    TriggerEvent("chatMessage", "[Debuger]", {255,0,0}, text)
end

function OpenMenu()
    SendNUIMessage({action = "OpenMenu"})
end

function CloseMenu()
    SendNUIMessage({action = "CloseMenu"})
end