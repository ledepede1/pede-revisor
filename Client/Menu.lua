-- Creating the menu
function OpenRevisionMenu(society, jobname)
    lib.registerContext({
        id = 'pede-revisionMenu',
        title = Config.Menus.MenuTitle,
        options = {
          {
            title = Config.Menus.BossMenuTitle,
            arrow = true,
            icon = Config.Menus.BossMenuIcon,
            disabled = CheckIfBoss(jobname), -- If the player is not boss then dont let them use the boss menu
            onSelect = function()
                TriggerEvent('esx_society:openBossMenu', society, function (data, menu)
                    --menu.close()
                end, {wash = false})
              end,        
          },
          {
            title = Config.Menus.MoneyLaunderingTitle,
            icon = Config.Menus.MoneyLaunderingIcon,
            onSelect = function()
              RevisorMoneyMenu(society, jobname)
            end,        
          }
        }
      })
      lib.showContext('pede-revisionMenu')
end

-- Creating the input dialog for revision
function RevisorMoneyMenu(society, jobname) 
    local input = lib.inputDialog(Config.Menus.DialogTitle, {
        {type = 'number', label = Config.Menus.DialogAmountLabel, description = Config.Menus.DialogAmountLabel, icon = Config.Menus.DialogAmountIcon, required = true},
        {type = 'number', label = Config.Menus.DialogPercentLabel, description = Config.Menus.DialogPercentDescription, icon = Config.Menus.DialogPercentIcon, required = true},
      })

      if not input then return end -- Just so ox-lib dosent spam in the console

        if input[1] < Config.MinAmmount then 
          lib.notify({
            title = Config.Notifications.MinimumAmount.Title,
            description = Config.Notifications.MinimumAmount.Description..Config.MinAmmount..Config.Valuta,
            type = Config.Notifications.MinimumAmount.Title
        })
        return end
        if input[2] < Config.MiniumPercent then 
          lib.notify({
            title = Config.Notifications.MinimumPercent.Title,
            description = Config.Notifications.MinimumPercent.Description..Config.MiniumPercent.."%",
            type = Config.Notifications.MinimumPercent.Title
        })
        return end
        if input[2] > Config.MaximumPercent then
          lib.notify({
            title = Config.Notifications.MaximumPercent.Title,
            description = Config.Notifications.MaximumPercent.Description..Config.MaximumPercent.."%",
            type = Config.Notifications.MaximumPercent.Title
        })
        return end

        if input[1] ~= nil and input[2] ~= nil then
        TriggerServerEvent("checkBlackMoney:Pede", input[1], input[2], society, jobname)
      end
end

