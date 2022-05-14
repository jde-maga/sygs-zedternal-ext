class Sygext_Skill_Commando_Guerilla extends WMUpgrade_Skill;

var array<float> DamageBonus;
var array<int> HealthBonus;

static function ModifyDamageGivenPassive(out float damageFactor, int upgLevel)
{
	damageFactor += default.DamageBonus[upgLevel - 1];
}

static function ModifyHealth(out int InHealth, int DefaultHealth, int upgLevel)
{
    InHealth += default.HealthBonus[upgLevel - 1];
}

defaultproperties
{
    DamageBonus(0)=0.20f;
    DamageBonus(1)=0.40f;
    HealthBonus(0)=10;
    HealthBonus(1)=25;

	upgradeName="Guerilla"
    upgradeDescription(0)="> <font color=\"#66cc00\">+20%</font> <font color=\"#ff3399\">damage</font>\n> <font color=\"#66cc00\">+10</font> <font color=\"#ff3399\">health points</font>"
    upgradeDescription(1)="> <font color=\"#b346ea\">+40%</font> <font color=\"#ff3399\">damage</font>\n> <font color=\"#b346ea\">+25</font> <font color=\"#ff3399\">health points</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Guerrilla'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Guerrilla_Deluxe'

	Name="Default__Sygext_Skill_Commando_Guerilla"
}
