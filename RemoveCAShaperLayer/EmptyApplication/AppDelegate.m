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
    _circleLayer0 = [CAShapeLayer layer];
    _circleLayer0.name = @"circle0";
    CGFloat leftX = 100.0f;
    CGFloat leftY = 100.0f;
    CGFloat Width = 50.0f;
    CGFloat Height = 50.0f;
    UIBezierPath* path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(leftX, leftY, Width, Height)];
    [_circleLayer0 setPath:[path CGPath]];
    
    CGFloat component[4];
    component[0] = 100.0;
    component[1] = 1.0;
    component[2] = 2.0;
    component[3] = 2.0;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    [_circleLayer0 setStrokeColor:CGColorCreate(colorSpace, component)];
    [_circleLayer0 setLineWidth:1.0f];
    [_circleLayer0 setFillColor:[[UIColor brownColor] CGColor]];
    // ============================================================
    // circle two
    _circleLayer1 = [CAShapeLayer layer];
    CGFloat leftX1 = 200.0f;
    CGFloat leftY1 = 200.0f;
    UIBezierPath* path1 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(leftX1, leftY1, Width, Height)];
    [_circleLayer1 setPath:[path1 CGPath]];
    _circleLayer1.name = @"circle1";
    
    CGFloat component1[4];
    component1[0] = 100.0;
    component1[1] = 0.0;
    component1[2] = 0.3;
    component1[3] = 0.6;
    CGColorSpaceRef colorSpace1 = CGColorSpaceCreateDeviceRGB();
    [_circleLayer1 setStrokeColor:CGColorCreate(colorSpace1, component1)];
    [_circleLayer1 setLineWidth:1.0f];
    [_circleLayer1 setFillColor:[[UIColor blueColor] CGColor]];
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

    
    UIButton* mybut11 = [UIButton buttonWithType:UIButtonTypeSystem];
    CGRect frame11 = CGRectMake(4, 500, 140, 50);
    mybut11.frame = frame11;
    [mybut11 addTarget:self action:@selector(hideCircle0:) forControlEvents:UIControlEventTouchUpInside];
    [mybut11 setTitle:@"Hide circle" forState:(UIControlState) UIControlStateNormal];
    [mybut11 setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    [mybut11.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    mybut11.backgroundColor = [UIColor brownColor];
    
    UIButton* mybut22 = [UIButton buttonWithType:UIButtonTypeSystem];
    CGRect frame22 = CGRectMake(150, 500, 140, 50);
    mybut22.frame = frame22;
    [mybut22 addTarget:self action:@selector(hideCircle1:) forControlEvents:UIControlEventTouchUpInside];
    [mybut22 setTitle:@"Hide circle1" forState:(UIControlState) UIControlStateNormal];
    [mybut22 setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    [mybut22.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    mybut22.backgroundColor = [UIColor brownColor];
    

    
    [self.window addSubview:mybut];
    [self.window addSubview:mybut1];
    
    [self.window addSubview:mybut11];
    [self.window addSubview:mybut22];

    
    [self.window.layer addSublayer:_circleLayer0];
    [self.window.layer addSublayer:_circleLayer1];
    
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)startClick1:(id)sender{
    NSLog(@"Click0 me");
    for(CAShapeLayer* layer in [self.window.layer.sublayers copy]){
        if([[layer name] isEqualToString:@"circle0"]){
            [layer removeFromSuperlayer];
        }
    }
}

-(void)startClick2:(id)sender{
    NSLog(@"Click1 me");
    for(CAShapeLayer* layer in [self.window.layer.sublayers copy]){
        if([[layer name] isEqualToString:@"circle1"]){
            [layer removeFromSuperlayer];
        }
    }
}

-(void)hideCircle0:(id)sender{
    if(_circleLayer0.isHidden)
        [_circleLayer0 setHidden:NO];
    else
        [_circleLayer0 setHidden:YES];

    NSLog(@"Hide Circle0");
}

-(void)hideCircle1:(id)sender{
    if(_circleLayer1.isHidden)
        [_circleLayer1 setHidden:NO];
    else
        [_circleLayer1 setHidden:YES];
    
    NSLog(@"Hide Circle1");
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
