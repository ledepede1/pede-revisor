-- Framework stuff
ESX = exports["es_extended"]:getSharedObject()
local running = false

while ESX.GetPlayerData().job == nil do
    Citizen.Wait(10)
end

ESX.PlayerData = ESX.GetPlayerData()

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)


-- Creating the progressbar and doing an emote/task
RegisterNetEvent('ProgressBar:Pede')
AddEventHandler('ProgressBar:Pede', function(cash, duration)
    local playerCoords = GetEntityCoords(PlayerPedId())
    running = true 

    TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_CLIPBOARD", 0, true);
    TriggerEvent("UpdateSeconds:pede", duration)

    if lib.progressBar({
        duration = duration,
        label = Config.Progressbar..cash..Config.Valuta,
        useWhileDead = false,
        canCancel = false,
        disable = {
            car = true,
            move = true,
            combat = true,
        },
    }) then 
        lib.notify({
            title = Config.Notifications.LaunderingDone.Title,
            description = 'Bogføring af '..cash..Config.Valuta..'er nu færdigt! Det tog ialt '..(math.floor(duration/1000%60))..' Sekunder',
            type = Config.Notifications.LaunderingDone.Type
        })
        ClearPedTasksImmediately(PlayerPedId()) 
        Citizen.Wait(150)
        ClearAreaOfObjects(playerCoords.x, playerCoords.y, playerCoords.z, 1.0, 0)
        running = false
        else
        print("How did you get here wtf?")
        ClearPedTasksImmediately(PlayerPedId()) 
        Citizen.Wait(150)
        ClearAreaOfObjects(playerCoords.x, playerCoords.y, playerCoords.z, 1.0, 0)
        running = false
    end
end)

-- Sends notify every Config.NotifyShowTime
RegisterNetEvent("UpdateSeconds:pede")
AddEventHandler("UpdateSeconds:pede", function(ms)
   --if ms - Config.NotifyShowTime * 1000 < 5 then return end
    while running == true do
        Citizen.Wait(5000)
        ms = ms - Config.NotifyShowTime * 1000
        if ms <= 0 then break end
        local secondsRemaining = math.floor(ms / 1000)
        lib.notify({
            title = Config.Notifications.SecondsUpdate.Title,
            description = 'Der er nu ' .. secondsRemaining .. ' Sekunder tilbage',
            type = Config.Notifications.SecondsUpdate.Title
        })
    end
end)

-- For sending notifys on server side
RegisterNetEvent("notify:pede")
AddEventHandler('notify:pede', function(title, description, type)
    lib.notify({
        title = title,
        description = description,
        type = type
    })
end)

-- Function to check if player is boss for the Config.JobName
function CheckIfBoss(jobname)
    local JobNeeded = jobname
    local grade = 'boss'
    
    if ESX.PlayerData.job.name == JobNeeded and ESX.PlayerData.job.grade_name == grade then
        return false
    else
        return true
    end
end