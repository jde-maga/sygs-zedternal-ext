Class SygExt_WeapUpg_Heal_Alpha extends WMUpgrade_Weapon
	abstract;

var float Heal;

// Only Medic weapons are compatible
static function bool IsUpgradeCompatible( class<KFWeapon> KFW )
{
	if (class<KFWeap_MedicBase>(KFW) != none)
		return true;
	else if (class<KFWeap_HRG_Vampire>(KFW) != none)
		return true;
	else if (class<KFWeap_Rifle_HRGIncision>(KFW) != none)
		return true;
	else if (class<KFWeap_HRG_Healthrower>(KFW) != none)
		return true;
	else if (class<KFWeap_Blunt_MedicBat>(KFW) != none)
		return true;
	else if (class<KFWeap_Rifle_ParasiteImplanter>(KFW) != none)
		return true;

	return false;
}

static function ModifyHealAmount( out float InHealAmount, float DefaultHealAmount, int upgLevel)
{
	InHealAmount += DefaultHealAmount * default.Heal * upgLevel;
}

defaultproperties
{
	upgradeName="Alpha Heal Potency"
	upgradeDescription(0)="Increase <font color=\"#ff3399\">healing potency</font> of this weapon by <font color=\"#66cc00\">%x%%</font>."
	WeaponBonus=(baseValue=0, incValue=30, maxValue=-1)
	Heal=0.300000
}
