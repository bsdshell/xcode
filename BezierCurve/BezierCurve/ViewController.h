//
//  ViewController.h
//  BezierCurve
//
//  Created by cat on 4/2/16.
//  Copyright © 2016 myxcode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    UISlider* _mySlider;
    CGFloat _minimum;
    CGFloat _maximum;
    CAShapeLayer* _curveLayer;
    CAShapeLayer* _rectLayer;
    CGPoint _begPoint;
    CGPoint _center;
    CGPoint _anchorPoint0;
    CGPoint _anchorPoint1;
    CGPoint _controlPoint;
    CGFloat _scale;
    CAShapeLayer* _line1Layer;
    CAShapeLayer* _line2Layer;
}
@end

