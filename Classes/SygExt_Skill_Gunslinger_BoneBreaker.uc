class SygExt_Skill_Gunslinger_BoneBreaker extends WMUpgrade_Skill;

var array<float> Power;

static function ModifyStumblePower(out float InStumblePower, float DefaultStumblePower, int upgLevel, optional KFPawn KFP, optional class<KFDamageType> DamageType, optional out float CooldownModifier, optional byte BodyPart, optional KFPawn OwnerPawn)
{
    if (BodyPart != HZI_HEAD) {
        InStumblePower += DefaultStumblePower * default.Power[upgLevel - 1];
    }
}

static function ModifyKnockdownPower(out float InKnockdownPower, float DefaultKnockdownPower, int upgLevel, KFPawn OwnerPawn, optional class<DamageType> DamageType, optional byte BodyPart, optional bool bIsSprinting=False)
{
	if (BodyPart != HZI_Head) {
		InKnockdownPower += DefaultKnockdownPower * default.Power[upgLevel - 1];
	}
}

defaultproperties
{
	Power(0)=0.3f
	Power(1)=0.75f
	upgradeName="Bone Breaker"
    upgradeDescription(0)="On a <font color=\"#ffff00\">limb shot</font>:\n> <font color=\"#66cc00\">+30%</font> <font color=\"#ff3399\">knockdown power</font>\n> <font color=\"#66cc00\">+30%</font> <font color=\"#ff3399\">stumble power</font>"
    upgradeDescription(1)="On a <font color=\"#ffff00\">limb shot</font>:\n> <font color=\"#b346ea\">+75%</font> <font color=\"#ff3399\">knockdown power</font>\n> <font color=\"#b346ea\">+75%</font> <font color=\"#ff3399\">stumble power</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_BoneBreaker'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_BoneBreaker_Deluxe'

	Name="Default__WMUpgrade_Skill_BoneBreaker"
}
