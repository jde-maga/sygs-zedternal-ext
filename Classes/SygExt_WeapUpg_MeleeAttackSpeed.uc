Class SygExt_WeapUpg_MeleeAttackSpeed extends WMUpgrade_Weapon
	abstract;

var float MeleeAttackSpeed;

// Only Melee weapons are compatible
static function bool IsUpgradeCompatible( class<KFWeapon> KFW )
{
	if (class<KFWeap_Pistol_Bladed>(KFW) != none)
		return false;
	else if (class<KFWeap_Pistol_DualBladed>(KFW) != none)
		return false;
	else if (class<KFWeap_Rifle_MosinNagant>(KFW) != none)
		return false;
	else if (class<KFWeap_Rifle_FrostShotgunAxe>(KFW) != none)
		return false;
	else if (class<KFWeap_MeleeBase>(KFW) != none)
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

	Name="Default__SygExt_WeapUpg_MeleeAttackSpeed"
}