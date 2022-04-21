class SygExt_WeapUpg_SWAP_WallOfFire extends WMUpgrade_Weapon
    abstract;

var float MagSize;
var float MagSizeStatic;
var float DamageStatic;

static function bool IsUpgradeCompatible(class<KFWeapon> KFW)
{
    if (class<KFWeap_AssaultRifle_LazerCutter>(KFW) != none)
        return false;
    if(class<KFWeap_FlameBase>(KFW) != none)
        return true;

    return false;
}

static simulated function ModifyMagSizeAndNumber(out int InMagazineCapacity, int DefaultMagazineCapacity, int upgLevel, KFWeapon KFW, optional array< class<KFPerk> > WeaponPerkClass, optional bool bSecondary=false, optional name WeaponClassName)
{
    InMagazineCapacity += Round(float(DefaultMagazineCapacity) * default.MagSizeStatic);
    InMagazineCapacity += Round((float(DefaultMagazineCapacity) * default.MagSize) * upgLevel);
}

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
    InDamage -= Round(float(DefaultDamage) * default.DamageStatic); 
}

defaultproperties
{
    MagSize=0.250
    MagSizeStatic=1.50
    DamageStatic=0.30
    WeaponBonus=(incValue=25,MaxValue=-1)
    upgradeName="SWAP Wall of Fire"
    upgradeDescription(0)="Increase <font color=\"#ff3399\">magazine size</font> by <font color=\"#ffcc00\">150%</font> (<font color=\"#66cc00\">+%x%%</font>).\nDecrease <font color=\"#ff3399\">damage dealt</font> by <font color=\"#ff0000\">30%</font>."

    Name="Default__SygExt_WeapUpg_SWAP_WallOfFire"
}