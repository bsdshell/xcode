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
    [self myReset];
    [self startFinishGameTimer];
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)createTextLayer{
    [_textLayer setFrame:CGRectMake(5, 50, 360, 300)];
    NSInteger minute = _numSecond / 60;
    NSInteger second = _numSecond % 60;

    NSString* timeStr = [NSString stringWithFormat:@"%2d:%2d", minute, second];
    [_textLayer setString:timeStr];
    [_textLayer setForegroundColor:[UIColor grayColor].CGColor];
    [_textLayer setContentsScale:2.f];
    [_textLayer setWrapped:YES];
    [_textLayer setAlignmentMode:kCAAlignmentCenter];
    [_textLayer setFontSize:100.f];
    [self.window.layer addSublayer:_textLayer];
}

-(void)myTimer{
    NSDate * timestamp = [NSDate dateWithTimeIntervalSince1970:[[NSDate date] timeIntervalSince1970]];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss.SSS"];
    
    NSString* newDateString = [dateFormatter stringFromDate:timestamp];

    NSString* secondText = [NSString stringWithFormat:@"%d", _numSecond];
    [self createTextLayer];
}

-(void)myReset{
    _resetButton = [UIButton buttonWithType:UIButtonTypeSystem];
    CGRect frame = CGRectMake(100, 500+10, 100, 50);
    _resetButton.frame = frame;
    [_resetButton addTarget:self action:@selector(clickClean:) forControlEvents:UIControlEventTouchUpInside];
    [_resetButton setTitle:@"Clean" forState:(UIControlState) UIControlStateNormal];
    [_resetButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_resetButton.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    _resetButton.backgroundColor = [UIColor brownColor];
    [self.window addSubview:_resetButton];
}


-(void)myButtonRot{
    _startButton = [UIButton buttonWithType:UIButtonTypeSystem];
    CGRect frame = CGRectMake(100, 400, 100, 50);
    _startButton.frame = frame;
    [_startButton addTarget:self action:@selector(clickStart:) forControlEvents:UIControlEventTouchUpInside];
    [_startButton setTitle:@"Star Timer" forState:(UIControlState) UIControlStateNormal];
    [_startButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_startButton.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    _startButton.backgroundColor = [UIColor brownColor];
    [self.window addSubview:_startButton];
}


-(void)tickEvent:(id)sender{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    _numSecond--;
    [self myTimer];
}

-(void)clickClean:(id)sender{
    _numSecond = 1800;
    _pause = YES;
    [_tickFinish invalidate];
    [self createTextLayer];
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
