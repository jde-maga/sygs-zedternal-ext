class SygExt_SpecialWave_ArcadeMode extends WMSpecialWave;

function WaveEnded()
{
	local KFWeapon KFW;
	local WMPawn_Human Player;
    local KFInventoryManager KFIM;

	foreach DynamicActors(class'WMPawn_Human', Player)
	{
		if (Player != None && Player.InvManager != None)
		{
            KFIM = KFInventoryManager(Player.InvManager);
			KFIM.AddGrenades(999);
            Player.AddArmor(Player.GetMaxArmor());
			foreach Player.InvManager.InventoryActors(class'KFWeapon', KFW)
			{
				if (KFWeap_Healer_Syringe(KFW) == None && KFWeap_Welder(KFW) == None)
				{
                    KFW.AddAmmo(KFW.GetMaxAmmoAmount(0));
					KFW.AddSecondaryAmmo(KFW.GetMaxAmmoAmount(1));
				}
			}
		}
	}
}

defaultproperties
{
	Title="Arcade Mode"
	Description="Refill armor, ammunitions and grenades each wave !"

	Name="Default__SygExt_SpecialWave_ArcadeMode"
}
