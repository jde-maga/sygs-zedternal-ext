class SygExt_Skill_Support_Supplier extends WMUpgrade_Skill;

var array<float> MaxAmmo;
var array<float> SupplierAmmo;

static simulated function bool IsSupplierActive(int upgLevel)
{
	return True;
}

static simulated function SupplierModifiers(int upgLevel, out float PrimaryAmmoPercentage, out float SecondaryAmmoPercentage, out float ArmorPercentage, out int GrenadeAmount)
{
	PrimaryAmmoPercentage += default.SupplierAmmo[upgLevel - 1];
	SecondaryAmmoPercentage += default.SupplierAmmo[upgLevel -1];
}

static simulated function ModifySpareAmmoAmountPassive(out float spareAmmoFactor, int upgLevel)
{
	spareAmmoFactor += default.MaxAmmo[upgLevel - 1];
}

defaultproperties
{
	MaxAmmo(0)=0.3f
	MaxAmmo(1)=0.75f
    SupplierAmmo(0)=0.3f
    SupplierAmmo(1)=1.0f

	upgradeName="Supplier"
    upgradeDescription(0)="> <font color=\"#66cc00\">+30%</font> <font color=\"#ff3399\">ammo</font>\n> Teammates can <font color=\"#ffff00\">resupply</font> for <font color=\"#66cc00\">30%</font> of their <font color=\"#ff3399\">ammo</font>"
    upgradeDescription(1)="> <font color=\"#b346ea\">+75%</font> <font color=\"#ff3399\">ammo</font>\n> Teammates can <font color=\"#ffff00\">resupply</font> for <font color=\"#b346ea\">100%</font> of their <font color=\"#ff3399\">ammo</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Supplier'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Supplier_Deluxe'

	Name="Default__SygExt_Skill_Support_Supplier"
}
