//
//  AppDelegate.h
//  EmptyApplication
//
//  Created by cat on 5/6/14.
//  Copyright (c) 2014 searchBarDemo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UILabel * _myLabel;
    CGPoint   _initXY;
    CGPoint _center;
    CAShapeLayer* _circleLayer;

}

@property (strong, nonatomic) UIWindow *window;
@end
