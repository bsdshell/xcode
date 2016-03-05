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
    CGFloat Width = 240.0f;
    CGFloat Height = 200.0f;
    CGFloat leftX = size.width/2 - Width/2;
    CGFloat leftY = size.height/2 - Height/2;
    UIBezierPath* path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(leftX, leftY, Width, Height)];
    
    [circleLayer setPath:[path CGPath]];

    circleLayer.lineWidth = 10.0f;
    circleLayer.strokeColor = [[UIColor brownColor] CGColor];
    [circleLayer setFillColor:[[UIColor clearColor] CGColor]];
    //----------------------------------------------------------
    
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
    [self printLayerInfo:self.window.layer];
    self.window.layer.anchorPoint = CGPointMake(0.5, 0.5);
    [self printLayerInfo:self.window.layer];
    
   [self.window makeKeyAndVisible];
    return YES;
}

-(void)printLayerInfo:(CALayer*)layer{
    CGPoint anchorPoint = layer.anchorPoint;
    CGPoint position = layer.position;
    CGRect layerFrame = layer.frame;
    CGRect layerBounds = layer.bounds;
    NSLog(@"anchor_point   =[%@]", [NSValue valueWithCGPoint:anchorPoint]);
    NSLog(@"layer_position =[%@]", [NSValue valueWithCGPoint:position]);
    NSLog(@"layer_frame    =[%@]", [NSValue valueWithCGRect:layerFrame]);
    NSLog(@"layer_bounds   =[%@]", [NSValue valueWithCGRect:layerBounds]);
}

-(void)startClick1:(id)sender{
    NSLog(@"Click me11");
}

@end
