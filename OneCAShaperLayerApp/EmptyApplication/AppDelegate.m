//
//  AppDelegate.m
//  EmptyApplication
//
//  Created by cat on 5/6/14.
//  Copyright (c) 2014 searchBarDemo. All rights reserved.
//

#import "AppDelegate.h"


// searchkey: CALayer example and draw one circle, color component
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    self.window.backgroundColor = [UIColor whiteColor];

    
    //----------------------------------------------------------
    CAShapeLayer* circleLayer = [CAShapeLayer layer];
    CGFloat leftX = 60.0f;
    CGFloat leftY = 100.0f;
    CGFloat Width = 240.0f;
    CGFloat Height = 200.0f;
    UIBezierPath* path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(leftX, leftY, Width, Height)];
    [circleLayer setPath:[path CGPath]];
    CGFloat component[4];
    component[0] = 100.0;
    component[1] = 1.0;
    component[2] = 0.5;
    component[3] = 0.9;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    [circleLayer setStrokeColor:CGColorCreate(colorSpace, component)];
    //[circleLayer setLineWidth:4.0f];
    circleLayer.lineWidth = 4.0f;
    circleLayer.borderColor = [[UIColor yellowColor]CGColor];
    [circleLayer setFillColor:[[UIColor clearColor] CGColor]];
    //----------------------------------------------------------
    CAShapeLayer* circleLayer1 = [CAShapeLayer layer];
    CGFloat leftX1 = 60.0f;
    CGFloat leftY1 = 200.0f;
    CGFloat Width1 = 240.0f;
    CGFloat Height1 = 200.0f;
    UIBezierPath* path1 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(leftX1, leftY1, Width1, Height1)];
    [circleLayer1 setPath:[path1 CGPath]];
    CGFloat component1[4];
    component1[0] = 20.0;
    component1[1] = 0.5;
    component1[2] = 0.5;
    component1[3] = 0.9;
    CGColorSpaceRef colorSpace1 = CGColorSpaceCreateDeviceRGB();
    [circleLayer1 setStrokeColor:CGColorCreate(colorSpace1, component1)];
    circleLayer1.lineWidth = 40.0f;
    [circleLayer1 setFillColor:[[UIColor clearColor] CGColor]];
    
    
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.startPoint = CGPointMake(0.5,1.0);
    gradientLayer.endPoint = CGPointMake(0.5,0.0);
    gradientLayer.frame = CGRectMake(0, 0, self.window.bounds.size.width, self.window.bounds.size.height);
    NSMutableArray *colors = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        [colors addObject:(id)[[UIColor colorWithHue:(0.1 * i) saturation:1 brightness:.8 alpha:1] CGColor]];
    }
    gradientLayer.colors = colors;
    
    [gradientLayer setMask:circleLayer1];
    
    CAShapeLayer* rectLayer = [self drawRectangle:CGPointMake(200, 300) semiWidth:100 semiHeight:100];
    [gradientLayer setMask:rectLayer];
    //[self.window.layer addSublayer:rectLayer];
    [self.window.layer addSublayer:gradientLayer];
    
    //----------------------------------------------------------

    
    [self.window.layer addSublayer:circleLayer];
    //[self.window.layer addSublayer:circleLayer1];
    
    [self.window makeKeyAndVisible];
    return YES;
}

// draw rectangle
-(CAShapeLayer*)drawRectangle:(CGPoint) location semiWidth:(CGFloat) semiWidth semiHeight:(CGFloat)semiHeight{
    CAShapeLayer* shapeLayer = [CAShapeLayer layer];
    UIBezierPath* path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(location.x - semiWidth, location.y - semiHeight)];
    
    [path addLineToPoint:CGPointMake(location.x + semiWidth, location.y - semiHeight)];
    [path addLineToPoint:CGPointMake(location.x + semiWidth, location.y + semiHeight)];
    [path addLineToPoint:CGPointMake(location.x - semiWidth, location.y + semiHeight)];
    [path addLineToPoint:CGPointMake(location.x - semiWidth + 0.5, location.y - semiHeight + 0.5)];
    
    shapeLayer.path = [path CGPath];
    
    shapeLayer.strokeColor = [[UIColor yellowColor] CGColor];
    shapeLayer.fillColor = [[UIColor brownColor] CGColor];
    shapeLayer.lineWidth = 1;
    [shapeLayer setFillColor:[[UIColor clearColor] CGColor]];

    return shapeLayer;
}



- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
