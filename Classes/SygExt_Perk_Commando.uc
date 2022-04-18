Class SygExt_Perk_Commando extends WMUpgrade_Perk;

var float CommandoWeaponsDamage, ReloadRate, ZedTimeExtension, BallisticDamage;

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
	if (IsWeaponOnSpecificPerk(MyKFW, class'KFGame.KFPerk_Commando') || IsDamageTypeOnSpecificPerk(DamageType, class'KFGame.KFPerk_Commando'))
		InDamage += Round(float(DefaultDamage) * default.CommandoWeaponsDamage * upgLevel);

	if (ClassIsChildOf(DamageType, class'KFDT_Ballistic'))
		InDamage += Round(float(DefaultDamage) * default.BallisticDamage * upgLevel);
}

static simulated function GetReloadRateScalePassive(out float reloadRateFactor, int upgLevel)
{
	reloadRateFactor = 1.0f / (1.0f / reloadRateFactor + default.ReloadRate * upgLevel);
}

static simulated function GetZedTimeExtension(out float InExtension, float DefaultExtension, int upgLevel)
{
	InExtension += default.ZedTimeExtension * upgLevel;
}

defaultproperties
{
	CommandoWeaponsDamage=0.10f
	ReloadRate=0.20f
    ZedTimeExtension=1.00f
    BallisticDamage=0.10f

	upgradeName="Commando"
    upgradeDescription(0)="> <font color=\"#66cc00\">+%x%</font> <font color=\"#ff3399\">ZED time extension</font>"
    upgradeDescription(1)="> <font color=\"#66cc00\">+%x%%</font> <font color=\"#ff3399\">reload speed</font>"
    upgradeDescription(2)="> <font color=\"#66cc00\">+%x%%</font> <font color=\"#ff3399\">ballistic damage</font>"
    upgradeDescription(3)="> <font color=\"#66cc00\">+%x%%</font> <font color=\"#ff3399\">Commando weapons damage</font>"
	PerkBonus(0)=(baseValue=0, incValue=1, maxValue=-1)
	PerkBonus(1)=(baseValue=0, incValue=20, maxValue=-1)
	PerkBonus(2)=(baseValue=0, incValue=10, maxValue=-1)
	PerkBonus(3)=(baseValue=0, incValue=10, maxValue=-1)
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Commando_Rank_0'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Commando_Rank_1'
	upgradeIcon(2)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Commando_Rank_2'
	upgradeIcon(3)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Commando_Rank_3'
	upgradeIcon(4)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Commando_Rank_4'
	upgradeIcon(5)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Commando_Rank_5'

	Name="Default__WMUpgrade_Perk_Commando"
}
