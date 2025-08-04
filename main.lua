
-- XRNL HUB - By Sebastian (Botón flotante para abrir panel Rayfield)
-- Compatible con KRNL móvil

-- Crear botón flotante en la pantalla
local btn = Instance.new("TextButton")
btn.Name = "XRNLButton"
btn.Size = UDim2.new(0, 120, 0, 40)
btn.Position = UDim2.new(0, 20, 0, 20)
btn.BackgroundColor3 = Color3.new(0, 0, 0)
btn.TextColor3 = Color3.new(1, 1, 1)
btn.Text = "Abrir XRNL"
btn.TextSize = 18
btn.Font = Enum.Font.SourceSansBold
btn.BorderSizePixel = 0
btn.Draggable = true
btn.Active = true

-- Crear GUI contenedor si no existe
local gui = Instance.new("ScreenGui")
gui.Name = "XRNL_GUI"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true

-- Si es en KRNL móvil, usar gethui o CoreGui
local success, result = pcall(function() return gethui and gethui() or game.CoreGui end)
local parentGui = success and result or game.Players.LocalPlayer:WaitForChild("PlayerGui")
gui.Parent = parentGui
btn.Parent = gui

-- Función para abrir el panel al presionar el botón
btn.MouseButton1Click:Connect(function()
    btn.Visible = false
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Christianxddd/m/c2da1fbbe0b1068a522100ec6ed63dd1bc1ce124/main.lua"))()
end)
