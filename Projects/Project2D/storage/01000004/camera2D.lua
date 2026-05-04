local ld = require 'ludens'

local Script = {
}

function Script:attach(comp)
	self.comp = comp
	ld.debug.log('camera2D script attached')
end

function Script:detach()
	ld.debug.log('camera2D script detached')
end

function Script:update(dt)
	if ld.input.get_key_down('u') then
		self.comp.viewport.x = 0.0
		self.comp.viewport.y = 0.0
		self.comp.viewport.w = 0.5
		self.comp.viewport.h = 0.5
		local childC = self.comp:create_child('Camera2D', { name = 'foo' })
		assert(childC)
		childC.transform.rotation = 180.0
		childC.viewport.x = 0.0
		childC.viewport.y = 0.5
		childC.viewport.w = 0.5
		childC.viewport.h = 0.5
	end
end

return Script