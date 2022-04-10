class SygExt_Skill_SWAT_RiotShield extends WMUpgrade_Skill;

var array<float> Damage, OtherDamage;

static function ModifyDamageTaken(out int InDamage, int DefaultDamage, int upgLevel, KFPawn OwnerPawn, optional class<DamageType> DamageType, optional Controller InstigatedBy, optional KFWeapon MyKFW)
{
	if (ClassIsChildOf(Damagetype, class'KFDT_Ballistic'))
		InDamage -= Round(float(DefaultDamage) * default.Damage[upgLevel - 1]);
	else
		InDamage -= Round(float(DefaultDamage) * default.OtherDamage[upgLevel - 1]);
}

defaultproperties
{
	Damage(0)=0.5f
	Damage(1)=0.9f
	OtherDamage(0)=0.05f
	OtherDamage(1)=0.1f

	upgradeName="Riot Shield"
	upgradeDescription(0)="> <font color=\"#66cc00\">+50%</font> <font color=\"#ff3399\">projectile resistance</font>\n> <font color=\"#66cc00\">+5%</font> <font color=\"#ff3399\">other damage resistances</font>"
	upgradeDescription(1)="> <font color=\"#b346ea\">+90%</font> <font color=\"#ff3399\">projectile resistance</font>\n> <font color=\"#b346ea\">+10%</font> <font color=\"#ff3399\">other damage resistances</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_RiotShield'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_RiotShield_Deluxe'

	Name="Default__WMUpgrade_Skill_RiotShield"
}
