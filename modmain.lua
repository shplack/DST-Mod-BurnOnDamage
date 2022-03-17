local require = GLOBAL.require

local BurnOnDamage = require "prefabs/burnondamage"

AddPlayerPostInit(function(inst)
	BurnOnDamage(inst)
end)

