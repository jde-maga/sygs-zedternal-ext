class SygExt_Skill_Gunslinger_FirstBlood extends WMUpgrade_Skill;

var array<float> Damage;

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
    if (MyKFW != None && MyKFW.MagazineCapacity[0] > 0 && ((MyKFW.MagazineCapacity[0] - (MyKFW.AmmoCount[0] + 1)) <= 0 )) 
        InDamage += Round(float(DefaultDamage) * default.Damage[upgLevel - 1] * MyKFW.MagazineCapacity[0]);
}

defaultproperties
{
    Damage(0)=0.05f
    Damage(1)=0.10f
    upgradeName="First Blood"
    upgradeDescription(0)="> <font color=\"#66cc00\">+5%</font> <font color=\"#ff3399\">damage</font> for the <font color=\"#ffff00\">first bullet of a magazine</font>, multiplicated by <font color=\"#ffff00\">magazine size</font>"
    upgradeDescription(1)="> <font color=\"#b346ea\">+10%</font> <font color=\"#ff3399\">damage</font> for the <font color=\"#ffff00\">first bullet of a magazine</font>, multiplicated by <font color=\"#ffff00\">magazine size</font>"
    upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_FirstBlood'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_FirstBlood_Deluxe'

	Name="Default__SygExt_Skill_Gunslinger_FirstBlood"
}