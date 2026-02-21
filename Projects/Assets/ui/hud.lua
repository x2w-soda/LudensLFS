local ld = require 'ludens'

local Script = {
}

function Script:attach(ui)
	self.ui = ui;
	self.btn = ui:get_widget('root/btn')
	self.btn.on_click = function() ld.debug.log('button clicked') end
	-- self.btn.on_press = function() ld.debug.log('mouse pressed') end
	-- self.btn.on_click = function (event, args) ui:signal('ButtonPressed', 100) end
	ld.debug.log('screen UI attached')
end

function Script:detach()
	ld.debug.log('screen UI detached')
end

return Script