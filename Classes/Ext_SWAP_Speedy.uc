class Ext_SWAP_Speedy extends WMUpgrade_Weapon
    abstract;

var float ReloadRate;
var float ReloadRateStatic;
var float MagSizeStatic;

static function bool IsUpgradeCompatible(class<KFWeapon> KFW)
{
    if(KFW.default.MagazineCapacity[0] <= 2)
    {
        return false;
    }
    else
    {
        if(class<KFWeap_MeleeBase>(KFW) != none)
        {
            return false;
        }
        else
        {
            if(class<KFWeap_Thrown_C4>(KFW) != none)
            {
                return false;
            }
        }
    }
    return true;
}

static simulated function GetReloadRateScale(out float InReloadRateScale, int upgLevel, KFWeapon KFW, KFPawn OwnerPawn)
{
    InReloadRateScale = 1.f / ((1.f / InReloadRateScale) + default.ReloadRateStatic);
    InReloadRateScale = 1.f / ((1.f / InReloadRateScale) + (default.ReloadRate * upgLevel));
}

static simulated function ModifyMagSizeAndNumber(out int InMagazineCapacity, int DefaultMagazineCapacity, int upgLevel, KFWeapon KFW, optional array< class<KFPerk> > WeaponPerkClass, optional bool bSecondary=false, optional name WeaponClassName)
{
    InMagazineCapacity -= Round(float(DefaultMagazineCapacity) * default.MagSizeStatic);
}


defaultproperties
{
    ReloadRate=0.10
    ReloadRateStatic=1.0
    MagSizeStatic=0.50
    WeaponBonus=(incValue=10,MaxValue=-1)
    upgradeName="SWAP Speedy"
    upgradeDescription(0)="Increase <font color=\"#ff3399\">reload speed</font> by <font color=\"#ffcc00\">100%</font> (<font color=\"#66cc00\">+%x%%</font>).\nDecrease <font color=\"#ff3399\">magazine size</font> by <font color=\"#ff0000\">50%</font>."
}