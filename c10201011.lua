-- 【自】：你的RIDE阶段中这张卡被从手牌舍弃时，你可以将这张卡CALL到R上。
local cm,m,o=GetID()
function cm.initial_effect(c)
	vgf.VgCard(c)
	
	vgd.EffectTypeTrigger(c,m,LOCATION_DROP,EFFECT_TYPE_SINGLE,EVENT_DISCARD,cm.operation,nil,cm.condition)
end
function cm.condition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetCurrentPhase()==PHASE_STANDBY
end
function cm.operation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	-- local rc=vgf.GetMatchingGroup(vgf.VMonsterFilter,tp,LOCATION_MZONE,0,nil):GetFirst()
	vgf.Call(c,0,tp)
end
