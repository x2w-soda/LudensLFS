local ld = require 'ludens'

local Script = {
	rotSpeed = 360.0,
}

function Script:attach(comp)
	self.comp = comp
	ld.debug.log('sprite script attached')
end

function Script:detach()
	ld.debug.log('sprite script detached')
end

function Script:update(dt)
	local comp = self.comp
	local rot = comp.transform.rotation
	if ld.input.get_key('q') then
		rot = rot + self.rotSpeed * dt
		comp.transform.rotation = rot
	elseif ld.input.get_key('e') then
		rot = rot - self.rotSpeed * dt
		comp.transform.rotation = rot
	end
end

return Script