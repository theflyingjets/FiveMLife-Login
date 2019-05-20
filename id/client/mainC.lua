Citizen.CreateThread(function(source)

    local insert_key = 121
    local home_key = 213
    local display = false
  
    while true do
        Citizen.Wait(1)
        if IsControlJustReleased(1,  insert_key --[[ Insert key ]]) then
            TriggerServerEvent('id:GetData', source)
        end
        if IsControlJustReleased(1,  home_key --[[ Home key ]]) then
            SendNUIMessage({type = "ui",display = false})
        end
    end
  end)

  RegisterNetEvent("RData")
  AddEventHandler("RData", function(id, firstName, lastName, sex, dob)
        SendNUIMessage({type = "ui",display = true,fName = firstName,lName = lastName,sE = sex,birth = dob,Num =id})
  end)