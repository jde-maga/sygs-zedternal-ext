class SygExt_Skill_SWAT_TacticalMovement extends WMUpgrade_Skill;

var array<float> Speed;
var float MoveSpeed;

static simulated function GetIronSightSpeedModifier(out float InSpeed, float DefaultSpeed, int upgLevel)
{
	InSpeed += DefaultSpeed * default.Speed[upgLevel - 1];
}

static simulated function ModifySpeedPassive(out float speedFactor, int upgLevel)
{
		speedFactor += default.MoveSpeed;
}

defaultproperties
{
	Speed(0)=1.0f
	Speed(1)=1.20f
	MoveSpeed=0.05f

	upgradeName="Tactical Movement"
	upgradeDescription(0)="> <font color=\"#66cc00\">Ignore</font> <font color=\"#ff3399\">iron sight movement penalty</font>\n> <font color=\"#66cc00\">+5%</font> <font color=\"#ff3399\">movement speed</font>"
	upgradeDescription(1)="> <font color=\"#66cc00\">Ignore</font> <font color=\"#ff3399\">iron sight movement penalty</font>\n> <font color=\"#66cc00\">+5%</font> <font color=\"#ff3399\">movement speed</font>\n> <font color=\"#b346ea\">+20%</font> <font color=\"#ff3399\">movement speed</font> when using <font color=\"#ffff00\">iron sights</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_TacticalMovement'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_TacticalMovement_Deluxe'

	Name="Default__WMUpgrade_Skill_TacticalMovement"
}
