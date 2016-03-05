#import "AppDelegate.h"

// searchkey: transform rotation
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    _myView = [[MyViewController alloc]init];
    
    CGSize size          = [UIScreen mainScreen].bounds.size;
    //----------------------------------------------------------
    _axisX = false;
    _axisY = false;
    _axisZ = false;
    _rotX = 0;
    _rotY = 0;
    _rotZ = 0;
    
    _shapeLayer = [CAShapeLayer layer];
    CGFloat Width = 200.0f;
    CGFloat Height = 200.0f;
    _transform = CATransform3DIdentity;

    _mycenter = CGPointMake(size.width/2 - Width/2, size.height/2 - Height/2);
    //UIBezierPath* path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(_mycenter.x, _mycenter.y, Width, Height)];
    UIBezierPath* path = [UIBezierPath bezierPathWithRect:CGRectMake(_mycenter.x, _mycenter.y, Width, Height)];

    
    [_shapeLayer setPath:[path CGPath]];

    
    _shapeLayer.lineWidth = 10.0f;
    _shapeLayer.strokeColor = [[UIColor brownColor] CGColor];
    [_shapeLayer setFillColor:[[UIColor clearColor] CGColor]];
//    _shapeLayer.anchorPoint = CGPointMake(0.0f, 0.0f);
    
    CGPoint anchorPoint = self.window.layer.anchorPoint;
    NSLog(@"init_anchor_x=[%f] init_anchor_y=[%f] ", anchorPoint.x, anchorPoint.y);
    
    [_myView.view.layer addSublayer:_shapeLayer];
    
    [self.window addSubview:_myView.view];
    
    
    [self myButtonX];
    [self myButtonY];
    [self myButtonZ];
   [self startFinishGameTimer];
    
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)myButtonX{
    UIButton* mybut = [UIButton buttonWithType:UIButtonTypeSystem];
    CGRect frame = CGRectMake(2, 450, 100, 50);
    mybut.frame = frame;
    [mybut addTarget:self action:@selector(clickRotX:) forControlEvents:UIControlEventTouchUpInside];
    [mybut setTitle:@"Rotate X" forState:(UIControlState) UIControlStateNormal];
    [mybut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [mybut.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    mybut.backgroundColor = [UIColor brownColor];
    [self.window addSubview:mybut];
}

-(void)myButtonY{
    UIButton* mybut = [UIButton buttonWithType:UIButtonTypeSystem];
    CGRect frame = CGRectMake(110, 450, 100, 50);
    mybut.frame = frame;
    [mybut addTarget:self action:@selector(clickRotY:) forControlEvents:UIControlEventTouchUpInside];
    [mybut setTitle:@"Rotate Y" forState:(UIControlState) UIControlStateNormal];
    [mybut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [mybut.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    mybut.backgroundColor = [UIColor brownColor];
    [self.window addSubview:mybut];
}

-(void)myButtonZ{
    UIButton* mybut = [UIButton buttonWithType:UIButtonTypeSystem];
    CGRect frame = CGRectMake(230, 450, 100, 50);
    mybut.frame = frame;
    [mybut addTarget:self action:@selector(clickRotZ:) forControlEvents:UIControlEventTouchUpInside];
    [mybut setTitle:@"Rotate Z" forState:(UIControlState) UIControlStateNormal];
    [mybut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [mybut.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    mybut.backgroundColor = [UIColor brownColor];
    [self.window addSubview:mybut];
}

-(void)clickRotX:(id)sender{
    _axisX = true;
    _axisY = false;
    _axisZ = false;
}

-(void)clickRotY:(id)sender{
    _axisX = false;
    _axisY = true;
    _axisZ = false;
}

-(void)clickRotZ:(id)sender{
    _axisX = false;
    _axisY = false;
    _axisZ = true;
}

-(void)startClick1:(id)sender{
     _transform = CATransform3DIdentity;
     _transform.m34 = -1.0/600.0f;
    CGFloat radians = 1*(2*M_PI/100.0f);
    
    if(_axisX){
        if(_rotX < 100)
            _rotX++;
        else
            _rotX = 1;
        
    }
    CGFloat rotValue = _rotX*radians;

    _transform = CATransform3DRotate(_transform, rotValue, 1.0, 0.0, 0.0);


    if(_axisY){
        if(_rotY < 100)
            _rotY++;
        else
            _rotY = 1;

    }
    rotValue = _rotY*radians;
    _transform = CATransform3DRotate(_transform, rotValue, 0.0, 1.0, 0.0);
    
    if(_axisZ){
        if(_rotZ < 100)
            _rotZ++;
        else
            _rotZ = 1;
        
    }
    rotValue = _rotZ*radians;
    _transform = CATransform3DRotate(_transform, rotValue, 0.0, 0.0, 1.0);
    
    [_myView.view.layer setTransform:_transform];
    
    CGPoint anchorPoint = self.window.layer.anchorPoint;
    CGPoint position = self.window.layer.position;
    NSLog(@"anchor_x=[%f] anchor_y=[%f]  position_x=[%f], position_y=[%f]", anchorPoint.x, anchorPoint.y, position.x, position.y);
    
    NSLog(@"numClick=[%ld]", _numClick);
    NSLog(@"radians =[%f]", radians);
    NSLog(@"---------------------------------------------");
    NSLog(@"[%f] [%f] [%f] [%f]", _transform.m11, _transform.m12, _transform.m13, _transform.m14);
    NSLog(@"[%f] [%f] [%f] [%f]", _transform.m21, _transform.m22, _transform.m23, _transform.m24);
    NSLog(@"[%f] [%f] [%f] [%f]", _transform.m31, _transform.m32, _transform.m33, _transform.m34);
    NSLog(@"[%f] [%f] [%f] [%f]", _transform.m41, _transform.m42, _transform.m43, _transform.m44);
    NSLog(@"---------------------------------------------");
}

-(void)startFinishGameTimer{
    if (_tickFinish!= nil)
        [_tickFinish invalidate];
    _tickFinish = [NSTimer scheduledTimerWithTimeInterval:0.05f
                                                   target:self
                                                 selector:@selector(startClick1:)
                                                 userInfo:nil
                                                  repeats:YES];
}

@end
