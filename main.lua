local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/preztel/AzureLibrary/master/uilib.lua", true))()

local LocalPlayerTab = Library:CreateTab("LocalPlayer", "LocalPlayer Tab", "Dark")


LocalPlayerTab:CreateToggle("No Stun & Cooldown", function(value) 
    shared.NoStun = value
    while wait() do
        if shared.NoStun then
			for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
				if v:IsA("Folder") then
					if v.Name == "PUNCHM2COOLDOWN" or v.Name == "Busy" or v.Name == "Superslow" or v.Name == "Comboing" or v.Name == "PunchCooldown" or v.Name == "CTag" or v.Name == "Blocking" or v.Name == "IgnisCooldown" or v.Name == "Helpless" or v.Name == "StepBlock" or v.Name == "Staggered" or v.Name == "Ragdolled" or v.Name == "Superamor" or v.Name == "Nospeedupdate" or v.Name == "Impaled" or v.Name == "manashield" or v.Name == "IFrames" then
						v:Remove()
					end
				end

				if v:IsA("Tool") then
					if v:FindFirstChild("Cooldown") then
						v.Cooldown:Remove()
					elseif v:FindFirstChild("MainCooldown") then
						v.MainCooldown:Remove()
					end
				end
			end		
        end
    end
end)

LocalPlayerTab:CreateToggle("Remove Kill Bricks", function(value) 
    shared.RemoEKillBricks = value
    while wait() do
		if shared.RemoEKillBricks then
			for i,v in pairs(game:GetService("Workspace").Map:GetChildren()) do
				if v.Name == "Kill" then
					v:FindFirstChild("TouchInterest"):Remove()
				end
			end
        end
    end
end)

LocalPlayerTab:CreateToggle("No Fire", function(value) 
    shared.NoFire = value
    while wait() do
		if shared.NoFire then
			if not game.Players.LocalPlayer.Character:FindFirstChild("IgnisCooldown") then
				local Nof = Instance.new("Folder")
				Nof.Parent = game.Players.LocalPlayer.Character
				Nof.Name = "IgnisCooldown"
			end
			for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
				if v:IsA("Folder") then
					if v.Name == "Flames" or v.Name == "WhiteFlames" then
						v:Remove()
					end
				end
			end	
        end
    end
end)

LocalPlayerTab:CreateToggle("No Poison", function(value) 
    shared.NOPOSITON = value
    while wait() do
        if shared.NOPOSITON then
			for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
				if v:IsA("Folder") then
					if v.Name == "Poison" then
						v:Remove()
					end
				end
			end
        end
    end
end)

LocalPlayerTab:CreateToggle("No Fall Damage", function(value) 
    shared.NoFall = value
    while wait() do
        if shared.NoFall then

			game:GetService("Players").LocalPlayer.Character.Rolled:FireServer()

        end
    end
end)

LocalPlayerTab:CreateToggle("No Curse Stacks", function(value) 
    shared.NoCS = value
    while wait() do
        if shared.NoCS then
			for i,v in pairs(game.Players.LocalPlayer.Character.Stats.CStacks:GetChildren()) do
				v:Remove()
			end
        end
    end
end)

LocalPlayerTab:CreateToggle("Artifact Collecter", function(value) 
    shared.ARF = value
    while wait() do
		if shared.ARF then
			for i,v in pairs(game.Workspace:GetChildren()) do
				if v:IsA("Tool") then
					if v.Name == "Ice Essence" or v.Name == "Lannis Amulet" or v.Name == "Fairfrozen" or v.Name == "Lost Bulwark" or v.Name == "Spidercloak" or v.Name == "Philo Stone" or v.Name == "Betrayer's Amulet" or v.Name == "Angel Feather" or v.Name == "Lost Bulwark" then
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
					end
				end
			end
        end
    end
end)


local ManaValue = 0

