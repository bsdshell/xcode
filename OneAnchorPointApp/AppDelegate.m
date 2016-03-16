//
//  AppDelegate.m
//  tut1
//
//  Created by aa aa on 12-06-16.
//  Copyright (c) 2012 asdfk. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
self.window.backgroundColor = [UIColor whiteColor];
    ViewController* viewController = [[ViewController alloc]init];
    [self.window setRootViewController:viewController];
    
    [self.window makeKeyAndVisible];
    return YES;
}
@end