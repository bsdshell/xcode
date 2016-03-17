#import "AppDelegate.h"
#import "Core.h"

// searchkey: transform rotation in arbitrary point 
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    _mainPos = CGPointMake(100, 300);

    
    _mainLayer = [CAShapeLayer layer];

    _myView = [[MyViewController alloc]init];
    _nonCenterView = [[MyViewController alloc]init];
    _transform = CATransform3DIdentity;
    _nonCenterTransform = CATransform3DIdentity;
    CGSize size          = [UIScreen mainScreen].bounds.size;
    //----------------------------------------------------------
    _nonCenter = 0;
    _isRotated = false;

    _mainLayer = [CAShapeLayer layer];
    _rectLayer = [CAShapeLayer layer];
    _nonCenterLayer = [CAShapeLayer layer];
    _width = 100.0f;
    _height = 100.0f;
    _mainWidth = 200;
    _mainHeight = 200;


    _mycenter = CGPointMake(size.width/2 - _width/2, size.height/2 - _height/2);
    
    
    _curveCenter = CGPointMake(100, 100);
    
    
//    UIBezierPath* path = [UIBezierPath bezierPathWithRect:CGRectMake(_mycenter.x, _mycenter.y, _width, _height)];
//    _rectLayer.lineWidth = 10.0f;
//    _rectLayer.strokeColor = [[UIColor brownColor] CGColor];
//    [_rectLayer setFillColor:[[UIColor clearColor] CGColor]];
//    [_rectLayer setPath:[path CGPath]];

    [_myView.view.layer addSublayer:_rectLayer];
    
    UIBezierPath* path1 = [UIBezierPath bezierPathWithRect:CGRectMake(_curveCenter.x - _width/2, _curveCenter.y - _height/2, _width, _height)];
    
    _nonCenterLayer.lineWidth = 10.0f;
    _nonCenterLayer.strokeColor = [[UIColor purpleColor] CGColor];
    [_nonCenterLayer setFillColor:[[UIColor clearColor] CGColor]];
    [_nonCenterLayer setPath:[path1 CGPath]];
    
    [_nonCenterView.view.layer addSublayer:_nonCenterLayer];
    
    CAShapeLayer* cartesianCoordinate = [Core CartesianCoordinate];
    [self.window.layer addSublayer:cartesianCoordinate];
    [self.window addSubview:_myView.view];
    [self.window addSubview:_nonCenterView.view];

    [self myDrawRectangle];
    

    [self myButtonRot];
    
    [self startFinishGameTimer];
    
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)myDrawRectangle{
    NSInteger numBlocks  = 2;
    CGFloat width = 50.0;
    CGFloat height = 50.0;
    CGFloat blockMarginX = 10;
    CGFloat blockMarginY = 10;
    CGPoint blockUpLeft  = CGPointMake((_mainWidth - numBlocks*width - (numBlocks-1)*blockMarginX)/2, (_mainHeight - numBlocks*height - (numBlocks-1)*blockMarginY)/2);

    CGSize size          = [UIScreen mainScreen].bounds.size;
    CGFloat offset = 50.0;
    CGPoint centerPoint = CGPointMake(size.width/2 - width/2, size.height/2 - height/2 + offset);

    UIBezierPath* mainPath     = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, _mainWidth, _mainHeight)];
    _mainLayer.path        = [mainPath CGPath];
    _mainLayer.bounds = CGRectMake(0, 0, _mainWidth, _mainHeight);
    _mainLayer.position = _mainPos;
    _mainLayer.lineWidth   = 4.0f;
    _mainLayer.strokeColor = [[UIColor yellowColor]CGColor];
    
    
    for(int i=0; i<2; i++){
        for(int j=0; j<2; j++){
            _rectLayer = [CAShapeLayer layer];
            UIBezierPath* path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, width, height)];
            _rectLayer.lineWidth = 1.0f;
            _rectLayer.strokeColor = [[UIColor brownColor] CGColor];
            [_rectLayer setFillColor:[[UIColor clearColor] CGColor]];
            _rectLayer.bounds = CGRectMake(0, 0, width, height);
            _rectLayer.position = CGPointMake(blockUpLeft.x + width/2 + j*(width + blockMarginX), blockUpLeft.y + height/2 + i*(height + blockMarginY));
            [_rectLayer setPath:[path CGPath]];
            
            if(i % 2 == 0)
                _rectLayer.backgroundColor = [[UIColor greenColor] CGColor];
            else
                _rectLayer.backgroundColor = [[UIColor blueColor] CGColor];
            
            [Core printLayerInfo:_rectLayer text:@"_rectLayer"];
            
            [_mainLayer addSublayer:_rectLayer];
        }
    }
    [_mainLayer setBackgroundColor:[[UIColor cyanColor]CGColor]];
    _mainLayer.anchorPoint = CGPointMake(0.5, 0.5);
    [_mainLayer setTransform:_nonCenterTransform];
    [self.window.layer addSublayer:_mainLayer];

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

//-(void)rotation:(id)sender{
//    if(_isRotated){
//        CGSize size          = [UIScreen mainScreen].bounds.size;
//        if(_nonCenter < 100)
//            _nonCenter++;
//        else
//            _nonCenter = 1;
//        
//        _nonCenterTransform = CATransform3DIdentity;
//        
//        CGFloat radians = 2*M_PI/100.0f;
//        CGFloat rotValue = _nonCenter*radians;
//        
//        CGPoint anchorPoint = CGPointMake(_curveCenter.x/size.width, _curveCenter.y/size.height);
//        [Core printLayerInfo:_nonCenterView.view.layer text:@"layer1"];
//        
//        _nonCenterView.view.layer.anchorPoint = anchorPoint;
//        
//        _nonCenterView.view.layer.position = _curveCenter;
//        _nonCenterTransform = CATransform3DRotate(_nonCenterTransform, rotValue, 0.0, 0.0, 1.0);
//        
//        [Core printLayerInfo:_nonCenterView.view.layer text:@"layer2"];
//        [Core printCATransform3D:_nonCenterTransform];
//        [_nonCenterView.view.layer setTransform:_nonCenterTransform];
//        
//        [Core printLayerInfo:_nonCenterView.view.layer text:@"layer3"];
//    }
//}

-(void)rotation:(id)sender{
    if(_isRotated){
        CGSize size          = [UIScreen mainScreen].bounds.size;
        if(_nonCenter < 100)
            _nonCenter++;
        else
            _nonCenter = 1;

        _nonCenterTransform = CATransform3DIdentity;

        CGFloat radians = 2*M_PI/100.0f;
        CGFloat rotValue = _nonCenter*radians;

        CGPoint anchorPoint = CGPointMake(_curveCenter.x/size.width, _curveCenter.y/size.height);
        [Core printLayerInfo:_mainLayer text:@"mainLayer"];

        _mainLayer.anchorPoint = CGPointMake(0.5, 0.5);

        _mainLayer.position = _mainPos;
        _nonCenterTransform = CATransform3DRotate(_nonCenterTransform, rotValue, 0.0, 0.0, 1.0);

        [Core printLayerInfo:_mainLayer text:@"mainLayer"];
        [Core printCATransform3D:_nonCenterTransform];
        [_mainLayer setTransform:_nonCenterTransform];

        [Core printLayerInfo:_mainLayer text:@"mainLayer"];
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

@end
