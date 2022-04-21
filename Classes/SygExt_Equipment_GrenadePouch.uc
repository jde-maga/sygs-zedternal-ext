class SygExt_Equipment_GrenadePouch extends WMUpgrade_Equipment;

var int ExtraGrenades;

static simulated function ModifySpareGrenadeAmount(out int SpareGrenade, int DefaultSpareGrenade, int upgLevel)
{
	SpareGrenade += default.ExtraGrenades * upgLevel;
}

defaultproperties
{
    ExtraGrenades=1
	upgradeName="Grenade pouch"
	upgradeDescription(0)="Increases your grenade count by 1 per level."
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Bombardier'
	EquipmentBonus(0)=(baseValue=0, incValue=1, maxValue=5)

	Name="Default__SygExt_Equipment_GrenadePouch"
}
