local shape = {}
shape._index = shape

local Create = require(script.Parent.Parent.InstanceMaker).Create
local Utils = require(script.Parent.Parent.utils)
local ColorScheme = require(script.Parent.Parent.ColorScheme)


local TweenService = game:GetService("TweenService")
function Tween(instance, time, properties,EasingStyle,EasingDirection)
	local tw = TweenService:Create(instance, TweenInfo.new(time, EasingStyle and Enum.EasingStyle[EasingStyle] or Enum.EasingStyle.Quad,EasingDirection and Enum.EasingDirection[EasingDirection] or Enum.EasingDirection.Out), properties)
	tw:Play()
	return tw
end

local Shapes = {
    ["rbxassetid://97273923256643"] = {
        ["4-leaf clover"] = Vector2.new(0,0),
        ["4-sided cookie"] = Vector2.new(256,0),
        ["6-sided cookie"] = Vector2.new(512,0),
        ["7-sided cookie"] = Vector2.new(768,0),
        ["8-leaf clover"] = Vector2.new(0,256),
        ["9-sided cookie"] = Vector2.new(256,256),
        ["12-sided cookie"] = Vector2.new(512,256),
        ["Arch"] = Vector2.new(768,256),
        ["Arrow"] = Vector2.new(0,512),
        ["Boom"] = Vector2.new(256,512),
        ["Bun"] = Vector2.new(512,512),
        ["Burst"] = Vector2.new(768,512),
        ["Circle"] = Vector2.new(0,768),
        ["Diamond"] = Vector2.new(256,768),
        ["Fan"] = Vector2.new(512,768),
        ["Flower"] = Vector2.new(768,768)
    },
    ["rbxassetid://107286573434275"] = {
        ["Gem"] = Vector2.new(0,0),
        ["Ghost-ish"] = Vector2.new(256,0),
        ["Heart"] = Vector2.new(512,0),
        ["Clamshell"] = Vector2.new(768,0),
        ["Oval"] = Vector2.new(0,256),
        ["Pentagon"] = Vector2.new(256,256),
        ["Pill"] = Vector2.new(512,256),
        ["Pixel circle"] = Vector2.new(768,256),
        ["Pixel triangle"] = Vector2.new(0,512),
        ["Puffy diamond"] = Vector2.new(256,512),
        ["Puffy"] = Vector2.new(512,512),
        ["Semicircle"] = Vector2.new(768,512),
        ["Slanted"] = Vector2.new(0,768),
        ["Soft boom"] = Vector2.new(256,768),
        ["Soft burst"] = Vector2.new(512,768),
        ["Square"] = Vector2.new(768,768)
    },
    ["rbxassetid://118453621462218"] = {
        ["Sunny"] = Vector2.new(0,0),
        ["Triangle"] = Vector2.new(256,0),
        ["Very sunny"] = Vector2.new(512,0)
    }
}

shape.SetShape = function(target,ShapeType)
    for key, value in pairs(Shapes) do
        if typeof(value) == "table" then
            if value[ShapeType] then
                target.Image = key
                target.ImageRectOffset = value[ShapeType]
            end
        else
            if key == ShapeType then
                target.ImageRectOffset = ShapeType
            end
        end
    end
end

shape.Create = function(options)
	options.Color = options.Color or ColorScheme.Accent

    local Shape = Create("ImageLabel",{
        Parent = options.Parent,
        Position = options.Position or UDim2.new(0,0,0,0),
        Size = options.Size or UDim2.new(0,100,0,100),
        BackgroundTransparency = 1,
        ImageColor3 = options.Color,
        Image = "rbxassetid://97273923256643",
        ImageRectSize = Vector2.new(256,256),
        ImageRectOffset = Vector2.new(0,0)
    })

    shape.SetShape(Shape,options.Shape)
end


return shape
