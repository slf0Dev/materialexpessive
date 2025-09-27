local appBar = {}
appBar._index = appBar

local Create = require(script.Parent.Parent.InstanceMaker).Create
local Utils = require(script.Parent.Parent.utils)
local ColorScheme = require(script.Parent.Parent.ColorScheme)


local TweenService = game:GetService("TweenService")
function Tween(instance, time, properties,EasingStyle,EasingDirection)
	local tw = TweenService:Create(instance, TweenInfo.new(time, EasingStyle and Enum.EasingStyle[EasingStyle] or Enum.EasingStyle.Quad,EasingDirection and Enum.EasingDirection[EasingDirection] or Enum.EasingDirection.Out), properties)
	tw:Play()
	return tw
end


appBar.Create = function(options)
	options.Color = options.Color or ColorScheme.Accent
    
    local Main = Create("Frame",{
        Parent = options.Parent,
        AnchorPoint = Vector2.new(0.5,0.5),
        Size = UDim2.new(1,0,0.07,0),
        Position = UDim2.new(0.5,0,0,0),
        BackgroundColor3 = Utils.Brighter(options.Parent.BackgroundColor3,0.05)
    })
end


return appBar
