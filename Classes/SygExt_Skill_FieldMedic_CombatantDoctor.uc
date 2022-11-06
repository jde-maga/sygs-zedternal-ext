class SygExt_Skill_FieldMedic_CombatantDoctor extends WMUpgrade_Skill;

var float AmmoDivider;
var array<int> HealthThreshold;

static function HealingDamage(int upgLevel, int HealAmount, KFPawn HealedPawn, KFPawn InstigatorPawn, class<DamageType> DamageType)
{
	local WMUpgrade_Skill_CombatantDoctor_Helper UPG;

	if (HealedPawn != None && InstigatorPawn != None && HealAmount > 0 && HealedPawn.GetHealthPercentage() < 1.0f)
	{
		UPG = GetHelper(InstigatorPawn);
		if (UPG != None)
		{
			UPG.AddHealedHealth(Min(HealAmount, HealedPawn.HealthMax - HealedPawn.Health));
			AddAmmunition(InstigatorPawn, UPG.GetAmmoMultiplier(default.HealthThreshold[upgLevel - 1]));
		}
	}
}

static function AddAmmunition(KFPawn Player, int Multiplier)
{
	local KFWeapon KFW;
	local byte i;
	local int ExtraAmmo;

	if (Player != None && Player.Health > 0 && Player.InvManager != None && Multiplier > 0)
	{
		foreach Player.InvManager.InventoryActors(class'KFWeapon', KFW)
		{
			for (i = 0; i < 2; ++i)
			{
				ExtraAmmo = Min(FCeil(float(KFW.GetMaxAmmoAmount(i)) / default.AmmoDivider) * Multiplier, KFW.GetMaxAmmoAmount(i) - KFW.GetTotalAmmoAmount(i));
				if (ExtraAmmo > 0)
				{
					if (i == 0)
						KFW.AddAmmo(ExtraAmmo);
					else
						KFW.AddSecondaryAmmo(ExtraAmmo);
				}
			}
		}
	}
}

static function WMUpgrade_Skill_CombatantDoctor_Helper GetHelper(KFPawn OwnerPawn)
{
	local WMUpgrade_Skill_CombatantDoctor_Helper UPG;

	if (KFPawn_Human(OwnerPawn) != None)
	{
		foreach OwnerPawn.ChildActors(class'WMUpgrade_Skill_CombatantDoctor_Helper', UPG)
		{
			return UPG;
		}

		//Should have one
		if (OwnerPawn.Role == Role_Authority)
			UPG = OwnerPawn.Spawn(class'WMUpgrade_Skill_CombatantDoctor_Helper', OwnerPawn);
	}

	return UPG;
}

static simulated function DeleteHelperClass(Pawn OwnerPawn)
{
	local WMUpgrade_Skill_CombatantDoctor_Helper UPG;

	if (OwnerPawn != None)
	{
		foreach OwnerPawn.ChildActors(class'WMUpgrade_Skill_CombatantDoctor_Helper', UPG)
		{
			UPG.Destroy();
		}
	}
}

defaultproperties
{
	AmmoDivider=20.0f
	HealthThreshold(0)=50
	HealthThreshold(1)=25

	upgradeName="Combatant Doctor"
    upgradeDescription(0)="After <font color=\"#ffff00\">healing 50 health points</font>:\n> <font color=\"#66cc00\">+5%</font> <font color=\"#ff3399\">max ammo regen</font> for <font color=\"#ffff00\">all your weapons</font>"
    upgradeDescription(1)="After <font color=\"#b346ea\">healing 25 health points</font>:\n> <font color=\"#66cc00\">+5%</font> <font color=\"#ff3399\">max ammo regen</font> for <font color=\"#ffff00\">all your weapons</font>"
	upgradeIcon(0)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_CombatantDoctor'
	upgradeIcon(1)=Texture2D'ZedternalReborn_Resource.Skills.UI_Skill_CombatantDoctor_Deluxe'

	Name="Default__SygExt_Skill_FieldMedic_CombatantDoctor"
}
