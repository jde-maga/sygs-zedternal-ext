class Ext_SWAP_SniperConversionKit extends WMUpgrade_Weapon
    abstract;

var float HeadDamage;
var float HeadDamageStatic;
var float SpareAmmoStatic;

static function bool IsUpgradeCompatible(class<KFWeapon> KFW)
{
    if(class<KFWeap_PistolBase>(KFW) != none)
    {
        return true;
    }
    else
    {
        if(class<KFWeap_RifleBase>(KFW) != none)
        {
            return true;
        }
        else
        {
            if(class<KFWeap_SMGBase>(KFW) != none)
            {
                return true;
            }
            else
            {
                if(class<KFWeap_MedicBase>(KFW) != none)
                {
                    return true;
                }
            }
        }
    }
    return false;   
}

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
    if(HitZoneIdx == 0)
    {
        InDamage += Round(float(DefaultDamage) * default.HeadDamageStatic);
        InDamage += Round((float(DefaultDamage) * default.HeadDamage) * float(upgLevel));
    }
}

static simulated function ModifySpareAmmoAmount(out int InSpareAmmo, int DefaultSpareAmmo, int upgLevel, KFWeapon KFW, const optional out STraderItem TraderItem, optional bool bSecondary=false)
{
    if(!bSecondary)
    {
        InSpareAmmo -= Round(float(DefaultSpareAmmo) * default.SpareAmmoStatic);
    }  
}

defaultproperties
{
    HeadDamage=0.10
    HeadDamageStatic=1.50
    SpareAmmoStatic=0.50
    WeaponBonus=(incValue=10,MaxValue=-1)
    upgradeName="SWAP Sniper Conversion Kit"
    upgradeDescription(0)="Increase <font color=\"#ff3399\">headshot damage</font> by <font color=\"#ffcc00\">150%</font> (<font color=\"#66cc00\">+%x%%</font>).\nDecrease <font color=\"#ff3399\">spare ammo</font> by <font color=\"#ff0000\">50%</font>."
}