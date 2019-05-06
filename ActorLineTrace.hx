package unrealHx;

import unreal.*;

using unreal.CoreAPI;

@:uclass()
@:uname("AActorLineTrace")
class ActorLineTrace extends AActor
{
    var cube:UStaticMeshComponent;

    public function new(wrapped) 
    {
        super(wrapped);
        PrimaryActorTick.bCanEverTick = true;

        cube = CreateDefaultSubobject("VisualRepresentation", UStaticMeshComponent.StaticClass());
        RootComponent = cube;

        var cubeAsset:FObjectFinder<UStaticMesh> = new FObjectFinder("/Game/StarterContent/Shapes/Shape_Cube.Shape_Cube", UStaticMesh.StaticClass());

        if (cubeAsset.Succeeded())
        {
            cube.SetStaticMesh(cubeAsset.Object);
            cube.RelativeLocation = FVector.ZeroVector;
            cube.SetWorldScale3D(FVector.OneVector);
        }
    }

    override function Tick(deltaSeconds:Float32) 
    {
        super.Tick(deltaSeconds);

        var outHit:FHitResult = new FHitResult(ForceInitToZero);
        var start = GetActorLocation();

        // start.Z += 50;
        // start.X += 200;

        var forwardVector = GetActorForwardVector();
        var end = forwardVector * 500 + start;
        var collisionParams = FCollisionQueryParams.create(false);
        var responseParams = FCollisionResponseParams.create();
        collisionParams.bTraceComplex = true;
        collisionParams.AddIgnoredComponent(cube);

        // DrawDebugHelpers.DrawLine(GetWorld(), start, end, FColor.Green, false, 1, 0, 5);


        if (GetWorld().LineTraceSingleByChannel(outHit, start, end, ECC_WorldStatic, collisionParams, responseParams))
            if (UEngine.GEngine != null)
                UEngine.GEngine.AddOnScreenDebugMessage(-1, 1, FColor.Green, 'The Component Being Hit: ${outHit.Component.GetName()}');
    }
}