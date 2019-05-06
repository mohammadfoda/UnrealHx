package unrealHx;

import unreal.*;

using unreal.CoreAPI;

@:uclass()
@:uname("AAddRadialForce")
class AddRadialForce extends AActor
{
    override function BeginPlay()
    {
        var myLocation = GetActorLocation();

        var myColSphere = FCollisionShape.MakeSphere(500);

        // unreal.DrawDebugHelpers.DrawDebugSphere(GetWorld(), GetActorLocation(), myColSphere.GetSphereRadius(), 50, FColor.Cyan, true);

        var outHits:TArray<FHitResult> = TArray.create();

        var queryParams = FCollisionQueryParams.create(false);
        var respParams = FCollisionResponseParams.create();
        var isHit = GetWorld().SweepMultiByChannel(outHits, myLocation, myLocation, FQuat.Identity, ECC_WorldStatic, myColSphere, queryParams, respParams);

        if (isHit)
            for (hit in outHits)
            {
                var meshComp = hit.Actor.RootComponent.as(UStaticMeshComponent);
                if (meshComp != null)
                    meshComp.AddRadialImpulse(GetActorLocation(), 500, 2000, RIF_Constant, true);
            }
        
        Destroy();
    }
}