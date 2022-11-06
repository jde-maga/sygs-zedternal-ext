class SygExt_Skill_FieldMedic_AcidicRounds extends WMUpgrade_Skill;

var const class<KFDamageType> WMDT;

var array<float> damageFactor;

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
	if (DamageType != None && DamageType != default.WMDT && DamageInstigator != None && MyKFPM != None)
	{
		//add poison effects on zed
		MyKFPM.ApplyDamageOverTime(int(float(DefaultDamage) * default.damageFactor[upgLevel - 1]), DamageInstigator, default.WMDT);
	}
}

defaultproperties
{
	WMDT=class'ZedternalReborn.WMDT_AcidicRounds_DoT'
	damageFactor(0)=0.25f
	damageFactor(1)=0.50f

	upgradeName="Acidic Rounds"
    upgradeDescription(0)="When <font color=\"#ffff00\">damaging a ZED</font>:\n> <font color=\"#66cc00\">25%</font> extra damage as <font color=\"#ff3399\">poison damage</font> every second for 8 seconds\n\n<i><font color=\"#919191\">Damage doesn't stack, only the highest damage is applied</font></i>"
    upgradeDescription(1)="When <font color=\"#ffff00\">damaging a ZED</font>:\n> <font color=\"#b346ea\">50%</font> extra damage as <font color=\"#ff3399\">poison damage</font> every second for 8 seconds\n\n<i><font color=\"#919191\">Damage doesn't stack, only the highest damage is applied</font></i>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_AcidicRounds'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_AcidicRounds_Deluxe'

	Name="Default__SygExt_Skill_FieldMedic_AcidicRounds"
}
