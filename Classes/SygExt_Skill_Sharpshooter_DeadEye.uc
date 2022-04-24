class SygExt_Skill_Sharpshooter_DeadEye extends WMUpgrade_Skill;

var array<float> Damage, Recoil;

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
	if (MyKFW.bUsingSights)
		InDamage += Round(float(DefaultDamage) * default.Damage[upgLevel - 1]);
}

static simulated function ModifyRecoil(out float InRecoilModifier, float DefaultRecoilModifier, int upgLevel, KFWeapon KFW)
{
	if (KFW != None && KFW.bUsingSights)
		InRecoilModifier -= DefaultRecoilModifier * default.Recoil[upgLevel - 1];
}

defaultproperties
{
    Damage(0)=0.20f
    Damage(1)=0.50f
    Recoil(0)=0.10f
    Recoil(1)=0.25f

	upgradeName="Dead Eye"
    upgradeDescription(0)="When using <font color=\"#ffff00\">iron sights</font>:\n> <font color=\"#66cc00\">+20%</font> <font color=\"#ff3399\">damage</font>\n> <font color=\"#66cc00\">-10%</font> <font color=\"#ff3399\">recoil</font>"
    upgradeDescription(1)="When using <font color=\"#ffff00\">iron sights</font>:\n> <font color=\"#b346ea\">+50%</font> <font color=\"#ff3399\">damage</font>\n> <font color=\"#b346ea\">-25%</font> <font color=\"#ff3399\">recoil</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_DeadEye'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_DeadEye_Deluxe'

	Name="Default__SygExt_Skill_Sharpshooter_DeadEye"
}
