//
//  ViewController.m
//  BezierCurve
//
//  Created by cat on 4/2/16.
//  Copyright © 2016 myxcode. All rights reserved.
//

#import "ViewController.h"
#import "Core.h"

@interface ViewController ()

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    _rectLayer = [CAShapeLayer layer];
    _curveLayer = [CAShapeLayer layer];
    _curveLayer.name = @"curve";
    
    _mySlider = [[UISlider alloc] initWithFrame:CGRectMake(50, 400, 200, 23)];
    [self.view addSubview:_mySlider];
    _mySlider.minimumValue = 1.0f;
    _mySlider.maximumValue = 1000.0f;
    _mySlider.continuous = YES;
    [_mySlider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
    
    _anchorPoint0 = CGPointMake(10, 200);
    _controlPoint = CGPointMake(200, 200);
    _anchorPoint1 = CGPointMake(200, 400);
    
    _rectLayer = [self myDrawRectangle:_controlPoint];
    [self.view.layer addSublayer:_rectLayer];

    _line1Layer = [CAShapeLayer layer];
    UIBezierPath* path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:_anchorPoint0];
    [path1 addLineToPoint:_controlPoint];
    _line1Layer.path = [path1 CGPath];
    _line1Layer.strokeColor = [[UIColor blackColor] CGColor];
    _line1Layer.lineWidth = 1.0f;
    [self.view.layer addSublayer:_line1Layer];

    
    _line2Layer = [CAShapeLayer layer];
    UIBezierPath* path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:_anchorPoint1];
    [path2 addLineToPoint:_controlPoint];
    _line2Layer.path = [path2 CGPath];
    _line2Layer.strokeColor = [[UIColor brownColor] CGColor];
    _line2Layer.lineWidth = 1.0f;
    [self.view.layer addSublayer:_line2Layer];

//    NSMutableArray* array = [[NSMutableArray alloc] initWithCapacity:10];
//    float scale = 1.00001;
//    [Core quatricBezierCurve:p0 p1:p1 p2:p2 scale:scale array:array];
    
    // insert to first
//    [array insertObject:[NSValue valueWithCGPoint:p0] atIndex:0];
//    // insert to end
//    [array addObject:[NSValue valueWithCGPoint:p2]];
//    
//    [Core printArrayPoint:array];
//    _curveLayer = [Core drawCurve:array];
  //  [self.view.layer addSublayer:_curveLayer];

//    CAShapeLayer* layer1 = [Core drawRect];
//    [self.view.layer addSublayer:layer1];
}

//-(void)quatricBezierCurve:(CGPoint)p0 p1:(CGPoint)p1 p2:(CGPoint)p2 scale:(float)scale array:(NSMutableArray*)array{
//    float anchorNorm = [Core norm:p0 p1:p2];
//    float len0 = [Core norm:p0 p1:p1];
//    float len1 = [Core norm:p1 p1:p2];
//    if(scale*anchorNorm <= (len0 + len1)){
//        CGPoint lp =       [Core middlePoint:p0 p1:p1];
//        CGPoint midPoint = [Core middlePoint:p0 p1:p1];
//        [array addObject:[NSValue valueWithCGPoint:midPoint]];
//        CGPoint rp = [Core middlePoint:p1 p1:p2];
//        
//        [self quatricBezierCurve:p0 p1:lp p2:midPoint scale:scale array:array];
//        [self quatricBezierCurve:midPoint p1:rp p2:p2 scale:scale array:array];
//    }
//}
//
//-(void)printArrayPoint:(NSMutableArray*)array{
//    for(int i=0; i<[array count]; i++){
//        NSLog(@"[%@]", array[i]);
//    }
//}

-(void)sliderChanged:(id)sender{
    NSLog(@"value=[%lf]", _mySlider.value);
        
    for(CAShapeLayer* layer in [self.view.layer.sublayers copy]){
        if([[layer name] isEqualToString:@"curve"]){
            [layer removeFromSuperlayer];
        }
    }
    
    
//    _anchorPoint0 = CGPointMake(10, 200);
//    _controlPoint = CGPointMake(200, 200);
//    _anchorPoint1 = CGPointMake(200, 400);
//    
    NSMutableArray* array = [[NSMutableArray alloc] initWithCapacity:10];
    _scale = 1.0 + (0.1/_mySlider.value);

    NSLog(@"value=[%lf] scale=[%lf]", _mySlider.value, _scale);

    [Core quatricBezierCurve:_anchorPoint0 p1:_controlPoint p2:_anchorPoint1 scale:_scale array:array];
    
    // insert to first
    [array insertObject:[NSValue valueWithCGPoint:_anchorPoint0] atIndex:0];
    // insert to end
    [array addObject:[NSValue valueWithCGPoint:_anchorPoint1]];
    
    [Core printArrayPoint:array];
    _curveLayer = [Core drawCurve:array layer:_curveLayer];
    [self.view.layer addSublayer:_curveLayer];
}


-(CAShapeLayer*)myDrawRectangle:(CGPoint)center{
    CGFloat width = 20.0;
    CGFloat height = 20.0;
    
    UIBezierPath* path = [UIBezierPath bezierPathWithRect:CGRectMake(center.x - width/2, center.y - height/2, width, height)];
    _rectLayer.lineWidth = 10.0f;
    _rectLayer.strokeColor = [[UIColor darkGrayColor] CGColor];
    [_rectLayer setFillColor:[[UIColor clearColor] CGColor]];
    [_rectLayer setPath:[path CGPath]];
    return _rectLayer;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    UITouch* touch = [touches anyObject];
    if(touch != nil){
        _begPoint = [touch locationInView:touch.view];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch* touch = [touches anyObject];
    if(touch != nil){
        CGPoint currXY = [touch locationInView:touch.view];

        // vector P0_P1
        CGPoint vect = [Core subtractPoints:currXY p1:_begPoint];

        // P1 = P0 + P0_P1
        _controlPoint = [Core addPoints:_controlPoint p1:vect];
        [self myDrawRectangle:_controlPoint];
        _begPoint = currXY;

        NSLog(@"move[%@]", [NSValue valueWithCGPoint:currXY]);

        UIBezierPath* path1 = [UIBezierPath bezierPath];
        [path1 moveToPoint:_anchorPoint0];
        [path1 addLineToPoint:_controlPoint];
        _line1Layer.path = [path1 CGPath];
        _line1Layer.strokeColor = [[UIColor blackColor] CGColor];
        _line1Layer.lineWidth = 1.0f;
        [self.view.layer addSublayer:_line1Layer];

        UIBezierPath* path2 = [UIBezierPath bezierPath];
        [path2 moveToPoint:_anchorPoint1];
        [path2 addLineToPoint:_controlPoint];
        _line2Layer.path = [path2 CGPath];
        _line2Layer.strokeColor = [[UIColor brownColor] CGColor];
        _line2Layer.lineWidth = 1.0f;
        [self.view.layer addSublayer:_line2Layer];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    UITouch* touch = [touches anyObject];
    if(touch != nil){
        CGPoint currXY = [touch locationInView:touch.view];
        
        // vector P0_P1
        CGPoint vect = [Core subtractPoints:currXY p1:_begPoint];
        
        // P1 = P0 + P0_P1
        _controlPoint = [Core addPoints:_controlPoint p1:vect];
        [self myDrawRectangle:_controlPoint];
    }
}


@end
