class SygExt_Skill_Sharpshooter_Ambush_Helper extends Info
    transient;

var const float AmbushTimer;
var int AmbushStacks;
var KFGameReplicationInfo KFGRI;

function PostBeginPlay()
{
    super.PostBeginPlay();

    if (Owner == None)
        Destroy();
    else {
        KFGRI = KFGameReplicationInfo(Owner.WorldInfo.GRI);
        SetTimer(AmbushTimer, False);
    }
    KFGRI = KFGameReplicationInfo(Owner.WorldInfo.GRI);
}

function Timer()
{
    if (Owner == None) {
        Destroy();
        return;
    }

    if (KFGRI.AIRemaining > 0) {
        AmbushStacks++;
        SetTimer(AmbushTimer, False);
    } else {
        AmbushStacks = 0;
        SetTimer(AmbushTimer, False);
    }
}

function ResetStacks()
{
    AmbushStacks = 0;
}

function int GetAmbushStacks()
{
    return AmbushStacks;
}

defaultproperties
{
    AmbushTimer=1.00f
    AmbushStacks=0
    Name="Default__SygExt_Skill_Sharpshooter_Ambush_Helper"
}