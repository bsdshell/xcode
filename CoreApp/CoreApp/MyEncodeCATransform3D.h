//
//  MyEncodeCATransform3D.h
//  CoreApp
//
//  Created by cat on 3/20/16.
//  Copyright (c) 2016 myxcode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MyEncodeCATransform3D : NSObject<NSCopying>{
    CATransform3D _transform;
}

@property(nonatomic)CATransform3D transform;

@end
