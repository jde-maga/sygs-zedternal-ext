class SygExt_Skill_Survivalist_Scrapper_Helper extends Info
	transient;

var array<int> ZedNeeded;
var int ZedCounter, upgLevel;
var float AmmoDivider;
var KFPawn_Human Player;

function PostBeginPlay()
{
	super.PostBeginPlay();

	Player = KFPawn_Human(Owner);
	if (Player == None || Player.Health <= 0)
		Destroy();
}

function ResetZedCounter()
{
    ZedCounter = 0;
}

function IncreaseCounter()
{
    ZedCounter++;
    if (ZedCounter >= ZedNeeded[upgLevel - 1]) {
        AddAmmunition();
        ResetZedCounter();
    }
}

function AddAmmunition()
{
	local KFWeapon KFW;
	local byte i;
	local int ExtraAmmo;

	if (Player != None && Player.Health > 0 && Player.InvManager != None)
	{
		foreach Player.InvManager.InventoryActors(class'KFWeapon', KFW)
		{
			if (KFW != KFWeapon(Player.Weapon))
			{
				for (i = 0; i < 2; ++i)
				{
					ExtraAmmo = Min(FCeil(float(KFW.GetMaxAmmoAmount(i)) / default.AmmoDivider), KFW.GetMaxAmmoAmount(i) - KFW.GetTotalAmmoAmount(i));
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
}

defaultproperties
{
    AmmoDivider=40.00f
    ZedCounter=0
    ZedNeeded(0)=6
    ZedNeeded(1)=2
    upgLevel=0

	Name="Default__SygExt_Skill_Survivalist_Scrapper_Helper"
}
