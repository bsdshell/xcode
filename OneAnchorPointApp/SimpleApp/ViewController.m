#import "ViewController.h"
#import "QuartzCore/QuartzCore.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _clickPos   = [[UILabel alloc] initWithFrame:CGRectMake(10, 200, 200, 20)];
    _clickPos.text = @"0";
    _anchorLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 300, 300, 100)];

    _coordinates = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 200, 20)];
    _size = [UIScreen mainScreen].bounds.size; // screen size
    NSString* coorText = [NSString stringWithFormat:@"[%@]", [NSValue valueWithCGSize:_size]];
    [self createLabel:_coordinates text:coorText];

    [self.view addSubview:_clickPos];
    [self.view addSubview:_anchorLabel];

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self CartesianCoordinate:self.view.layer];
    [self animationRectangle];
}

-(NSString*)printLayerInfo:(CALayer*)layer{
    CGPoint anchorPoint = layer.anchorPoint;
    CGPoint position = layer.position;
    CGRect frame = layer.frame;
    CGRect bounds = layer.bounds;
    
    NSString* text = [NSString stringWithFormat:@"anchor[%@]\n position[%@]\n frame[%@]\n bounds[%@]",
                      [NSValue valueWithCGPoint:anchorPoint], [NSValue valueWithCGPoint:position], [NSValue valueWithCGRect:frame], [NSValue valueWithCGRect:bounds]];
    [self createLabel:_anchorLabel text:text];

    NSLog(@"anchor  [%@]", [NSValue valueWithCGPoint:anchorPoint]);
    NSLog(@"position[%@]", [NSValue valueWithCGPoint:position]);
    NSLog(@"frame   [%@]", [NSValue valueWithCGRect:frame]);
    NSLog(@"bounds  [%@]", [NSValue valueWithCGRect:bounds]);
    return text;
}


// [layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
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


-(void)animationRectangle{
    CGFloat width = 40.0;
    CGFloat height = 40.0;
    CGSize size          = [UIScreen mainScreen].bounds.size;
    CGPoint leftUp = CGPointMake(0, 0);

    CABasicAnimation* rotationAnimation = [self createAnimation];
    
    CAShapeLayer* mainLayer = [CAShapeLayer layer];
    mainLayer.frame = CGRectMake(0, 0, 200, 150);
    mainLayer.lineWidth = 4.0f;
    mainLayer.strokeColor = [[UIColor blackColor]CGColor];
    
    for(int i=0; i<2; i++){
        for(int j=0; j<2; j++){
            _rectLayer = [CAShapeLayer layer];
            
            UIBezierPath* path = [UIBezierPath bezierPathWithRect:CGRectMake(leftUp.x + j*50, leftUp.y + i*50, width, height)];
            
            _rectLayer.lineWidth = 1.0f;
            _rectLayer.strokeColor = [[UIColor brownColor] CGColor];
            [_rectLayer setFillColor:[[UIColor clearColor] CGColor]];
            [_rectLayer setPath:[path CGPath]];
            _rectLayer.bounds = CGRectMake(0, 0, width, height);
            _rectLayer.position = CGPointMake(size.width/2, size.height/2);
            //_rectLayer.position = CGPointMake(30, 30);
        
            if(i % 2 == 0)
                _rectLayer.backgroundColor = [[UIColor greenColor] CGColor];
            else
                _rectLayer.backgroundColor = [[UIColor blueColor] CGColor];
            
            [self printLayerInfo:_rectLayer];

            [self.view.layer addSublayer:_rectLayer];
            
            //[mainLayer addSublayer:_rectLayer];
        }
    }
    [mainLayer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    mainLayer.position = CGPointMake(100, 100);
    mainLayer.backgroundColor = [[UIColor clearColor] CGColor];
    mainLayer.anchorPoint = CGPointMake(0.5, 0.5);
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

-(void)createLabel:(NSString*)text{
    
    
    UILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 300, 300, 300)];
    [myLabel setTextColor:[UIColor blueColor]];
    [myLabel setBackgroundColor:[UIColor clearColor]];
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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    UITouch* touch = [touches anyObject];
    if(touch != nil){
        CGPoint currXY = [touch locationInView:touch.view];
        NSString* text = [NSString stringWithFormat:@"[%@]", [NSValue valueWithCGPoint:currXY]];
        _rectLayer.position = currXY;
        
        [self createLabel:_clickPos text:text];

//NSString* anchorText = [self printLayerInfo:_rectLayer];
//[self createLabel:_anchorLabel text:anchorText];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch* touch = [touches anyObject];
    if(touch != nil){
        CGPoint currXY = [touch locationInView:touch.view];
        NSString* text = [NSString stringWithFormat:@"[%@]", [NSValue valueWithCGPoint:currXY]];
        _rectLayer.position = currXY;
        [self createLabel:_clickPos text:text];

        NSString* anchorText = [self printLayerInfo:_rectLayer];
        [self createLabel:_anchorLabel text:anchorText];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    UITouch* touch = [touches anyObject];
    if(touch != nil){
        CGPoint touchXY = [touch locationInView:touch.view];
        NSString* mytext = [NSString stringWithFormat:@"[%.01f][%.01f]", touchXY.x, touchXY.y];
    }
}

-(void) clickMe:(id) sender{
    NSLog(@"click me");
}

- (void)viewDidUnload{
    [super viewDidUnload];
}

@end
