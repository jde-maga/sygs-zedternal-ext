class Ext_Hunter_Omega extends WMUpgrade_Weapon
    abstract;

var float Damage;

static function bool IsUpgradeCompatible(class<KFWeapon> KFD)
{
    return true;
}

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
    if ((MyKFPM != none) && WMPawn_ZedClot_Slasher_Omega(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
    else if ((MyKFPM != none) && WMPawn_ZedFleshpound_Omega(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
    else if ((MyKFPM != none) && WMPawn_ZedFleshpound_Predator(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
    else if ((MyKFPM != none) && WMPawn_ZedGorefast_Omega(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
    else if ((MyKFPM != none) && WMPawn_ZedHusk_Omega(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
    else if ((MyKFPM != none) && WMPawn_ZedScrake_Emperor(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
    else if ((MyKFPM != none) && WMPawn_ZedScrake_Omega(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
    else if ((MyKFPM != none) && WMPawn_ZedSiren_Omega(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
    else if ((MyKFPM != none) && WMPawn_ZedStalker_Omega(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
}

defaultproperties
{
    Damage=0.20
    WeaponBonus=(incValue=20,MaxValue=-1)
    upgradeName="Hunter: Omega"
    upgradeDescription(0)="Increase <font color=\"#ff3399\">damage</font> of this weapon by <font color=\"#66cc00\">%x%%</font> against <font color=\"#ffff00\">all types of Omega zeds</font>."
}