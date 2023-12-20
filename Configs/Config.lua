Config = {}

Config.Companys = {
    ["PedersRevisor"] = {
        CompaneName = "Peders Revisor", -- Label til society'et
        JobName = "police", -- Navnet på jobbet som man skal bruge for at være revisor i det her firma (Job navnet er det samme som society navnet)
        RevisionCoords = vector3(-126.0892,-641.5922,168.8203), -- Koordinater hvor target skal placeres
        TargetLabel = "Åben revisions menu",
        TargetIcon = "fa-solid fa-building-columns",
    },
    ["Revisoren"] = {
        CompaneName = "Din Revisor", -- Label til society'et
        JobName = "pederevisor", -- Navnet på jobbet som man skal bruge for at være revisor i det her firma (Job navnet er det samme som society navnet)
        RevisionCoords = vector3(-1372.9812,-464.3054,72.0439), -- Koordinater hvor target skal placeres
        TargetLabel = "Åben revisions menu",
        TargetIcon = "fa-solid fa-building-columns",
    },
}

Config.Valuta = " DKK" -- Ligesom USD EURO og så videre kan være lige hvad du har lyst til

Config.MiniumPercent = 80 -- 80%
Config.MaximumPercent = 100 -- 100%
Config.MinAmmount = 10 -- Mindste antal penge man kan hvidvaske

Config.Time = 2 -- Hvor mange millisekunder der skal gå per seddel der skal bogføres
Config.NotifyShowTime = 5 -- Hvor mange sekunder der skal gå imellem før den viser nyt progress alstå (Der er nu X sekunder tilbage) 

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
        DialogPercentDescription = "Procent der skal gives tilbage af beløbet uden %",
        DialogPercentIcon = "percent",

        DialogCheckBoxLabel = "Er personens identitet blevet verificeret?",

        DateLabel = "Dato for bogføring",
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



