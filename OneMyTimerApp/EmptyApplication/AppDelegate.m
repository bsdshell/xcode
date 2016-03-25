#import "AppDelegate.h"
#import "Core.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    _mainView = [[MyViewController alloc]init];
    _textLayer = [CATextLayer layer];
    _deltaCount = 0;
    _numSecond = 1800;
    
    [self myButtonRot];
    [self startFinishGameTimer];
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)createTextLayer:(NSString*)timeText{
    [_textLayer setFrame:CGRectMake(20, 100, 300, 200)];
    [_textLayer setString:timeText];
    [_textLayer setForegroundColor:[UIColor grayColor].CGColor];
    [_textLayer setContentsScale:2.f];
    [_textLayer setWrapped:YES];
    [_textLayer setAlignmentMode:kCAAlignmentCenter];
    [_textLayer setFontSize:80.f];
    [self.window.layer addSublayer:_textLayer];
}

-(void)myTimer{
    NSDate * timestamp = [NSDate dateWithTimeIntervalSince1970:[[NSDate date] timeIntervalSince1970]];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss.SSS"];
    
    NSString* newDateString = [dateFormatter stringFromDate:timestamp];

    NSString* secondText = [NSString stringWithFormat:@"%d", _numSecond];
    [self createTextLayer:secondText];
}

-(void)myButtonRot{
    UIButton* mybut = [UIButton buttonWithType:UIButtonTypeSystem];
    CGRect frame = CGRectMake(100, 500+10, 100, 50);
    mybut.frame = frame;
    [mybut addTarget:self action:@selector(clickStart:) forControlEvents:UIControlEventTouchUpInside];
    [mybut setTitle:@"Star Timer" forState:(UIControlState) UIControlStateNormal];
    [mybut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [mybut.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    mybut.backgroundColor = [UIColor brownColor];
    [self.window addSubview:mybut];
}

-(void)tickEvent:(id)sender{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    _numSecond--;
    [self myTimer];
}

-(void)clickStart:(id)sender{
    _pause = _pause? NO : YES;
    if(_pause){
        [_tickFinish invalidate];
    }else{
        [self startFinishGameTimer];
    }
}

-(void)startFinishGameTimer{
    if (_tickFinish!= nil)
        [_tickFinish invalidate];
    _tickFinish = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                                   target:self
                                                 selector:@selector(tickEvent:)
                                                 userInfo:nil
                                                  repeats:YES];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    UITouch* touch = [touches anyObject];
    if(touch != nil){
    }
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch* touch = [touches anyObject];
    if(touch != nil){
    }
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    UITouch* touch = [touches anyObject];
    if(touch != nil){
    }
}


@end
