function BurnOnDamage(inst)
	local do_delta_old = inst.components.health.DoDelta

	local do_delta_new = function(self, amount, overtime, cause, ignore_invincible, afflicter, ignore_absorb)
		local damage = do_delta_old(self, amount, overtime, cause, ignore_invincible, afflicter, ignore_absorb)
		local player = self.inst
		if damage < 0 then
			if not player.components.health.takingfiredamage then
				player:PushEvent("onstartedfire", { target = player })
				player.components.burnable:Ignite()
			end
		end
	end

	inst.components.health.DoDelta = do_delta_new

	print("BurnOnDamage loaded!")
end

return BurnOnDamage