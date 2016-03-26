#import "AppDelegate.h"
#import "Core.h"

#define TOTAL_NUM 1800 

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self createStarButton];
    [self createResetButton];

    _deltaCount = 0;
    _numSecond  = TOTAL_NUM;
    _pause = YES;

    _textLayer  = [CATextLayer layer];
    [self createTextLayer];
    
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)createTextLayer{
    [_textLayer setFrame:CGRectMake(5, 50, 360, 300)];
    NSInteger minute = _numSecond / 60;
    NSInteger second = _numSecond % 60;

    NSString* timeStr = [NSString stringWithFormat:@"%2ld:%2ld", minute, second];
    [_textLayer setString:timeStr];
    [_textLayer setForegroundColor:[[UIColor grayColor] CGColor]];
    [_textLayer setContentsScale:2.f];
    [_textLayer setWrapped:YES];
    [_textLayer setAlignmentMode:kCAAlignmentCenter];
    [_textLayer setFontSize:100.f];
    [self.window.layer addSublayer:_textLayer];
}

-(void)createStarButton{
    _startButton = [UIButton buttonWithType:UIButtonTypeSystem];
    CGRect frame = CGRectMake(100, 300, 100, 50);
    _startButton.frame = frame;
    [_startButton setTitle:@"Star" forState:(UIControlState) UIControlStateNormal];
    [_startButton addTarget:self action:@selector(starEvent:) forControlEvents:UIControlEventTouchUpInside];
    [_startButton.titleLabel setFont:[UIFont boldSystemFontOfSize:40]];
    _startButton.backgroundColor = [UIColor grayColor];
    [self.window addSubview:_startButton];
}
-(void)starEvent:(id)sender{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    if(_pause){
        [_startButton setTitle:@"Stop" forState:(UIControlState) UIControlStateNormal];
        [self startTimer];
    }else{
        [_tickFinish invalidate];
        [_startButton setTitle:@"Star" forState:(UIControlState) UIControlStateNormal];
    }
    [self.window addSubview:_startButton];
    _pause = _pause == YES ? NO : YES;
}

-(void)createResetButton{
    _resetButton = [UIButton buttonWithType:UIButtonTypeSystem];
    CGRect frame = CGRectMake(10, 400, 200, 100);
    _resetButton.frame = frame;
    [_resetButton setTitle:@"Reset" forState:(UIControlState) UIControlStateNormal];
    [_resetButton addTarget:self action:@selector(resetEvent:) forControlEvents:UIControlEventTouchUpInside];
    [_resetButton.titleLabel setFont:[UIFont boldSystemFontOfSize:40]];
    _resetButton.backgroundColor = [UIColor brownColor];

    [self.window addSubview:_resetButton];

}
-(void)resetEvent:(id)sender{
    _numSecond = TOTAL_NUM;
    [_tickFinish invalidate];
    _pause = YES;
    [self createTextLayer];
}

-(void)myTimer{
    NSDate * timestamp = [NSDate dateWithTimeIntervalSince1970:[[NSDate date] timeIntervalSince1970]];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss.SSS"];
    
    NSString* newDateString = [dateFormatter stringFromDate:timestamp];

    NSString* secondText = [NSString stringWithFormat:@"%ld", _numSecond];
    [self createTextLayer];
}

-(void)tickEvent:(id)sender{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    _numSecond--;
    [self createTextLayer];
    if(_numSecond == 0){
        NSLog(@"Done! _numSecond=[%d] ", _numSecond);
    }
}

-(void)startTimer{
    if (_tickFinish!= nil)
        [_tickFinish invalidate];
    _tickFinish = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                                   target:self
                                                 selector:@selector(tickEvent:)
                                                 userInfo:nil
                                                  repeats:YES];
}

@end
