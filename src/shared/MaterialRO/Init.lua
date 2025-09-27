local material = {}

local components = {
	FilledButton = require(script.Parent.components.FilledButton),
	Shape = require(script.Parent.components.Shape)
}



material.Component = function(target,options)
	components[target].Create(options)
end

return material