//
//  ViewController.h
//  BezierCurve
//
//  Created by cat on 4/2/16.
//  Copyright © 2016 myxcode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    UISlider* _mySlider1;
    UISlider* _mySlider2;
    CGFloat _minimum;
    CGFloat _maximum;
    CAShapeLayer* _curveLayer;
    CAShapeLayer* _controlLayer;

    CAShapeLayer* _lineLayer;

    CGPoint _begPoint;
    CGPoint _center;
    CGPoint _anchorPoint0;
    CGPoint _anchorPoint1;
    CGPoint _controlPoint;

    CGPoint _linearP0;
    CGPoint _linearP1;
    CGPoint _line;

    CGFloat _scale1;
    CGFloat _scale2;
    CAShapeLayer* _qline0Layer;
    CAShapeLayer* _qline1Layer;

    CAShapeLayer* _anchor0Layer;
    CAShapeLayer* _anchor1Layer;

    CAShapeLayer* _line0Layer;
    CAShapeLayer* _line1Layer;
    CAShapeLayer* _connectedPointLayer;


    NSMutableArray* _arrayPoints1;
    NSMutableArray* _arrayPoints2;
}
@end

