Class Ext_DamageTaken_Alpha extends WMUpgrade_Weapon
	abstract;

var float Damage;

// Only Melee weapons are compatible
static function bool IsUpgradeCompatible( class<KFWeapon> KFW )
{
	if (class<KFWeap_MeleeBase>(KFW) != none)
		return true;
	else if (class<KFWeap_Bow_CompoundBow>(KFW) != none)
		return true;
	else if (class<KFWeap_SMG_G18>(KFW) != none)
		return true;

	return false;
}

static function ModifyDamageTaken( out int InDamage, int DefaultDamage, int upgLevel, KFPawn OwnerPawn, optional class<DamageType> DamageType, optional Controller InstigatedBy, optional KFWeapon MyKFW)
{
	InDamage -= Round(float(DefaultDamage) * default.Damage * upgLevel);
}

defaultproperties
{
	upgradeName="Alpha Damage Taken"
	upgradeDescription(0)="Increase <font color=\"#ff3399\">damage resistance</font> by <font color=\"#66cc00\">%x%%</font> while holding this weapon.\n<font color=\"#ff0000\">No effects</font> past level 5."
	WeaponBonus=(baseValue=0, incValue=5, maxValue=25)
	Damage=0.050000
}
