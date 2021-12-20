class SygExt_Skill_Berserker_Vampire extends WMUpgrade_Skill;

var array<int> MeleeVampire, WeapVampire;

static function AddVampireHealth(out int InHealth, int DefaultHealth, int upgLevel, KFPlayerController KFPC, class<DamageType> DT)
{
	if (DT != None && static.IsMeleeDamageType(DT))
		InHealth += default.MeleeVampire[upgLevel - 1];
	else
		InHealth += default.WeapVampire[upgLevel - 1];
}

defaultproperties
{
	MeleeVampire(0)=3
	MeleeVampire(1)=8
	WeapVampire(0)=2
	WeapVampire(1)=5

	upgradeName="Vampire"
	upgradeDescription(0)="When you <font color=\"#ffff00\">kill a ZED</font>:\n> Heal <font color=\"#66cc00\">3</font> <font color=\"#ff3399\">health points</font> with a melee weapon\n> Heal <font color=\"#66cc00\">2</font> <font color=\"#ff3399\">health points</font> with a ranged weapon"
	upgradeDescription(1)="When you <font color=\"#ffff00\">kill a ZED</font>:\n> Heal <font color=\"#b346ea\">8</font> <font color=\"#ff3399\">health points</font> with a melee weapon\n> Heal <font color=\"#b346ea\">5</font> <font color=\"#ff3399\">health points</font> with any other weapon"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Vampire'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Vampire_Deluxe'

	Name="Default__WMUpgrade_Skill_Vampire"
}
