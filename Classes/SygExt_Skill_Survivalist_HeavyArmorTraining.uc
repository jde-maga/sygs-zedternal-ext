class SygExt_Skill_Survivalist_HeavyArmorTraining extends WMUpgrade_Skill;

var array<int> Armor;

static function bool CanNotBeGrabbed(int upgLevel, KFPawn OwnerPawn)
{
	if (KFPawn_Human(OwnerPawn) != None && KFPawn_Human(OwnerPawn).Armor > 0)
		return True;
	else
		return False;
}

static function ModifyArmor(out int MaxArmor, int DefaultArmor, int upgLevel)
{
    MaxArmor += default.Armor[upgLevel - 1];
}

defaultproperties
{
	Armor(0)=20
	Armor(1)=50

	upgradeName="Heavy Armor Training"
    upgradeDescription(0)="> <font color=\"#66cc00\">+20</font> <font color=\"#ff3399\">max armor</font>\n> <font color=\"#66cc00\">Clots can't grab you</font>"
    upgradeDescription(1)="> <font color=\"#b346ea\">+50</font> <font color=\"#ff3399\">max armor</font>\n> <font color=\"#66cc00\">Clots can't grab you</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_TacticalArmor'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_TacticalArmor_Deluxe'

	Name="Default__SygExt_Skill_Survivalist_HeavyArmorTraining"
}
