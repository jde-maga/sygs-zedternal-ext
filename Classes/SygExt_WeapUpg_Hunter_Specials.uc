class SygExt_WeapUpg_Hunter_Specials extends WMUpgrade_Weapon
    abstract;

var float Damage;

static function bool IsUpgradeCompatible(class<KFWeapon> KFD)
{
    return true;
}

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
    if ((MyKFPM != none) && KFPawn_ZedHusk(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
    else if ((MyKFPM != none) && WMPawn_ZedHusk_Omega(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
    else if ((MyKFPM != none) && WMPawn_ZedHusk_Tiny_Blue(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
    else if ((MyKFPM != none) && WMPawn_ZedHusk_Tiny_Green(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
    else if ((MyKFPM != none) && WMPawn_ZedHusk_Tiny_Pink(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
    else if ((MyKFPM != none) && WMPawn_ZedHusk_Tiny(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
    else if ((MyKFPM != none) && KFPawn_ZedSiren(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
    else if ((MyKFPM != none) && WMPawn_ZedSiren_Omega(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
    else if ((MyKFPM != none) && KFPawn_ZedDAR_Rocket(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
    else if ((MyKFPM != none) && KFPawn_ZedDAR_EMP(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
    else if ((MyKFPM != none) && KFPawn_ZedDAR_Laser(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
     else if ((MyKFPM != none) && KFPawn_ZedBloat(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
    else if ((MyKFPM != none) && KFPawn_ZedBloatKingSubspawn(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
}

defaultproperties
{
    Damage=0.20
    WeaponBonus=(incValue=20,MaxValue=-1)
    upgradeName="Hunter: Specials"
    upgradeDescription(0)="Increase <font color=\"#ff3399\">damage</font> of this weapon by <font color=\"#66cc00\">%x%%</font> against <font color=\"#ffff00\">all types of Sirens, Husks, EDARs and Bloats</font>."

    Name="Default__SygExt_WeapUpg_Hunter_Specials"
}