class SygExt_Skill_Sharpshooter_Hunter extends WMUpgrade_Skill;

var array<int> Vampire;

static function ModifyDamageGiven(out int InDamage, int DefaultDamage, int upgLevel, optional Actor DamageCauser, optional KFPawn_Monster MyKFPM, optional KFPlayerController DamageInstigator, optional class<KFDamageType> DamageType, optional int HitZoneIdx, optional KFWeapon MyKFW)
{
	if (MyKFPM != None && MyKFPM.bLargeZed && MyKFPM.IsAliveAndWell() && (MyKFPM.Health - InDamage) <= 0 && DamageInstigator != None && DamageInstigator.Pawn != None)
		DamageInstigator.Pawn.HealDamage(default.Vampire[upgLevel - 1], DamageInstigator, class'KFDT_Healing');
}

defaultproperties
{
	Vampire(0)=15
	Vampire(1)=40
	upgradeName="Hunter"
    upgradeDescription(0)="On killing a <font color=\"#ffff00\">large ZED</font>:\n> <font color=\"#66cc00\">+15</font> <font color=\"#ff3399\">health regen</font>"
    upgradeDescription(1)="On killing a <font color=\"#ffff00\">large ZED</font>:\n> <font color=\"#b346ea\">+40</font> <font color=\"#ff3399\">health regen</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Hunter'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_Hunter_Deluxe'

	Name="Default__SygExt_Skill_Sharpshooter_Hunter"
}
