class SygExt_Skill_FieldMedic_AirborneAgent extends WMUpgrade_Skill;

static simulated function InitiateWeapon(int upgLevel, KFWeapon KFW, KFPawn OwnerPawn)
{
	local SygExt_Skill_FieldMedic_AirborneAgent_Helper UPG;

	if (KFPawn_Human(OwnerPawn) != None && OwnerPawn.Role == Role_Authority)
	{
		foreach OwnerPawn.ChildActors(class'SygExt_Skill_FieldMedic_AirborneAgent_Helper', UPG)
            return;

		UPG = OwnerPawn.Spawn(class'SygExt_Skill_FieldMedic_AirborneAgent_Helper', OwnerPawn);
        UPG.bDeluxe = (upgLevel > 1);
	}
}

static simulated function DeleteHelperClass(Pawn OwnerPawn)
{
	local SygExt_Skill_FieldMedic_AirborneAgent_Helper UPG;

	if (OwnerPawn != None)
		foreach OwnerPawn.ChildActors(class'SygExt_Skill_FieldMedic_AirborneAgent_Helper', UPG)
			UPG.Destroy();
}

defaultproperties
{
	upgradeName="Airborne Agent"
    upgradeDescription(0)="When you have less than <font color=\"#ffff00\">35% health points</font>:\n\n> <font color=\"#ff3399\">Heal</font> <font color=\"#66cc00\">50% of your maximum health points</font> over 8 seconds in a <font color=\"#ff3399\">4 meter radius</font>, with a <font color=\"#ffff00\">40 seconds cooldown</font>"
    upgradeDescription(1)="When you have less than <font color=\"#ffff00\">35% health points</font>:\n\n> <font color=\"#ff3399\">Heal</font> <font color=\"#b346ea\">100% of your maximum health points</font> over 8 seconds in a <font color=\"#ff3399\">4 meter radius</font>, with a <font color=\"#ffff00\">40 seconds cooldown</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_AirborneAgent'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_AirborneAgent_Deluxe'

	Name="Default__SygExt_Skill_FieldMedic_AirborneAgent"
}
