class SygExt_Skill_Berserker_Brawler extends WMUpgrade_Skill;

var array<float> Damage;

static function bool CanNotBeGrabbed(int upgLevel, KFPawn OwnerPawn)
{
	return True;
}

static function ModifyDamageTaken(out int InDamage, int DefaultDamage, int upgLevel, KFPawn OwnerPawn, optional class<DamageType> DamageType, optional Controller InstigatedBy, optional KFWeapon MyKFW)
{
	if (DamageType != None && (ClassIsChildOf(DamageType, class'KFDT_Bludgeon') || ClassIsChildOf(DamageType, class'KFDT_Piercing') || ClassIsChildOf(DamageType, class'KFDT_Slashing')))
		InDamage -= Round(float(DefaultDamage) * default.Damage[upgLevel - 1]);
}

defaultproperties
{
	Damage(0)=0.05f
	Damage(1)=0.25f

	upgradeName="Brawler"
	upgradeDescription(0)="> <font color=\"#66cc00\">Clots can't grab you\n</font>> <font color=\"#66cc00\">+5%</font> <font color=\"#ff3399\">melee damage resistance</font>"
	upgradeDescription(1)="> <font color=\"#66cc00\">Clots can't grab you\n</font>> <font color=\"#b346ea\">+25%</font> <font color=\"#ff3399\">melee damage resistance</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Brawler'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Brawler_Deluxe'

	Name="Default__WMUpgrade_Skill_Brawler"
}
