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
    CAShapeLayer* _myRectLayer;
    UIBezierPath* _curve;
    CGPoint _mycenter;
    double _semiWidth;
    double _semiHeight;
    CGPoint _upLeft;
    NSTimer* _tickFinish;
    MyViewController* _myView;
    MyViewController* _mainView;
    BOOL _isRotated;
    
    CATransform3D _transform;
    CATransform3D _translateTransform;
    
    CGPoint _rectCenter;
    NSInteger _rotX;
    NSInteger _rotY;
    NSInteger _rotZ;
    NSInteger _deltaCount;
    
    CGFloat _width;
    CGFloat _height;
    CGPoint _initXY;
    CGPoint _newInitXY;
}

@property (strong, nonatomic) UIWindow *window;

@end
