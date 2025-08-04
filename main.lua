
-- XRNL HUB - By Sebastian
-- Estilo completo replicando XZuyaX HUB con pestañas e interfaz avanzada
-- Ejecutar en KRNL móvil

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local plr = game.Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")
local humanoid = char:WaitForChild("Humanoid")

local Window = Rayfield:CreateWindow({
    Name = "XRNL HUB - By Sebastian",
    LoadingTitle = "Cargando XRNL...",
    LoadingSubtitle = "Blue Lock Control Panel",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "XRNLHub",
        FileName = "config_v1"
    },
    Discord = {
        Enabled = true,
        Invite = "yourdiscordlink",
        RememberJoins = true
    },
    KeySystem = false
})

-- Tabs replicadas del panel de XZuyaX
local Home = Window:CreateTab("🏠 Home", 4483362458)
local Main = Window:CreateTab("🖥 Main", 4483362458)
local Rollback = Window:CreateTab("🔁 Rollback", 4483362458)
local BallHack = Window:CreateTab("⚽ Ball hack", 4483362458)
local Misc = Window:CreateTab("📁 Misc", 4483362458)
local Event = Window:CreateTab("🎁 Event", 4483362458)
local Visual = Window:CreateTab("👁 Visual", 4483362458)
local Server = Window:CreateTab("🖧 Server", 4483362458)
local Config = Window:CreateTab("⚙ Window and File Configuration", 4483362458)
local Theme = Window:CreateTab("🎨 Create Theme", 4483362458)

-- HOME
Home:CreateParagraph({
    Title = "XRNL HUB - By Sebastian",
    Content = "Gracias por usar mi script.
YouTube: XRNL Scripts
TikTok: @xrnl_hub
Discord: coming soon."
})
Home:CreateButton({
    Name = "Copiar YouTube",
    Callback = function() setclipboard("https://youtube.com/@XRNL_Scripts") end
})
Home:CreateButton({
    Name = "Copiar TikTok",
    Callback = function() setclipboard("https://tiktok.com/@xrnl_hub") end
})

-- MAIN
Main:CreateButton({
    Name = "TP al balón",
    Callback = function()
        local ball = workspace:FindFirstChild("Ball")
        if ball then hrp.CFrame = ball.CFrame + Vector3.new(0,3,0) end
    end
})
Main:CreateButton({
    Name = "No cooldown (habilidades)",
    Callback = function()
        for _,v in pairs(getgc(true)) do
            if type(v)=="table" and rawget(v,"Cooldown") then v.Cooldown=0 end
        end
    end
})

-- ROLLBACK
Rollback:CreateButton({
    Name = "Reiniciar personaje",
    Callback = function() humanoid.Health = 0 end
})

-- BALL HACK
BallHack:CreateToggle({
    Name = "Control/Magnet Ball",
    CurrentValue = false,
    Callback = function(state)
        _G.Magnet = state
        while _G.Magnet do
            local ball = workspace:FindFirstChild("Ball")
            if ball then ball.CFrame = hrp.CFrame + Vector3.new(0,2,0) end
            wait(0.1)
        end
    end
})

-- VISUAL
Visual:CreateToggle({
    Name = "Highlight al balón",
    CurrentValue = false,
    Callback = function(on)
        local ball = workspace:FindFirstChild("Ball")
        if ball then
            if on then
                local h = Instance.new("Highlight", ball)
                h.FillColor = Color3.fromRGB(255,255,0)
            else
                for _,v in pairs(ball:GetChildren()) do
                    if v:IsA("Highlight") then v:Destroy() end
                end
            end
        end
    end
})

-- THEME (decorativo)
Theme:CreateParagraph({
    Title = "Colores y estilo",
    Content = "Tema oscuro | Moderno | Inspirado en XZuyaX Panel"
})

-- FINAL
Misc:CreateParagraph({ Title = "XRNL HUB", Content = "Creado por Sebastian | Mejora continua 🔧" })
