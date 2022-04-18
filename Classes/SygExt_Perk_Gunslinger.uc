Class SygExt_Perk_Gunslinger extends WMUpgrade_Perk;

var float GunslingerWeaponsDamage, MoveSpeed, SwitchSpeed, FireRate;

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
	if (IsWeaponOnSpecificPerk(MyKFW, class'KFGame.KFPerk_Gunslinger') || IsDamageTypeOnSpecificPerk(DamageType, class'KFGame.KFPerk_Gunslinger'))
		InDamage += Round(float(DefaultDamage) * default.GunslingerWeaponsDamage * upgLevel);
}

static simulated function ModifySpeedPassive(out float speedFactor, int upgLevel)
{
	speedFactor += default.MoveSpeed * upgLevel;
}

static simulated function ModifyWeaponSwitchTimePassive(out float switchTimeFactor, int upgLevel)
{
	switchTimeFactor = 1.0f / (1.0f / switchTimeFactor + default.SwitchSpeed);
}

static simulated function ModifyRateOfFirePassive(out float rateOfFireFactor, int upgLevel)
{
	rateOfFireFactor = 1.0f / (1.0f / rateOfFireFactor + default.FireRate * upgLevel);
}

defaultproperties
{
	GunslingerWeaponsDamage=0.10f
	MoveSpeed=0.05f
	SwitchSpeed=0.25f
    FireRate=0.10f

	upgradeName="Gunslinger"
    upgradeDescription(0)="> <font color=\"#66cc00\">+%x%%</font> <font color=\"#ff3399\">movement speed</font>"
    upgradeDescription(1)="> <font color=\"#66cc00\">+%x%%</font> <font color=\"#ff3399\">switch speed</font>"
    upgradeDescription(2)="> <font color=\"#66cc00\">+%x%%</font> <font color=\"#ff3399\">fire rate</font>"
    upgradeDescription(3)="> <font color=\"#66cc00\">+%x%%</font> <font color=\"#ff3399\">Gunslinger weapons damage</font>"
	PerkBonus(0)=(baseValue=0, incValue=5, maxValue=-1)
	PerkBonus(1)=(baseValue=0, incValue=25, maxValue=-1)
	PerkBonus(2)=(baseValue=0, incValue=10, maxValue=-1)
    PerkBonus(3)=(baseValue=0, incValue=10, maxValue=-1)
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Gunslinger_Rank_0'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Gunslinger_Rank_1'
	upgradeIcon(2)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Gunslinger_Rank_2'
	upgradeIcon(3)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Gunslinger_Rank_3'
	upgradeIcon(4)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Gunslinger_Rank_4'
	upgradeIcon(5)=Texture2D'ZedternalReborn_Resource.Perks.UI_Perk_Gunslinger_Rank_5'

	Name="Default__WMUpgrade_Perk_Gunslinger"
}
