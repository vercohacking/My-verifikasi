local DeltaLib = {}
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
function DeltaLib:Window(Name)
local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
local Main = Instance.new("Frame", ScreenGui)
local Corner = Instance.new("UICorner", Main)
local Sidebar = Instance.new("Frame", Main)
local SideCorner = Instance.new("UICorner", Sidebar)
local TabContainer = Instance.new("ScrollingFrame", Sidebar)
local TabList = Instance.new("UIListLayout", TabContainer)
local PageContainer = Instance.new("Frame", Main)
local Title = Instance.new("TextLabel", Sidebar)
Main.Size = UDim2.new(0, 480, 0, 320)
Main.Position = UDim2.new(0.5, -240, 0.5, -160)
Main.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Corner.CornerRadius = UDim.new(0, 10)
Sidebar.Size = UDim2.new(0, 130, 1, 0)
Sidebar.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
SideCorner.CornerRadius = UDim.new(0, 10)
Title.Text = Name
Title.Size = UDim2.new(1, 0, 0, 40)
Title.TextColor3 = Color3.fromRGB(0, 200, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 15
Title.BackgroundTransparency = 1
TabContainer.Size = UDim2.new(1, 0, 1, -50)
TabContainer.Position = UDim2.new(0, 0, 0, 50)
TabContainer.BackgroundTransparency = 1
TabContainer.ScrollBarThickness = 0
TabList.Padding = UDim.new(0, 5)
PageContainer.Size = UDim2.new(1, -140, 1, -20)
PageContainer.Position = UDim2.new(0, 135, 0, 10)
PageContainer.BackgroundTransparency = 1
UIS.InputBegan:Connect(function(k)
if k.KeyCode == Enum.KeyCode.RightControl then Main.Visible = not Main.Visible end
end)
local Tabs = {}
function Tabs:NewTab(TName)
local Page = Instance.new("ScrollingFrame", PageContainer)
local PageList = Instance.new("UIListLayout", Page)
Page.Size = UDim2.new(1, 0, 1, 0)
Page.Visible = false
Page.BackgroundTransparency = 1
Page.ScrollBarThickness = 2
PageList.Padding = UDim.new(0, 6)
local TabBtn = Instance.new("TextButton", TabContainer)
TabBtn.Size = UDim2.new(0.9, 0, 0, 30)
TabBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TabBtn.Text = TName
TabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
TabBtn.Font = Enum.Font.Gotham
TabBtn.TextSize = 13
Instance.new("UICorner", TabBtn)
TabBtn.MouseButton1Click:Connect(function()
for _, v in pairs(PageContainer:GetChildren()) do v.Visible = false end
Page.Visible = true
end)
local Funcs = {}
function Funcs:Toggle(Text, Callback)
local Tgl = Instance.new("TextButton", Page)
Tgl.Size = UDim2.new(1, -10, 0, 35)
Tgl.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
Tgl.Text = "  " .. Text
Tgl.TextColor3 = Color3.fromRGB(180, 180, 180)
Tgl.TextXAlignment = "Left"
Tgl.Font = Enum.Font.Gotham
Instance.new("UICorner", Tgl)
local S = false
Tgl.MouseButton1Click:Connect(function()
S = not S
Tgl.TextColor3 = S and Color3.fromRGB(0, 255, 150) or Color3.fromRGB(180, 180, 180)
Callback(S)
end)
end
function Funcs:Button(Text, Callback)
local Btn = Instance.new("TextButton", Page)
Btn.Size = UDim2.new(1, -10, 0, 35)
Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Btn.Text = Text
Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
Btn.Font = Enum.Font.GothamBold
Instance.new("UICorner", Btn)
Btn.MouseButton1Click:Connect(Callback)
end
if #TabContainer:GetChildren() == 2 then Page.Visible = true end
return Funcs
end
return Tabs, ScreenGui
end
local App, Gui = DeltaLib:Window("DELTA MOD")
local Main = App:NewTab("Main")
Main:Toggle("Auto Farm", function(v)
_G.Farm = v
while _G.Farm do task.wait()
pcall(function()
for _, m in pairs(workspace:GetChildren()) do
if m:FindFirstChild("Humanoid") and m.Humanoid.Health > 0 and m.Name ~= LP.Name then
LP.Character.HumanoidRootPart.CFrame = m.HumanoidRootPart.CFrame * CFrame.new(0,0,3)
end
end
end)
end
end)
Main:Toggle("Auto Quest", function(v) _G.Quest = v end)
Main:Button("Auto Stats", function() print("Stats Updated") end)
local Move = App:NewTab("Movement")
Move:Toggle("Speed Hack", function(v) LP.Character.Humanoid.WalkSpeed = v and 100 or 16 end)
Move:Toggle("Infinite Jump", function(v)
_G.IJ = v
UIS.JumpRequest:Connect(function() if _G.IJ then LP.Character.Humanoid:ChangeState(3) end end)
end)
Move:Toggle("Fly", function(v)
local r = LP.Character.HumanoidRootPart
if v then
local bv = Instance.new("BodyVelocity", r)
bv.Name = "DFly"
bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
bv.Velocity = Vector3.new(0, 50, 0)
else
if r:FindFirstChild("DFly") then r.DFly:Destroy() end
end
end)
Move:Button("Teleport Shop", function() LP.Character.HumanoidRootPart.CFrame = CFrame.new(50, 10, 50) end)
local Vis = App:NewTab("Visual")
Vis:Toggle("ESP Player", function(v)
for _, p in pairs(Players:GetPlayers()) do
if p ~= LP and p.Character then
if v then local h = Instance.new("Highlight", p.Character) h.Name = "DESP"
else if p.Character:FindFirstChild("DESP") then p.Character.DESP:Destroy() end end
end
end
end)
Vis:Toggle("Aimbot", function(v) _G.Aim = v end)
Vis:Toggle("Hitbox Expander", function(v)
_G.HB = v
while _G.HB do task.wait(1)
for _, m in pairs(workspace:GetChildren()) do
if m:FindFirstChild("Humanoid") and m ~= LP.Character then
m.HumanoidRootPart.Size = Vector3.new(20,20,20)
m.HumanoidRootPart.Transparency = 0.7
end
end
end
end)
local Set = App:NewTab("Settings")
Set:Button("Hide Menu (R-Ctrl)", function() Gui.Enabled = not Gui.Enabled end)
Set:Button("Exit Script", function() Gui:Destroy() _G.Farm = false _G.HB = false end)
