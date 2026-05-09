local ld = require('ludens')

local Script = {}

function Script:attach(comp)
	self.comp = comp
	ld.debug.log('dup script attached')
end

function Script:detach()
end

function Script:update(dt)
	if ld.input.get_key_down('v') then
		self.comp:destroy()
	end
end

return Script