class SygExt_Skill_FieldMedic_BattleSurgeon extends WMUpgrade_Skill;

var array<float> Damage, OtherDamage;

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
	if ((MyKFW != None && IsWeaponOnSpecificPerk(MyKFW, class'KFGame.KFPerk_FieldMedic')) || (DamageType != None && IsDamageTypeOnSpecificPerk(DamageType, class'KFGame.KFPerk_FieldMedic')))
		InDamage += DefaultDamage * default.Damage[upgLevel - 1];
	else
		InDamage += DefaultDamage * default.OtherDamage[upgLevel - 1];
}

defaultproperties
{
	Damage(0)=0.35f
	Damage(1)=0.75f
	OtherDamage(0)=0.20f
	OtherDamage(1)=0.40f

	upgradeName="Battle Surgeon"
    upgradeDescription(0)="> <font color=\"#66cc00\">+35%</font> <font color=\"#ff3399\">damage</font> with <font color=\"#ffff00\">Field Medic weapons</font>\n> <font color=\"#66cc00\">+20%</font> <font color=\"#ff3399\">damage</font> with <font color=\"#ffff00\">other weapons</font>"
    upgradeDescription(1)="> <font color=\"#b346ea\">+75%</font> <font color=\"#ff3399\">damage</font> with <font color=\"#ffff00\">Field Medic weapons</font>\n> <font color=\"#b346ea\">+40%</font> <font color=\"#ff3399\">damage</font> with <font color=\"#ffff00\">other weapons</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_BattleSurgeon'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_BattleSurgeon_Deluxe'

	Name="Default__SygExt_Skill_FieldMedic_BattleSurgeon"
}
