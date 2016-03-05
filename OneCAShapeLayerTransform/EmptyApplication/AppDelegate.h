//
//  AppDelegate.h
//  EmptyApplication
//
//  Created by cat on 5/6/14.
//  Copyright (c) 2014 searchBarDemo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    NSInteger _numClick;
    CAShapeLayer* _shapeLayer;
    CAShapeLayer* _curveLayer;
    UIBezierPath* _curve;
    double _semiWidth;
    double _semiHeight;
    CGPoint _upLeft;
    NSTimer* _tickFinish;
}

@property (strong, nonatomic) UIWindow *window;

@end
