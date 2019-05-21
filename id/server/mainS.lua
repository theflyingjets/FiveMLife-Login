RegisterServerEvent("id:GetData")
AddEventHandler("id:GetData", function()

    local src = source
    local ident = PlayerIdentifier("license", src)
    local name = GetPlayerName(src)

    MySQL.Async.fetchAll("SELECT * FROM idtabel",{}, 
    function(result)
            local source = src
            local sendid = result[1].id
            local sendfn = result[1].firstName
            local sendln = result[1].lastName
            local sendsex = result[1].sex
            local senddob = result[1].dob 
            TriggerClientEvent("RData", source, sendid, sendfn, sendln, sendsex, senddob) 
    end)  
end)

function PlayerIdentifier(type, id)
    local identifiers = {}
    local numIdentifiers = GetNumPlayerIdentifiers(id)

    for a = 0, numIdentifiers do
        table.insert(identifiers, GetPlayerIdentifier(id, a))
    end

    for b = 1, #identifiers do
        if string.find(identifiers[b], type, 1) then
            return identifiers[b]
        end
    end
    return false
end

