//
//  MyViewController.h
//  OneCAShaperTransform
//
//  Created by cat on 3/4/16.
//  Copyright (c) 2016 searchBarDemo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyViewController : UIViewController{
    NSInteger _numClick;
    CAShapeLayer* _rectLayer;
    CAShapeLayer* _nonCenterLayer;
    UIBezierPath* _curve;
    CGPoint _mycenter;
    double _semiWidth;
    double _semiHeight;
    CGPoint _upLeft;
    NSTimer* _tickFinish;
    MyViewController* _myView;
    BOOL _isRotated;
    
    CATransform3D _transform;
    CATransform3D _nonCenterTransform;
    
    bool _axisX;
    bool _axisY;
    bool _axisZ;
    
    CGPoint _curveCenter;
    NSInteger _rotX;
    NSInteger _rotY;
    NSInteger _rotZ;
    NSInteger _nonCenter;
    
    CGFloat _width;
    CGFloat _height;

}

@end
