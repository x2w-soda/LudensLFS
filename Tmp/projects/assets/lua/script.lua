local ld = require 'ludens'

local Script = {
	name = '',
	rotSpeed = 2160.0, 
	moveSpeed = 10.0
}

function Script:attach(comp)
	--self.name = comp:get_name()
	ld.debug.log('script attached')
end

function Script:detach()
	ld.debug.log('script detached')
end

function Script:update(comp, dt)
	local rot = comp.transform.rotation
	if ld.input.get_key('space') then
		-- ld.debug.log('L key pressed')
		rot.y = rot.y + self.rotSpeed * dt
		comp.transform.rotation = rot
	end

	local pos = comp.transform.position
	if ld.input.get_key('h') then
		pos.x = pos.x + self.moveSpeed * dt
		comp.transform.position = pos
	end
	if ld.input.get_key('l') then
		pos.x = pos.x - self.moveSpeed * dt
		comp.transform.position = pos
	end
end

return Script