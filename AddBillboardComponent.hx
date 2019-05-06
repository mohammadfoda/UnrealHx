package unrealHx;

import unreal.*;

using unreal.CoreAPI;

@:uclass()
@:uname("AAddBillboardComp")
class AddBillboardComp extends AActor
{
    @:uproperty(VisibleAnywhere)
    var MyBillboardComp:UBillboardComponent;

    public function new(wrapped)
    {
        super(wrapped);

        MyBillboardComp = CreateDefaultSubobject("RootBillboardComp", UBillboardComponent.StaticClass());
        MyBillboardComp.SetHiddenInGame(false, true);
        RootComponent = MyBillboardComp;
    }
}