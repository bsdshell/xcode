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
    CGFloat leftX = 60.0f;
    CGFloat leftY = 100.0f;
    CGFloat Width = 240.0f;
    CGFloat Height = 200.0f;
    UIBezierPath* path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(leftX, leftY, Width, Height)];
    CGFloat component[4];
    component[0] = 100.0;
    component[1] = 1.0;
    component[2] = 0.5;
    component[3] = 0.9;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    // ------------------------------------------------------------------
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.startPoint = CGPointMake(0.5,1.0);
    gradientLayer.endPoint = CGPointMake(0.5,0.0);
    gradientLayer.frame = CGRectMake(0, 0, self.window.bounds.size.width, self.window.bounds.size.height);
    NSMutableArray *colors = [NSMutableArray array];
    for (int i = 0; i < 5; i++) {
        [colors addObject:(id)[[UIColor colorWithHue:(0.3 * i) saturation:0.5 brightness:.8 alpha:0.5] CGColor]];
    }
    gradientLayer.colors = colors;
    CAShapeLayer* rectLayer = [self drawRectangle:CGPointMake(200, 50) semiWidth:40 semiHeight:40];
    [gradientLayer setMask:rectLayer];
    [self.window.layer addSublayer:gradientLayer];

    // ------------------------------------------------------------------
    CAGradientLayer *gradientLayer1 = [CAGradientLayer layer];
    gradientLayer1.startPoint = CGPointMake(0.5,1.0);
    gradientLayer1.endPoint = CGPointMake(0.5,0.0);
    gradientLayer1.frame = CGRectMake(0, 0, self.window.bounds.size.width, self.window.bounds.size.height);
    NSMutableArray *colors1 = [NSMutableArray array];
    for (int i = 0; i < 5; i++) {
        [colors1 addObject:(id)[[UIColor colorWithHue:(0.3 * i) saturation:0.5 brightness:.8 alpha:0.5] CGColor]];
    }
    gradientLayer1.colors = colors1;
    CAShapeLayer* rectLayer1 = [self drawRectangle1:CGPointMake(200, 200) semiWidth:40 semiHeight:40];
    [gradientLayer1 setMask:rectLayer1];
    [self.window.layer addSublayer:gradientLayer1];
   
    // ------------------------------------------------------------------
    CAGradientLayer *gradientLayer2 = [CAGradientLayer layer];
    gradientLayer2.startPoint = CGPointMake(0.5,1.0);
    gradientLayer2.endPoint = CGPointMake(0.5,0.0);
    gradientLayer2.frame = CGRectMake(0, 0, self.window.bounds.size.width, self.window.bounds.size.height);
    NSMutableArray *colors2 = [NSMutableArray array];
    for (int i = 0; i < 5; i++) {
        [colors2 addObject:(id)[[UIColor colorWithHue:(0.3 * i) saturation:0.7 brightness:.8 alpha:0.5] CGColor]];
    }
    gradientLayer2.colors = colors2;
    CAShapeLayer* rectLayer2 = [self drawRectangle2:CGPointMake(200, 350) semiWidth:40 semiHeight:40];
    [gradientLayer2 setMask:rectLayer2];
    [self.window.layer addSublayer:gradientLayer2];
    // ------------------------------------------------------------------

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
    [path addLineToPoint:CGPointMake(location.x - semiWidth, location.y - semiHeight)];

    [path closePath];
    shapeLayer.path = [path CGPath];
    
    shapeLayer.strokeColor = [[UIColor yellowColor] CGColor];
    [shapeLayer setFillColor:[[UIColor clearColor] CGColor]];
    shapeLayer.lineWidth = 10;

    return shapeLayer;
}


// draw rectangle
-(CAShapeLayer*)drawRectangle1:(CGPoint) location semiWidth:(CGFloat) semiWidth semiHeight:(CGFloat)semiHeight{
    CAShapeLayer* shapeLayer = [CAShapeLayer layer];
    UIBezierPath* path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(location.x - semiWidth, location.y - semiHeight)];
    
    [path addLineToPoint:CGPointMake(location.x + semiWidth, location.y - semiHeight)];
    [path addLineToPoint:CGPointMake(location.x + semiWidth, location.y + semiHeight)];
    [path addLineToPoint:CGPointMake(location.x - semiWidth, location.y + semiHeight)];
    [path addLineToPoint:CGPointMake(location.x - semiWidth, location.y - semiHeight)];
    
    [path moveToPoint:CGPointMake(location.x - semiWidth, location.y - semiHeight)];

    //[path closePath]; add an extract point to the path
    shapeLayer.path = [path CGPath];
    
    shapeLayer.strokeColor = [[UIColor yellowColor] CGColor];
    [shapeLayer setFillColor:[[UIColor clearColor] CGColor]];
    shapeLayer.lineWidth = 20;
    
    return shapeLayer;
}

// draw rectangle
-(CAShapeLayer*)drawRectangle2:(CGPoint) location semiWidth:(CGFloat) semiWidth semiHeight:(CGFloat)semiHeight{
    CAShapeLayer* shapeLayer = [CAShapeLayer layer];
    UIBezierPath* path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(location.x - semiWidth, location.y - semiHeight)];
    
    [path addLineToPoint:CGPointMake(location.x + semiWidth, location.y - semiHeight)];
    [path addLineToPoint:CGPointMake(location.x + semiWidth, location.y + semiHeight)];
    [path addLineToPoint:CGPointMake(location.x - semiWidth, location.y + semiHeight)];
    [path addLineToPoint:CGPointMake(location.x - semiWidth, location.y - semiHeight)];
    
    
    [path closePath]; //add an extract point to the path
    shapeLayer.path = [path CGPath];
    
    shapeLayer.strokeColor = [[UIColor yellowColor] CGColor];
    [shapeLayer setFillColor:[[UIColor greenColor] CGColor]];
    shapeLayer.lineWidth = 20;
    
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
