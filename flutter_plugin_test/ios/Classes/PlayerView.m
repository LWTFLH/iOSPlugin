#import "PlayerView.h"

@interface PlayerView()<FlutterPlugin,AVPictureInPictureControllerDelegate>
@property (nonatomic,strong) FlutterMethodChannel *channel;
@property (nonatomic,strong) AVPictureInPictureController *pipVC;
@property (nonatomic,strong) AVPlayer *avPlayer;
@property (nonatomic,strong) AVPlayerLayer *playerLayer;
@end
@implementation PlayerView
{
    NSString *_nowUrl;
}

- (instancetype)initWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id _Nullable)args registrar:(NSObject<FlutterPluginRegistrar>*)registrar
{
    self = [super init];
    if (self) {
        NSDictionary *dictionary = [NSDictionary dictionaryWithDictionary:args];
        _nowUrl = dictionary[@"url"];
        NSLog(@"==========dictionary:%@",dictionary);
        NSString *name = @"plugins";
        FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:name binaryMessenger:registrar.messenger];
        self.channel = channel;
        [registrar addMethodCallDelegate:self channel:channel];
        self.backgroundColor = [UIColor blackColor];
        [self initPlayer];
    }
    return self;
}
-(void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result{
    if ([call.method isEqualToString:@"fullScreen"]) {
        NSLog(@"fullScreen");
    }
}
- (void)initPlayer{
    NSURL *url = [NSURL URLWithString:_nowUrl];
    @try {
        NSError *error = nil;
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionOrientationBack error:&error];
        [[AVAudioSession sharedInstance] setActive:YES error:&error];
    } @catch (NSException *exception) {
        NSLog(@"AvAudioSession发生错误");
    }
    self.avPlayer = [AVPlayer playerWithURL:url];
    self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.avPlayer];
    self.pipVC = [[AVPictureInPictureController alloc] initWithPlayerLayer:self.playerLayer];
    [self.layer addSublayer:self.playerLayer];
    self.pipVC.delegate = self;
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    NSLog(@"bounds:width:%f,height:%f",self.bounds.size.width,self.bounds.size.height);
    self.playerLayer.frame = self.bounds;
    [self play];
}

- (void)addListen{
    __weak typeof(self) weakSelf = self;
    [self.avPlayer addPeriodicTimeObserverForInterval:CMTimeMake(1.0, 1.0) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        NSLog(@"当前时间：%f",CMTimeGetSeconds(weakSelf.avPlayer.currentItem.currentTime));
        NSLog(@"总时间%f",CMTimeGetSeconds(weakSelf.avPlayer.currentItem.duration));
    }];
}

- (void)play{
    [self.avPlayer play];
}

- (void)pause{
    [self.avPlayer pause];
}

- (void)seekTo:(int)time{
    CMTime nextTime = CMTimeMakeWithSeconds(time/1000, 1.0);
    [self.avPlayer seekToTime:nextTime];
}

- (void)replacePlay:(NSString *)urlString{
    NSURL *url = [[NSURL alloc]initWithString:urlString];
    AVPlayerItem *item = [AVPlayerItem playerItemWithURL:url];
    [self.avPlayer replaceCurrentItemWithPlayerItem:item];
}

- (void)startPiP{
    if ([AVPictureInPictureController isPictureInPictureSupported]) {
        if (self.pipVC == nil){
            self.pipVC = [[AVPictureInPictureController alloc]initWithPlayerLayer:self.playerLayer];
            self.pipVC.delegate = self;
        }
        if (self.pipVC.pictureInPictureActive == NO){
            [self.pipVC startPictureInPicture];
        }
    }
}

- (void)stopPip{
    if ([AVPictureInPictureController isPictureInPictureSupported]) {
        if (self.pipVC == nil){
            self.pipVC = [[AVPictureInPictureController alloc]initWithPlayerLayer:self.playerLayer];
            self.pipVC.delegate = self;
        }
        if (self.pipVC.pictureInPictureActive){
            [self.pipVC stopPictureInPicture];
        }
    }
}


+ (void)registerWithRegistrar:(nonnull NSObject<FlutterPluginRegistrar> *)registrar {
    
}

- (void)pictureInPictureControllerWillStartPictureInPicture:(AVPictureInPictureController *)pictureInPictureController{
    
}

- (void)pictureInPictureControllerDidStartPictureInPicture:(AVPictureInPictureController *)pictureInPictureController{
    
}

- (void)pictureInPictureController:(AVPictureInPictureController *)pictureInPictureController failedToStartPictureInPictureWithError:(NSError *)error{
    
}

- (void)pictureInPictureControllerWillStopPictureInPicture:(AVPictureInPictureController *)pictureInPictureController{
    
}

- (void)pictureInPictureControllerDidStopPictureInPicture:(AVPictureInPictureController *)pictureInPictureController{
    
}

- (void)pictureInPictureController:(AVPictureInPictureController *)pictureInPictureController restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(void (^)(BOOL restored))completionHandler{
    
}

@end
