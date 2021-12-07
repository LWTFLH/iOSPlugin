#import "FlutterPlayerFactory.h"
#import "PlayerPlatformView.h"
@interface FlutterPlayerFactory()
{
    id<FlutterPluginRegistrar> _registrar;
}

@end
@implementation FlutterPlayerFactory
- (instancetype)initWith:(NSObject<FlutterPluginRegistrar>*)registrar{
    self = [super init];
        if (self) {
            _registrar = registrar;
        }
        return self;
}



- (NSObject<FlutterPlatformView>*)createWithFrame:(CGRect)frame
                                   viewIdentifier:(int64_t)viewId
                                        arguments:(id _Nullable)args
{
    NSLog(@"====---f--==%@",NSStringFromCGRect(frame));
    NSLog(@"====-----==%lld",viewId);
    NSLog(@"=======%@",args);
    return [[PlayerPlatformView alloc] initWithFrame:frame viewIdentifier:viewId arguments:args registrar:_registrar];
}


- (NSObject<FlutterMessageCodec>*)createArgsCodec
{
    return  [[FlutterJSONMessageCodec alloc] init];
}

@end