LocalPlayerTab:CreateToggle("Mana Adjust", function(value) 
    shared.InfMana = value
    while wait() do
        if shared.InfMana then
			game:GetService("Players").LocalPlayer.Character.ManaCharge.Value = false

			if game:GetService("Players").LocalPlayer.Character.Stats.Mana.Value >= ManaValue then

				game:GetService("Players").LocalPlayer.Character.ManaChargeEnd:FireServer()

			else

				game:GetService("Players").LocalPlayer.Character.ManaChargeStart:FireServer()
			end
        end
    end
end)

local Spells = {
	["Ignis"] = 80;
	["Gelidus"] = 80;
	["Tenebris"] = 100;
	["Gate"] = 80;
	["Fimbulvetr"] = 85;
}

LocalPlayerTab:CreateToggle("Spell Adjust", function(value) 
    shared.SpellAbjust = value
    while wait() do
		if shared.SpellAbjust then
			for i,v in pairs(Spells) do
				for I,V in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
					if V:IsA("Tool") then
						if V.Name == i then
							
							game:GetService("Players").LocalPlayer.Character.ManaCharge.Value = false

							if game:GetService("Players").LocalPlayer.Character.Stats.Mana.Value >= Spells[V.Name] then

								game:GetService("Players").LocalPlayer.Character.ManaChargeEnd:FireServer()

							else

								game:GetService("Players").LocalPlayer.Character.ManaChargeStart:FireServer()
							end
						end
					end
				end
			end
        end
    end
end)

LocalPlayerTab:CreateButton("Scroll Roulette", function() 
    fireclickdetector(game:GetService("Workspace").NPCs.Inari["Left Arm"].ClickDetector)
end)


LocalPlayerTab:CreateSlider("Mana Amount", 0, 100, function(arg) 
    ManaValue = arg
end)

LocalPlayerTab:CreateSlider("Mana Climb Speed", 1, 350, function(arg) 
    game.Players.LocalPlayer.Character.Stats.ClimbMult.Value = arg
end)



local GateSpots = {
	["SkyCastle"] = game:GetService("Workspace").MouseIgnore.GateSpots.Skycastle.CFrame;
	["Deepforest 1"] = game:GetService("Workspace").MouseIgnore.GateSpots.Deepforest.Entrance.CFrame;
	["Deepforest 2"] = game:GetService("Workspace").MouseIgnore.GateSpots.Deepforest.Tree.CFrame;
	["Tundra 1"] = game:GetService("Workspace").MouseIgnore.GateSpots.Tundra.Black.CFrame;
	["Tundra 2"] = game:GetService("Workspace").MouseIgnore.GateSpots.Tundra.Ridge.CFrame;
}

local Gat = {}

for i,v in pairs(GateSpots) do
	table.insert(Gat, i)
end

LocalPlayerTab:CreateDropDown("Gate Teleports", Gat, function(Talker) 
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = GateSpots[Talker]
end)



local VisualTab = Library:CreateTab("Visuals", "Visuals Tab")


VisualTab:CreateToggle("No Fog", function(value) 
    shared.NoFog = value
    while wait() do
		if shared.NoFog then
			game:GetService("Lighting").FogEnd = 1000000
		else
			game:GetService("Lighting").FogEnd = 500
        end
    end
end)

VisualTab:CreateToggle("Full Bright", function(value) 
    shared.FullBright = value
    if shared.FullBright then
        game:GetService("Lighting").Changed:Connect(function()
            if not shared.FullBright then return end
            game:GetService("Lighting").Brightness = 2
            game:GetService("Lighting").ClockTime = 14
            game:GetService("Lighting").GlobalShadows = false
            game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(128, 128, 128)
        end)
    else
        game:GetService("Lighting").Brightness = 1
        game:GetService("Lighting").GlobalShadows = true
        game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(161, 161, 161)
    end
end)

VisualTab:CreateToggle("Max Zoom", function(value) 
    shared.MaxZoom = value
	if shared.MaxZoom then
		game.Players.LocalPlayer.CameraMaxZoomDistance = math.huge
	else
        game.Players.LocalPlayer.CameraMaxZoomDistance = 50
    end
end)
