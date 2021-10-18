
local TargetModule = {}

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")
local Players = game:GetService("Players")

local TargetValue = Players.LocalPlayer:WaitForChild("leaderstats").Target
local Playing = game.Workspace.Playing.Value
local Results = Players.LocalPlayer.PlayerGui:WaitForChild("LevelResults")
local RemovePoints = ReplicatedStorage:WaitForChild("RemovePoints")

local GameTimeRunning = 30 -- this is the time that the loop will carry, you can change this value based on how long you want the game to last.
local Missed = {} -- This table will store how many missed hits you have, this will effect the overall accuracy
local hit = {} -- how many targets you have hit

local Interact = game.Workspace.Interact.SurfaceGui.StartFrame.StartGame
local Scoreboard = game.Workspace.Scoreboard.SurfaceGui.ScoreFrame.ScoreValue
local TargetFolder = game.Workspace.AllTargets

-- Modules
local PopupModule = require(ReplicatedStorage.TargetModules.Popup)
local TargetObject = require(ReplicatedStorage.TargetModules.MetaTarget)

-- Parents the target made from the module into "TargetFolder"
function TargetModule.Target()
	Playing = true
	TargetObject.new(Vector3.new(math.random(67.787, 103.593), math.random(2.946, 19.275), -15.945), -- Position (Random Position)
 	Vector3.new(2, 2, 2), --Size
 	Enum.PartType.Ball, --Shape
 	TargetFolder -- Parent
) 
end

function TargetModule.ResetValues()
	Missed = {}
	hit = {}
	Interact.Text = ""
	Scoreboard.Text = "00"
end

-- Loop and destroy all targets
function TargetModule.FolderLoop()
	local TargetStat = Players.LocalPlayer.leaderstats.Target.Value
	for i,v in pairs(TargetFolder:GetChildren()) do
		Playing = false
		v:Destroy()
	end
end

--Set values for end result
function TargetModule.PlayerTargetResults()
	local TargetStat = Players.LocalPlayer.leaderstats.Target.Value
	Results.Enabled = true
	Results.Left.Score.Text = "Score: "..TargetStat
	Results.Left.BestScore.Text = "Missed: "..#Missed
	Results.Left.Accuracy.Text = "Accuracy: "
	Results.Left.TargetsHit.Text = "Targets Hit: "..#hit
end

-- Interaction is fired when sent to the client script
function TargetModule.Interaction(object)
	local Countdown = game.Workspace.Scoreboard.SurfaceGui.CountdownFrame.CountdownValue
	if Playing == true then
		print("You're already playing")
	else
		Interact.Text = "🎯"
		TargetModule:Target()
	for i = GameTimeRunning, 0, -1 do
		task.wait(1)
		Countdown.Text = i
		if i == 0 then
			TargetModule.FolderLoop()
			TargetModule.PlayerTargetResults()
		end
	end
		if Playing == true then
			print("Already in-game")
			RemovePoints:FireServer(TargetValue)
		end
	end
end

-- Information sent when required from the client script
function TargetModule.RemovedTarget(descendant)
	if descendant.Name == tostring("Target") then
		if Playing ==  true then
			print("Target Removed")
			TargetModule.Target()
		elseif Playing == false then
			print("Game Over")
		end
    end
end

-- Score determination based on aiming
function TargetModule.Score()
	local GivePoints = ReplicatedStorage:WaitForChild("GivePoints")
	local Mouse = game.Players.LocalPlayer:GetMouse()
	if Playing == false then
		print("Game not running")
		return
	end
	if Mouse.Target == nil and Playing == true then
		RemovePoints:FireServer(TargetValue)
	elseif Mouse.Target.Name == tostring("Target") and Playing == true then
		print(Mouse.Target.Name)
		table.insert(hit, 1)
		Scoreboard.Text = tostring(#hit)
		PopupModule().Parent = Mouse.Target -- Billboard Gui Returned'
		SoundService.Pop:Play()
		GivePoints:FireServer(TargetValue)
		Mouse.Target:Destroy(task.wait(.1))
	elseif Mouse.Target.Name ~= tostring("Target") and Playing == true then
			RemovePoints:FireServer(TargetValue)
			table.insert(Missed, 1)
	end

end

function TargetModule.Popup()
	PopupModule()
end

function TargetModule.ContinueButton()
	local RestartPoints = ReplicatedStorage:WaitForChild("RestartPoints")
	Results.Enabled = false
	RestartPoints:FireServer(TargetValue)
end

return TargetModule