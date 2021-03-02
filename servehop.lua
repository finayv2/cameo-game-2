local Artifacts = {
    "Lannis Amulet";
    "Fairfrozen";
    "Lost Bulwark";
    "Spider Cloak";
    "Philo Stone";
    "Betrayer's Amulet";
    "Angel Feather";
    "Lost Bulwark";
    "MemoryDisc";
    "Phoenix Feather";
}

function Check(Instance)
    for i,v in pairs(Artifacts) do
        if v.Name == Instance.Name then
            return true
        end
    end
end

for _, v in ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
    if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
        x[#x + 1] = v.id
    end
end

for i,v in pairs(game.Workspace:GetChildren()) do
    if v:IsA("Tool") then
        if Check(v) then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
        else
            if #x > 0 then
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, x[math.random(1, #x)])
            end

            game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(State)
                if State == Enum.TeleportState.Started then
                    syn.queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/finayv2/UAB/main/Main.lua'))()")
                end
            end)
        end
    end
end

