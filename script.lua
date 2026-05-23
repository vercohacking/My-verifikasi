-- FuFa Mod Menu - Full Version
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")

-- Menghapus menu lama jika sudah ada (mencegah duplikat)
if CoreGui:FindFirstChild("FuFaMenu") then
    CoreGui.FuFaMenu:Destroy()
end

-- Membuat ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "FuFaMenu"
gui.Parent = CoreGui
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- 1. Floating Button (Tombol F)
local btn = Instance.new("TextButton", gui)
btn.Size = UDim2.new(0, 50, 0, 50)
btn.Position = UDim2.new(0.1, 0, 0.1, 0)
btn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
btn.BorderSizePixel = 2
btn.Text = "F"
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
btn.TextSize = 25
btn.Draggable = true -- Bisa digeser

-- 2. Main Menu Frame
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 220, 0, 400)
frame.Position = UDim2.new(0.2, 0, 0.2, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BackgroundTransparency = 0.2
frame.Visible = false
frame.Active = true

-- Judul
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "FuFa Mod Menu"
title.TextColor3 = Color3.fromRGB(0, 255, 0)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold

-- Fungsi Tombol Fitur
local function createButton(name, callback)
    local b = Instance.new("TextButton", frame)
    b.Size = UDim2.new(0.9, 0, 0, 40)
    b.Position = UDim2.new(0.05, 0, 0, #frame:GetChildren() * 45)
    b.BackgroundColor3 = Color3.fromRGB(0, 80, 0)
    b.Text = name
    b.TextColor3 = Color3.new(1, 1, 1)
    b.MouseButton1Click:Connect(callback)
    return b
end

-- Daftar Fitur
createButton("Tele ke Tim", function() print("Tele ke Tim") end)
createButton("Tele ke Musuh", function() print("Tele ke Musuh") end)
createButton("Mata Hantu (ESP)", function() print("ESP Aktif") end)
createButton("Speed Run", function() game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50 end)
createButton("Wallhack", function() print("Wallhack Aktif") end)
createButton("HP 1000", function() game.Players.LocalPlayer.Character.Humanoid.MaxHealth = 1000; game.Players.LocalPlayer.Character.Humanoid.Health = 1000 end)
createButton("Exit", function() gui:Destroy() end)

-- Toggle Menu
btn.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible
end)
