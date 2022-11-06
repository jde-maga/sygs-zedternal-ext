class SygExt_Skill_FieldMedic_FocusInjection extends WMUpgrade_Skill;

var array<byte> MaxDamageBoost, MaxDamageResist;
var byte DamageBoost, DamageResist;

static simulated function GetHealingDamageBoost(out byte InHealingDamageBoost, int upgLevel)
{
	InHealingDamageBoost = default.DamageBoost;
}

static simulated function GetMaxHealingDamageBoost(out byte InMaxHealingDamageBoost, int upgLevel)
{
	InMaxHealingDamageBoost = default.MaxDamageBoost[upgLevel - 1];
}

static simulated function GetHealingShield(out byte InHealingShield, int upgLevel)
{
	InHealingShield = default.damageResist;
}

static simulated function GetMaxHealingShield(out byte InMaxHealingShield, int upgLevel)
{
	InMaxHealingShield = default.MaxDamageResist[upgLevel - 1];
}

defaultproperties
{
    DamageBoost=5
    DamageResist=1
    MaxDamageBoost(0)=35
    MaxDamageBoost(1)=75
    MaxDamageResist(0)=5
    MaxDamageResist(1)=10

	upgradeName="Focus Injection"
    upgradeDescription(0)="When <font color=\"#ffff00\">healing a teammate</font>:\n> <font color=\"#66cc00\">+5%</font> <font color=\"#ff3399\">teammate damage</font>, up to <font color=\"#66cc00\">35%</font>\n> <font color=\"#66cc00\">+1%</font> <font color=\"#ff3399\">teammate damage resist</font>, up to <font color=\"#66cc00\">5%</font>"
    upgradeDescription(1)="When <font color=\"#ffff00\">healing a teammate</font>:\n> <font color=\"#66cc00\">+5%</font> <font color=\"#ff3399\">teammate damage</font>, up to <font color=\"#b346ea\">75%</font>\n> <font color=\"#66cc00\">+1%</font> <font color=\"#ff3399\">teammate damage resist</font>, up to <font color=\"#b346ea\">10%</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_FocusInjection'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_FocusInjection_Deluxe'

	Name="Default__SygExt_Skill_FieldMedic_FocusInjection"
}
