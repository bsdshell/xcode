//
//  ViewController.m
//  tut1
//
//  Created by aa aa on 12-06-16.
//  Copyright (c) 2012 asdfk. All rights reserved.
//

#import "ViewController.h"
#import "QuartzCore/QuartzCore.h"

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
    self.rectLayer = [self drawHexagon:CGPointMake(200, 300) semiWidth:50 semiHeight:80];
    [self.view.layer addSublayer:self.rectLayer];
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
