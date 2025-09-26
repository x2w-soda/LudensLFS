local ld = require 'ludens'

-- script that modifies a Mesh component
local Script = {
	time = 0.0,
	origin = {},
	radius = 5.0,
}

function Script:attach(comp)
	io.write('script attached\n')
	self.origin = comp.transform:get_position();
end

function Script:detach()
	io.write('script detached\n')
end

function Script:update(comp, dt)
	self.time = self.time + dt;
	local rot = comp.transform:get_rotation();
	local offsetX = math.sin(math.pi / 2.0 * self.time);
	local offsetZ = math.cos(math.pi / 2.0 * self.time);

	local rotSpeed = 180.0
	rot.y = rot.y + rotSpeed * dt;
	if rot.y > 360.0 then
		rot.y = rot.y - 360.0;
	end
	comp.transform:set_rotation(rot);

	-- TODO: Vec3:copy()
	-- local pos = { x=self.origin.x, y=self.origin.y, z=self.origin.z }
	-- pos.x = pos.x + offsetX * self.radius;
	-- pos.z = pos.z + offsetZ * self.radius;
	-- comp.transform:set_position(pos);
end

return Script