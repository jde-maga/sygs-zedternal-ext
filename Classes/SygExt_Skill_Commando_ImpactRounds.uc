class SygExt_Skill_Commando_ImpactRounds extends WMUpgrade_Skill;

var array<float> Damage, Stumble;

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
	if (ClassIsChildOf(DamageType, class'KFDT_Ballistic'))
		InDamage += Round(float(DefaultDamage) * default.Damage[upgLevel - 1]);
}

static function ModifyStumblePowerPassive(out float stumblePowerFactor, int upgLevel)
{
	stumblePowerFactor += default.Stumble[upgLevel - 1];
}

defaultproperties
{
	Damage(0)=0.25f
	Damage(1)=0.50f
	Stumble(0)=0.35f
	Stumble(1)=0.75f

    upgradeDescription(0)="> <font color=\"#66cc00\">+25%</font> <font color=\"#ff3399\">ballistic damage</font>\n> <font color=\"#66cc00\">+35%</font> <font color=\"#ff3399\">stumble power</font>"
    upgradeDescription(1)="> <font color=\"#b346ea\">+50%</font> <font color=\"#ff3399\">ballistic damage</font>\n> <font color=\"#b346ea\">+75%</font> <font color=\"#ff3399\">stumble power</font>"

	upgradeName="Impact Rounds"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_ImpactRounds'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_ImpactRounds_Deluxe'

	Name="Default__SygExt_Skill_Commando_ImpactRounds"
}
