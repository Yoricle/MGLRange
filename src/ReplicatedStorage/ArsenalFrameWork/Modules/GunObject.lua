local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local FrameworkFolder = ReplicatedStorage:WaitForChild("ArsenalFrameWork")
local WeaponChosen = FrameworkFolder:WaitForChild("Remotes").WeaponChosen

local WeaponObject = {}
WeaponObject.__index = WeaponObject

function WeaponObject.new(Weapon, player) -- given weapon will be made into a tool and inherit these properties (Comes from the Weapons Folder)

	local self = {}
	setmetatable(self, WeaponObject)
	print(Weapon)
	--self.Weapon = Weapon
	local Weapon = Weapon:Clone()
	Weapon.Name = Weapon.Name
	Weapon.CanBeDropped = false
	Weapon.RequiresHandle = true
	Weapon.Parent = player:WaitForChild("Backpack")
	return self
end

function WeaponObject:Init(player)
	-- give weapon to player and set values
	if not player then 
		assert("Player doesn't exist, returning", player)
	end
	if not RunService:IsServer() then
		warn("Weapons can only be given from the server")
	end
end


return WeaponObject


--[[
Creating metatables for different gun properties, example flash, sound, bullets, ammo etc.
(also creating method functions for basic functionality like firing, reloading, equip)

General Metatable management from different modules for requiring different functions to
a localclient script(Better organisation)

Make a module script for the viewport, so handling the arms and the movement to be required
]]