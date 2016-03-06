#import "AppDelegate.h"

// searchkey: CALayer example and draw one circle, color component
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    CGSize size          = [UIScreen mainScreen].bounds.size;
    
    //----------------------------------------------------------
    CAShapeLayer* circleLayer = [CAShapeLayer layer];
    CGFloat Width = 200.0f;
    CGFloat Height = 200.0f;
    CGFloat leftX = size.width/2 - Width/2;
    CGFloat leftY = size.height/2 - Height/2;
    //UIBezierPath* path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(leftX, leftY, Width, Height)];
    UIBezierPath* path = [UIBezierPath bezierPathWithRect:CGRectMake(leftX, leftY, Width, Height)];

    [self printLayerInfo:circleLayer];
    
    [circleLayer setPath:[path CGPath]];
    //circleLayer.position = CGPointMake(10, 10);
    [circleLayer setBounds:CGRectMake(0, 0, 50, 50)];
    //[circleLayer setFrame:CGRectMake(0, 0, 100, 100)];
    circleLayer.lineWidth = 1.0f;
    circleLayer.strokeColor = [[UIColor brownColor] CGColor];
    [circleLayer setFillColor:[[UIColor clearColor] CGColor]];
    //----------------------------------------------------------
    [self printLayerInfo:circleLayer];
    
    [self.window.layer addSublayer:circleLayer];

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
    //----------------------------------------------------------

    CAShapeLayer* cartesianLayer = [self CartesianCoordinate];
    [self.window.layer addSublayer:cartesianLayer];
    
   [self.window makeKeyAndVisible];
    return YES;
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


-(void)printLayerInfo:(CALayer*)layer{
    NSLog(@"-----------------------------------------------------");
    CGPoint anchorPoint = layer.anchorPoint;
    CGPoint position = layer.position;
    CGRect layerFrame = layer.frame;
    CGRect layerBounds = layer.bounds;
    NSLog(@"anchor_point   =[%@]", [NSValue valueWithCGPoint:anchorPoint]);
    NSLog(@"layer_position =[%@]", [NSValue valueWithCGPoint:position]);
    NSLog(@"layer_frame    =[%@]", [NSValue valueWithCGRect:layerFrame]);
    NSLog(@"layer_bounds   =[%@]", [NSValue valueWithCGRect:layerBounds]);
    NSLog(@"-----------------------------------------------------");
}

-(void)startClick1:(id)sender{
    NSLog(@"Click me11");
}

@end
