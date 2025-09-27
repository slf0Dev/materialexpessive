local module = {}

local HasProperty = function(instance, property) -- Currently not so reliable. Tests if instance has a certain property
	local successful = pcall(function()
		return instance[property]
	end)
	return successful and not instance:FindFirstChild(property) -- Fails if instance DOES have a child named a property, will fix soon
end


function module.Create(instance : string,properties : table)
	local Corner,Stroke
	local CreatedInstance = Instance.new(instance)
	local StrokeProperties
	local Stroke
	if instance == "TextButton" or instance == "ImageButton" then
		CreatedInstance.AutoButtonColor = false
	end

	if HasProperty(CreatedInstance,"BorderSizePixel") then
		CreatedInstance.BorderSizePixel = 0
	end

	for property,value in next,properties do
		if tostring(property) ~= "CornerRadius" and tostring(property) ~= "Stroke" and tostring(property) ~= "BoxShadow" then
			CreatedInstance[property] = value
		elseif tostring(property) == "Stroke" then
			StrokeProperties = {
				Color = value['Color'],
				Thickness = value['Thickness'],
				Transparency = value['Transparency'] or 0
			}
			Stroke = Instance.new("UIStroke",CreatedInstance)
			Stroke.Name = "Stroke"
			Stroke.Color = value["Color"] or Color3.fromRGB(255,255,255)
			Stroke.Thickness = value["Thickness"] or 1
			Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			Stroke.Transparency = value["Transparency"] or 0
			Stroke.LineJoinMode = Enum.LineJoinMode.Round

		elseif tostring(property) == "CornerRadius" then
			Corner = Instance.new("UICorner",CreatedInstance)
			Corner.Name = "Corner"
			Corner.CornerRadius = value
		elseif tostring(property) == "BoxShadow" then
			local BoxShadow = Instance.new("ImageLabel",CreatedInstance)
			BoxShadow.Size = UDim2.new(1,value['Size'][1],1,value['Size'][2])
			BoxShadow.AnchorPoint = Vector2.new(0.5,0.5)
			BoxShadow.Position = UDim2.new(0.5,value['Padding'][1],0.5,value['Padding'][2])
			BoxShadow.Image = "rbxassetid://1316045217"
			BoxShadow.BackgroundTransparency = 1
			BoxShadow.ImageTransparency = value['Transparency']
			BoxShadow.ScaleType = Enum.ScaleType.Slice
			BoxShadow.SliceCenter = Rect.new(10,10,118,118)
			BoxShadow.ImageColor3 = value['Color']
			BoxShadow.ZIndex = value['ZIndex'] or 1
			BoxShadow.Name = "Shadow"
		end
	end
	

	return CreatedInstance;
end

return module
