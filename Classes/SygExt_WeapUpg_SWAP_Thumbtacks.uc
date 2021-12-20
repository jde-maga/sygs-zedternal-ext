class SygExt_WeapUpg_SWAP_Thumbtacks extends WMUpgrade_Weapon
    abstract;

var float MagSize;
var float MagSizeStatic;
var float PenetrationStatic;

static function bool IsUpgradeCompatible(class<KFWeapon> KFW)
{
    if (class<KFWeap_Rifle_FrostShotgunAxe>(KFW) != none)
		return false;
    else if(class<KFWeap_Shotgun_HRG_Kaboomstick>(KFW) != none)
        return false;
    else if(class<KFWeap_ShotgunBase>(KFW) != none)
        return true;

    return false;
}

static simulated function ModifyMagSizeAndNumber(out int InMagazineCapacity, int DefaultMagazineCapacity, int upgLevel, KFWeapon KFW, optional array< class<KFPerk> > WeaponPerkClass, optional bool bSecondary=false, optional name WeaponClassName)
{
    InMagazineCapacity += Round(float(DefaultMagazineCapacity) * default.MagSizeStatic);
    InMagazineCapacity += Round((float(DefaultMagazineCapacity) * default.MagSize) * float(upgLevel));
}

static simulated function ModifyPenetration(out float InPenetration, float DefaultPenetration, int upgLevel, class<KFDamageType> DamageType, KFPawn OwnerPawn, optional bool bForce)
{
    InPenetration -= (DefaultPenetration * default.PenetrationStatic); 
}

defaultproperties
{
    MagSize=0.20
    MagSizeStatic=2.0
    PenetrationStatic=5.0
    WeaponBonus=(incValue=20,MaxValue=-1)
    upgradeName="SWAP Thumbtacks"
    upgradeDescription(0)="Increase <font color=\"#ff3399\">magazine size</font> by <font color=\"#ffcc00\">200%</font> (<font color=\"#66cc00\">+%x%%</font>).\nDecrease <font color=\"#ff3399\">penetration</font> by <font color=\"#ff0000\">500%</font>."
}