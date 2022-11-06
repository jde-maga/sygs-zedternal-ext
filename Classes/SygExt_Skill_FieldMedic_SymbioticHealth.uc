class SygExt_Skill_FieldMedic_SymbioticHealth extends WMUpgrade_Skill;

var array<float> Bonus;

static function ModifyHealth(out int InHealth, int DefaultHealth, int upgLevel)
{
	InHealth += DefaultHealth * default.Bonus[upgLevel - 1];
}

static simulated function GetSelfHealingSurgePct(out float InHealingPct, int upgLevel)
{
	InHealingPct += default.Bonus[upgLevel - 1];
}

defaultproperties
{
	Bonus(0)=0.10f
	Bonus(1)=0.25f

	upgradeName="Symbiotic Health"
    upgradeDescription(0)="> <font color=\"#66cc00\">+10</font> <font color=\"#ff3399\">health points</font>\n\nWhen you <font color=\"#ffff00\">heal a teammate</font>:\n> <font color=\"#ff3399\">Heal</font> <font color=\"#66cc00\">10% max health points</font>"
    upgradeDescription(1)="> <font color=\"#b346ea\">+25</font> <font color=\"#ff3399\">health points</font>\n\nWhen you <font color=\"#ffff00\">heal a teammate</font>:\n> <font color=\"#ff3399\">Heal</font> <font color=\"#b346ea\">25% max health points</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_SymbioticHealth'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_SymbioticHealth_Deluxe'

	Name="Default__SygExt_Skill_FieldMedic_SymbioticHealth"
}
