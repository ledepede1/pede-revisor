ESX = exports["es_extended"]:getSharedObject()

for _, v in pairs(Config.Companys) do

    TriggerEvent('esx_society:registerSociety', v.JobName, v.CompaneName, 'society_'..v.JobName, 'society_'..v.JobName, 'society_'..v.JobName, {type = 'private'})

    local list = MySQL.Sync.fetchAll('SELECT name FROM `addon_account` WHERE `name` = ?', {
        'society_'..v.JobName
    })
    if not list[1] then
    MySQL.insert.await('INSERT INTO `addon_account` (name, label, shared) VALUES (?, ?, ?)', {
        'society_'..v.JobName, v.CompaneName, 1
    })
    MySQL.insert.await('INSERT INTO `addon_account_data` (account_name, money) VALUES (?, ?)', {
        'society_'..v.JobName, 0
    })
    print("Created new Society: "..'society_'..v.JobName)
    end
end

RegisterNetEvent("checkBlackMoney:Pede")
AddEventHandler("checkBlackMoney:Pede", function (money, percent, society, jobname)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local blackMoney = xPlayer.getAccount('black_money').money
    local job = xPlayer.job.name


    if job ~= jobname then
        Log("Playername: "..GetPlayerName(source).."\n Got kicked for exploiting keep an eye out!")
        Citizen.Wait(50)
        xPlayer.kick("EXECUTING")
    end

    local company = 'society_'..society

    local companyFetched = MySQL.Sync.fetchAll('SELECT name FROM `addon_account` WHERE `name` = ?', {
        company
    })


    if blackMoney >= money then
        if companyFetched ~= nil then
        local amount = money / 100 * percent

        local waitTime = money * Config.Time
        TriggerClientEvent("ProgressBar:Pede", source, money, waitTime)

        Citizen.Wait(waitTime)

        TriggerEvent('esx_addonaccount:getSharedAccount', company, function(account)
            account.addMoney(money-amount)

            xPlayer.removeAccountMoney('black_money', money)
            xPlayer.addMoney(amount)

            Log("Navn: "..GetPlayerName(source).."\n Har lige hvidvasket "..money..Config.Valuta.."\n Og valgte "..percent.."% og modtog "..amount.." ud af det!")
		end)
    else
        print("ERROR: Companys society dosent exist")
    end
        else
            TriggerClientEvent("notify:pede", source, Config.Notifications.NotEnoughMoney.Title, Config.Notifications.NotEnoughMoney.Description, Config.Notifications.NotEnoughMoney.Type)
    end
end)

function Log(msg)
    local embeds = {
          {
              ["title"] = "Pede Revisor",
              ["description"] = msg,
          }
    }
    PerformHttpRequest(SVConfig.WebhookURL, function(err, text, headers) end, 'POST', json.encode({username = 'pede-vangelico', embeds = embeds}), { ['Content-Type'] = 'application/json' })
end
  