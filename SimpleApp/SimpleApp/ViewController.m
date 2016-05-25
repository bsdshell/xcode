#import "ViewController.h"
#import "QuartzCore/QuartzCore.h"

@interface ViewController()
@end

@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    _rectLayer = [CAShapeLayer layer];
    _screenSize               = [UIScreen mainScreen].bounds.size;
   
    UIButton* mybut = [UIButton buttonWithType:UIButtonTypeSystem];
    CGRect frame = CGRectMake(100, 250, 140, 50);
    mybut.frame = frame;

    [mybut addTarget:self action:@selector(clickMe:) forControlEvents:UIControlEventTouchUpInside];
    [mybut setBackgroundImage:[[UIImage imageNamed:@"pic.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [mybut setTitle:@"mybut" forState:(UIControlState) UIControlStateNormal];
    self.view.backgroundColor = [UIColor grayColor];
    
    [self myDrawRectangle];
    [self.view addSubview:mybut];
}

-(void) clickMe:(id) sender{
    NSLog(@"click me");
    CGRect rect = [self currentScreenBoundsDependOnOrientation];
    NSLog(@" [%@]", [NSValue valueWithCGRect:rect]);
    BOOL isiPad = [ViewController isiPad];
    NSLog(@"[%d]", isiPad);
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
