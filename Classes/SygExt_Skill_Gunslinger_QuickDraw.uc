class SygExt_Skill_Gunslinger_QuickDraw extends WMUpgrade_Skill;

var array<float> SwitchSpeed;

static simulated function ModifyWeaponSwitchTimePassive(out float switchTimeFactor, int upgLevel)
{
	switchTimeFactor = 1.0f / (1.0f / switchTimeFactor + default.SwitchSpeed[upgLevel - 1]);
}

defaultproperties
{
	SwitchSpeed(0)=2.5f
	SwitchSpeed(1)=50.00f

	upgradeName="Quick Draw"
    upgradeDescription(0)="> <font color=\"#66cc00\">+250%</font> <font color=\"#ff3399\">switch speed</font>"
    upgradeDescription(1)="> <font color=\"#b346ea\">+5000%</font> <font color=\"#ff3399\">switch speed</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_QuickDraw'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_QuickDraw_Deluxe'

	Name="Default__SygExt_Skill_Gunslinger_QuickDraw"
}
