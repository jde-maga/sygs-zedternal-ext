Class SygExt_Perk_Demolitionist extends WMUpgrade_Perk;

var float DemolitionistWeaponsDamage, GrenadeDamage, SpareGrenades, ExplosiveResist;

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
	if (IsWeaponOnSpecificPerk(MyKFW, class'KFGame.KFPerk_Demolitionist') || IsDamageTypeOnSpecificPerk(DamageType, class'KFGame.KFPerk_Demolitionist'))
		InDamage += Round(float(DefaultDamage) * default.DemolitionistWeaponsDamage * upgLevel);

	if (DamageType != None && static.IsGrenadeDT(DamageType))
		InDamage += Round(float(DefaultDamage) * default.GrenadeDamage * upgLevel);
}

static simulated function ModifySpareGrenadeAmount(out int SpareGrenade, int DefaultSpareGrenade, int upgLevel)
{
	SpareGrenade += default.SpareGrenades * upgLevel;
}

static function ModifyDamageTaken(out int InDamage, int DefaultDamage, int upgLevel, KFPawn OwnerPawn, optional class<DamageType> DamageType, optional Controller InstigatedBy, optional KFWeapon MyKFW)
{
	if (ClassIsChildOf(DamageType, class'KFDT_Explosive'))
		InDamage -= Round(float(DefaultDamage) * (default.ExplosiveResist * upgLevel));
}

defaultproperties
{
	DemolitionistWeaponsDamage=0.10f
	GrenadeDamage=0.20f
	SpareGrenades=1.00f
    ExplosiveResist=0.05f

	upgradeName="Demolitionist"
    upgradeDescription(0)="> <font color=\"#66cc00\">+%x%%</font> <font color=\"#ff3399\">grenade damage</font>"
    upgradeDescription(1)="> <font color=\"#66cc00\">+%x%</font> <font color=\"#ff3399\">grenades</font>"
    upgradeDescription(2)="> <font color=\"#66cc00\">+%x%%</font> <font color=\"#ff3399\">explosive damage resistance</font>"
    upgradeDescription(3)="> <font color=\"#66cc00\">+%x%%</font> <font color=\"#ff3399\">Demolitionist weapons damage</font>"
	PerkBonus(0)=(baseValue=0, incValue=20, maxValue=-1)
	PerkBonus(1)=(baseValue=0, incValue=1, maxValue=-1)
	PerkBonus(2)=(baseValue=0, incValue=5, maxValue=-1)
    PerkBonus(3)=(baseValue=0, incValue=10, maxValue=-1)
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Demolition_Rank_0'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Demolition_Rank_1'
	upgradeIcon(2)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Demolition_Rank_2'
	upgradeIcon(3)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Demolition_Rank_3'
	upgradeIcon(4)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Demolition_Rank_4'
	upgradeIcon(5)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Demolition_Rank_5'

	Name="Default__SygExt_Perk_Demolitionist"
}
