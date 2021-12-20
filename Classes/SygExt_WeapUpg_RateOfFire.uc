Class SygExt_WeapUpg_RateOfFire extends WMUpgrade_Weapon
	abstract;

var float RateOfFire;

// Revolvers, Shotgun, Rifle, SMG and Medic weapons are compatible
static function bool IsUpgradeCompatible( class<KFWeapon> KFW )
{
	if (class<KFWeap_Pistol_Blunderbuss>(KFW) != none)
		return false;
	else if (class<KFWeap_Rifle_MosinNagant>(KFW) != none)
		return true;
	else if (class<KFWeap_Rifle_FrostShotgunAxe>(KFW) != none)
		return true;
	else if (class<KFWeap_Pistol_Bladed>(KFW) != none)
		return true;
	else if (class<KFWeap_Pistol_DualBladed>(KFW) != none)
		return true;
	else if (class<KFWeap_PistolBase>(KFW) != none)
		return true;
	else if (class<KFWeap_ShotgunBase>(KFW) != none && class<KFWeap_Shotgun_DoubleBarrel>(KFW) == none)
		return true;
	else if (class<KFWeap_RifleBase>(KFW) != none)
		return true;
	else if (class<KFWeap_SMGBase>(KFW) != none)
		return true;
	else if (class<KFWeap_MedicBase>(KFW) != none)
		return true;

	return false;
}
static simulated function ModifyRateOfFire( out float InRate, float DefaultRate, int upgLevel, KFWeapon KFW )
{
	InRate = DefaultRate / (DefaultRate/InRate + default.RateOfFire * upgLevel);
}

defaultproperties
{
	upgradeName="Rate Of Fire"
	upgradeDescription(0)="Increase <font color=\"#ff3399\">rate of fire</font> of this weapon by <font color=\"#66cc00\">%x%%</font>."
	WeaponBonus=(baseValue=0, incValue=10, maxValue=-1)
	RateOfFire=0.100000
}
