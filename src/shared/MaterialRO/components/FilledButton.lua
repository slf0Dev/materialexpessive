local button = {}
button._index = button

local Create = require(script.Parent.Parent.InstanceMaker).Create
local Utils = require(script.Parent.Parent.utils)
local ColorScheme = require(script.Parent.Parent.ColorScheme)



local ms = game.Players.LocalPlayer:GetMouse()
local TweenService = game:GetService("TweenService")


function Tween(instance, time, properties,EasingStyle,EasingDirection)
	local tw = TweenService:Create(instance, TweenInfo.new(time, EasingStyle and Enum.EasingStyle[EasingStyle] or Enum.EasingStyle.Quad,EasingDirection and Enum.EasingDirection[EasingDirection] or Enum.EasingDirection.Out), properties)
	tw:Play()
	return tw
end


local function Ripple(parent)
	local c = Create("ImageLabel",{
		Size = UDim2.new(0,0,0,0),
		Parent = parent,
        AnchorPoint = Vector2.new(0.5,0.5),
		CornerRadius = UDim.new(1,0),
		BackgroundTransparency = 1,
		Image = "rbxassetid://77682921635240",
		ImageTransparency = 0.8,
		ImageColor3 = Color3.fromRGB(0,0,0)
	})


	local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
	c.Position = UDim2.new(0, x, 0, y)
	local len, size = 0.35, nil
	if parent.AbsoluteSize.X >= parent.AbsoluteSize.Y then
		size = (parent.AbsoluteSize.X * 1)
	else
		size = (parent.AbsoluteSize.Y * 1)
	end
	Tween(c,len,{Size = UDim2.new(0, size, 0, size)}, 'Quart', 'Out')
	Tween(c,0.7,{ImageTransparency = 1})
	task.delay(0.8,function()
		c:Destroy()
	end)
end


button.Create = function(options)
	options.Background = options.Background or ColorScheme.Accent

	local Button = Create("TextButton",{
		Parent = options.Parent,
		AnchorPoint = options.AnchorPoint or Vector2.new(0,0),
		Position = options.Position or UDim2.new(0,0,0,0),
		Size = options.Size or UDim2.new(0,0,0,0),
		BackgroundColor3 = options.Background,
		Text = 'Hello world!',
		CornerRadius = UDim.new(0.5,0),
		TextSize = options.FontSize or 16,
        TextColor3 = Color3.fromRGB(22, 22, 22),
		Font = Enum.Font.Roboto
	})

	local HoverColor = Utils.changeBrightness(options.Background)


	local RippleCanvas = Create("CanvasGroup",{
		Parent = Button,
		Size = UDim2.new(1,0,1,0),
		CornerRadius = UDim.new(0.5,0),
		BackgroundTransparency = 1
	})


	Button.MouseButton1Click:Connect(function()
		Ripple(RippleCanvas)
		if options.OnClick then
			options.OnClick()
		end
	end)


	Button.MouseEnter:Connect(function()
		Tween(Button,0.3,{BackgroundColor3 = HoverColor})
	end)

	Button.MouseLeave:Connect(function()
		Tween(Button,0.3,{BackgroundColor3 = options.Background})
	end)
end


return button
