class SygExt_Skill_Sharpshooter_Ranger extends WMUpgrade_Skill;

var array<float> Damage, Knockdown;

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
	if (DamageInstigator != None && DamageInstigator.WorldInfo.TimeDilation < 1)
		InDamage += Round(float(DefaultDamage) * default.Damage[upgLevel - 1]);
}

static function ModifyKnockdownPower(out float InKnockdownPower, float DefaultKnockdownPower, int upgLevel, KFPawn OwnerPawn, optional class<DamageType> DamageType, optional byte BodyPart, optional bool bIsSprinting=False)
{
    if (OwnerPawn != None && OwnerPawn.WorldInfo.TimeDilation < 1 && BodyPart == HZI_HEAD)
    InKnockdownPower += DefaultKnockdownPower * default.Knockdown[upgLevel - 1];
}

defaultproperties
{
	Damage(0)=0.3f
	Damage(1)=0.75f
    Knockdown(0)=3.50f;
    Knockdown(1)=150.00f;

	upgradeName="Ranger"
    upgradeDescription(0)="During <font color=\"#ffff00\">ZED time</font>:\n> <font color=\"#66cc00\">+350%</font> <font color=\"#ff3399\">knockdown power</font> with <font color=\"#ffff00\">headshots</font>"
    upgradeDescription(1)="During <font color=\"#ffff00\">ZED time</font>:\n> <font color=\"#b346ea\">+15000%</font> <font color=\"#ff3399\">knockdown power</font> with <font color=\"#ffff00\">headshots</font>"

	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Concentration'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Concentration_Deluxe'

	Name="Default__SygExt_Skill_Sharpshooter_Ranger"
}
