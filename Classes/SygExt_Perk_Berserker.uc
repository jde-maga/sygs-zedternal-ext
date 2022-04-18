Class SygExt_Perk_Berserker extends WMUpgrade_Perk;

var float AttackSpeed, BerserkerWeaponsDamage, Defense, MeleeResist, SonicResist;

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
	if (IsWeaponOnSpecificPerk(MyKFW, class'KFGame.KFPerk_Berserker') || IsDamageTypeOnSpecificPerk(DamageType, class'KFGame.KFPerk_Berserker'))
		InDamage += Round(float(DefaultDamage) * default.BerserkerWeaponsDamage * upgLevel);
}

static function ModifyDamageTaken(out int InDamage, int DefaultDamage, int upgLevel, KFPawn OwnerPawn, optional class<DamageType> DamageType, optional Controller InstigatedBy, optional KFWeapon MyKFW)
{
	if (ClassIsChildOf(DamageType, class'KFDT_Bludgeon') || ClassIsChildOf(DamageType, class'KFDT_Piercing') || ClassIsChildOf(DamageType, class'KFDT_Slashing'))
		InDamage -= Round(float(DefaultDamage) * default.MeleeResist * upgLevel);

	if (ClassIsChildOf(DamageType, class'KFDT_Sonic'))
		InDamage -= Round(float(DefaultDamage) * default.SonicResist * upgLevel);
}

static simulated function ModifyMeleeAttackSpeedPassive(out float durationFactor, int upgLevel)
{
	durationFactor = 1.0f / (1.0f / durationFactor + default.AttackSpeed * upgLevel);
}

defaultproperties
{
	AttackSpeed=0.10f
	BerserkerWeaponsDamage=0.10f
	SonicResist=0.05f
	MeleeResist=0.05f

	upgradeName="Berserker"
    upgradeDescription(0)="> <font color=\"#66cc00\">+%x%%</font> <font color=\"#ff3399\">melee damage resistance</font>"
    upgradeDescription(1)="> <font color=\"#66cc00\">+%x%%</font> <font color=\"#ff3399\">sonic damage resistance</font>"
    upgradeDescription(2)="> <font color=\"#66cc00\">+%x%%</font> <font color=\"#ff3399\">attack speed</font>"
    upgradeDescription(3)="> <font color=\"#66cc00\">+%x%%</font> <font color=\"#ff3399\">Berserker weapons damage</font>"
	PerkBonus(0)=(baseValue=0, incValue=5, maxValue=-1)
	PerkBonus(1)=(baseValue=0, incValue=5, maxValue=-1)
	PerkBonus(2)=(baseValue=0, incValue=10, maxValue=-1)
    PerkBonus(3)=(baseValue=0, incValue=10, maxValue=-1)
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Berserker_Rank_0'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Berserker_Rank_1'
	upgradeIcon(2)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Berserker_Rank_2'
	upgradeIcon(3)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Berserker_Rank_3'
	upgradeIcon(4)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Berserker_Rank_4'
	upgradeIcon(5)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Berserker_Rank_5'

	Name="Default__WMUpgrade_Perk_Berserker"
}
