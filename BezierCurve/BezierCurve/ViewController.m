//
//  ViewController.m
//  BezierCurve
//
//  Created by cat on 4/2/16.
//  Copyright © 2016 myxcode. All rights reserved.
//

#import "ViewController.h"
#import "Core.h"

#define NSLog(...)     //
#define printf(...)    //

@interface ViewController ()

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    _arrayPoints           = [[NSMutableArray alloc] initWithCapacity:10];

    _curveLayer            = [CAShapeLayer layer];
    _curveLayer.name       = @"curve";
    
    _mySlider              = [[UISlider alloc] initWithFrame:CGRectMake(50, 600, 200, 23)];
    _mySlider.minimumValue = 1.0f;
    _mySlider.maximumValue = 1000.0f;
    _mySlider.continuous   = YES;
    [self.view addSubview:_mySlider];
    [self scaleValue];

    [_mySlider setThumbImage:[UIImage imageNamed:@"mypic.png"] forState:UIControlStateNormal];
    [_mySlider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
    
    _anchorPoint0 = CGPointMake(10, 200);
    _controlPoint = CGPointMake(200, 200);
    _anchorPoint1 = CGPointMake(200, 400);

    _rectLayer    = [CAShapeLayer layer];
    _rectLayer    = [self createRect:_controlPoint layer:_rectLayer];

    _anchor0Layer = [CAShapeLayer layer];
    _anchor1Layer = [CAShapeLayer layer];

    _anchor0Layer = [self createRect:_anchorPoint0 layer:_anchor0Layer];
    _anchor1Layer = [self createRect:_anchorPoint1 layer:_anchor1Layer];

    [self.view.layer addSublayer:_rectLayer];
    _line0Layer = [CAShapeLayer layer];
    _line1Layer = [CAShapeLayer layer];

    [self.view.layer addSublayer:_anchor0Layer];
    [self.view.layer addSublayer:_anchor1Layer];

    [self updateLines];
}

-(void)touchPoints{

}

-(void)scaleValue{
    _scale = 1.0 + (0.1/_mySlider.value);
}

-(void)updateLines{
    UIBezierPath* path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:_anchorPoint0];
    [path1 addLineToPoint:_controlPoint];
    _line0Layer.path = [path1 CGPath];
    _line0Layer.strokeColor = [[UIColor blackColor] CGColor];
    _line0Layer.lineWidth = 1.0f;
    [self.view.layer addSublayer:_line0Layer];

    UIBezierPath* path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:_anchorPoint1];
    [path2 addLineToPoint:_controlPoint];
    _line1Layer.path = [path2 CGPath];
    _line1Layer.strokeColor = [[UIColor brownColor] CGColor];
    _line1Layer.lineWidth = 1.0f;
    [self.view.layer addSublayer:_line1Layer];
}

-(void)sliderChanged:(id)sender{
    NSLog(@"value=[%lf]", _mySlider.value);

    [_arrayPoints removeAllObjects]; 
    [self scaleValue];
    
    NSLog(@"value=[%lf] scale=[%lf]", _mySlider.value, _scale);

    [Core quatricBezierCurve:_anchorPoint0 p1:_controlPoint p2:_anchorPoint1 scale:_scale array:_arrayPoints];
    
    // insert to first
    [_arrayPoints insertObject:[NSValue valueWithCGPoint:_anchorPoint0] atIndex:0];
    // insert to end
    [_arrayPoints addObject:[NSValue valueWithCGPoint:_anchorPoint1]];
    
    [Core printArrayPoint:_arrayPoints];
    _curveLayer = [Core drawCurve:_arrayPoints layer:_curveLayer];
    [self.view.layer addSublayer:_curveLayer];
}

-(CAShapeLayer*)createRect:(CGPoint)center layer:(CAShapeLayer*)myLayer{
    CGFloat width = 20.0;
    CGFloat height = 20.0;
    
    UIBezierPath* path = [UIBezierPath bezierPathWithRect:CGRectMake(center.x - width/2, center.y - height/2, width, height)];
    myLayer.lineWidth = 10.0f;
    myLayer.strokeColor = [[UIColor darkGrayColor] CGColor];
    [myLayer setFillColor:[[UIColor clearColor] CGColor]];
    [myLayer setPath:[path CGPath]];
    return myLayer;
}

-(void)reDrawCurve{
    [_arrayPoints removeAllObjects]; 
    [Core quatricBezierCurve:_anchorPoint0 p1:_controlPoint p2:_anchorPoint1 scale:_scale array:_arrayPoints];
    // insert to first
    [_arrayPoints insertObject:[NSValue valueWithCGPoint:_anchorPoint0] atIndex:0];
    // insert to end
    [_arrayPoints addObject:[NSValue valueWithCGPoint:_anchorPoint1]];

    [Core printArrayPoint:_arrayPoints];
    _curveLayer = [Core drawCurve:_arrayPoints layer:_curveLayer];
    [self.view.layer addSublayer:_curveLayer];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    UITouch* touch = [touches anyObject];
    if(touch != nil){
        _begPoint = [touch locationInView:touch.view];
        if(CGPathContainsPoint(_rectLayer.path, NULL, _begPoint, false)){
            _begPoint = [touch locationInView:touch.view];
        }
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch* touch = [touches anyObject];
    if(touch != nil){
        CGFloat speed = 1.0;
        CGPoint currXY = [touch locationInView:touch.view];
        CGPoint vect = [Core subtractPoints:currXY p1:_begPoint];
        //    vect = CGPointMake(speed*vect.x, speed*vect.y);

        if(CGPathContainsPoint(_rectLayer.path, NULL, currXY, false)){
            NSLog(@"move[%@]", [NSValue valueWithCGPoint:currXY]);
            // vector P0_P1
            // P1 = P0 + P0_P1
            _controlPoint = [Core addPoints:_controlPoint p1:vect];
            [self createRect:_controlPoint layer:_rectLayer];
            [self updateLines];
            [self reDrawCurve];
        }
        else if(CGPathContainsPoint(_anchor0Layer.path, NULL, currXY, false)){
            NSLog(@"move[%@]", [NSValue valueWithCGPoint:currXY]);
            _anchorPoint0 = [Core addPoints:_anchorPoint0 p1:vect];
            [self createRect:_anchorPoint0 layer:_anchor0Layer];
            [self updateLines];
            [self reDrawCurve];
        }
        else if(CGPathContainsPoint(_anchor1Layer.path, NULL, currXY, false)){
            NSLog(@"move[%@]", [NSValue valueWithCGPoint:currXY]);
            _anchorPoint1 = [Core addPoints:_anchorPoint1 p1:vect];
            [self createRect:_anchorPoint1 layer:_anchor1Layer];
            [self updateLines];
            [self reDrawCurve];
        }
        _begPoint = currXY;
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    UITouch* touch = [touches anyObject];
    if(touch != nil){
        CGPoint currXY = [touch locationInView:touch.view];
        if(CGPathContainsPoint(_rectLayer.path, NULL, currXY, false)){
            // vector P0_P1
            CGPoint vect = [Core subtractPoints:currXY p1:_begPoint];
            
            // P1 = P0 + P0_P1
            _controlPoint = [Core addPoints:_controlPoint p1:vect];
            [self createRect:_controlPoint layer:_rectLayer];
        }
        _begPoint = currXY;
    }
}


@end
