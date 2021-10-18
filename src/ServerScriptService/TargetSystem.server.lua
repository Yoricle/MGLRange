local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GivePoints = ReplicatedStorage:WaitForChild("GivePoints")
local RemovePoints = ReplicatedStorage:WaitForChild("RemovePoints")
local ResetPoints = ReplicatedStorage:WaitForChild("RestartPoints")
local Players = game:GetService("Players")
local PlayerValues = require(ReplicatedStorage.TargetModules.PlayerValues)

function AddingPlayer(player)
    PlayerValues.PlayerInfo(player)
end
function AddPoints(player, Targetpoints)
    PlayerValues.AddPoints(player, Targetpoints)
end
function MinusPoints(player, Targetpoints)
    PlayerValues.MinusPoints(player, Targetpoints)
end
function RestartPoints(player, Targetpoints)
    PlayerValues.WipePoints(player, Targetpoints)
end

Players.PlayerAdded:Connect(AddingPlayer)
RemovePoints.OnServerEvent:Connect(MinusPoints)
ResetPoints.OnServerEvent:Connect(RestartPoints)
GivePoints.OnServerEvent:Connect(AddPoints)
