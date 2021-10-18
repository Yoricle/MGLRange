local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PlayerGui = game.Players.LocalPlayer.PlayerGui
local InventoryGui = PlayerGui:WaitForChild("InventoryGui")

local Inventory = InventoryGui:WaitForChild("Inventory")
local Instructions = InventoryGui:WaitForChild("Instructions")

--Folders
local FrameworkFolder = ReplicatedStorage:WaitForChild("ArsenalFrameWork")

--Buttons
local M9Button = Inventory.M9

--Remotes
local WeaponChosen = FrameworkFolder:WaitForChild("Remotes").WeaponChosen

-- When pressed, the inventory opens
UserInputService.InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.V then
		Inventory.Visible = true
		Instructions.Visible = false
	end
end)

-- When a weapon is chosen, this will fire creating a new Weapon
M9Button.MouseButton1Click:Connect(function()
	WeaponChosen:FireServer()
end)

-- when let go, the inventory closes
UserInputService.InputEnded:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.V then
		Inventory.Visible = false
		Instructions.Visible = true
	end
end)