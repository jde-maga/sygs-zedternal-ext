class Ext_SWAP_MakeItCount extends WMUpgrade_Weapon
    abstract;

var float Damage;
var float DamageStatic;
var float SpareAmmoStatic;

static function bool IsUpgradeCompatible(class<KFWeapon> KFW)
{
    if(class<KFWeap_GrenadeLauncher_Base>(KFW) != none)
    {
        return true;
    }
    else
    {
        if(class<KFWeap_Thrown_C4>(KFW) != none)
        {
            return true;
        }
        else
        {
            if(class<KFWeap_AssaultRifle_M16M203>(KFW) != none)
            {
                return true;
            }
        }
    }
    return false;
}

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
    InDamage += Round(float(DefaultDamage) * default.DamageStatic);
    InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel)); 
}

static simulated function ModifySpareAmmoAmount(out int InSpareAmmo, int DefaultSpareAmmo, int upgLevel, KFWeapon KFW, optional const out STraderItem TraderItem, optional bool bSecondary=false)
{
    if(!bSecondary)
    {
        InSpareAmmo -= Round(float(DefaultSpareAmmo) * default.SpareAmmoStatic);
    }   
}

defaultproperties
{
    Damage=0.10
    DamageStatic=2.0
    SpareAmmoStatic=0.750
    WeaponBonus=(incValue=10,MaxValue=-1)
    upgradeName="SWAP Make It Count"
    upgradeDescription(0)="Increase <font color=\"#ff3399\">damage dealt</font> by <font color=\"#ffcc00\">200%</font> (<font color=\"#66cc00\">+%x%%</font>).\nDecrease <font color=\"#ff3399\">spare ammo</font> by <font color=\"#ff0000\">75%</font>."
}