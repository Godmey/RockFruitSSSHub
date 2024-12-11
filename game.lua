-- spawn task wait game Players LocalPlayer Character HumanoidRootPart Humanoid GetService Destroy workspace ReplicatedStorage Value GetDescendants GetChildren firetouchinterest 

getgenv().Config = {
  Webhook = {
    ["Link Webhook"] = "nil"
  },
}


if not getgenv().Config then
getgenv().Config = {
  Webhook = {
    ["Link Webhook"] = "nil"
  },
}
end

local NameMap = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

local function TP(cframe)
    pcall(function()
        local character = game.Players.LocalPlayer.Character
        if character and character.PrimaryPart then
            character:SetPrimaryPartCFrame(cframe)
        end
    end)
end
local FreeAccessory = {}
local Tool = {}
local AllMob = {}
local NotCheck = {}
for _, v in pairs(workspace.Mob:GetChildren()) do
    if v:IsA("Model") then
        if not NotCheck[v.Name] then
            table.insert(AllMob, v.Name)
            NotCheck[v.Name] = true
        end
    end
end
for _, v in pairs(game.ReplicatedStorage.Tools.Weapon:GetChildren()) do
  if v:IsA("Folder") then
  table.insert(Tool, v.Name)
  end
end
local function Attack()
  game:GetService'VirtualUser':CaptureController()
  game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672),game:GetService("Workspace").Camera.CFrame)
end
local function Equiptools()
    for _, v in ipairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
      if v:IsA("Tool") then
    for _, y in ipairs(game.ReplicatedStorage.Tools.Weapon[_G.Weapon]:GetDescendants()) do
      if y:IsA("Tool") and y.Name == v.Name then
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(y.Name))
        end
      end
    end
  end
end
for _, v in pairs(game:GetService("ReplicatedStorage").Accessories:GetDescendants()) do
    if v:IsA("Accessory") then
        table.insert(FreeAccessory, v.Name)
    end
end

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/SixZensED/Backups/refs/heads/main/Xelora%20Lib%202.lua"))()

local main = library:CreateWindow({
  Title = "SSS Hub | "..NameMap,
  Icon = 86913874100548
})


local T1 = main:CreateTab({Title = "⚔️ • Auto Farm"})
local T2 = main:CreateTab({Title = "📊 • Stats"})
local T3 = main:CreateTab({Title = "🌈 • Item"})
local S1 = T1:CreateSection({
  Title = "⚔️ | Auto Farm",
  Side = "l"
})
local S2 = T1:CreateSection({
  Title = "⚙️ | Settings",
  Side = "r"
})
local S3 = T2:CreateSection({
  Title = "📊 | Up Status",
  Side = "l"
})
local S4 = T2:CreateSection({
  Title = "🔮 | Free Accessory",
  Side = "r"
})
local S5 = T3:CreateSection({
  Title = "🥬 | Vegetables",
  Side = "l"
})
S1:CreateDropdown({
  Title = "Select Monster",
  value = "Bacon",
  list = AllMob,
  multi = false,
  callback = function(a1)
    _G.a1 = a1
  end
})

S1:CreateToggle({
  Title = "Auto Farm Select",
  value = false,
  callback = function(a2)
    _G.a2 = a2
  end
})

S2:CreateDropdown({
  Title = "Select Weapon",
  value = "Melee",
  list = Tool,
  multi = false,
  callback = function(weapon)
    _G.Weapon = weapon
  end
})
S2:CreateDropdown({
  Title = "Select Method",
  value = "Upper",
  list = {"Upper","Behind","Below"},
  multi = false,
  callback = function(Method)
    _G.Method = Method
  end
})
S2:CreateSlider({
  Title = "Distance Monster",
  min = 1,
  max = 31,
  value = 15,
  callback = function(call)
    _G.DistanceMob = call
  end
})


S3:CreateSlider({
  Title = "Points Up",
  min = 100,
  max = 10001,
  value = 100,
  callback = function(I)
    _G.Up = I
  end
})

