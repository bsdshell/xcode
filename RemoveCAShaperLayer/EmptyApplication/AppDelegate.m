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

    // ============================================================
    // circle one
    CAShapeLayer* circleLayer = [CAShapeLayer layer];
    circleLayer.name = @"circle";
    CGFloat leftX = 100.0f;
    CGFloat leftY = 100.0f;
    CGFloat Width = 50.0f;
    CGFloat Height = 50.0f;
    UIBezierPath* path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(leftX, leftY, Width, Height)];
    [circleLayer setPath:[path CGPath]];
    
    CGFloat component[4];
    component[0] = 100.0;
    component[1] = 1.0;
    component[2] = 2.0;
    component[3] = 2.0;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    [circleLayer setStrokeColor:CGColorCreate(colorSpace, component)];
    [circleLayer setLineWidth:1.0f];
    [circleLayer setFillColor:[[UIColor brownColor] CGColor]];
    // ============================================================
    // circle two
    CAShapeLayer* circleLayer1 = [CAShapeLayer layer];
    CGFloat leftX1 = 200.0f;
    CGFloat leftY1 = 200.0f;
    UIBezierPath* path1 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(leftX1, leftY1, Width, Height)];
    [circleLayer1 setPath:[path1 CGPath]];
    circleLayer1.name = @"circle1";
    
    CGFloat component1[4];
    component1[0] = 100.0;
    component1[1] = 0.0;
    component1[2] = 0.3;
    component1[3] = 0.6;
    CGColorSpaceRef colorSpace1 = CGColorSpaceCreateDeviceRGB();
    [circleLayer1 setStrokeColor:CGColorCreate(colorSpace1, component1)];
    [circleLayer1 setLineWidth:1.0f];
    [circleLayer1 setFillColor:[[UIColor blueColor] CGColor]];
    // ============================================================

    UIButton* mybut = [UIButton buttonWithType:UIButtonTypeSystem];
    CGRect frame = CGRectMake(4, 400, 140, 50);
    mybut.frame = frame;
    [mybut addTarget:self action:@selector(startClick1:) forControlEvents:UIControlEventTouchUpInside];
    [mybut setTitle:@"Remove circle" forState:(UIControlState) UIControlStateNormal];
    [mybut setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    [mybut.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    mybut.backgroundColor = [UIColor brownColor];

    UIButton* mybut1 = [UIButton buttonWithType:UIButtonTypeSystem];
    CGRect frame1 = CGRectMake(150, 400, 140, 50);
    mybut1.frame = frame1;
    [mybut1 addTarget:self action:@selector(startClick2:) forControlEvents:UIControlEventTouchUpInside];
    [mybut1 setTitle:@"Remove Circle1" forState:(UIControlState) UIControlStateNormal];
    [mybut1 setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    [mybut1.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    mybut1.backgroundColor = [UIColor brownColor];

    
    [self.window addSubview:mybut];
    [self.window addSubview:mybut1];
    
    [self.window.layer addSublayer:circleLayer];
    [self.window.layer addSublayer:circleLayer1];
    
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)startClick1:(id)sender{
    NSLog(@"Click1 me");
    for(CAShapeLayer* layer in [self.window.layer.sublayers copy]){
        if([[layer name] isEqualToString:@"circle"]){
            [layer removeFromSuperlayer];
        }
    }
}

-(void)startClick2:(id)sender{
    NSLog(@"Click2 me");
    for(CAShapeLayer* layer in [self.window.layer.sublayers copy]){
        if([[layer name] isEqualToString:@"circle1"]){
            [layer removeFromSuperlayer];
        }
    }
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
