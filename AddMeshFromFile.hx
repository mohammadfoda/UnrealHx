package unrealHx;

import unreal.*;

using unreal.CoreAPI;

@:uclass()
@:uname("AAddMeshFromFile")
class AddMeshFromFile extends AActor
{
    public function new(wrapped)
    {
        super(wrapped);

        var cylinder:UStaticMeshComponent = CreateDefaultSubobject("VisualRepresentation", UStaticMeshComponent.StaticClass());
        RootComponent = cylinder;

        var cylinderAsset = FObjectFinderImpl.Find(new TypeParam<UStaticMesh>(), "/Game/StarterContent/Shapes/Cylinder_Shape.Cylinder_Shape");
        if (cylinderAsset.Succeeded())
        {
            cylinder.SetStaticMesh(cylinderAsset.Object);
            cylinder.RelativeLocation = FVector.ZeroVector;
            cylinder.SetWorldScale3D(FVector.OneVector);
        }
    }
}