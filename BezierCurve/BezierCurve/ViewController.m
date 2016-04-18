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
    _arrayPoints1           = [[NSMutableArray alloc] initWithCapacity:10];
    _arrayPoints2           = [[NSMutableArray alloc] initWithCapacity:10];

    [self addSliders]; 

    _curveLayer = [CAShapeLayer layer];
    _lineLayer = [CAShapeLayer layer];
    _connectedPointLayer = [CAShapeLayer layer];

    [self quadraticSelectedPoints]; 
    //[self linearSelectedPoints];
    //[self addLinearLines];
    
    [self.view.layer addSublayer:_controlLayer];
    //_qline0Layer = [CAShapeLayer layer];
    //_qline1Layer = [CAShapeLayer layer];

    [self.view.layer addSublayer:_anchor0Layer];
    [self.view.layer addSublayer:_anchor1Layer];
    [self addQuadLines];
}

-(void)addSliders{
    _mySlider1              = [[UISlider alloc] initWithFrame:CGRectMake(50, 600, 200, 23)];
    _mySlider1.minimumValue = 1.0f;
    _mySlider1.maximumValue = 1000.0f;
    _mySlider1.continuous   = YES;
    [_mySlider1 setThumbImage:[UIImage imageNamed:@"mypic.png"] forState:UIControlStateNormal];
    [_mySlider1 addTarget:self action:@selector(sliderChanged1:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_mySlider1];
    [self scaleValue1];

//    _mySlider2              = [[UISlider alloc] initWithFrame:CGRectMake(50, 550, 200, 23)];
//    _mySlider2.minimumValue = 1.0f;
//    _mySlider2.maximumValue = 1000.0f;
//    _mySlider2.continuous   = YES;
//    [self.view addSubview:_mySlider2];
//    [_mySlider2 setThumbImage:[UIImage imageNamed:@"mypic.png"] forState:UIControlStateNormal];
//    [_mySlider2 addTarget:self action:@selector(sliderChanged2:) forControlEvents:UIControlEventValueChanged];
//    [self scaleValue2];
}

-(void)quadraticSelectedPoints{
    _anchorPoint0 = CGPointMake(20, 200);
    _controlPoint = CGPointMake(200, 200);
    _anchorPoint1 = CGPointMake(200, 400);

    _controlLayer = [CAShapeLayer layer];
    _controlLayer = [self createRect:_controlPoint layer:_controlLayer];

    _anchor0Layer = [CAShapeLayer layer];
    _anchor1Layer = [CAShapeLayer layer];

    _anchor0Layer = [self createRect:_anchorPoint0 layer:_anchor0Layer];
    _anchor1Layer = [self createRect:_anchorPoint1 layer:_anchor1Layer];
    [self scaleValue1];
}


-(void)linearSelectedPoints{
    _line0Layer = [CAShapeLayer layer];
    _line1Layer = [CAShapeLayer layer];

    _linearP0   = CGPointMake(20, 20);
    _linearP1   = CGPointMake(200, 30);
    _line0Layer = [self createRect:_linearP0 layer:_line0Layer];
    _line1Layer = [self createRect:_linearP1 layer:_line1Layer];

    [self.view.layer addSublayer:_line0Layer];
    [self.view.layer addSublayer:_line1Layer];
    [self scaleValue2];
}

-(void)scaleValue1{
    _scale1 = 1.0 + (0.1/_mySlider1.value);
}


-(void)scaleValue2{
    _scale2 = 0.0 + (0.1/_mySlider2.value); 
}

-(void)addLinearLines{
    UIBezierPath* path3 = [UIBezierPath bezierPath];
    [path3 moveToPoint:_linearP0];
    [path3 addLineToPoint:_linearP1];
    _connectedPointLayer.path = [path3 CGPath];
    _connectedPointLayer.strokeColor = [[UIColor blackColor] CGColor];
    _connectedPointLayer.lineWidth = 1.0f;
    [self.view.layer addSublayer:_connectedPointLayer];
}

-(void)addQuadLines{
    UIBezierPath* path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:_anchorPoint0];
    [path1 addLineToPoint:_controlPoint];
    _qline0Layer.path = [path1 CGPath];
    _qline0Layer.strokeColor = [[UIColor blackColor] CGColor];
    _qline0Layer.lineWidth = 1.0f;
    [self.view.layer addSublayer:_qline0Layer];

    UIBezierPath* path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:_anchorPoint1];
    [path2 addLineToPoint:_controlPoint];
    _qline1Layer.path = [path2 CGPath];
    _qline1Layer.strokeColor = [[UIColor brownColor] CGColor];
    _qline1Layer.lineWidth = 1.0f;
    [self.view.layer addSublayer:_qline1Layer];
}

-(void)sliderChanged1:(id)sender{
    NSLog(@"value=[%lf]", _mySlider1.value);

    [_arrayPoints1 removeAllObjects]; 
    
    NSLog(@"value=[%lf] scale=[%lf]", _mySlider1.value, _scale1);

    [Core quatricBezierCurve:_anchorPoint0 p1:_controlPoint p2:_anchorPoint1 scale:_scale1 array:_arrayPoints1];
    
    // insert to first
    [_arrayPoints1 insertObject:[NSValue valueWithCGPoint:_anchorPoint0] atIndex:0];
    // insert to end
    [_arrayPoints1 addObject:[NSValue valueWithCGPoint:_anchorPoint1]];
    
    [Core printArrayPoint:_arrayPoints1];
    _curveLayer = [Core drawCurve:_arrayPoints1 layer:_curveLayer];
    [self.view.layer addSublayer:_curveLayer];
    [self scaleValue1];
}

