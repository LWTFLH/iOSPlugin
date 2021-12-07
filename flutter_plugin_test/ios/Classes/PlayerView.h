#import <UIKit/UIKit.h>
#import <Flutter/Flutter.h>
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface PlayerView : UIView
- (instancetype)initWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id _Nullable)args registrar:(NSObject<FlutterPluginRegistrar>*)registrar;
@end

NS_ASSUME_NONNULL_END