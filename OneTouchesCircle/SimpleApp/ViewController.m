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

-(id) initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        [self.layer setBorderWidth:1.0];
        [self.layer setCornerRadius:0];
        CGColorSpaceRef rgb=CGColorSpaceCreateDeviceRGB();
        CGFloat mycolor[] = {0.5, 0.5, 0.5, 0.5};
        CGColorRef col=CGColorCreate(rgb, mycolor);
        [self.layer setBackgroundColor:col];
        [self.layer setBorderColor:[[UIColor colorWithWhite:0.3 alpha:0.7]CGColor]];
    }
    return self;
}

@end

@implementation ViewController
@synthesize shaperLayer = _shapeLayer;
@synthesize rectLayer = _rectLayer;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s", __PRETTY_FUNCTION__);

    UITouch* touch = [touches anyObject];
    if(touch != nil){
        self.view.multipleTouchEnabled = NO;
        
        CGPoint touchXY = [touch locationInView:touch.view];
        
        CGFloat radius = 10;
        [self drawCircle:touchXY radius:radius];
        if(CGPathContainsPoint(_shapeLayer.path, NULL, touchXY, FALSE)){
            NSLog(@"inside the  circle x=[%f] y=[%f]", touchXY.x, touchXY.y);
        }else{
            NSLog(@"outside the circle x=[%f] y=[%f]", touchXY.x, touchXY.y);
        }
        
        if(CGPathContainsPoint(_rectLayer.path, NULL, touchXY, FALSE)){
            NSLog(@"inside the  rectangle x=[%f] y=[%f]", touchXY.x, touchXY.y);
        }else{
            NSLog(@"outside the rectangle x=[%f] y=[%f]", touchXY.x, touchXY.y);
        }

        
        
        NSLog(@"---------------------------------------");
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

// draw circle
- (void)drawCircle:(CGPoint)location radius:(CGFloat)radius {
    _shapeLayer = [CAShapeLayer layer];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:location
                    radius:radius
                startAngle:0.0
                  endAngle:M_PI * 2.0
                 clockwise:YES];
    
    _shapeLayer.path = [path CGPath];
    _shapeLayer.strokeColor = [[UIColor brownColor] CGColor];
    _shapeLayer.fillColor = [[UIColor yellowColor] CGColor];
    _shapeLayer.lineWidth = 1.0;
    [self.view.layer addSublayer:_shapeLayer];
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

-(void) clickMe:(id)sender
{
    NSLog(@"click me");
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
