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

    _myLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 100)];
    [_myLabel setTextColor:[UIColor redColor]];
    [_myLabel setBackgroundColor:[UIColor clearColor]];
    [_myLabel setFont:[UIFont fontWithName: @"Trebuchet MS" size:14.0f]];
    [_myLabel setText:@""];
    [self.window addSubview:_myLabel];


    _circleLayer = [CAShapeLayer layer];
    _center = CGPointMake(100.0f, 200.0f);
    UIBezierPath* path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(_center.x-50, _center.y-50, 100, 100)];
    [_circleLayer setPath:[path CGPath]];
    
    [_circleLayer setFillColor:[[UIColor brownColor] CGColor]];
    [self.window.layer addSublayer:_circleLayer];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    UITouch* touch = [touches anyObject];
    if(touch != nil){
        _initXY = [touch locationInView:touch.view];
        NSString* mytext = [NSString stringWithFormat:@"[%.01f][%.01f] Began", _initXY.x, _initXY.y];
        [_myLabel setText:mytext];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch* touch = [touches anyObject];
    if(touch != nil){
        CGPoint currXY = [touch locationInView:touch.view];
        NSString* mytext = [NSString stringWithFormat:@"[%.01f][%.01f] Moved", currXY.x, currXY.y];
        NSLog(mytext);
        _center.x = _center.x + (currXY.x - _initXY.x); 
        _center.y = _center.y + (currXY.y - _initXY.y); 

        UIBezierPath* path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(_center.x-50, _center.y-50, 100, 100)];
        [_circleLayer setPath:[path CGPath]];
        [_circleLayer setFillColor:[[UIColor brownColor] CGColor]];
        [_myLabel setText:mytext];
        _initXY = currXY;
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    UITouch* touch = [touches anyObject];
    if(touch != nil){
        CGPoint touchXY = [touch locationInView:touch.view];
        NSString* mytext = [NSString stringWithFormat:@"[%.01f][%.01f] Ended", touchXY.x, touchXY.y];
        [_myLabel setText:mytext];
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
