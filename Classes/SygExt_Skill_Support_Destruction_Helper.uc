class SygExt_Skill_Support_Destruction_Helper extends Info
	transient;

var KFPawn_Human Player;
var bool bDeluxe, bReady;
var const float Update;
var const int Radius;

function PostBeginPlay()
{
	super.PostBeginPlay();

	Player = KFPawn_Human(Owner);
	if (Player == None || Player.Health <= 0)
		Destroy();
	else
		SetTimer(Update, True);
}

function Timer()
{
	local KFPawn_Monster KFM;

	if (Player == None || Player.Health <= 0)
	{
		Destroy();
		return;
	}

	if (bReady && Player.WorldInfo.TimeDilation < 1)
	{
		bReady = False;

		foreach DynamicActors(class'KFPawn_Monster', KFM)
		{
			if (KFM.IsAliveAndWell() && (bDeluxe || VSizeSQ(Player.Location - KFM.Location) <= default.Radius))
			{
				if (KFM.CanDoSpecialMove(SM_Knockdown))
					KFM.Knockdown(vect(0,0,0), vect(1,1,1), KFM.Location, 1000, 100);
			}
		}
	}
	else if (!bReady && Player.WorldInfo.TimeDilation >= 1)
		bReady = True;
}

defaultproperties
{
	bDeluxe=False
	bReady=True
	Update=0.25f
	Radius=1000000

	Name="Default__SygExt_Skill_Support_Destruction_Helper"
}
