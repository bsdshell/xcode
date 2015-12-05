//
//  AppDelegate.h
//  EmptyApp
//
//  Created by cat on 7/29/15.
//  Copyright (c) 2015 myxcode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UIImageView* _imageView;
    double _radians;
    CAShapeLayer* _layerRect;
    CAShapeLayer* _layerCircle;
    CGAffineTransform _matrix;
    CGAffineTransform _m2;
    double _rad;
    CGPoint _point;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) UIImageView* imageView;
-(CGAffineTransform)rotateCenter:(CGAffineTransform) matrix  center:(CGPoint)center;


@end

