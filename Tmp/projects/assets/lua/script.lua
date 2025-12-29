local ld = require 'ludens'

local Script = {
	name = '',
	rotSpeed = 2160.0, 
	moveSpeed = 10.0
}

function Script:attach(comp)
	self.comp = comp
	ld.debug.log('script attached')
end

function Script:detach()
	ld.debug.log('script detached')
end

function Script:update(dt)
	local tr = self.comp.transform
	local rot = tr.rotation
	if ld.input.get_key('space') then
		-- ld.debug.log('L key pressed')
		rot.y = rot.y + self.rotSpeed * dt
		tr.rotation = rot
	end

	local pos = tr.position
	if ld.input.get_key('h') then
		pos.x = pos.x + self.moveSpeed * dt
		tr.position = pos
	end
	if ld.input.get_key('l') then
		pos.x = pos.x - self.moveSpeed * dt
		tr.position = pos
	end

	if ld.input.get_key_down('x') then
		local childC = self.comp:get_child('Audio')
		if childC then
			ld.debug.log('childC exists')
			childC.volume = 1.0
			childC:play()
		else
			ld.debug.log('childC not found')
		end
	end
end

return Script