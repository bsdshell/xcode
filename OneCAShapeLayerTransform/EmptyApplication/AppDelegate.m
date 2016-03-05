#import "AppDelegate.h"

// searchkey: transform rotation
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    _numClick = 0;

    _semiWidth = 100;
    _semiHeight = 100;
    _upLeft = CGPointMake(100, 100);

    _shapeLayer = [CAShapeLayer layer];
    _curveLayer = [CAShapeLayer layer];

    UIBezierPath* path = [UIBezierPath bezierPathWithRect:CGRectMake(100, 100, 200, 200)];
    UIBezierPath* path1 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 200, 200)];

//    UIBezierPath* path = [UIBezierPath bezierPathWithRect:CGRectMake(-100, -100, 200, 200)];
//    UIBezierPath* path1 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(-100, -100, 200, 200)];
    
    //UIBezierPath* path = [UIBezierPath bezierPath];

//    [path moveToPoint:CGPointMake(_upLeft.x - _semiWidth, _upLeft.y - _semiHeight)];
//    
//    [path addLineToPoint:CGPointMake(_upLeft.x + _semiWidth, _upLeft.y - _semiHeight)];
//    [path addLineToPoint:CGPointMake(_upLeft.x + _semiWidth, _upLeft.y + _semiHeight)];
//    [path addLineToPoint:CGPointMake(_upLeft.x - _semiWidth, _upLeft.y + _semiHeight)];
//    [path closePath];
    _shapeLayer.path = [path CGPath];
    _curveLayer.path = [path1 CGPath];
    
    _shapeLayer.strokeColor = [[UIColor brownColor] CGColor];
    _shapeLayer.fillColor = [[UIColor clearColor] CGColor];
    _shapeLayer.lineWidth = 10;

    
    _curveLayer.strokeColor = [[UIColor greenColor] CGColor];
    _curveLayer.fillColor = [[UIColor clearColor] CGColor];
    _curveLayer.lineWidth = 10;


    CGPoint anchorPoint = self.window.layer.anchorPoint;
    NSLog(@"init_anchor_x=[%f] init_anchor_y=[%f] ", anchorPoint.x, anchorPoint.y);
    
    [self.window.layer addSublayer:_shapeLayer];
    [self.window.layer addSublayer:_curveLayer];
    //----------------------------------------------------------
    UIButton* mybut = [UIButton buttonWithType:UIButtonTypeSystem];
    CGRect frame = CGRectMake(100, 450, 140, 50);
    mybut.frame = frame;
    [mybut addTarget:self action:@selector(startClick1:) forControlEvents:UIControlEventTouchUpInside];
    [mybut setTitle:@"Rotate" forState:(UIControlState) UIControlStateNormal];
    [mybut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [mybut.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    mybut.backgroundColor = [UIColor brownColor];
    [self.window addSubview:mybut];

    [self startFinishGameTimer];
    
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)startClick1:(id)sender{
    //NSLog(@"Click0 me");
    if(_numClick < 100)
        _numClick++;
    else
        _numClick = 1;
    
//    CATransform3D translate = CATransform3DMakeTranslation(-200.0, -200.0f, 0.0);
//    CATransform3D rotate = CATransform3DMakeRotation(_numClick*(M_1_PI/30.0f), 0.0, 0.0, 1.0);
//    CATransform3D translateback = CATransform3DMakeTranslation(200.0f, 200.0f, 0.0f);
//    CATransform3D finalTransform = CATransform3DConcat(CATransform3DConcat(translate, rotate), translateback);

    CATransform3D translate = CATransform3DMakeTranslation(-200.0, -200.0f, 0.0);
    CGFloat radians =_numClick*(2*M_PI/100.0f);
    CATransform3D rotate = CATransform3DMakeRotation(radians, 0.0, 0.0, 1.0);
    CATransform3D translateback = CATransform3DMakeTranslation(200.0f, 200.0f, 0.0f);
    
    CATransform3D finalTransform = CATransform3DConcat(CATransform3DConcat(translate, rotate), translateback);
    
//    finalTransform.m34 = -1.0/800.0f;
    
    _shapeLayer.transform = finalTransform;
    
    CGPoint anchorPoint = self.window.layer.anchorPoint;
    CGPoint position = self.window.layer.position;
    NSLog(@"anchor_x=[%f] anchor_y=[%f]  position_x=[%f], position_y=[%f]", anchorPoint.x, anchorPoint.y, position.x, position.y);

    
    NSLog(@"numClick=[%ld]", _numClick);
    NSLog(@"radians =[%f]", radians);
    NSLog(@"---------------------------------------------");
    NSLog(@"[%f] [%f] [%f] [%f]", rotate.m11, rotate.m12, rotate.m13, rotate.m14);
    NSLog(@"[%f] [%f] [%f] [%f]", rotate.m21, rotate.m22, rotate.m23, rotate.m24);
    NSLog(@"[%f] [%f] [%f] [%f]", rotate.m31, rotate.m32, rotate.m33, rotate.m34);
    NSLog(@"[%f] [%f] [%f] [%f]", rotate.m41, rotate.m42, rotate.m43, rotate.m44);
    NSLog(@"---------------------------------------------");
    //_curveLayer.transform = rotate;
}

-(void)startFinishGameTimer{
    if (_tickFinish!= nil)
        [_tickFinish invalidate];
    _tickFinish = [NSTimer scheduledTimerWithTimeInterval:0.01
                                                   target:self
                                                 selector:@selector(startClick1:)
                                                 userInfo:nil
                                                  repeats:YES];
}

@end
