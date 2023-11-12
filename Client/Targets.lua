-- Framework stuff
ESX = exports["es_extended"]:getSharedObject()
local ox_target = exports.ox_target

while ESX.GetPlayerData().job == nil do
    Citizen.Wait(10)
end

ESX.PlayerData = ESX.GetPlayerData()

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

for k,v  in pairs(Config.Companys) do
    ox_target:addBoxZone({
        coords = v.RevisionCoords,
        size = vec3(3, 3, 3),
        rotation = 45,
        debug = false,
        drawSprite = true,
        options = {
            {
                canInteract = function(entity, distance, coords, name)
                    if ESX.PlayerData.job.name == v.JobName then
                        return true
                    else
                        return false
                    end
                end,
                onSelect = function ()
                    if ESX.PlayerData.job.name == v.JobName then
                    OpenRevisionMenu(v.JobName, v.JobName)
                    end
                end,
                icon = v.TargetIcon,
                label = v.TargetLabel,
            }
        }
    })    
end

