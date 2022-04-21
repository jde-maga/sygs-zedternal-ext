
class SygExt_WeapUpg_SWAP_HeavyShells extends WMUpgrade_Weapon
    abstract;

var float Damage;
var float DamageStatic;
var float ReloadRateStatic;

static function bool IsUpgradeCompatible(class<KFWeapon> KFW)
{
	if (class<KFWeap_Rifle_FrostShotgunAxe>(KFW) != none)
		return true;

    if(class<KFWeap_ShotgunBase>(KFW) != none)
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

static simulated function GetReloadRateScale(out float InReloadRateScale, int upgLevel, KFWeapon KFW, KFPawn OwnerPawn)
{
    InReloadRateScale = 1.f * (1.f * InReloadRateScale + default.ReloadRateStatic);
}

defaultproperties
{
    upgradeName="SWAP Heavy Shells"
    upgradeDescription(0)="Increase <font color=\"#ff3399\">damage dealt</font> by <font color=\"#ffcc00\">150%</font> (<font color=\"#66cc00\">+%x%%</font>).\nDecrease <font color=\"#ff3399\">reload speed<font color=\"#ff3399\"> by <font color=\"#ff0000\">50%</font>."
    WeaponBonus=(incValue=10,MaxValue=-1)
    Damage=0.10
    DamageStatic=1.250
    ReloadRateStatic=0.50

    Name="Default__SygExt_WeapUpg_SWAP_HeavyShells"
}