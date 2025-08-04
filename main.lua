
-- XRNL HUB - By Sebastian (versión extendida estilo XZuyaX)
-- Hecho con Rayfield | Compatible con KRNL Móvil

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
   Name = "XRNL HUB - By Sebastian",
   LoadingTitle = "Cargando XRNL...",
   LoadingSubtitle = "By Sebastian",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "XRNL",
      FileName = "xrnl_settings"
   },
   Discord = {
      Enabled = true,
      Invite = "tuserverdiscord",
      RememberJoins = true
   },
   KeySystem = false
})

-- PESTAÑAS IGUAL QUE XZUYAX

local Home = Window:CreateTab("🏠 Home", 4483362458)
local Main = Window:CreateTab("🖥 Main", 4483362458)
local Rollback = Window:CreateTab("🔁 Rollback", 4483362458)
local BallHack = Window:CreateTab("⚽ Ball Hack", 4483362458)
local Misc = Window:CreateTab("📁 Misc", 4483362458)
local Event = Window:CreateTab("🎁 Event", 4483362458)
local Visual = Window:CreateTab("👁 Visual", 4483362458)
local Server = Window:CreateTab("🖧 Server", 4483362458)
local Config = Window:CreateTab("⚙ Window and File Configuration", 4483362458)
local Theme = Window:CreateTab("🎨 Create Theme", 4483362458)

-- CONTENIDO DEMO PARA CADA TAB

Home:CreateParagraph({Title = "Bienvenido a XRNL HUB", Content = "Hecho por Sebastian
YouTube: XRNL Scripts
TikTok: @xrnl_hub"})
Home:CreateButton({Name = "Copiar Discord", Callback = function() setclipboard("https://discord.gg/tuinvite") end})

Main:CreateDropdown({
   Name = "Posición",
   Options = {"GK", "DF", "MF", "FW"},
   CurrentOption = "FW",
   Callback = function(option) print("Posición: "..option) end
})

Rollback:CreateButton({Name = "Reiniciar Personaje", Callback = function() game.Players.LocalPlayer.Character:BreakJoints() end})

BallHack:CreateToggle({
   Name = "Magnet Ball",
   CurrentValue = false,
   Callback = function(v)
      getgenv().MagnetBall = v
      while getgenv().MagnetBall do
         local ball = workspace:FindFirstChild("Ball")
         if ball then ball.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame end
         wait()
      end
   end
})

Misc:CreateButton({Name = "Sin cooldown", Callback = function()
   for _,v in pairs(getgc(true)) do if type(v)=="table" and rawget(v,"Cooldown") then v.Cooldown=0 end end
end})

Visual:CreateToggle({
   Name = "Resaltar balón",
   CurrentValue = false,
   Callback = function(state)
      local ball = workspace:FindFirstChild("Ball")
      if ball then
         if state then
            local h = Instance.new("Highlight", ball)
            h.FillColor = Color3.fromRGB(255,255,0)
         else
            for _,v in pairs(ball:GetChildren()) do if v:IsA("Highlight") then v:Destroy() end end
         end
      end
   end
})

Server:CreateButton({Name = "Rejoin", Callback = function()
   game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
end})

Config:CreateParagraph({Title = "Configuración", Content = "Guarda tus configuraciones del HUB XRNL"})
Theme:CreateParagraph({Title = "Tema", Content = "Tema oscuro moderno con íconos y secciones"})
