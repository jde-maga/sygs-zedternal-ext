Class SygExt_WeapUpg_HardMeleeAttack extends WMUpgrade_Weapon
	abstract;

var float Damage;

// Only Melee weapons are compatible
static function bool IsUpgradeCompatible( class<KFWeapon> KFW )
{
	if (class<KFWeap_Rifle_MosinNagant>(KFW) != none)
		return false;
	else if (class<KFWeap_Rifle_FrostShotgunAxe>(KFW) != none)
		return false;
	else if (class<KFWeap_Pistol_Bladed>(KFW) != none)
		return false;
	else if (class<KFWeap_Pistol_DualBladed>(KFW) != none)
		return false;
	else if (class<KFWeap_MeleeBase>(KFW) != none)
		return true;

	return false;
}

static function ModifyHardAttackDamage( out int InDamage, int DefaultDamage, int upgLevel, KFPawn OwnerPawn)
{
	InDamage += Round(float(DefaultDamage) * default.Damage * upgLevel);
}

defaultproperties
{
	upgradeName="Hard Melee Attack Damage"
	upgradeDescription(0)="Increase <font color=\"#ff3399\">hard melee attack damage</font> dealt with this weapon by <font color=\"#66cc00\">%x%%</font>."
	WeaponBonus=(baseValue=0, incValue=10, maxValue=-1)
	Damage=0.100000

	Name="Default__SygExt_WeapUpg_HardMeleeAttack"
}