S3:CreateToggle({
  Title = "Auto UpStats Melee",
  value = false,
  callback = function(Melee)
    _G.Melee = Melee
  end
})

S3:CreateToggle({
  Title = "Auto UpStats Sword",
  value = false,
  callback = function(Sword)
    _G.Sword = Sword
  end
})

S3:CreateToggle({
  Title = "Auto UpStats DevilFruit",
  value = false,
  callback = function(DevilFruit)
    _G.DevilFruit = DevilFruit
  end
})

S3:CreateToggle({
  Title = "Auto UpStats Special",
  value = false,
  callback = function(Special)
    _G.Special = Special
  end
})

S3:CreateToggle({
  Title = "Auto UpStats Defense",
  value = false,
  callback = function(Defense)
    _G.Defense = Defense
  end
})
for _, stat in ipairs({"Melee", "Sword", "DevilFruit", "Special", "Defense"}) do
    task.spawn(function()
        while wait() do
            pcall(function()
                if _G[stat] then
                    game:GetService("ReplicatedStorage").Remotes.System:FireServer("UpStats", stat, _G.Up)
                end
            end)
        end
    end)
end
S4:CreateDropdown({
  Title = "Select Accessory",
  value = "nil",
  list = FreeAccessory,
  multi = false,
  callback = function(Accessory)
    _G.Accessory = Accessory
  end
})
S4:CreateButton({
  Title = "Get Accessory",
  callback = function()
    game:GetService("ReplicatedStorage").Remotes.Inventory:FireServer(_G.Accessory)
  end
})
S5:CreateToggle({
  Title = "Auto Farm Vegetables",
  value = false,
  callback = function(Veg)
    _G.Vegetables = Veg
  end
})
S5:CreateToggle({
  Title = "Auto Storage Vegetables",
  value = false,
  callback = function(SVET)
    _G.StorageVegetables = SVET
  end
})
S5:CreateToggle({
  Title = "Auto Sell Vegetables",
  value = false,
  callback = function(SellV)
    _G.SellVegetables = SellV
  end
})
task.spawn(function()
  while wait() do 
    pcall(function()
    if _G.Method == "Behind" then
      MethodFarm = CFrame.new(0,0,_G.DistanceMob)
    elseif _G.Method == "Below" then
      MethodFarm = CFrame.new(0,-_G.DistanceMob,0) * CFrame.Angles(math.rad(90),0,0)
    elseif _G.Method == "Upper" then
      MethodFarm = CFrame.new(0,_G.DistanceMob,0)  * CFrame.Angles(math.rad(-90),0,0)
    else
      MethodFarm = CFrame.new(0,_G.DistanceMob,0)  * CFrame.Angles(math.rad(-90),0,0)
                end
            end)
        end
    end)
