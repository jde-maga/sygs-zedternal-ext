class SygExt_Skill_Gunslinger_FanFire extends WMUpgrade_Skill;

var array<float> ActionSpeed;

static simulated function GetZedTimeModifier(out float InModifier, int upgLevel, KFWeapon KFW)
{
	local name StateName;

	if(KFW != None)
	{
		StateName = KFW.GetStateName();
		if (class'ZedternalReborn.WMWeaponStates'.static.IsWeaponAttackState(StateName) && KFWeap_MeleeBase(KFW) == None)
			InModifier += default.ActionSpeed[upgLevel - 1];
	}
}

defaultproperties
{
	ActionSpeed(0)=0.5f
	ActionSpeed(1)=1.0f

	upgradeName="Fan Fire"
    upgradeDescription(0)="During <font color=\"#ffff00\">ZED time</font>:\n> <font color=\"#66cc00\">50%</font> reduced <font color=\"#ff3399\">ZED time slowdown</font> while <font color=\"#ffff00\">shooting</font>"
    upgradeDescription(1)="During <font color=\"#ffff00\">ZED time</font>:\n> <font color=\"#b346ea\">100%</font> reduced <font color=\"#ff3399\">ZED time slowdown</font> while <font color=\"#ffff00\">shooting</font>"
    
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_WhirlwindOfLead'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_WhirlwindOfLead_Deluxe'

	Name="Default__SygExt_Skill_Gunslinger_FanFire"
}
