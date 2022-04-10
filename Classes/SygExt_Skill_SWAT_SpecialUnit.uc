class SygExt_Skill_SWAT_SpecialUnit extends WMUpgrade_Skill;

var array<float> Damage, Speed;

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
	if (DamageInstigator != None && WMPawn_Human(DamageInstigator.Pawn) != None && WMPawn_Human(DamageInstigator.Pawn).ZedternalArmor > 0)
		InDamage += DefaultDamage * default.Damage[upgLevel - 1];
}

static simulated function ModifySpeed(out float InSpeed, float DefaultSpeed, int upgLevel, KFPawn OwnerPawn)
{
	if (WMPawn_Human(OwnerPawn) != None && WMPawn_Human(OwnerPawn).ZedternalArmor <= 0)
		InSpeed += DefaultSpeed * default.Speed[upgLevel - 1];
}

defaultproperties
{
	Damage(0)=0.25f
	Damage(1)=0.75f
	Speed(0)=0.1f
	Speed(1)=0.3f

	upgradeName="Special Unit"
	upgradeDescription(0)="While you have <font color=\"#ffff00\">armor</font>:\n> <font color=\"#66cc00\">+25%</font> <font color=\"#ff3399\">damage</font>\n\nWhile you have <font color=\"#ffff00\">no armor</font> :\n> <font color=\"#66cc00\">+10%</font> <font color=\"#ff3399\">movement speed</font>"
	upgradeDescription(1)="While you have <font color=\"#ffff00\">armor</font>:\n> <font color=\"#b346ea\">+75%</font> <font color=\"#ff3399\">damage</font>\n\nWhile you have <font color=\"#ffff00\">no armor</font> :\n> <font color=\"#b346ea\">+30%</font> <font color=\"#ff3399\">movement speed</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_SpecialUnit'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_SpecialUnit_Deluxe'

	Name="Default__WMUpgrade_Skill_SpecialUnit"
}