-(void)sliderChanged2:(id)sender{
    [_arrayPoints2 removeAllObjects]; 
    [Core linearBezierCurve:_linearP0 p1:_linearP1 scale:_scale2 array:_arrayPoints2];

    // insert to first
    [_arrayPoints2 insertObject:[NSValue valueWithCGPoint:_linearP0] atIndex:0];
    // insert to end
    [_arrayPoints2 addObject:[NSValue valueWithCGPoint:_linearP1]];

    [Core printArrayPoint:_arrayPoints2];
    [self scaleValue2];
}


-(CAShapeLayer*)createRect:(CGPoint)center layer:(CAShapeLayer*)myLayer{
    CGFloat width = 40.0;
    CGFloat height = 40.0;

    UIBezierPath* path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(center.x - width/2, center.y - height/2, width, height)];
    //UIBezierPath* path = [UIBezierPath bezierPathWithRect:CGRectMake(center.x - width/2, center.y - height/2, width, height)];
    myLayer.lineWidth = 1.0f;
    myLayer.strokeColor = [[UIColor darkGrayColor] CGColor];
    [myLayer setFillColor:[[UIColor brownColor] CGColor]];
    [myLayer setPath:[path CGPath]];
    return myLayer;
}

-(void)reDrawLine{
    [_arrayPoints2 removeAllObjects]; 
    [Core linearBezierCurve:_linearP0 p1:_linearP1 scale:_scale2 array:_arrayPoints2];

    // insert to first
    [_arrayPoints2 insertObject:[NSValue valueWithCGPoint:_linearP0] atIndex:0];
    // insert to end
    [_arrayPoints2 addObject:[NSValue valueWithCGPoint:_linearP1]];

    [Core printArrayPoint:_arrayPoints2];
}

-(void)reDrawCurve{
    [_arrayPoints1 removeAllObjects]; 
    [Core quatricBezierCurve:_anchorPoint0 p1:_controlPoint p2:_anchorPoint1 scale:_scale1 array:_arrayPoints1];
    // insert to first
    [_arrayPoints1 insertObject:[NSValue valueWithCGPoint:_anchorPoint0] atIndex:0];
    // insert to end
    [_arrayPoints1 addObject:[NSValue valueWithCGPoint:_anchorPoint1]];

    [Core printArrayPoint:_arrayPoints1];
    _curveLayer = [Core drawCurve:_arrayPoints1 layer:_curveLayer];
    [self.view.layer addSublayer:_curveLayer];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    UITouch* touch = [touches anyObject];
    if(touch != nil){
        _begPoint = [touch locationInView:touch.view];
        if(CGPathContainsPoint(_controlLayer.path, NULL, _begPoint, false)){
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

        if(CGPathContainsPoint(_controlLayer.path, NULL, currXY, false)){
            NSLog(@"move[%@]", [NSValue valueWithCGPoint:currXY]);
            _controlPoint = [Core addPoints:_controlPoint p1:vect];
            [self createRect:_controlPoint layer:_controlLayer];
            [self addQuadLines];
            [self reDrawCurve];
        }
        else if(CGPathContainsPoint(_anchor0Layer.path, NULL, currXY, false)){
            NSLog(@"move[%@]", [NSValue valueWithCGPoint:currXY]);
            _anchorPoint0 = [Core addPoints:_anchorPoint0 p1:vect];
            [self createRect:_anchorPoint0 layer:_anchor0Layer];
            [self addQuadLines];
            [self reDrawCurve];
        }
        else if(CGPathContainsPoint(_anchor1Layer.path, NULL, currXY, false)){
            NSLog(@"move[%@]", [NSValue valueWithCGPoint:currXY]);
            _anchorPoint1 = [Core addPoints:_anchorPoint1 p1:vect];
            [self createRect:_anchorPoint1 layer:_anchor1Layer];
            [self addQuadLines];
            [self reDrawCurve];
        } 
        else if(CGPathContainsPoint(_line0Layer.path, NULL, currXY, false)){
            _linearP0 = [Core addPoints:_linearP0 p1:vect];
            [self createRect:_linearP0 layer:_line0Layer];
            //[self reDrawLine];
        }
        else if(CGPathContainsPoint(_line1Layer.path, NULL, currXY, false)){
            _linearP1 = [Core addPoints:_linearP1 p1:vect];
            [self createRect:_linearP1 layer:_line1Layer];
            //[self reDrawLine];
        }
        _begPoint = currXY;
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    UITouch* touch = [touches anyObject];
    if(touch != nil){
        CGPoint currXY = [touch locationInView:touch.view];
        if(CGPathContainsPoint(_controlLayer.path, NULL, currXY, false)){
            // vector P0_P1
            CGPoint vect = [Core subtractPoints:currXY p1:_begPoint];
            
            // P1 = P0 + P0_P1
            _controlPoint = [Core addPoints:_controlPoint p1:vect];
            [self createRect:_controlPoint layer:_controlLayer];
        }
        _begPoint = currXY;
    }
}

@end
