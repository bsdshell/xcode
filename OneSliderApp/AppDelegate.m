//
//  AppDelegate.m
//  tut1
//
//  Created by aa aa on 12-06-16.
//  Copyright (c) 2012 asdfk. All rights reserved.
//

#import "AppDelegate.h"
#import "SliderController.h"

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    

    SliderController* sliderController = [[SliderController alloc]init];
    [self.window setRootViewController:sliderController];
    
    [self.window makeKeyAndVisible];
    
    // Override point for customization after application launch.
    return YES;
}
							

@end
