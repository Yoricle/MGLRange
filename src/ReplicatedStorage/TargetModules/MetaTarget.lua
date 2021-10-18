local Targets = {}

Targets.__index = Targets

function Targets.new(pos, size, shape, parent) -- Constructor function
	local self = setmetatable({}, Targets)
	self.Part = Instance.new("Part")
    self.Part.Size = size
	self.Part.Shape = shape
	self.Part.Name = "Target"
	self.Part.Position = pos
	self.Part.Parent = parent
	self.Part.BrickColor = BrickColor.new("Really red")
	self.Part.Anchored = true
	self.Part.CastShadow = false
	return self
end

return Targets