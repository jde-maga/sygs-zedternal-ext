class SygExt_WeapUpg_Hunter_Fleshpound extends WMUpgrade_Weapon
    abstract;

var float Damage;

static function bool IsUpgradeCompatible(class<KFWeapon> KFD)
{
    return true;
}

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
    if ((MyKFPM != none) && KFPawn_ZedFleshpound(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
    else if ((MyKFPM != none) && KFPawn_ZedFleshpoundMini(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
    else if ((MyKFPM != none) && WMPawn_ZedFleshpound_Omega(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
    else if ((MyKFPM != none) && WMPawn_ZedFleshpound_Predator(MyKFPM) != none)
        InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
}

defaultproperties
{
    Damage=0.20
    WeaponBonus=(incValue=20,MaxValue=-1)
    upgradeName="Hunter: Fleshpound"
    upgradeDescription(0)="Increase <font color=\"#ff3399\">damage</font> of this weapon by <font color=\"#66cc00\">%x%%</font> against <font color=\"#ffff00\">all types of Fleshpounds (excluding the Fleshpound King)</font>."
}