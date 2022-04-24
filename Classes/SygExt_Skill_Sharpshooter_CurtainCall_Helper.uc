class SygExt_Skill_Sharpshooter_CurtainCall_Helper extends Info
	transient;

var int Stacks;

function PostBeginPlay()
{
	super.PostBeginPlay();

	if (Owner == None)
		Destroy();
}

function IncreaseCounter()
{
    Stacks++;
}

function ResetCounter()
{
    Stacks = 0;
}

function int GetStacks()
{
    return Stacks;
}

defaultproperties
{
    Stacks=0;
    Name="Default__SygExt_Skill_Sharpshooter_CurtainCall_Helper"
}