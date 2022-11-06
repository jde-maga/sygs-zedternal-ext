class SygExt_Skill_FieldMedic_Hemoglobin extends WMUpgrade_Skill;

var const class<KFDamageType> WMDT;

var Vector VectZero;
var array<float> damageFactor;

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
	if (ClassIsChildOf(DamageType, class'KFDT_Toxic') && DamageInstigator != None && MyKFPM != None)
	{
		//add poison effects on zed
		MyKFPM.TakeDamage(int(float(DefaultDamage) * default.damageFactor[upgLevel - 1]), DamageInstigator, MyKFPM.Location, default.VectZero, default.WMDT);
	}
}

defaultproperties
{
	WMDT=class'ZedternalReborn.WMDT_Hemogoblin'
	VectZero=(x=0.0f,y=0.0f,z=0.0f)
	damageFactor(0)=0.20f
	damageFactor(1)=0.50f

	upgradeName="Hemoglobin"
    upgradeDescription(0)="When dealing <font color=\"#ffff00\">poison damage</font>:\n> Deal <font color=\"#ff3399\">bleeding damage</font> instead, with <font color=\"#66cc00\">+20%</font> extra damage"
    upgradeDescription(0)="When dealing <font color=\"#ffff00\">poison damage</font>:\n> Deal <font color=\"#ff3399\">bleeding damage</font> instead, with <font color=\"#b346ea\">+50%</font> extra damage"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Hemoglobin'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Hemoglobin_Deluxe'

	Name="Default__SygExt_Skill_FieldMedic_Hemoglobin"
}
