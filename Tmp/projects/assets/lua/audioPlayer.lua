local ld = require 'ludens'

local Script = {
}

function Script:attach(comp)
	self.comp = comp
	comp.pan = 0.5
end

function Script:detach()
end

function Script:update(dt)
	local comp = self.comp
	if ld.input.get_key_down('i') then
		comp:play()
	elseif ld.input.get_key_down('o') then
		comp:pause()
	elseif ld.input.get_key_down('p') then
		comp:resume()
	end
end

return Script