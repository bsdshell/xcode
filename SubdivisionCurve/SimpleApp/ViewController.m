//
//  ViewController.m
//  tut1
//
//  Created by aa aa on 12-06-16.
//  Copyright (c) 2012 asdfk. All rights reserved.
//

#import "ViewController.h"
#import "QuartzCore/QuartzCore.h"
#import "Core.h"

@interface ViewController ()
@end

@implementation MyButton


@end

@implementation ViewController
@synthesize shaperLayer = _shapeLayer;
@synthesize rectLayer = _rectLayer;

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    self.rectLayer = [self subcurve];
    [self.view.layer addSublayer:self.rectLayer];
}

-(CAShapeLayer*)subcurve{
    CAShapeLayer* shapeLayer = [CAShapeLayer layer];
    UIBezierPath* path = [UIBezierPath bezierPath];
    
    CGPoint p0 = CGPointMake(20, 20);
    CGPoint p1 = CGPointMake(200, 20);
    CGPoint p2 = CGPointMake(200, 200);
    CGPoint p3 = CGPointMake(20, 200);
    NSMutableArray* array = [[NSMutableArray alloc]init];
    [array addObject:[NSValue valueWithCGPoint:p0]];
    [array addObject:[NSValue valueWithCGPoint:p1]];
    [array addObject:[NSValue valueWithCGPoint:p2]];
    [array addObject:[NSValue valueWithCGPoint:p3]];
    [array addObject:[NSValue valueWithCGPoint:p0]];

    int count = 0;
    while(count < 3){
        NSMutableArray* tmpArr = [NSMutableArray arrayWithArray:array];                  // copy mutable array copy array
        [array removeAllObjects];
        for(int i=0; i<[tmpArr count]-1; i++){
            CGPoint pp0 = [tmpArr[i] CGPointValue];
            CGPoint pp1 = [tmpArr[i+1] CGPointValue];
            CGPoint pp2 = CGPointMake(pp0.x + (pp1.x - pp0.x)/4, pp0.y + (pp1.y - pp0.y)/4);
            CGPoint pp3 = CGPointMake(pp0.x + (pp1.x - pp0.x)*(3.0/4.0), pp0.y + (pp1.y - pp0.y)*(3.0/4.0));
            [array addObject:[NSValue valueWithCGPoint:pp2]];
            [array addObject:[NSValue valueWithCGPoint:pp3]];
        }
        [array addObject:array[0]];
        count++;
    }
    
    [path moveToPoint:[array[0] CGPointValue]] ;
    for(int i=1; i<[array count]; i++){
        CGPoint p = [array[i] CGPointValue];
        [path addLineToPoint:p];
    }

    //[path closePath];

    shapeLayer.path = [path CGPath];
    shapeLayer.strokeColor = [[UIColor yellowColor] CGColor];
    //shapeLayer.fillColor = [[UIColor brownColor] CGColor];
    shapeLayer.lineWidth = 1.0f;

    //CAShapeLayer* layer = [Core drawListCircles:array];
    //[shapeLayer addSublayer:layer];

    return shapeLayer;
}

-(CAShapeLayer*)drawHexagon:(CGPoint) location semiWidth:(CGFloat) semiWidth semiHeight:(CGFloat)semiHeight{
    CAShapeLayer* shapeLayer = [CAShapeLayer layer];
    UIBezierPath* path = [UIBezierPath bezierPath];
    [path setLineJoinStyle:kCGLineJoinMiter];
    CGFloat radians = 100.0;
    NSInteger num = 6;
    CGFloat interval = 2*M_PI/num;
    
    CGFloat initX = radians*cosf(0*interval);
    CGFloat initY = radians*sinf(0*interval);
    
    [path moveToPoint:CGPointMake(location.x - semiWidth + initX, location.y - semiHeight + initY)];
    for(int i=1; i<num; i++){
        CGFloat x = radians*cosf(i*interval);
        CGFloat y = radians*sinf(i*interval);
        [path addLineToPoint:CGPointMake(location.x - semiWidth + x, location.y - semiHeight + y)];
    }
    [path closePath];
    shapeLayer.path = [path CGPath];
    shapeLayer.strokeColor = [[UIColor yellowColor] CGColor];
    shapeLayer.fillColor = [[UIColor brownColor] CGColor];
    shapeLayer.lineWidth = 4.0f;
    return shapeLayer;
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}
@end
