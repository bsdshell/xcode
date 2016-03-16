#import "ViewController.h"
#import "QuartzCore/QuartzCore.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _mainLayer = [CAShapeLayer layer];
    _clickPos   = [[UILabel alloc] initWithFrame:CGRectMake(10, 200, 200, 20)];
    _clickPos.text = @"0";
    _anchorLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 300, 300, 100)];
    _mainLabel= [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 200, 100)];
    _mainLabel.backgroundColor = [UIColor brownColor];
    _mainWidth = 200;
    _mainHeight = 200;


    _coordinates = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 200, 20)];
    _size = [UIScreen mainScreen].bounds.size; // screen size
    NSString* coorText = [NSString stringWithFormat:@"[%@]", [NSValue valueWithCGSize:_size]];
    [self createLabel:_coordinates text:coorText];

    [self.view addSubview:_clickPos];
    [self.view addSubview:_anchorLabel];

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self CartesianCoordinate:self.view.layer];
    [self animationRectangle];

    UIButton* mybut = [UIButton buttonWithType:UIButtonTypeSystem];
    CGRect frame = CGRectMake(200, 400, 140, 50);
    mybut.frame = frame;
    [mybut addTarget:self action:@selector(clickMe:) forControlEvents:UIControlEventTouchUpInside];
    [mybut setTitle:@"Rotate" forState:(UIControlState) UIControlStateNormal];
    [mybut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [mybut.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    mybut.backgroundColor = [UIColor brownColor];
    [self.view addSubview:mybut];
}

-(void)clickMe:(id)sender{
    NSLog(@"Click me");
    [_mainLayer addAnimation:_rotationAnimation forKey:@"rotationAnimation"];
}
-(NSString*)printLayerInfo:(CALayer*)layer{
    NSLog(@"-----------------------------------------------------------------------");

    CGPoint anchorPoint = layer.anchorPoint;
    CGPoint position = layer.position;
    CGRect frame = layer.frame;
    CGRect bounds = layer.bounds;
    
    NSString* text = [NSString stringWithFormat:@"anchor[%@]\n position[%@]\n frame[%@]\n bounds[%@]\n f.origin[%@]",
                      [NSValue valueWithCGPoint:anchorPoint],
                      [NSValue valueWithCGPoint:position],
                      [NSValue valueWithCGRect:frame],
                      [NSValue valueWithCGRect:bounds],
                      [NSValue valueWithCGPoint:frame.origin]
                      ];
    [self createLabel:_anchorLabel text:text];

    NSLog(@"anchor   [%@]", [NSValue valueWithCGPoint:anchorPoint]);
    NSLog(@"position [%@]", [NSValue valueWithCGPoint:position]);
    NSLog(@"frame.or [%@]", [NSValue valueWithCGPoint:frame.origin]);
    NSLog(@"frame    [%@]", [NSValue valueWithCGRect:frame]);
    NSLog(@"bounds   [%@]", [NSValue valueWithCGRect:bounds]);
    NSLog(@"-----------------------------------------------------------------------");
    return text;
}


// [layer addAnimation:_rotationAnimation forKey:@"rotationAnimation"];
-(CABasicAnimation*)createAnimation{
    CGFloat duration = 3.0;
    CGFloat repeat = 1.0;
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0];
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = repeat;
    return rotationAnimation;
}

-(void)createLabel:(NSString*)text{
    UILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 300, 300, 300)];
    [myLabel setTextColor:[UIColor blueColor]];
    //[myLabel setBackgroundColor:[UIColor clearColor]];
    [myLabel setFont:[UIFont fontWithName: @"Trebuchet MS" size: 12.0f]];
    [myLabel setText:text];
    [myLabel setNumberOfLines:0];
    [self.view addSubview:myLabel];
}

-(void)createLabel:(NSString*)text x:(NSInteger)x y:(NSInteger)y{
    UILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, 300, 300)];
    [myLabel setTextColor:[UIColor blueColor]];
    [myLabel setBackgroundColor:[UIColor clearColor]];
    [myLabel setFont:[UIFont fontWithName: @"Trebuchet MS" size: 12.0f]];
    [myLabel setText:text];
    [myLabel setNumberOfLines:0];
    [self.view addSubview:myLabel];
}

