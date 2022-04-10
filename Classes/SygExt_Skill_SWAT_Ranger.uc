class SygExt_Skill_SWAT_Ranger extends WMUpgrade_Skill;

var array<float> Damage, Stun;

static function ModifyStunPower(out float InStunPower, float DefaultStunPower, int upgLevel, optional class<DamageType> DamageType, optional byte HitZoneIdx)
{
	if (HitZoneIdx == HZI_HEAD)
		InStunPower += DefaultStunPower * default.Stun[upgLevel - 1];
}

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
	if (HitZoneIdx == HZI_HEAD)
		InDamage += Round(float(DefaultDamage) * default.Damage[upgLevel - 1]);
}

defaultproperties
{
	Damage(0)=0.25f
	Damage(1)=0.75f
	Stun(0)=0.75f
	Stun(1)=4.00f

	upgradeName="Ranger"
	upgradeDescription(0)="> <font color=\"#66cc00\">+25%</font> <font color=\"#ff3399\">headshot damage</font>\n> <font color=\"#66cc00\">+75%</font> <font color=\"#ff3399\">headshot stun power</font>"
	upgradeDescription(1)="> <font color=\"#b346ea\">+75%</font> <font color=\"#ff3399\">headshot damage</font>\n> <font color=\"#b346ea\">+400%</font> <font color=\"#ff3399\">headshot stun power</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Ranger'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Ranger_Deluxe'

	Name="Default__WMUpgrade_Skill_Ranger"
}