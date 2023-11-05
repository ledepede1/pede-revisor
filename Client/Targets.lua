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

ox_target:addBoxZone({
    coords = Config.RevisionCoords,
    size = vec3(3, 3, 3),
    rotation = 45,
    debug = false,
    drawSprite = true,
    options = {
        {
            canInteract = function(entity, distance, coords, name)
                if ESX.PlayerData.job.name == Config.JobName then
                    return true
                else
                    return false
                end
            end,
            onSelect = function ()
                if ESX.PlayerData.job.name == Config.JobName then
                OpenRevisionMenu()
                end
            end,
            icon = Config.TargetIcon,
            label = Config.TargetLabel,
        }
    }
})