-(void)createLabel:(UILabel*)myLabel text:(NSString*)text{
    [myLabel setTextColor:[UIColor blueColor]];
    [myLabel setBackgroundColor:[UIColor grayColor]];
    [myLabel setFont:[UIFont fontWithName: @"Trebuchet MS" size: 12.0f]];
    [myLabel setText:text];
    [myLabel setNumberOfLines:0];
    [self.view addSubview:myLabel];
}

-(void)animationRectangle{
    NSInteger numBlocks  = 3;
    CGFloat blockMarginX = 10;
    CGFloat blockMarginY = 10;
    CGFloat width        = 50.0;
    CGFloat height       = 50.0;
    CGFloat marginX      = 10;
    CGFloat marginY      = 10;
    CGPoint mainUpLeft   = CGPointMake(0, 0);
    CGPoint blockUpLeft  = CGPointMake((_mainWidth - numBlocks*width - (numBlocks-1)*blockMarginX)/2, (_mainHeight - numBlocks*height - (numBlocks-1)*blockMarginY)/2);
    CGSize size          = [UIScreen mainScreen].bounds.size;
    CGPoint leftUp       = CGPointMake(0, 0);
    _prevPos           = CGPointMake(0, 0);

    _rotationAnimation = [self createAnimation];
    UIBezierPath* path     = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, _mainWidth, _mainHeight)];
    _mainLayer.path        = [path CGPath];
    _mainLayer.bounds = CGRectMake(0, 0, _mainWidth, _mainHeight);
    _mainLayer.position = CGPointMake(100, 200);
    _mainLayer.lineWidth   = 4.0f;
    _mainLayer.strokeColor = [[UIColor yellowColor]CGColor];
    [_mainLayer setBackgroundColor:[[UIColor cyanColor]CGColor]];
    
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
            
            [self printLayerInfo:_rectLayer];

            //[self.view.layer addSublayer:_rectLayer];
            
            [_mainLayer addSublayer:_rectLayer];
        }
    }
    [_mainLayer addAnimation:_rotationAnimation forKey:@"rotationAnimation"];
    _mainLayer.anchorPoint = CGPointMake(0.5, 0.5);
    [self.view.layer addSublayer:_mainLayer];
    NSString* anchorText = [self printLayerInfo:_rectLayer];
    
//    CAShapeLayer* newLayer = [CAShapeLayer layer];
//    UIBezierPath* newPath = [UIBezierPath bezierPathWithRect:CGRectMake(leftUp.x, leftUp.y, width, height)];
//    newLayer.lineWidth = 10.0f;
//    newLayer.strokeColor = [[UIColor brownColor] CGColor];
//    [newLayer setFillColor:[[UIColor clearColor] CGColor]];
//    [newLayer setPath:[newPath CGPath]];
//    
//    newLayer.bounds = newPath.bounds;
//    CGPoint newLayerCenter = CGPointMake(leftUp.x + width/2 , leftUp.y + height/2);
//    
//    newLayer.anchorPoint = CGPointMake(newLayerCenter.x/size.width, newLayerCenter.y/size.height);
//    CGFloat offset = 100.0;
//    newLayer.position = CGPointMake(size.width/2, size.height/2 + offset);
//    
//    [newLayer addAnimation:_rotationAnimation forKey:@"rotationAnimation"];
//    [self.view.layer addSublayer:newLayer];
}

