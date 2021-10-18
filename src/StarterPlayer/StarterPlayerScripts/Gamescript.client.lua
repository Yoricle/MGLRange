local Module = require(game.ReplicatedStorage.TargetModules.TargetSystem)
local Players = game:GetService("Players")
local Interact = game.Workspace.Interact.SurfaceGui.StartFrame.StartGame
local Results = Players.LocalPlayer.PlayerGui:WaitForChild("LevelResults")
local Mouse = game.Players.LocalPlayer:GetMouse()
local TargetFolder = game.Workspace.AllTargets

-- When interacting with the button, this will fire and the module script will run
local function StartAndRunGame()
    Module.Interaction()
end
-- When the continue button is clicked at the end of a round, all the values are reset
local function EndOfRoundResults()
    Module.ContinueButton()
end
-- Module script will evaluate the score and determine the outcome of the results value
local function ScoreEvaluated()
    Module.Score()
end
-- When something is moved from the "TargetFolder" this method/event will detect when that happens
function TargetRemoved(descendant)
    Module.RemovedTarget(descendant)
end

TargetFolder.DescendantRemoving:Connect(TargetRemoved)
Mouse.Button1Down:Connect(ScoreEvaluated)
Results.Continue.TextButton.MouseButton1Click:Connect(EndOfRoundResults)
Interact.MouseButton1Click:Connect(StartAndRunGame)