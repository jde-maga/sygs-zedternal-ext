Class Ext_SpareAmmo_Alpha extends WMUpgrade_Weapon
	abstract;

var float SpareAmmo;

// large spare ammo weapons are compatible
static function bool IsUpgradeCompatible( class<KFWeapon> KFW )
{
	if (KFW.default.SpareAmmoCapacity[0] >= 7)
		return true;

	return false;
}

static simulated function ModifySpareAmmoAmount( out int InSpareAmmo, int DefaultSpareAmmo, int upgLevel, KFWeapon KFW, optional const out STraderItem TraderItem, optional bool bSecondary=false )
{
	if (!bSecondary)
		InSpareAmmo += Round(float(DefaultSpareAmmo) * default.SpareAmmo * upgLevel);
}

defaultproperties
{
	upgradeName="Alpha Spare Ammo"
	upgradeDescription(0)="Carry up to <font color=\"#66cc00\">%x%%</font> <font color=\"#ff3399\">more ammo</font> for this weapon."
	WeaponBonus=(baseValue=0, incValue=20, maxValue=-1)
	SpareAmmo=0.200000
}
