//
//  AppDelegate.m
//  EmptyApp
//
//  Created by cat on 7/29/15.
//  Copyright (c) 2015 myxcode. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "MyLib.h"

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
    _point = CGPointMake(120, 120);

    
    self.imageView = [[UIImageView alloc]initWithFrame:self.window.bounds];
    self.imageView.image=[UIImage imageNamed:@"myimage.jpg"];
    [self.window addSubview:self.imageView];
    
    // create simple text label
    UILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 300, 300)];
    [myLabel setTextColor:[UIColor redColor]];
    [myLabel setBackgroundColor:[UIColor clearColor]];
    [myLabel setFont:[UIFont fontWithName: @"Trebuchet MS" size: 20.0f]];
    [myLabel setText:@"Supper Simple Application"];
    
    _layerCircle = [self drawCircle:CGPointMake(100, 100) radius:100];
    [self.imageView.layer addSublayer:_layerCircle];
    
    // draw oval
    CAShapeLayer* layerOval = [self drawOval:CGPointMake(200, 100) semimajor:40 semiminor:20];
    [self.imageView.layer addSublayer:layerOval];
    
    // draw rectangle
    _layerRect = [self drawRectangle:_point semiWidth:10 semiHeight:10];
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


-(CGAffineTransform)rotateCenter:(CGAffineTransform) matrix  center:(CGPoint)center{
    CGAffineTransform  translate = CGAffineTransformTranslate(CGAffineTransformIdentity, -center.x, -center.y);
    matrix = CGAffineTransformConcat(matrix, translate);
    CGAffineTransform rotateTransform = CGAffineTransformMakeRotation(3.1415/2);
    matrix = CGAffineTransformConcat(matrix, rotateTransform);
    
    CGAffineTransform mat = CGAffineTransformMakeTranslation(center.x, center.y);
    matrix = CGAffineTransformConcat(matrix, mat);
    return matrix;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    UITouch* touch = [touches anyObject];
    if(touch != nil){

        //CGAffineTransform mat;
        _matrix = [self rotateCenter:_matrix center:_point];
        //_point = CGPointApplyAffineTransform(_point, _matrix);
  //       CGAffineTransform  tran = CGAffineTransformTranslate(CGAffineTransformIdentity, -100, -100);
//        _matrix = CGAffineTransformConcat(_matrix, tran);
//        CGAffineTransform rotateTransform = CGAffineTransformMakeRotation(_rad);
//        _matrix = CGAffineTransformConcat(_matrix, rotateTransform);
//        
//        CGAffineTransform m3 = CGAffineTransformMakeTranslation(100, 100);
//        _matrix = CGAffineTransformConcat(_matrix, m3);
        
//        [_layerRect setAffineTransform:_matrix];
        
//        NSNumber *rotationAtStart = [_layerRect valueForKeyPath:@"transform.rotation"];
//        CATransform3D myRotationTransform = CATransform3DRotate(_layerRect.transform, 0.1, 0.0, 0.0, 1.0);
//        //_layerRect.transform = myRotationTransform;
//        [_layerRect setAffineTransform:_matrix];
//        CABasicAnimation* myAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
//        myAnimation.duration = 1.0;
//        myAnimation.fromValue = rotationAtStart;
//        myAnimation.toValue = [NSNumber numberWithFloat:([rotationAtStart floatValue] + 0.1)];
//        [_layerRect addAnimation:myAnimation forKey:@"transform.rotation"];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch* touch = [touches anyObject];
    if(touch != nil){
        CGPoint currXY = [touch locationInView:touch.view];
        NSString* mytext = [NSString stringWithFormat:@"[%.01f][%.01f]", currXY.x, currXY.y];

//        _radians = _radians + 0.05;
//        CGAffineTransform rotateTransform = CGAffineTransformMakeRotation(_radians);
//        _m2 = CGAffineTransformConcat(_matrix, rotateTransform);
//        [_layerRect setAffineTransform:_m2];
        
        
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
//        CGAffineTransform m3 = CGAffineTransformMakeTranslation(100, 100);
//        _matrix = CGAffineTransformConcat(_m2, m3);
        [_layerRect setAffineTransform:_matrix];
    }
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
