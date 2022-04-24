class SygExt_Skill_Sharpshooter_Assassin extends WMUpgrade_Skill;

var array<float> Damage;

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
	if (HitZoneIdx == HZI_HEAD)
		InDamage += Round(float(DefaultDamage) * default.Damage[upgLevel - 1]);
}

defaultproperties
{
	Damage(0)=0.35f
	Damage(1)=1.25f

	upgradeName="Assassin"
    upgradeDescription(0)="> <font color=\"#66cc00\">+35%</font> <font color=\"#ff3399\">headshot damage</font>"
    upgradeDescription(1)="> <font color=\"#b346ea\">+125%</font> <font color=\"#ff3399\">headshot damage</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Assassin'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Assassin_Deluxe'

	Name="Default__SygExt_Skill_Sharpshooter_Assassin"
}
