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
    _myLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 400, 400, 100)];
    _myLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(150, 400, 400, 100)];

    [_myLabel1 setTextColor:[UIColor redColor]];
    [_myLabel1 setBackgroundColor:[UIColor clearColor]];
    [_myLabel1 setFont:[UIFont fontWithName: @"Trebuchet MS" size: 20.0f]];

    [_myLabel2 setTextColor:[UIColor brownColor]];
    [_myLabel2 setBackgroundColor:[UIColor clearColor]];
    [_myLabel2 setFont:[UIFont fontWithName: @"Trebuchet MS" size: 20.0f]];

    
    //[self drawCircle:CGPointMake(100, 250) radius:50];
    //self.rectLayer = [self drawRectangle:CGPointMake(150, 300) semiWidth:50 semiHeight:80];
    self.rectLayer = [self drawHexagon:CGPointMake(150, 300) semiWidth:50 semiHeight:80];
    [self.view.layer addSublayer:self.rectLayer];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    UITouch* touch = [touches anyObject];
    if(touch != nil){
        self.view.multipleTouchEnabled = NO;
        
        CGPoint touchXY = [touch locationInView:touch.view];
        
        NSString* labelTitle = @"";
        if(CGPathContainsPoint(_shapeLayer.path, NULL, touchXY, FALSE)){
            NSLog(@"inside the  circle x=[%f] y=[%f]", touchXY.x, touchXY.y);
                [_myLabel1 setText:[NSString stringWithFormat:@"Inside circle"]];
        }else{
            [_myLabel1 setText:[NSString stringWithFormat:@"Outside circle"]];
            NSLog(@"outside the circle x=[%f] y=[%f]", touchXY.x, touchXY.y);
        }
        
        if(CGPathContainsPoint(_rectLayer.path, NULL, touchXY, FALSE)){
            [_myLabel2 setText:[NSString stringWithFormat:@"Inside Rectangle"]];
            NSLog(@"inside the  rectangle x=[%f] y=[%f]", touchXY.x, touchXY.y);
        }else{
            [_myLabel2 setText:[NSString stringWithFormat:@"Outside Rectangle"]];
            NSLog(@"outside the rectangle x=[%f] y=[%f]", touchXY.x, touchXY.y);
        }
        
        [self.view addSubview:_myLabel1];
        [self.view addSubview:_myLabel2];

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

-(CAShapeLayer*)drawHexagon:(CGPoint) location semiWidth:(CGFloat) semiWidth semiHeight:(CGFloat)semiHeight{
    CAShapeLayer* shapeLayer = [CAShapeLayer layer];
    UIBezierPath* path = [UIBezierPath bezierPath];

    NSInteger dist = 4;
    double radians = 50.0;
    NSInteger num = 6;
    double interval = 2*M_PI/num;
    
    NSInteger initX = radians*cosf(interval);
    NSInteger initY = radians*sinf(interval);
    
    [path moveToPoint:CGPointMake(location.x - semiWidth + initX, location.y - semiHeight + initY)];
    for(int i=2; i<=num+1; i++){
        double x = radians*cosf(i*interval);
        double y = radians*sinf(i*interval);
        [path addLineToPoint:CGPointMake(location.x - semiWidth + x, location.y - semiHeight + y)];
    }

    shapeLayer.path = [path CGPath];
    shapeLayer.strokeColor = [[UIColor yellowColor] CGColor];
    shapeLayer.fillColor = [[UIColor brownColor] CGColor];
    shapeLayer.lineWidth = 0.5;
    return shapeLayer;
}

// draw rectangle
-(CAShapeLayer*)drawRectangle:(CGPoint) location semiWidth:(CGFloat) semiWidth semiHeight:(CGFloat)semiHeight{
    CAShapeLayer* shapeLayer = [CAShapeLayer layer];
    UIBezierPath* path = [UIBezierPath bezierPath];
    
    // start point
    //[path moveToPoint:CGPointMake(location.x - semiWidth, location.y - semiHeight)];
    
//    draw lines
//    [path addLineToPoint:CGPointMake(location.x + semiWidth, location.y - semiHeight)];
//    [path addLineToPoint:CGPointMake(location.x + semiWidth, location.y + semiHeight)];
//    [path addLineToPoint:CGPointMake(location.x - semiWidth, location.y + semiHeight)];
//    [path addLineToPoint:CGPointMake(location.x - semiWidth + 0.5, location.y - semiHeight + 0.5)];
    
    NSInteger dist = 4;
    double radians = 50.0;
    NSInteger num = 6;
    double interval = 2*M_PI/num;

    NSInteger initX = radians*cosf(interval);
    NSInteger initY = radians*sinf(interval);
    
    [path moveToPoint:CGPointMake(location.x - semiWidth + initX, location.y - semiHeight + initY)];
    for(int i=2; i<=num+1; i++){
        double x = radians*cosf(i*interval);
        double y = radians*sinf(i*interval);
        //[path moveToPoint:CGPointMake(location.x - semiWidth + x, location.y - semiHeight + y)];
        [path addLineToPoint:CGPointMake(location.x - semiWidth + x, location.y - semiHeight + y)];
    }
    
    //[path closePath];
    
    shapeLayer.path = [path CGPath];
    
    shapeLayer.strokeColor = [[UIColor yellowColor] CGColor];
    shapeLayer.fillColor = [[UIColor brownColor] CGColor];
    shapeLayer.lineWidth = 0.5;
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
