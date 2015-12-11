//
//  AppDelegate.m
//  EmptyApp
//
//  Created by cat on 7/29/15.
//  Copyright (c) 2015 myxcode. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end


@implementation AppDelegate
@synthesize navigationController = _navigationController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    // create ViewController doing nothing
    ViewController* viewController = [[ViewController alloc]init];
    [self.window addSubview:viewController.view];
    self.navigationController = [[UINavigationController alloc]initWithRootViewController:viewController];
    
    // create simple text label
//    UILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 400, 300)];
//    [myLabel setTextColor:[UIColor redColor]];
//    [myLabel setBackgroundColor:[UIColor clearColor]];
//    [myLabel setFont:[UIFont fontWithName: @"Trebuchet MS" size: 20.0f]];
//    [myLabel setText:@"Supper Simple Application"];
//    
//    
//    [self.window addSubview:myLabel];
    
    [self.window makeKeyAndVisible];

    // Override point for customization after application launch.
    return YES;
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
