class SygExt_Skill_FieldMedic_CoagulantBooster extends WMUpgrade_Skill;

var array<float> Resistance;

static function ModifyDamageTaken(out int InDamage, int DefaultDamage, int upgLevel, KFPawn OwnerPawn, optional class<DamageType> DamageType, optional Controller InstigatedBy, optional KFWeapon MyKFW)
{
	if (OwnerPawn != None)
		InDamage -= Round(float(DefaultDamage) * (float(OwnerPawn.HealthMax - OwnerPawn.Health)/float(OwnerPawn.HealthMax) * 100.00f) * default.Resistance[upgLevel - 1]);
}

defaultproperties
{
	Resistance(0)=0.001f
	Resistance(1)=0.002f

	upgradeName="Coagulant Booster"
    upgradeDescription(0)="For each <font color=\"#ffff00\">percent of health missing</font>:\n> <font color=\"#66cc00\">+0.10%</font> <font color=\"#ff3399\">damage resistance</font>"
    upgradeDescription(1)="For each <font color=\"#ffff00\">percent of health missing</font>:\n> <font color=\"#b346ea\">+0.20%</font> <font color=\"#ff3399\">damage resistance</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_CoagulantBooster'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_CoagulantBooster_Deluxe'

	Name="Default__SygExt_Skill_FieldMedic_CoagulantBooster"
}
