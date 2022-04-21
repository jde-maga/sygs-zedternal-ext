class SygExt_WeapUpg_SWAP_Militia extends WMUpgrade_Weapon
    abstract;

var float rateOfFire;
var float RateOfFireStatic;
var float RecoilStatic;

static function bool IsUpgradeCompatible(class<KFWeapon> KFW)
{
	if (class<KFWeap_Pistol_Bladed>(KFW) != none)
		return false;
	else if (class<KFWeap_Pistol_DualBladed>(KFW) != none)
		return false;
	else if (class<KFWeap_Rifle_MosinNagant>(KFW) != none)
		return false;
	else if (class<KFWeap_Rifle_FrostShotgunAxe>(KFW) != none)
		return false;
    else if(class<KFWeap_PistolBase>(KFW) != none)
        return true;
    else if(class<KFWeap_RifleBase>(KFW) != none)
        return true;
    else if (class<KFWeap_SMGBase>(KFW) != none)
        return true;
    else if(class<KFWeap_ScopedBase>(KFW) != none)
        return true;
    else if(class<KFWeap_MedicBase>(KFW) != none)
        return true;

    return false;
}

static simulated function ModifyRateOfFire(out float InRate, float DefaultRate, int upgLevel, KFWeapon KFW)
{
    InRate = DefaultRate / ((DefaultRate / InRate) + default.RateOfFireStatic);
    InRate = DefaultRate / ((DefaultRate / InRate) + (default.rateOfFire * upgLevel));
}

static simulated function ModifyRecoil(out float InRecoilModifier, float DefaultRecoilModifier, int upgLevel, KFWeapon KFW)
{
    InRecoilModifier += (DefaultRecoilModifier * default.RecoilStatic);
}

defaultproperties
{
    rateOfFire=0.10
    RateOfFireStatic=1.0
    RecoilStatic=0.50
    WeaponBonus=(incValue=10,MaxValue=-1)
    upgradeName="SWAP Militia"
    upgradeDescription(0)="Increase <font color=\"#ff3399\">rate of fire</font> by <font color=\"#ffcc00\">100%</font> (<font color=\"#66cc00\">+%x%%</font>).\nIncrease <font color=\"#ff3399\">recoil</font> by <font color=\"#ff0000\">50%</font>."

    Name="Default__SygExt_WeapUpg_SWAP_Militia"
}