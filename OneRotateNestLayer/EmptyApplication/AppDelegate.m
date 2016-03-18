#import "AppDelegate.h"
#import "Core.h"

// searchkey: transform rotation in arbitrary point 
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    _mainPos = CGPointMake(100, 300);
    _outerLayer = [CAShapeLayer layer];

    _mainView = [[MyViewController alloc]init];
    _transform = CATransform3DIdentity;
    _rotateTransform = CATransform3DIdentity;
    //----------------------------------------------------------
    _deltaCount = 0;
    _isRotated = false;

    _outerLayer = [CAShapeLayer layer];
    _rectLayer = [CAShapeLayer layer];
    _nonCenterLayer = [CAShapeLayer layer];
    _width = 100.0f;
    _height = 100.0f;
    _outerWidth = 200;
    _outerHeight = 200;
    
    CAShapeLayer* cartesianCoordinate = [Core CartesianCoordinate];
    [self.window.layer addSublayer:cartesianCoordinate];
    [self.window addSubview:_mainView.view];

    [self myDrawRectangle];
    [self myButtonRot];
    //[self startFinishGameTimer];
    
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)myDrawRectangle{
    NSInteger numBlocks  = 2;
    CGFloat width = 50.0;
    CGFloat height = 50.0;
    CGFloat blockMarginX = 10;
    CGFloat blockMarginY = 10;
    CGPoint blockUpLeft  = CGPointMake((_outerWidth - numBlocks*width - (numBlocks-1)*blockMarginX)/2, (_outerHeight - numBlocks*height - (numBlocks-1)*blockMarginY)/2);

    CGSize size          = [UIScreen mainScreen].bounds.size;
    CGFloat offset = 50.0;

    UIBezierPath* mainPath     = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, _outerWidth, _outerHeight)];
    _outerLayer.path        = [mainPath CGPath];
    _outerLayer.bounds = CGRectMake(0, 0, _outerWidth, _outerHeight);
    _outerLayer.position = _mainPos;
    _outerLayer.lineWidth   = 4.0f;
    _outerLayer.strokeColor = [[UIColor yellowColor]CGColor];
    
    
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
            
            [_outerLayer addSublayer:_rectLayer];
        }
    }
    [_outerLayer setBackgroundColor:[[UIColor cyanColor]CGColor]];
    _outerLayer.anchorPoint = CGPointMake(0.5, 0.5);
    [_outerLayer setTransform:_rotateTransform];
    [self.window.layer addSublayer:_outerLayer];

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

        _rotateTransform = CATransform3DIdentity;

        CGFloat radians = 2*M_PI/100.0f;
        CGFloat rotValue = _deltaCount*radians;

        [Core printLayerInfo:_outerLayer text:@"mainLayer1"];

        _outerLayer.anchorPoint = CGPointMake(0.5, 0.5);

        _outerLayer.position = _mainPos;
        _rotateTransform = CATransform3DRotate(_rotateTransform, rotValue, 0.0, 0.0, 1.0);

        [Core printLayerInfo:_outerLayer text:@"mainLayer2"];
        [Core printCATransform3D:_rotateTransform];
        [_outerLayer setTransform:_rotateTransform];

        [Core printLayerInfo:_outerLayer text:@"mainLayer3"];
    }
}

-(void)clickNonCenter:(id)sender{
    _isRotated = _isRotated? NO : YES;
    if(_isRotated){
        [self startFinishGameTimer];
    }
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
