-- TEMP FARM
repeat task.wait() until game:IsLoaded();
local Player = game.Players.LocalPlayer;
repeat task.wait() until not Player.PlayerGui:FindFirstChild("Intro");

local HRP = Player.Character.Playermodel.Charmodel.HumanoidRootPart
wait(5)

-- OPEN FIRST DOOR
HRP.CFrame = game:GetService("Workspace").Dungeon.Elevator.Special.Door.Interact.CFrame
wait(0.5)
game.ReplicatedStorage.Ints.Regiontrig:FireServer("Door", game:GetService("Workspace").Dungeon.Elevator.Special.Door);
wait(5)

-- TALK TO VOICE
for i, v in pairs(game:GetService("Workspace").Dungeon.Main.Special:GetDescendants()) do
	if v.Name == "Sequence" then
		HRP.CFrame = v.CFrame
		wait(0.5)
		game:GetService("ReplicatedStorage").Ints.Interactcontrol:InvokeServer("Seq", v.Activate)
		wait(2)
	end
end
-- BUY 10 SYNC
HRP.CFrame = game:GetService("Workspace").Dungeon.Main.Temp_Keepsakereward.Interact.CFrame
wait(0.5)
game:GetService("Workspace").Dungeon.Main.Temp_Keepsakereward.Interact.Purchase:FireServer()
wait(2)

-- BUY 1 SYNC
for i=0, 10 do
	HRP.CFrame = game:GetService("Workspace").Dungeon.Main.Temp_Purgereward.Interact.CFrame
	wait(0.5)
	game:GetService("Workspace").Dungeon.Main.Temp_Purgereward.Interact.Purchase:FireServer()
	wait(2)
end

-- SLEEP
for i, v in pairs(game:GetService("Workspace").Dungeon.Main.Special:GetDescendants()) do
	if v.Name == "Interact" and v:IsA("Part") then
		HRP.CFrame = v.CFrame
	end
end
wait(0.5)
game.ReplicatedStorage.Ints.Regiontrig:FireServer("Leave")
