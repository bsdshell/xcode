//
//  AppDelegate.m
//  EmptyApplication
//
//  Created by cat on 5/6/14.
//  Copyright (c) 2014 searchBarDemo. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    self.window.backgroundColor = [UIColor whiteColor];

    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.window.bounds];
    imageView.image=[UIImage imageNamed:@"image.png"];
    CAShapeLayer* circleLayer = [CAShapeLayer layer];
    CGFloat leftX = 100.0f;
    CGFloat leftY = 100.0f;
    CGFloat Width = 200.0f;
    CGFloat Height = 200.0f;
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
    [circleLayer setFillColor:[[UIColor blueColor] CGColor]];
    [[imageView layer] addSublayer:circleLayer];
    [self.window addSubview:imageView];
    
    [self.window makeKeyAndVisible];
    return YES;
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
