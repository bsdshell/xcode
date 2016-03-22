//
//  MyClass.h
//  OneEncodeCATransform3D
//
//  Created by cat on 3/20/16.
//  Copyright (c) 2016 myxcode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MyClass : NSObject<NSCopying>{
    CATransform3D _transform;
    CGPoint _point;
}

@property(nonatomic)CATransform3D transform;
@property(nonatomic)CGPoint point;

@end
