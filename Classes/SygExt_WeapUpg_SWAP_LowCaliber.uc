class SygExt_WeapUpg_SWAP_LowCaliber extends WMUpgrade_Weapon
    abstract;

var float MagSize;
var float MagSizeStatic;
var float DamageStatic;

static function bool IsUpgradeCompatible(class<KFWeapon> KFW)
{
	if (class<KFWeap_Pistol_Bladed>(KFW) != none)
		return true;
	else if (class<KFWeap_Pistol_DualBladed>(KFW) != none)
		return true;
	else if (class<KFWeap_Rifle_MosinNagant>(KFW) != none)
		return true;
	else if (class<KFWeap_Rifle_FrostShotgunAxe>(KFW) != none)
		return true;
    else if (class<KFWeap_MeleeBase>(KFW) != none)
        return false;
    else if (class<KFWeap_Thrown_C4>(KFW) != none)
        return false;
        
    
    return true;
}

static simulated function ModifyMagSizeAndNumber(out int InMagazineCapacity, int DefaultMagazineCapacity, int upgLevel, KFWeapon KFW, optional array< class<KFPerk> > WeaponPerkClass, optional bool bSecondary=false, optional name WeaponClassName)
{
    InMagazineCapacity += Round(float(DefaultMagazineCapacity) * default.MagSizeStatic);
    InMagazineCapacity += Round((float(DefaultMagazineCapacity) * default.MagSize) * float(upgLevel));
}

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
    InDamage -= Round(float(DefaultDamage) * default.DamageStatic);   
}

defaultproperties
{
    MagSize=0.10
    MagSizeStatic=1.0
    DamageStatic=0.250
    WeaponBonus=(incValue=10,MaxValue=-1)
    upgradeName="SWAP Low Caliber"
    upgradeDescription(0)="Increase <font color=\"#ff3399\">magazine size</font> by <font color=\"#ffcc00\">100%</font> (<font color=\"#66cc00\">+%x%%</font>).\nDecrease <font color=\"#ff3399\">damage dealt</font> by <font color=\"#ff0000\">25%</font>."
}