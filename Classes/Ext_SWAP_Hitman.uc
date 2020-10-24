class Ext_SWAP_Hitman extends WMUpgrade_Weapon
    abstract;

var float Damage;
var float DamageStatic;
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

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
    InDamage += Round(float(DefaultDamage) + default.DamageStatic);
    InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));  
}

static simulated function ModifyMagSizeAndNumber(out int InMagazineCapacity, int DefaultMagazineCapacity, int upgLevel, KFWeapon KFW, optional array< class<KFPerk> > WeaponPerkClass, optional bool bSecondary=false, optional name WeaponClassName)
{
    InMagazineCapacity -= Round(float(DefaultMagazineCapacity) * default.MagSizeStatic);
}

defaultproperties
{
    Damage=0.100000
    DamageStatic=1.500000
    MagSizeStatic=0.500000
    WeaponBonus=(incValue=10,MaxValue=-1)
    upgradeName="SWAP Hitman"
    upgradeDescription(0)="Increase <font color=\"#ff3399\">damage dealt</font> by <font color=\"#ffcc00\">150%</font> (<font color=\"#66cc00\">+%x%%</font>).\nDecrease <font color=\"#ff3399\">magazine size</font> by <font color=\"#ff0000\">50%</font>."
}