-(void)CartesianCoordinate:(CALayer*)layer{
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
    [layer addSublayer:shapeLayer];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s", __PRETTY_FUNCTION__);

    UITouch* touch = [touches anyObject];
    if(touch != nil){
        CGPoint currXY = [touch locationInView:touch.view];
        _prevPos = currXY;
        NSString* text = [NSString stringWithFormat:@"[%@]", [NSValue valueWithCGPoint:currXY]];
        //_rectLayer.position = currXY;
        
        [self createLabel:_clickPos text:text];

        NSString* mainLayer = [self printLayerInfo:_mainLayer];
        [self createLabel:_mainLabel text:mainLayer];

        CGPoint layerToSelfP = [self.view.layer convertPoint:currXY toLayer:_mainLayer];
        CGPoint selfToLayerP = [_mainLayer convertPoint:currXY toLayer:self.view.layer];
        NSLog(@"layerToSelfP[%@]", [NSValue valueWithCGPoint:layerToSelfP]);
        NSLog(@"selfToLayerP[%@]", [NSValue valueWithCGPoint:selfToLayerP]);
        NSLog(@"currXY      [%@]", [NSValue valueWithCGPoint:currXY]);
        NSLog(@"f.o + currXY[%@]", [NSValue valueWithCGPoint:CGPointMake(currXY.x + _mainLayer.frame.origin.x, currXY.y + _mainLayer.frame.origin.y)]);
        
        //currXY = [_mainLayer convertPoint:currXY toLayer:self.view.layer];
        if(CGPathContainsPoint(_mainLayer.path, NULL, layerToSelfP, FALSE)){
        //if(CGPathContainsPoint(_mainLayer.path, NULL, CGPointMake(currXY.x, currXY.y), FALSE)){
            _mainLayer.position = CGPointMake(_mainLayer.position.x + currXY.x - _prevPos.x, _mainLayer.position.y + currXY.y - _prevPos.y);
        }
        //_cursorPos = currXY;
//        if(CGPathContainsPoint(_rectLayer.path, NULL, currXY, FALSE)){
//            _rectLayer.position = currXY;
//        }
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch* touch = [touches anyObject];


    if(touch != nil){
        CGPoint currXY = [touch locationInView:touch.view];
        NSString* text = [NSString stringWithFormat:@"[%@]", [NSValue valueWithCGPoint:currXY]];
        //_rectLayer.position = currXY;
        [self createLabel:_clickPos text:text];

        NSLog(@"path[%@]", [NSValue valueWithCGRect:_mainLayer.frame]);
        
        //currXY = [_mainLayer convertPoint:currXY toLayer:self.view.layer];

        CGPoint layerToSelfP = [self.view.layer convertPoint:currXY toLayer:_mainLayer];
        CGPoint selfToLayerP = [_mainLayer convertPoint:currXY toLayer:self.view.layer];
        NSLog(@"layerToSelfP[%@]", [NSValue valueWithCGPoint:layerToSelfP]);
        NSLog(@"selfToLayerP[%@]", [NSValue valueWithCGPoint:selfToLayerP]);
        NSLog(@"currXY      [%@]", [NSValue valueWithCGPoint:currXY]);
        NSLog(@"f.o + currXY[%@]", [NSValue valueWithCGPoint:CGPointMake(currXY.x + _mainLayer.frame.origin.x, currXY.y + _mainLayer.frame.origin.y)]);
        
        if(CGPathContainsPoint(_mainLayer.path, NULL, layerToSelfP, FALSE)){
//        if(CGPathContainsPoint(_mainLayer.path, NULL, currXY, FALSE)){
            _mainLayer.position = CGPointMake(_mainLayer.position.x + currXY.x - _prevPos.x , _mainLayer.position.y + currXY.y - _prevPos.y);
        }

//        if(CGPathContainsPoint(_rectLayer.path, NULL, currXY, FALSE)){
//            _rectLayer.position = CGPointMake(currXY.x - _cursorPos.x, currXY.y -_cursorPos.y);
//        }
        
        NSString* anchorText = [self printLayerInfo:_rectLayer];
        [self createLabel:_anchorLabel text:anchorText];

        NSString* mainLayer = [self printLayerInfo:_mainLayer];
        [self createLabel:_mainLabel text:mainLayer];

        _prevPos = currXY; 
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    UITouch* touch = [touches anyObject];
    if(touch != nil){
        CGPoint currXY = [touch locationInView:touch.view];

        if(CGPathContainsPoint(_mainLayer.path, NULL, currXY, FALSE)){
            _mainLayer.position = CGPointMake(_mainLayer.position.x + _prevPos.x - currXY.x, _mainLayer.position.y + _prevPos.y - currXY.y);
        }
//        if(CGPathContainsPoint(_rectLayer.path, NULL, currXY, FALSE)){
//            _rectLayer.position = CGPointMake(_cursorPos.x - currXY.x, _cursorPos.y - currXY.y);
//        }
        _prevPos = currXY;
    }
}

- (void)viewDidUnload{
    [super viewDidUnload];
}

@end
