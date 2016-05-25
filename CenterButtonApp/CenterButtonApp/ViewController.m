#import "ViewController.h"
#import "QuartzCore/QuartzCore.h"

#define OPTION_BUT_HEIGHT   50
#define OPTION_BUT_WIDTH    180 

@interface ViewController()
@end

@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    _rectLayer = [CAShapeLayer layer];
     _screenSize               = [UIScreen mainScreen].bounds.size;

    self.view.backgroundColor = [UIColor grayColor];
    
    [self myDrawRectangle];
    [self listButton];
}
-(void) clickMe:(id) sender{
    NSLog(@"click me");
    CGRect rect = [self currentScreenBoundsDependOnOrientation];
    NSLog(@" [%@]", [NSValue valueWithCGRect:rect]);
    BOOL isiPad = [ViewController isiPad];
    NSLog(@"[%d]", isiPad);
}

-(void)listButton{
    // #define OPTION_BUT_HEIGHT   50
    // #define OPTION_BUT_WIDTH    180 
    // CGSize          _screenSize;            
    // _screenSize               = [UIScreen mainScreen].bounds.size;

    NSInteger numButton = 2;
    NSInteger butIndex0 = 0;
    NSInteger butIndex1 = 1;
    
    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    CGRect frame    = CGRectMake((_screenSize.width - OPTION_BUT_WIDTH)/2, butIndex0*(_screenSize.height - (numButton*OPTION_BUT_HEIGHT))/(numButton+1) + 3*OPTION_BUT_HEIGHT, OPTION_BUT_WIDTH, OPTION_BUT_HEIGHT);

    backButton.frame     = frame;
    [backButton addTarget:self action:@selector(but0Click:) forControlEvents:UIControlEventTouchUpInside];
    [backButton setTitle:@"Button 0" forState:(UIControlState) UIControlStateNormal];
    [backButton.titleLabel setFont:[UIFont fontWithName:@"MarkerFelt-Thin" size:18]];
    [backButton setBackgroundColor:[UIColor brownColor]];
    [backButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.view addSubview:backButton];

    UIButton* resumeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    CGRect resumeFrame    = CGRectMake((_screenSize.width - OPTION_BUT_WIDTH)/2, butIndex1*(_screenSize.height - (numButton*OPTION_BUT_HEIGHT))/(numButton+1) + 3*OPTION_BUT_HEIGHT, OPTION_BUT_WIDTH, OPTION_BUT_HEIGHT);

    resumeButton.frame = resumeFrame;
    [resumeButton addTarget:self action:@selector(but1Click:) forControlEvents:UIControlEventTouchUpInside];
    [resumeButton setTitle:@"Button 1" forState:(UIControlState) UIControlStateNormal];
    [resumeButton.titleLabel setFont:[UIFont fontWithName:@"MarkerFelt-Thin" size:18]];
    [resumeButton setBackgroundColor:[UIColor greenColor]];
    [resumeButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.view addSubview:resumeButton];
}

-(void)but0Click:(id)sender{
    NSLog(@"%s", __PRETTY_FUNCTION__); 
}


-(void)but1Click:(id)sender{
    NSLog(@"%s", __PRETTY_FUNCTION__); 
}


// CAShapeLayer* _rectLayer;
-(void)myDrawRectangle{
    CGFloat width = 320.0;
    CGFloat height = 480.0;
    CGSize size          = [UIScreen mainScreen].bounds.size;
    //CGFloat offset = 10.0;
    CGPoint centerPoint = CGPointMake(size.width/2 - width/2, size.height/2 - height/2);
    
    UIBezierPath* path = [UIBezierPath bezierPathWithRect:CGRectMake(centerPoint.x, centerPoint.y, width, height)];
    _rectLayer.lineWidth = 2.0f;
    _rectLayer.strokeColor = [[UIColor redColor] CGColor];
    [_rectLayer setFillColor:[[UIColor clearColor] CGColor]];
    [_rectLayer setPath:[path CGPath]];
    [_rectLayer setOpacity:0.5];
    [self.view.layer addSublayer:_rectLayer];
}

+(BOOL)isiPad{
    static BOOL isIPad = NO;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isIPad = [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad;
        
    });
    return isIPad;
}


-(CGRect)currentScreenBoundsDependOnOrientation
{
    NSString *reqSysVer = @"8.0";
    NSString *currSysVer = [[UIDevice currentDevice] systemVersion];
    NSLog(@"currVersion[%@]", currSysVer);
    
//    if ([currSysVer compare:reqSysVer options:NSNumericSearch] != NSOrderedAscending)
//        return [UIScreen mainScreen].bounds;
//    
    CGRect screenBounds = [UIScreen mainScreen].bounds ;
    CGFloat width = CGRectGetWidth(screenBounds)  ;
    CGFloat height = CGRectGetHeight(screenBounds) ;
    UIInterfaceOrientation interfaceOrientation = [UIApplication sharedApplication].statusBarOrientation;
    
    NSLog(@"w[%f] h[%f]", width, height);
    NSLog(@"scale[%f]", [[UIScreen mainScreen]scale]);
    
    if(UIInterfaceOrientationIsPortrait(interfaceOrientation)){
        screenBounds.size = CGSizeMake(width, height);
        NSLog(@"Portrait Height: %f", screenBounds.size.height);
    }else if(UIInterfaceOrientationIsLandscape(interfaceOrientation)){
        screenBounds.size = CGSizeMake(height, width);
        NSLog(@"Landscape Height: %f", screenBounds.size.height);
    }
    
    return screenBounds ;
}
@end
