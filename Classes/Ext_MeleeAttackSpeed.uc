Class Ext_MeleeAttackSpeed extends WMUpgrade_Weapon
	abstract;

var float MeleeAttackSpeed;

// Only Melee weapons are compatible
static function bool IsUpgradeCompatible( class<KFWeapon> KFW )
{
	if (class<KFWeap_MeleeBase>(KFW) != none)
		return true;
	else if (class<KFWeap_Bow_CompoundBow>(KFW) != none)
		return true;

	return false;
}

static simulated function ModifyMeleeAttackSpeed( out float InDuration, float DefaultDuration, int upgLevel, KFWeapon KFW)
{
	InDuration = DefaultDuration / (DefaultDuration/InDuration + default.MeleeAttackSpeed * upgLevel);
}

defaultproperties
{
	upgradeName="Melee Attack Speed"
	upgradeDescription(0)="Increase <font color=\"#ff3399\">attack speed</font> by <font color=\"#66cc00\">%x%%</font> with this weapon."
	WeaponBonus=(baseValue=0, incValue=10, maxValue=-1)
	MeleeAttackSpeed=0.100000
}