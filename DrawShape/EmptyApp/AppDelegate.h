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
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) UIImageView* imageView;

@end

