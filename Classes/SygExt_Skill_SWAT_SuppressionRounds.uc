class SygExt_Skill_SWAT_SuppressionRounds extends WMUpgrade_Skill;

var array<float> KnockDown;

static function ModifyKnockdownPower(out float InKnockdownPower, float DefaultKnockdownPower, int upgLevel, KFPawn OwnerPawn, optional class<DamageType> DamageType, optional byte BodyPart, optional bool bIsSprinting=False)
{
	if (bIsSprinting || upgLevel == 2)
		InKnockdownPower += DefaultKnockdownPower * default.KnockDown[upgLevel - 1];
}

defaultproperties
{
	KnockDown(0)=0.5f
	KnockDown(1)=0.150f

	upgradeName="Suppression Rounds"
	upgradeDescription(0)="> <font color=\"#66cc00\">+50%</font> <font color=\"#ff3399\">knockdown power</font> on <font color=\"#ffff00\">sprinting ZEDs</font>"
	upgradeDescription(1)="> <font color=\"#b346ea\">+150%</font> <font color=\"#ff3399\">knockdown power</font> on <font color=\"#b346ea\">any ZEDs</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_SuppressionRounds'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_SuppressionRounds_Deluxe'

	Name="Default__WMUpgrade_Skill_SuppressionRounds"
}
