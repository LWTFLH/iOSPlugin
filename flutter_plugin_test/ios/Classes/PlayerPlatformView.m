#import "PlayerPlatformView.h"
#import "PlayerView.h"

@interface PlayerPlatformView()
{

    PlayerView *playerView;
}
@end
@implementation PlayerPlatformView

- (instancetype)initWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id _Nullable)args registrar:(NSObject<FlutterPluginRegistrar>*)registrar
{
    self = [super init];
    if (self) {
        playerView = [[PlayerView alloc]initWithFrame:frame viewIdentifier:viewId arguments:args registrar:registrar];
    }
    return self;
}

- (UIView*)view{
    return  playerView;
}
@end
