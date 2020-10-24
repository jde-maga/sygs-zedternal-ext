class Ext_SWAP_Ninja extends WMUpgrade_Weapon
    abstract;

var float MeleeAttackSpeed;
var float MeleeAttackSpeedStatic;
var float DamageStatic;

static function bool IsUpgradeCompatible(class<KFWeapon> KFW)
{
    if(class<KFWeap_MeleeBase>(KFW) != none)
    {
        return true;
    }
    return false; 
}

static simulated function ModifyMeleeAttackSpeed(out float InDuration, float DefaultDuration, int upgLevel, KFWeapon KFW)
{
    InDuration = DefaultDuration / ((DefaultDuration / InDuration) + default.MeleeAttackSpeedStatic);
    InDuration = DefaultDuration / ((DefaultDuration / InDuration) + (default.MeleeAttackSpeed * upgLevel));
}

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
    InDamage -= Round(float(DefaultDamage) * default.DamageStatic);
}

defaultproperties
{
    MeleeAttackSpeed=0.10
    MeleeAttackSpeedStatic=0.750
    DamageStatic=0.250
    WeaponBonus=(incValue=10,MaxValue=-1)
    upgradeName="SWAP Ninja"
    upgradeDescription(0)="Increase <font color=\"#ff3399\">attack speed</font> by <font color=\"#ffcc00\">75%</font> (<font color=\"#66cc00\">+%x%%</font>).\nDecrease <font color=\"#ff3399\">damage dealt</font> by <font color=\"#ff0000\">25%</font>."
}