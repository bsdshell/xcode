#import "AppDelegate.h"
#import "Core.h"

#define TOTAL_NUM 1800 
#define BUT_HEIGHT 200 
#define FONT_SIZE  80 

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

-(NSString*)timeFormat:(NSInteger)num{
    NSInteger minute = num / 60;
    NSInteger second = num % 60;
    NSString* timeStr = @"";
    if(minute >= 10 && second < 10)
        timeStr = [NSString stringWithFormat:@"%2ld:0%ld", minute, second];
    else if(minute < 10 && second >= 10)
        timeStr = [NSString stringWithFormat:@"0%ld:%2ld", minute, second];
    else if(minute >= 10 && second >= 10)
        timeStr = [NSString stringWithFormat:@"%2ld:%2ld", minute, second];
    else if(minute < 10 && second < 10)
        timeStr = [NSString stringWithFormat:@"0%ld:0%ld", minute, second];

    return timeStr;
}

-(void)createTextLayer{
    CGSize size       = [UIScreen mainScreen].bounds.size;
    [_textLayer setFrame:CGRectMake(0, 0, size.width, 350)];

    NSString* timeStr = [self timeFormat:_numSecond]; 

    [_textLayer setString:timeStr];
    [_textLayer setForegroundColor:[[UIColor grayColor] CGColor]];
    [_textLayer setContentsScale:2.f];
    [_textLayer setWrapped:YES];
    [_textLayer setAlignmentMode:kCAAlignmentCenter];
    [_textLayer setFontSize:100.f];
    [_textLayer setForegroundColor:[UIColor grayColor].CGColor];
    [self.window.layer addSublayer:_textLayer];
}

-(void)createStarButton{
    CGSize size       = [UIScreen mainScreen].bounds.size;
    NSInteger bheight = BUT_HEIGHT;
    NSInteger spacing = 10;
    _startButton = [UIButton buttonWithType:UIButtonTypeSystem];
    CGRect frame = CGRectMake(0, size.height - 2*bheight - spacing, size.width, bheight);
    _startButton.frame = frame;
    [_startButton setTitle:@"Start" forState:(UIControlState) UIControlStateNormal];
    [_startButton addTarget:self action:@selector(starEvent:) forControlEvents:UIControlEventTouchUpInside];
    [_startButton.titleLabel setFont:[UIFont boldSystemFontOfSize:FONT_SIZE]];
    _startButton.backgroundColor = [UIColor grayColor];
    [_startButton setTitleColor:[UIColor whiteColor] forState:(UIControlState)UIControlStateNormal];
    [self.window addSubview:_startButton];
}

-(void)createResetButton{
    CGSize size       = [UIScreen mainScreen].bounds.size;
    NSInteger bheight = BUT_HEIGHT;
    _resetButton = [UIButton buttonWithType:UIButtonTypeSystem];
    CGRect frame = CGRectMake(0, size.height - bheight, size.width, bheight);
    _resetButton.frame = frame;

    [_resetButton setTitle:@"Reset" forState:(UIControlState) UIControlStateNormal];
    [_resetButton addTarget:self action:@selector(resetEvent:) forControlEvents:UIControlEventTouchUpInside];
    [_resetButton.titleLabel setFont:[UIFont boldSystemFontOfSize:FONT_SIZE]];
    _resetButton.backgroundColor = [UIColor grayColor];
    [_resetButton setTitleColor:[UIColor whiteColor] forState:(UIControlState)UIControlStateNormal];


    [self.window addSubview:_resetButton];

    
    _pause = YES;
}

-(void)starEvent:(id)sender{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    if(_pause){
        [_startButton setTitle:@"Stop" forState:(UIControlState) UIControlStateNormal];
        [self startTimer];
    }else{
        [_tickFinish invalidate];
        [_startButton setTitle:@"Start" forState:(UIControlState) UIControlStateNormal];
        if(_numSecond == 0){
            _player.numberOfLoops   = 0; // -1 is infinite
            _numSecond = TOTAL_NUM;
            [self createTextLayer];
        }
    }
    [self.window addSubview:_startButton];
    _pause = _pause == YES ? NO : YES;
}

-(void)resetEvent:(id)sender{
    if(_numSecond == 0){
        _player.numberOfLoops   = 0; // -1 is infinite
    }
    
    _numSecond = TOTAL_NUM;
    [_tickFinish invalidate];
    _pause = YES;
    [self createTextLayer];
    [_startButton setTitle:@"Start" forState:(UIControlState) UIControlStateNormal];
    [self.window addSubview:_startButton];
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
    
    if(_numSecond > 0){
        _numSecond--;
    }
    else{
        if(_numSecond == 0){
            [_tickFinish invalidate];
            NSLog(@"Done! _numSecond=[%ld]", _numSecond);
            NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"timeout" ofType:@"wav"];
            NSURL *soundFileURL     = [NSURL fileURLWithPath:soundFilePath];
            _player                 = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
            _player.numberOfLoops   = -1; // -1 is infinite
            [_player play];
        }
    }
    [self createTextLayer];
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
