local ld = require 'ludens'

local Script = {
	rotSpeed = 720.0, 
	moveSpeed = 30.0
}

function Script:attach(comp)
	self.comp = comp
	self.audioC = comp:get_child('Audio')
	ld.debug.log('script attached')
end

function Script:detach()
	ld.debug.log('script detached')
end

function Script:update(dt)
	local tr = self.comp.transform
	local rot = tr.rotation
	if ld.input.get_key('space') then
		rot.y = rot.y + self.rotSpeed * dt
		tr.rotation = rot
	end
	if ld.input.get_key_down('space') then
		self.audioC.volume = 1.0
		self.audioC:play()
	end
	if ld.input.get_key_up('space') then
		self.audioC:pause()
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

end

return Script