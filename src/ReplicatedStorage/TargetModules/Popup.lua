local TweenService = game:GetService("TweenService")
local TweenInformation = TweenInfo.new(
	0.35,
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.Out,
	-1,
	true,
	0
)

return function()
--Billboard Gui
    local Notification = Instance.new("BillboardGui")
    Notification.Name = "TargetHit"
    Notification.Size = UDim2.new(2, 0, 2, 0)
    Notification.StudsOffset = Vector3.new(0, 2, 0)
--Text Label
    local Label = Instance.new("TextLabel")
    Label.Name = "+1"
    Label.Text = "+1"
    Label.Size = UDim2.new(1, 0, 1, 0)
    Label.Parent = Notification
    Label.TextScaled = true
    Label.BackgroundTransparency = 1
    Label.Font = Enum.Font.GothamBlack
    Label.TextColor3 = Color3.new(255, 255, 255)
    Label.TextStrokeColor3 = Color3.new(0.2, 0.2, 0.2)
    Label.TextStrokeTransparency = 0

    local MoveYPosition = TweenService:Create(Notification, TweenInformation, {StudsOffset = Vector3.new(0,5,0)})
	local FadeOut = TweenService:Create(Label, TweenInformation, {TextTransparency = 2})
	local FadeStrokeOut = TweenService:Create(Label, TweenInformation, {TextStrokeTransparency = 2})
	MoveYPosition:Play()
	FadeOut:Play()
	FadeStrokeOut:Play()
    return Notification
 end