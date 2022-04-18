Class SygExt_Perk_FieldMedic extends WMUpgrade_Perk;

var float FieldMedicWeaponsDamage, Health, HealRate, BileResist;

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
	if (IsWeaponOnSpecificPerk(MyKFW, class'KFGame.KFPerk_FieldMedic') || IsDamageTypeOnSpecificPerk(DamageType, class'KFGame.KFPerk_FieldMedic'))
		InDamage += Round(float(DefaultDamage) * default.FieldMedicWeaponsDamage * upgLevel);
}

static function ModifyHealth(out int InHealth, int DefaultHealth, int upgLevel)
{
	InHealth += Round(float(DefaultHealth) * FMin(default.Health * upgLevel, 0.5f));
}

static simulated function ModifyHealerRechargeTime(out float InRechargeTime, float DefaultRechargeTime, int upgLevel)
{
	InRechargeTime = DefaultRechargeTime / (DefaultRechargeTime / InRechargeTime + default.HealRate * upgLevel);
}

static function ModifyDamageTaken(out int InDamage, int DefaultDamage, int upgLevel, KFPawn OwnerPawn, optional class<DamageType> DamageType, optional Controller InstigatedBy, optional KFWeapon MyKFW)
{
	if (ClassIsChildOf(DamageType, class'KFDT_Toxic'))
		InDamage -= Round(float(DefaultDamage) * (default.BileResist * upgLevel));
}

defaultproperties
{
	FieldMedicWeaponsDamage=0.10f
	Health=0.05f
	HealRate=0.2f
    BileResist=0.05f

	upgradeName="Field Medic"
    upgradeDescription(0)="> <font color=\"#66cc00\">+%x%</font> <font color=\"#ff3399\">max health</font>"
    upgradeDescription(1)="> <font color=\"#66cc00\">+%x%%</font> <font color=\"#ff3399\">healing recharge rate</font>"
    upgradeDescription(2)="> <font color=\"#66cc00\">+%x%%</font> <font color=\"#ff3399\">bile damage resistance</font>"
    upgradeDescription(3)="> <font color=\"#66cc00\">+%x%%</font> <font color=\"#ff3399\">Field Medic weapons damage</font>"
	PerkBonus(0)=(baseValue=0, incValue=5, maxValue=-1)
	PerkBonus(1)=(baseValue=0, incValue=20, maxValue=-1)
	PerkBonus(2)=(baseValue=0, incValue=5, maxValue=-1)
    PerkBonus(3)=(baseValue=0, incValue=10, maxValue=-1)
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Medic_Rank_0'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Medic_Rank_1'
	upgradeIcon(2)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Medic_Rank_2'
	upgradeIcon(3)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Medic_Rank_3'
	upgradeIcon(4)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Medic_Rank_4'
	upgradeIcon(5)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Medic_Rank_5'

	Name="Default__WMUpgrade_Perk_FieldMedic"
}
