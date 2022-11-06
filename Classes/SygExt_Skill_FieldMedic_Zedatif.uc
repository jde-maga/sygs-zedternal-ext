class SygExt_Skill_FieldMedic_Zedatif extends WMUpgrade_Skill;

var float Snare;
var array<float> Bonus;

static function ModifySnarePower(out float InSnarePower, float DefaultSnarePower, int upgLevel, optional class<DamageType> DamageType, optional byte BodyPart)
{
	if (ClassIsChildOf(DamageType, class'KFDT_Toxic'))
		InSnarePower += DefaultSnarePower * default.Snare;
}

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
	if (ClassIsChildOf(DamageType, class'KFDT_Toxic'))
		InDamage += int(float(DefaultDamage) * default.Bonus[upgLevel - 1]);
}

static function ModifyHealAmount(out float InHealAmount, float DefaultHealAmount, int upgLevel)
{
	InHealAmount += DefaultHealAmount * default.Bonus[upgLevel - 1];
}

defaultproperties
{
	Snare=30.0f
	Bonus(0)=0.25f
	Bonus(1)=0.6f

	upgradeName="ZED-atif"
    upgradeDescription(0)="When dealing <font color=\"#ffff00\">poison damage</font>:\n> <font color=\"#66cc00\">+25%</font> <font color=\"#ff3399\">ZED slowdown</font>"
    upgradeDescription(1)="When dealing <font color=\"#ffff00\">poison damage</font>:\n> <font color=\"#b346ea\">+60%</font> <font color=\"#ff3399\">ZED slowdown</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Zedatif'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Zedatif_Deluxe'

	Name="Default__SygExt_Skill_FieldMedic_Zedatif"
}
