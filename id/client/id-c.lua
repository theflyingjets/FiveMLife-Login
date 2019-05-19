Citizen.CreateThread(function()

    local insert_key = 121
    local home_key = 213

    while true do
        Citizen.Wait(1)
        if IsControlJustReleased(1,  insert_key --[[ Insert key ]]) then
            msg("Insert key worked!!")  
            OpenMenu()   
        end
        if IsControlJustReleased(1,  home_key --[[ Home key ]]) then
            msg("Home key worked!!")  
            CloseMenu()   
        end
    end
end)





