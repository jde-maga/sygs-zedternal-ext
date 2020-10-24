class Ext_SWAP_Barbarian extends WMUpgrade_Weapon
    abstract;

var float Damage;
var float DamageStatic;
var float MeleeAttackSpeedStatic;

static function bool IsUpgradeCompatible(class<KFWeapon> KFW)
{
    if(class<KFWeap_MeleeBase>(KFW) != none)
    {
        return true;
    }
    return false;
}

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
    InDamage += Round(float(DefaultDamage) + default.DamageStatic);
    InDamage += Round((float(DefaultDamage) * default.Damage) * float(upgLevel));
}

static simulated function ModifyMeleeAttackSpeed(out float InDuration, float DefaultDuration, int upgLevel, KFWeapon KFW)
{
    InDuration = DefaultDuration * ((DefaultDuration / InDuration) + default.MeleeAttackSpeedStatic);
}
defaultproperties
{
    upgradeName="SWAP Barbarian"
    upgradeDescription(0)="Increase <font color=\"#ff3399\">melee attack damage</font> by <font color=\"#ffcc00\">150%</font> (<font color=\"#66cc00\">+%x%%</font>).\nDecrease <font color=\"#ff3399\">damage dealt<font color=\"#ff3399\"> by <font color=\"#ff0000\">30%</font>."
    WeaponBonus=(incValue=10,MaxValue=-1)
    Damage=0.10
    DamageStatic=1.500
    MeleeAttackSpeedStatic=0.30
}