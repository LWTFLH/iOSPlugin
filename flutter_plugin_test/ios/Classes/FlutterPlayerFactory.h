#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
NS_ASSUME_NONNULL_BEGIN

@interface FlutterPlayerFactory : NSObject<FlutterPlatformViewFactory>
- (instancetype)initWith:(NSObject<FlutterPluginRegistrar>*)registrar;
@end

NS_ASSUME_NONNULL_END