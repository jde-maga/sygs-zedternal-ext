Class SygExt_Perk_Firebug extends WMUpgrade_Perk;

var float FirebugWeaponsDamage, FireResist, DotDuration, DotDamage;

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
	if (IsWeaponOnSpecificPerk(MyKFW, class'KFGame.KFPerk_Firebug') || IsDamageTypeOnSpecificPerk(DamageType, class'KFGame.KFPerk_Firebug'))
		InDamage += Round(float(DefaultDamage) * default.FirebugWeaponsDamage * upgLevel);

    if (DamageType != None && (ClassIsChildOf(DamageType, class'KFDT_Fire') || ClassIsChildOf(DamageType, class'KFDT_Toxic') || ClassIsChildOf(DamageType, class'KFDT_Bleeding')))
		InDamage += Round(float(DefaultDamage) * (default.DoTDamage * upgLevel));
}

static function ModifyDamageTaken(out int InDamage, int DefaultDamage, int upgLevel, KFPawn OwnerPawn, optional class<DamageType> DamageType, optional Controller InstigatedBy, optional KFWeapon MyKFW)
{
	if (ClassIsChildOf(DamageType, class'KFDT_Fire'))
		InDamage -= Round(float(DefaultDamage) * (default.FireResist * upgLevel));
}

static function ModifyDoTScaler(out float InDoTScaler, float DefaultDotScaler, int upgLevel, optional class<KFDamageType> KFDT, optional bool bNapalmInfected)
{
	InDoTScaler += DefaultDotScaler * (default.DotDuration * upgLevel);
}

defaultproperties
{
	FireResist=0.05f
	FirebugWeaponsDamage=0.10f
	DotDuration=0.20f
    DoTDamage=0.10f

	upgradeName="FireBug"
    upgradeDescription(0)="> <font color=\"#66cc00\">+%x%%</font> <font color=\"#ff3399\">damage over time damage</font>"
    upgradeDescription(1)="> <font color=\"#66cc00\">+%x%%</font> <font color=\"#ff3399\">damage over time duration</font>"
    upgradeDescription(2)="> <font color=\"#66cc00\">+%x%%</font> <font color=\"#ff3399\">fire resistance</font>"
    upgradeDescription(3)="> <font color=\"#66cc00\">+%x%%</font> <font color=\"#ff3399\">Firebug weapons damage</font>"
	PerkBonus(0)=(baseValue=0, incValue=10, maxValue=-1)
	PerkBonus(1)=(baseValue=0, incValue=20, maxValue=-1)
	PerkBonus(2)=(baseValue=0, incValue=5, maxValue=-1)
    PerkBonus(3)=(baseValue=0, incValue=10, maxValue=-1)
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Firebug_Rank_0'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Firebug_Rank_1'
	upgradeIcon(2)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Firebug_Rank_2'
	upgradeIcon(3)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Firebug_Rank_3'
	upgradeIcon(4)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Firebug_Rank_4'
	upgradeIcon(5)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Firebug_Rank_5'

	Name="Default__WMUpgrade_Perk_Firebug"
}
