ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent("checkBlackMoney:Pede")
AddEventHandler("checkBlackMoney:Pede", function (money, percent)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local blackMoney = xPlayer.getAccount('black_money').money
    local job = xPlayer.job.name

    if job ~= Config.JobName then
        Log("Playername: "..GetPlayerName(source).."\n Got kicked for exploiting keep an eye out!")
        Citizen.Wait(50)
        xPlayer.kick("EXECUTING")
    end

    if blackMoney >= money then
        local amount = money / 100 * percent

        local waitTime = money * Config.Time
        TriggerClientEvent("ProgressBar:Pede", source, money, waitTime)

        Citizen.Wait(waitTime)
        xPlayer.removeAccountMoney('black_money', money)
        xPlayer.addMoney(amount)
        
        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_revisor', function(account)
			account.addMoney(money-amount)
		end)

        Log("Navn: "..GetPlayerName(source).."\n Har lige hvidvasket "..money.." DKK \n Og valgte "..percent.."% og modtog "..amount.." ud af det!")

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
    PerformHttpRequest(Config.WebhookURL, function(err, text, headers) end, 'POST', json.encode({username = 'pede-vangelico', embeds = embeds}), { ['Content-Type'] = 'application/json' })
end
  