task.spawn(function()
  while task.wait(.5) do
    pcall(function()
      if _G.a2 then
        for _, v in pairs(workspace.Mob:GetChildren()) do
          if v:IsA("Model") and v.Name == _G.a1 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            repeat task.wait()
              TP(v.HumanoidRootPart.CFrame * MethodFarm)
            until not _G.a2 or v.Humanoid.Health <= 0
          end
        end
      end
    end)
  end
end)
task.spawn(function()
  while wait() do
    pcall(function()
      if _G.StorageVegetables then
        if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Dialogue") then
          Attack()
        end
      end
    end)
  end
end)
task.spawn(function()
  while wait() do
    pcall(function()
      if _G.SellVegetables then
        game.ReplicatedStorage.Modules.NetworkFramework.NetworkEvent:FireServer("fire", nil, "economy", "Vegetables", 1)
      end
    end)
  end
end)
task.spawn(function()
    while task.wait() do
        pcall(function()
            if _G.StorageVegetables then
                local plr = game.Players.LocalPlayer
                if plr.Backpack:FindFirstChild("Vegetables") and not plr.Character:FindFirstChild("Vegetables") then
                    plr.Character.Humanoid:EquipTool(plr.Backpack.Vegetables)
                    Attack()
                elseif plr.Character:FindFirstChild("Vegetables") then
                    local gui = plr.PlayerGui:FindFirstChild("Dialogue")
                    if gui then
                   gui.Frame["3"].Text = ""
                   gui.Frame["3"].BackgroundTransparency = 1
                   gui.Frame["3"].Size = UDim2.new(0, 5000, 0, 5000)
                    end
                    game:GetService'VirtualUser':CaptureController()
                    game:GetService'VirtualUser':ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
                end
            end
        end)
    end
end)
task.spawn(function()
    while wait() do
        pcall(function()
            if _G.Vegetables then
              if game.Players.LocalPlayer.Backpack:FindFirstChild("Watering vegetables") or game.Players.LocalPlayer.Character:FindFirstChild("Watering vegetables") then
                  game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Watering vegetables")); wait(1)
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Seeds Bag") then
                        for _, v in pairs(workspace.Interactable.Farm:GetDescendants()) do
                            if v:IsA("ProximityPrompt") and v.Enabled == true then
                                TP(v.Parent.CFrame * CFrame.new(0, 3, 0))
                                for i = 1, 3 do
                                    fireproximityprompt(v, 10)
                                end
                            end
                        end
                    else
                        TP(workspace.npcClick["10 Diamond For Seeds Bag"].HumanoidRootPart.CFrame * CFrame.new(0, 5, 0))
                        wait(0.3)
                        for i = 1, 36 do
                            fireproximityprompt(workspace.npcClick["10 Diamond For Seeds Bag"].HumanoidRootPart.Prompt)
                            wait(0.2)
                        end
                    end
                else
                    TP(workspace.npcClick["Get Watering vegetables"].HumanoidRootPart.CFrame)
                    wait(0.1)
                    fireproximityprompt(workspace.npcClick["Get Watering vegetables"].HumanoidRootPart.Prompt)
                end
            end
        end)
    end
end)
task.spawn(function()
  local Tickwait = {equip = 0, attack = 0}
  while wait(0.1) do
    pcall(function()
      if _G.a2 then
        if tick() - Tickwait.equip >= 1.5 then
          Equiptools()
          Tickwait.equip = tick() 
        end
        if tick() - Tickwait.attack >= 0.3 then
          Attack()
          Tickwait.attack = tick() 
        end
      end
    end)
  end
end)


task.spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        if _G.a2 and _G.Vegetables then
            local hrp = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp and not hrp:FindFirstChild("BodyClip") then
                local noclip = Instance.new("BodyVelocity")
                noclip.Name = "BodyClip"
                noclip.Parent = hrp
                noclip.MaxForce = Vector3.new(100000, 100000, 100000)
                noclip.Velocity = Vector3.new(0, 0, 0)
            end
        else
            local hrp = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp and hrp:FindFirstChild("BodyClip") then
                hrp.BodyClip:Destroy()
            end
        end
    end)
end)


while task.wait() do
for _, v in pairs(game:GetService("CoreGui").Aizawa.Background:GetChildren()) do
    if v:IsA("ImageLabel") then
        v.Image = "rbxassetid://74099166547943"
    end
  end
end

local CoreGui = game:GetService("CoreGui")
local Aizawa = CoreGui:WaitForChild("Aizawa")
local Map = Aizawa:WaitForChild("Background"):WaitForChild("Map")
local MapName = Map:WaitForChild("MapName")
local startTime = tick()
local frames = 0
local lastTime = tick()
local fps = 0
game:GetService("RunService").Heartbeat:Connect(function()
    frames = frames + 1
    local currentTime = tick()
    if currentTime - lastTime >= 1 then
        fps = frames
        frames = 0
        lastTime = currentTime
    end
end)
local function updateDisplay()
    local elapsedTime = tick() - startTime
    local elapsedMinutes = math.floor(elapsedTime / 60)
    local elapsedSeconds = math.floor(elapsedTime % 60)
    local currentDate = os.date("%Y/%m/%d")
    MapName.Text = "FPS: " .. fps .. " | Uptime: " .. string.format("%02d:%02d", elapsedMinutes, elapsedSeconds) .. " | Today: " .. currentDate
end
while true do
    updateDisplay()
    wait(1)
end

