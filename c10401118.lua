local cm,m,o=GetID()
--泪流之恶意
--通过【费用】[将你的2张后防者退场]施放！
--抽1张卡，将这张卡放置到灵魂里，计数回充1。
function cm.initial_effect(c)
	vgf.VgCard(c)
	vgd.SpellActivate(c,m,cm.operation,cm.cost)
end
function cm.cost(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return vgf.IsExistingMatchingCard(vgf.RMonsterFilter,tp,LOCATION_MZONE,0,2,nil) end
	local g=vgf.SelectMatchingCard(HINTMSG_LEAVEONFIELD,e,tp,vgf.RMonsterFilter,tp,LOCATION_MZONE,0,2,2,nil)
	vgf.Sendto(LOCATION_DROP,g,REASON_COST)
end
function cm.op(e,tp,eg,ep,ev,re,r,rp)
    local c=e:GetHandler()
	Duel.Draw(tp,1,REASON_TRIGGER)
    vgf.Sendto(LOCATION_OVERLAY,c)
	VgF.DamageFill(1)
end