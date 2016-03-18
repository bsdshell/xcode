#import "AppDelegate.h"
#import "Core.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    _mainView = [[MyViewController alloc]init];
    _translateTransform = CATransform3DIdentity;
    _width = 100.0f;
    _height = 100.0f;

    _deltaCount = 0;
    _isRotated = false;
    _rectCenter = CGPointMake(100, 100);
    
    _rectLayer = [CAShapeLayer layer];
    
    CGRect rect = CGRectMake(0, 0, _width, _height);
    UIBezierPath* path = [UIBezierPath bezierPathWithRect:rect];
    _rectLayer.bounds = rect;
    _rectLayer.position = CGPointMake(_rectCenter.x + _width/2, _rectCenter.y + _height/2);
    _rectLayer.lineWidth = 1.0f;
    _rectLayer.strokeColor = [[UIColor purpleColor] CGColor];
    [_rectLayer setFillColor:[[UIColor clearColor] CGColor]];
    [_rectLayer setPath:[path CGPath]];
    [self.window.layer addSublayer:_rectLayer];
    
    CAShapeLayer* cartesianCoordinate = [Core CartesianCoordinate];
    [self.window.layer addSublayer:cartesianCoordinate];
    [self myButtonRot];
    [self startFinishGameTimer];
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)myButtonRot{
    UIButton* mybut = [UIButton buttonWithType:UIButtonTypeSystem];
    CGRect frame = CGRectMake(100, 500+10, 100, 50);
    mybut.frame = frame;
    [mybut addTarget:self action:@selector(clickNonCenter:) forControlEvents:UIControlEventTouchUpInside];
    [mybut setTitle:@"Rot nonCenter" forState:(UIControlState) UIControlStateNormal];
    [mybut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [mybut.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    mybut.backgroundColor = [UIColor brownColor];
    [self.window addSubview:mybut];
}

-(void)rotation:(id)sender{
    if(_isRotated){
        if(_deltaCount < 100)
            _deltaCount++;
        else
            _deltaCount = 1;

        //_translateTransform = CATransform3DIdentity;
        
        CGFloat rotValue = _deltaCount*2;
        _translateTransform = CATransform3DTranslate(_translateTransform, rotValue, 0, 0);

        [Core printCATransform3D:_translateTransform];
        [_mainView.view.layer setTransform:_translateTransform];
        
        [Core printLayerInfo:_mainView.view.layer text:@"layer1"];
    }
}

-(void)clickNonCenter:(id)sender{
    _isRotated = _isRotated? NO : YES;
}

-(void)startFinishGameTimer{
    if (_tickFinish!= nil)
        [_tickFinish invalidate];
    _tickFinish = [NSTimer scheduledTimerWithTimeInterval:0.05f
                                                   target:self
                                                 selector:@selector(rotation:)
                                                 userInfo:nil
                                                  repeats:YES];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    UITouch* touch = [touches anyObject];
    if(touch != nil){
        _initXY = [touch locationInView:touch.view];
        _newInitXY = [self.window.layer convertPoint:_initXY toLayer:_rectLayer];

        if(CGPathContainsPoint(_rectLayer.path, NULL, _initXY, false)){
            NSLog(@"%s", __PRETTY_FUNCTION__);
        }
    }
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch* touch = [touches anyObject];
    if(touch != nil){
        CGPoint currXY = [touch locationInView:touch.view];
        CGPoint newPoint = [self.window.layer convertPoint:currXY toLayer:_rectLayer];
        if(CGPathContainsPoint(_rectLayer.path, NULL, newPoint, false)){
            NSLog(@"%s", __PRETTY_FUNCTION__);
            
            CGPoint diffPoint = CGPointMake(newPoint.x - _newInitXY.x, newPoint.y - _newInitXY.y);
            _translateTransform = CATransform3DTranslate(_translateTransform, diffPoint.x, diffPoint.y, 0);
            
            [Core printCATransform3D:_translateTransform];
            [_rectLayer setTransform:_translateTransform];

        }
    }
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    UITouch* touch = [touches anyObject];
    if(touch != nil){
        CGPoint currXY = [touch locationInView:touch.view];
        NSString* mytext = [NSString stringWithFormat:@"[%.01f][%.01f]", currXY.x, currXY.y];
    }
}


@end
