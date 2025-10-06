local ld = require 'ludens'

local Script = {
	name = '',
	rotSpeed = 540.0,
	moveSpeed = 10.0
}

function Script:attach(comp)
	self.name = comp:get_name()
	ld.debug.log('script attached to %s', self.name)
end

function Script:detach()
	ld.debug.log('script detached from %s', self.name)
end

function Script:update(comp, dt)
	local rot = comp.transform:get_rotation()
	if ld.input.get_key('space') then
		--ld.debug.log('L key pressed')
		rot.y = rot.y + self.rotSpeed * dt
		comp.transform:set_rotation(rot)
	end

	local pos = comp.transform:get_position()
	if ld.input.get_key('h') then
		pos.x = pos.x + self.moveSpeed * dt
		comp.transform:set_position(pos)
	end
	if ld.input.get_key('l') then
		pos.x = pos.x - self.moveSpeed * dt
		comp.transform:set_position(pos)
	end
end

return Script