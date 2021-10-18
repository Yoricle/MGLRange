local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = ReplicatedStorage:WaitForChild("ShotEvent")

remoteEvent.OnServerEvent:Connect(function(player, gunPos, mosPos)
	local RayCast = RaycastParams.new()
	RayCast.FilterDescendantsInstances = {player.Character}
	RayCast.FilterType = Enum.RaycastFilterType.Blacklist
	
	local RayCastResult = workspace:Raycast(gunPos, (mosPos - gunPos)*300, RayCast)

	if RayCast then
		if RayCastResult then
			local HitPart = RayCastResult.Instance
			local model = HitPart:FindFirstAncestorOfClass("Model")
			if model and model:FindFirstChild("Humanoid") then
				model:FindFirstChild("Humanoid"):TakeDamage(30)
			else
				print("Nothing was hit")
			end
		end
	end
end)