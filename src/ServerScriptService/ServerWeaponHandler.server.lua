local ReplicatedStorage = game:GetService("ReplicatedStorage")
local FrameWork = ReplicatedStorage:WaitForChild("ArsenalFrameWork")

local FrameworkFolder = ReplicatedStorage:WaitForChild("ArsenalFrameWork")
local WeaponsFolder = FrameworkFolder:WaitForChild("Weapons")

local WeaponChosen = FrameworkFolder:WaitForChild("Remotes").WeaponChosen

local M9_Weapon = WeaponsFolder:WaitForChild("M9")

local WeaponModule = require(FrameWork.Modules.GunObject)

-- When a Weapon is chosen from the Inventory, this will fire and attach a newly created weapon
WeaponChosen.OnServerEvent:Connect(function(player)
	local NewWeapon = WeaponModule.new(M9_Weapon, player)
	NewWeapon:Init(player) -- check if this is being run on the server
	print("New Weapon Created")
end)

