Config = {}

Config.WebhookURL = ""

Config.JobName = "revisor"
Config.RevisionCoords = vector3(-126.0892,-641.5922,168.8203) -- x = -126.0892,  y = -641.2422,  z = 168.8203

Config.MiniumPercent = 80 -- 80%
Config.MaximumPercent = 100 -- 100%

Config.MinAmmount = 1000 -- Mindste antal penge man kan hvidvaske

Config.Time = 200 -- Hvor mange millisekunder der skal gå per seddel der skal bogføres
Config.NotifyShowTime = 5 -- Hvor mange sekunder der skal gå imellem før den viser nyt progress alstå (Der er nu X sekunder tilbage) 

Config.TargetLabel = "Åben revisions menu"
Config.TargetIcon = "fa-solid fa-building-columns"

Config.Progressbar = "Bogfører " -- Efter her vil der stå hvor mange penge personen bogfører

Config.Menus = {
    MenuTitle = "Revisor Menu",

    BossMenuTitle = "Bossmenu",
    BossMenuIcon = "toolbox",

    MoneyLaunderingTitle = "Indberet Penge",
    MoneyLaunderingIcon = "money-bill-transfer",

    DialogTitle = "Bogfør kontanter",
    DialogAmountLabel = "Beløb",
    DialogAmountDescription = "Beløbet på de penge som skal bogføres",
    DialogAmountIcon = "money-bill-wave",

    DialogPercentLabel = "Procentsats",
    DialogPercentDescription = "Procent der skal tages af beløbet uden %",
    DialogPercentIcon = "percent",
}
Config.Notifications = {
    LaunderingDone = {
        Title = "Bogføring",
        -- Hvis du vil ændre description vil jeg nok råde dig til at kigge i Client/Main.lua linje 36 cirka
        Type = "success"
    },
    SecondsUpdate = {
        Title = "Bogføring",
        -- Hvis du vil ændre description vil jeg nok råde dig til at kigge i Client/Main.lua linje 63 cirka
        Type = "success"
    },
    NotEnoughMoney = {
        Title = "Bogføring",
        Description = "Du har ikke nok penge på dig!",
        Type = "error"
    },

    -- Error notifys --
    MinimumAmount = {
        Title = "Bogføring",
        Description = "Du kan mindste hvidvaske for ",
        Type = "error"
    },
    MinimumPercent = {
        Title = "Bogføring",
        Description = "Den mindste procent du kan bruge er ",
        Type = "error"
    },
    MaximumPercent = {
        Title = "Bogføring",
        Description = "Den største procent du kan bruge er ",
        Type = "error"
    }
}


