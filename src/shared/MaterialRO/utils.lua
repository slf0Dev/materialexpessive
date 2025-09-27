local utils = {}

utils.getBrightness = function(color)
    -- color: Color3
    -- Формула perceived brightness
    local r, g, b = color.R, color.G, color.B
    local brightness = math.sqrt(0.299 * (r^2) + 0.587 * (g^2) + 0.114 * (b^2))
    return brightness
end

utils.changeBrightness = function(color)
    local h,s,v = color:ToHSV()
    print(utils.getBrightness(color))
    v = utils.getBrightness(color) >= 0.5 and v-0.1 or v+0.1
    return Color3.fromHSV(h,s,v)
end

return utils