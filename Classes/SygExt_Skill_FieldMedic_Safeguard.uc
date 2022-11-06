class SygExt_Skill_FieldMedic_Safeguard extends WMUpgrade_Skill;

var array<float> Bonus, HealAmountBonus;

static function ModifyHealAmountPassive(out float healAmountFactor, int upgLevel)
{
	healAmountFactor += default.HealAmountBonus[upgLevel - 1];
}

static simulated function ModifyHealerRechargeTime(out float InRechargeTime, float DefaultRechargeTime, int upgLevel)
{
	InRechargeTime = DefaultRechargeTime / (DefaultRechargeTime / InRechargeTime + default.Bonus[upgLevel - 1]);
}

defaultproperties
{
	HealAmountBonus(0)=1.00f
	HealAmountBonus(1)=50.00f
	Bonus(0)=2.00f
	Bonus(1)=50.00f

	upgradeName="Safeguard"
    upgradeDescription(0)="> <font color=\"#66cc00\">+200%</font> <font color=\"#ff3399\">syringe recharge rate</font>\n> <font color=\"#66cc00\">+100%</font> <font color=\"#ff3399\">syringe healing</font>"
    upgradeDescription(1)="> <font color=\"#b346ea\">+5000%</font> <font color=\"#ff3399\">syringe recharge rate</font>\n> <font color=\"#b346ea\">+5000%</font> <font color=\"#ff3399\">syringe healing</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Safeguard'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Safeguard_Deluxe'

	Name="Default__SygExt_Skill_FieldMedic_Safeguard"
}
