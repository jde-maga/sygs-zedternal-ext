class SygExt_Skill_Support_Penetrator extends WMUpgrade_Skill;

var array<float> Penetration;

static simulated function ModifyPenetrationPassive(out float penetrationFactor, int upgLevel)
{
	penetrationFactor += default.Penetration[upgLevel - 1];
}

defaultproperties
{
	Penetration(0)=3.5f
	Penetration(1)=99.0f

	upgradeName="Penetrator"
    upgradeDescription(0)="When using <font color=\"#ffff00\">shotguns, rifles, revolvers</font>:\n> <font color=\"#66cc00\">+350%</font> <font color=\"#ff3399\">penetration</font>"
    upgradeDescription(1)="When using <font color=\"#ffff00\">shotguns, rifles, revolvers</font>:\n> <font color=\"#ff3399\">unlimited</font> <font color=\"#ff3399\">penetration</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Penetrator'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Penetrator_Deluxe'

	Name="Default__SygExt_Skill_Support_Penetrator"
}
