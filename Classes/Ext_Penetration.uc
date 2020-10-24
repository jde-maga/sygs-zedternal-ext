Class Ext_Penetration extends WMUpgrade_Weapon
	abstract;

var float Penetration;

// weapons with penetration power are compatible
static function bool IsUpgradeCompatible( class<KFWeapon> KFW )
{
	if (KFW.default.PenetrationPower[0] > 0)
		return true;

	return false;
}

static simulated function ModifyPenetration( out float InPenetration, float DefaultPenetration, int upgLevel, class<KFDamageType> DamageType, KFPawn OwnerPawn, optional bool bForce)
{
	InPenetration += DefaultPenetration * default.Penetration * upgLevel;
}

defaultproperties
{
	upgradeName="Penetration"
	upgradeDescription(0)="Increase <font color=\"#ff3399\">penetration power</font> of this weapon by <font color=\"#66cc00\">%x%%</font>."
	WeaponBonus=(baseValue=0, incValue=50, maxValue=-1)
	Penetration=0.500000
}
