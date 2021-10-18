local module = {}

function module.PlayerInfo(player)
    local leaderstats = Instance.new("Folder")
    leaderstats.Name = "leaderstats"
    leaderstats.Parent = player

    local points = Instance.new("IntValue")
    points.Name = "Target"
    points.Parent = leaderstats
end

function module.AddPoints(player, Targetpoints)
    Targetpoints.Value = Targetpoints.Value + 1
    return
end

function module.MinusPoints(player, Targetpoints)
    Targetpoints.Value = Targetpoints.Value - 1
    return
end

function module.WipePoints(player, Targetpoints)
    Targetpoints.Value = 0
end

return module