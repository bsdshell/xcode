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
    CAShapeLayer* _rectLayer;
    CAShapeLayer* _nonCenterLayer;
    UIBezierPath* _curve;
    CGPoint _mycenter;
    double _semiWidth;
    double _semiHeight;
    CGPoint _upLeft;
    NSTimer* _tickFinish;
    MyViewController* _mainView;
    BOOL _isRotated;
    
    CATransform3D _transform;
    CATransform3D _rotateTransform;
    CAShapeLayer* _outerLayer;
    CGFloat _outerWidth;
    CGFloat _outerHeight;
    
    bool _axisX;
    bool _axisY;
    bool _axisZ;
    
    CGPoint _curveCenter;
    CGPoint _mainPos;
    NSInteger _rotX;
    NSInteger _rotY;
    NSInteger _rotZ;
    NSInteger _deltaCount;
    
    CGFloat _width;
    CGFloat _height;

    
    
}

@property (strong, nonatomic) UIWindow *window;

@end
