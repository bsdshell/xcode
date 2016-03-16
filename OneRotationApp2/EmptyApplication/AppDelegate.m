#import "AppDelegate.h"

// searchkey: transform rotation in arbitrary point 
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    _myView = [[MyViewController alloc]init];
    _nonCenterView = [[MyViewController alloc]init];
    _transform = CATransform3DIdentity;
    _nonCenterTransform = CATransform3DIdentity;
    CGSize size          = [UIScreen mainScreen].bounds.size;
    //----------------------------------------------------------
    _nonCenter = 0;
    _isRotated = false;
    
    _rectLayer = [CAShapeLayer layer];
    _nonCenterLayer = [CAShapeLayer layer];
    _width = 100.0f;
    _height = 100.0f;

    _mycenter = CGPointMake(size.width/2 - _width/2, size.height/2 - _height/2);
    
    _curveCenter = CGPointMake(100, 100);
    
    
    UIBezierPath* path = [UIBezierPath bezierPathWithRect:CGRectMake(_mycenter.x, _mycenter.y, _width, _height)];
    _rectLayer.lineWidth = 10.0f;
    _rectLayer.strokeColor = [[UIColor brownColor] CGColor];
    [_rectLayer setFillColor:[[UIColor clearColor] CGColor]];
    [_rectLayer setPath:[path CGPath]];

    [_myView.view.layer addSublayer:_rectLayer];
    
    UIBezierPath* path1 = [UIBezierPath bezierPathWithRect:CGRectMake(_curveCenter.x - _width/2, _curveCenter.y - _height/2, _width, _height)];
    
    _nonCenterLayer.lineWidth = 10.0f;
    _nonCenterLayer.strokeColor = [[UIColor purpleColor] CGColor];
    [_nonCenterLayer setFillColor:[[UIColor clearColor] CGColor]];
    [_nonCenterLayer setPath:[path1 CGPath]];
    
    [_nonCenterView.view.layer addSublayer:_nonCenterLayer];
    
    CAShapeLayer* cartesianCoordinate = [self CartesianCoordinate];
    [self.window.layer addSublayer:cartesianCoordinate];
    [self.window addSubview:_myView.view];
    [self.window addSubview:_nonCenterView.view];

    [self myDrawRectangle];
    
    CAShapeLayer* verticalLine = [self verticalLine];
    [self.window.layer addSublayer:verticalLine];

    [self myButtonRot];
    
    [self startFinishGameTimer];
    
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)myDrawRectangle{
    CGFloat width = 100.0;
    CGFloat height = 100.0;
    CGSize size          = [UIScreen mainScreen].bounds.size;
    CGFloat offset = 50.0;
    CGPoint centerPoint = CGPointMake(size.width/2 - width/2, size.height/2 - height/2 + offset);

    UIBezierPath* path = [UIBezierPath bezierPathWithRect:CGRectMake(centerPoint.x, centerPoint.y, width, height)];
    _rectLayer.lineWidth = 10.0f;
    _rectLayer.strokeColor = [[UIColor darkGrayColor] CGColor];
    [_rectLayer setFillColor:[[UIColor clearColor] CGColor]];
    [_rectLayer setPath:[path CGPath]];
    [self.window.layer addSublayer:_rectLayer];
}


-(CAShapeLayer*)CartesianCoordinate{
    CGSize size          = [UIScreen mainScreen].bounds.size;
    
    CAShapeLayer* shapeLayer = [CAShapeLayer layer];
    UIBezierPath* path = [UIBezierPath bezierPath];

    // Vertical line
    [path moveToPoint:CGPointMake(size.width/2, 0)];
    [path addLineToPoint:CGPointMake(size.width/2, size.height)];

    // Horizontal line
    [path moveToPoint:CGPointMake(0, size.height/2)];
    [path addLineToPoint:CGPointMake(size.width, size.height/2)];

    shapeLayer.path = [path CGPath];
    shapeLayer.strokeColor = [[UIColor blackColor] CGColor];
    shapeLayer.fillColor = [[UIColor brownColor] CGColor];
    shapeLayer.lineWidth = 1.0f;
    return shapeLayer;
}

-(CAShapeLayer*)verticalLine{
    CGSize size          = [UIScreen mainScreen].bounds.size;
    
    CAShapeLayer* shapeLayer = [CAShapeLayer layer];
    UIBezierPath* path = [UIBezierPath bezierPath];
    
    // Vertical line
    [path moveToPoint:CGPointMake(_mycenter.x + _width+10  + _width/2, 0)];
    [path addLineToPoint:CGPointMake(_mycenter.x + _width+10 + _width/2, size.height)];
    
    shapeLayer.path = [path CGPath];
    shapeLayer.strokeColor = [[UIColor brownColor] CGColor];
    shapeLayer.lineWidth = 1.0f;
    return shapeLayer;
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

-(void)printLayerInfo:(CALayer*)layer{
    CGPoint anchorPoint = layer.anchorPoint;
    CGPoint position = layer.position;
    CGRect layerFrame = layer.frame;
    CGRect layerBounds = layer.bounds;
    NSLog(@"anchor_x=[%f] anchor_y=[%f]  position_x=[%f], position_y=[%f]", anchorPoint.x, anchorPoint.y, position.x, position.y);
    NSLog(@"anchor_point   =[%@]", [NSValue valueWithCGPoint:anchorPoint]);
    NSLog(@"layer_position =[%@]", [NSValue valueWithCGPoint:position]);
    NSLog(@"layer_frame    =[%@]", [NSValue valueWithCGRect:layerFrame]);
    NSLog(@"frame_origin   =[%@]", [NSValue valueWithCGPoint:layerFrame.origin]);
    NSLog(@"layer_bounds   =[%@]", [NSValue valueWithCGRect:layerBounds]);
}

-(void)printCATransform3D:(CATransform3D)transform{
    NSLog(@"-------------------------------------------------------------------------------");
    NSLog(@"[%f] [%f] [%f] [%f]", transform.m11, transform.m12, transform.m13, transform.m14);
    NSLog(@"[%f] [%f] [%f] [%f]", transform.m21, transform.m22, transform.m23, transform.m24);
    NSLog(@"[%f] [%f] [%f] [%f]", transform.m31, transform.m32, transform.m33, transform.m34);
    NSLog(@"[%f] [%f] [%f] [%f]", transform.m41, transform.m42, transform.m43, transform.m44);
    NSLog(@"-------------------------------------------------------------------------------");
}

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
        [self printLayerInfo:_nonCenterView.view.layer];

        _nonCenterView.view.layer.anchorPoint = anchorPoint;

        _nonCenterView.view.layer.position = _curveCenter;
        _nonCenterTransform = CATransform3DRotate(_nonCenterTransform, rotValue, 0.0, 0.0, 1.0);

        [self printLayerInfo:_nonCenterView.view.layer];
        [self printCATransform3D:_nonCenterTransform];
        [_nonCenterView.view.layer setTransform:_nonCenterTransform];

        [self printLayerInfo:_nonCenterView.view.layer];
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
