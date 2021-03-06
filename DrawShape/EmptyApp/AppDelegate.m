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
@synthesize imageView = _imageView;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    _radians = 0.0;
    _rad = 3.141516/2;
    _matrix = CGAffineTransformIdentity;
    
    self.imageView = [[UIImageView alloc]initWithFrame:self.window.bounds];
    self.imageView.image=[UIImage imageNamed:@"myimage.jpg"];
    [self.window addSubview:self.imageView];
    
    // create simple text label
    UILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 300, 300)];
    [myLabel setTextColor:[UIColor redColor]];
    [myLabel setBackgroundColor:[UIColor clearColor]];
    [myLabel setFont:[UIFont fontWithName: @"Trebuchet MS" size: 20.0f]];
    [myLabel setText:@"Supper Simple Application"];
    
    CAShapeLayer* layerCircle = [self drawCircle:CGPointMake(100, 100) radius:60];
    [self.imageView.layer addSublayer:layerCircle];
    
    // draw oval
    CAShapeLayer* layerOval = [self drawOval:CGPointMake(200, 100) semimajor:40 semiminor:20];
    [self.imageView.layer addSublayer:layerOval];
    
    // draw rectangle
    _layerRect = [self drawRectangle:CGPointMake(100, 100) semiWidth:100 semiHeight:100];
    [self.imageView.layer addSublayer:_layerRect];
    
    
    [self.window addSubview:myLabel];
    
    [self.window addSubview:self.imageView];
    
    
    [self.window makeKeyAndVisible];

    // Override point for customization after application launch.
    return YES;
}

// draw circle
- (CAShapeLayer*)drawCircle:(CGPoint)location radius:(CGFloat)radius {
    CAShapeLayer* shapeLayer = [CAShapeLayer layer];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:location
                    radius:radius
                startAngle:0.0
                  endAngle:M_PI * 2.0
                 clockwise:YES];
    
    shapeLayer.path = [path CGPath];
    shapeLayer.strokeColor = [[UIColor redColor] CGColor];
    shapeLayer.fillColor = nil;
    shapeLayer.lineWidth = 5.0;
    return shapeLayer;
}

// draw oval
-(CAShapeLayer*)drawOval:(CGPoint) location semimajor:(CGFloat)semimajor semiminor:(CGFloat) semiminor{
    CAShapeLayer* shapeLayer = [CAShapeLayer layer];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(location.x-semimajor, location.y-semiminor, 2*semimajor, 2*semiminor)];
    
    shapeLayer.path = [path CGPath];
    
    shapeLayer.strokeColor = [[UIColor greenColor] CGColor];
    shapeLayer.fillColor = [[UIColor blackColor] CGColor];
    shapeLayer.lineWidth = 1.0;
    return shapeLayer;
}

// draw rectangle
-(CAShapeLayer*)drawRectangle:(CGPoint) location semiWidth:(CGFloat) semiWidth semiHeight:(CGFloat)semiHeight{
    CAShapeLayer* shapeLayer = [CAShapeLayer layer];
    UIBezierPath* path = [UIBezierPath bezierPath];
    
    // start point
    [path moveToPoint:CGPointMake(location.x - semiWidth, location.y - semiHeight)];
    
    // draw lines
    [path addLineToPoint:CGPointMake(location.x + semiWidth, location.y - semiHeight)];
    [path addLineToPoint:CGPointMake(location.x + semiWidth, location.y + semiHeight)];
    [path addLineToPoint:CGPointMake(location.x - semiWidth, location.y + semiHeight)];
    [path addLineToPoint:CGPointMake(location.x - semiWidth, location.y - semiHeight)];
    //[path closePath];
    
    shapeLayer.path = [path CGPath];
    
    shapeLayer.strokeColor = [[UIColor yellowColor] CGColor];
    shapeLayer.fillColor = [[UIColor blackColor] CGColor];
    shapeLayer.lineWidth = 1.0;
    return shapeLayer;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    UITouch* touch = [touches anyObject];
    if(touch != nil){
         CGAffineTransform  tran = CGAffineTransformTranslate(CGAffineTransformIdentity, -100, -100);
        _matrix = CGAffineTransformConcat(_matrix, tran);
        [_layerRect setAffineTransform:_matrix];
        
        CGAffineTransform rotateTransform = CGAffineTransformMakeRotation(_rad);
        _m2 = CGAffineTransformConcat(_matrix, rotateTransform);
        
        CGAffineTransform translate = CGAffineTransformTranslate(CGAffineTransformIdentity, 100, 100);
        _matrix = CGAffineTransformConcat(_matrix, translate);
        [_layerRect setAffineTransform:_matrix];

    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch* touch = [touches anyObject];
    if(touch != nil){
        CGPoint currXY = [touch locationInView:touch.view];
        NSString* mytext = [NSString stringWithFormat:@"[%.01f][%.01f]", currXY.x, currXY.y];

        
        
//        CGAffineTransform iden2 = CGAffineTransformIdentity;
//        CGAffineTransform translateback = CGAffineTransformTranslate(iden2, 150, 150);
//        
        //CGAffineTransform translate = CGAffineTransformTranslate(iden, 100, 100);

        
    }
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    UITouch* touch = [touches anyObject];
    if(touch != nil){
        CGPoint touchXY = [touch locationInView:touch.view];
        NSString* mytext = [NSString stringWithFormat:@"[%.01f][%.01f]", touchXY.x, touchXY.y];
        CGAffineTransform m3 = CGAffineTransformMakeTranslation(100, 100);
        _matrix = CGAffineTransformConcat(_m2, m3);
        [_layerRect setAffineTransform:_matrix];
    }
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
