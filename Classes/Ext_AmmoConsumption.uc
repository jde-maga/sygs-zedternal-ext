Class Ext_AmmoConsumption extends WMUpgrade_Weapon
	abstract;

var float RateOfFire;

// Flamme/Freeze thrower weapons are compatible
static function bool IsUpgradeCompatible( class<KFWeapon> KFW )
{
	if (class<KFWeap_AssaultRifle_LazerCutter>(KFW) != none)
		return false;
	else if (class<KFWeap_FlameBase>(KFW) != none)
		return true;

	return false;
}

static simulated function ModifyRateOfFire( out float InRate, float DefaultRate, int upgLevel, KFWeapon KFW )
{
		InRate = DefaultRate / (DefaultRate/InRate - default.RateOfFire * (upgLevel <= 10 ? upgLevel : 10));
}

defaultproperties
{
	upgradeName="Ammunition Consumption"
	upgradeDescription(0)="Decrease <font color=\"#ff3399\">ammunition consumption rate</font> by <font color=\"#66cc00\">%x%%</font>.\n<font color=\"#ff0000\">No effects</font> past level 10."
	WeaponBonus=(baseValue=0, incValue=5, maxValue=50)
	RateOfFire=0.050000
}
