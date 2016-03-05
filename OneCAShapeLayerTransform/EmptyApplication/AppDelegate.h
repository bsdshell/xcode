//
//  AppDelegate.h
//  EmptyApplication
//
//  Created by cat on 5/6/14.
//  Copyright (c) 2014 searchBarDemo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    NSInteger _numClick;
    CAShapeLayer* _shapeLayer;
    CAShapeLayer* _curveLayer;
    UIBezierPath* _curve;
    CGPoint _mycenter;
    double _semiWidth;
    double _semiHeight;
    CGPoint _upLeft;
    NSTimer* _tickFinish;
    MyViewController* _myView;
    CATransform3D _transform;
    bool _axisX;
    bool _axisY;
    bool _axisZ;
    NSInteger _rotX;
    NSInteger _rotY;
    NSInteger _rotZ;
    
    
}

@property (strong, nonatomic) UIWindow *window;

@end
