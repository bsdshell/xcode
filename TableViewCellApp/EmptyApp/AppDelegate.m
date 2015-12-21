//
//  AppDelegate.m
//  EmptyApp
//
//  Created by cat on 7/29/15.
//  Copyright (c) 2015 myxcode. All rights reserved.
//

#import "AppDelegate.h"
#import "MyTableViewController.h"

@interface AppDelegate ()

@end


@implementation AppDelegate
@synthesize navigationController = _navigationController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor grayColor];
    
    MyTableViewController* tableViewController = [[MyTableViewController alloc]initWithStyle:UITableViewStylePlain];
    [self.window setRootViewController:tableViewController];
    [self.navigationController pushViewController:tableViewController animated:YES];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
