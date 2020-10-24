class Ext_SWAP_Pacifist extends WMUpgrade_Weapon
    abstract;

var float Heal;
var float HealStatic;
var float DamageStatic;

static function bool IsUpgradeCompatible(class<KFWeapon> KFW)
{
    if(class<KFWeap_MedicBase>(KFW) != none)
    {
        return true;
    }
    return false;  
}

static function ModifyHealAmount(out float InHealAmount, float DefaultHealAmount, int upgLevel)
{
    InHealAmount += (DefaultHealAmount * default.HealStatic);
    InHealAmount += ((DefaultHealAmount * default.Heal) * float(upgLevel));  
}

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
    InDamage -= Round(float(DefaultDamage) * default.DamageStatic);   
}

defaultproperties
{
    Heal=0.10
    HealStatic=1.50
    DamageStatic=0.50
    WeaponBonus=(incValue=10,MaxValue=-1)
    upgradeName="SWAP Pacifist"
    upgradeDescription(0)="Increase <font color=\"#ff3399\">healing rate</font> by <font color=\"#ffcc00\">150%</font> (<font color=\"#66cc00\">+%x%%</font>).\nDecrease <font color=\"#ff3399\">damage dealt</font> by <font color=\"#ff0000\">50%</font>."
}