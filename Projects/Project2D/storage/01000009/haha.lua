local ld = require 'ludens'

local Script = {
	timer = 0.0
}

function Script:attach(comp)
	self.comp = comp
	ld.debug.log('timer script attached')
end

function Script:detach()
	ld.debug.log('timer script detached after %d seconds', self.timer)
end

function Script:update(dt)
	self.timer = self.timer + dt
end

return Script