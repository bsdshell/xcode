//
//  MyClass.h
//  SingleView
//
//  Created by cat on 1/10/16.
//  Copyright (c) 2016 myxcode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MyClass : NSObject<NSCoding>{
    NSString* _name;
    int       _age;
    NSArray* _nsarray;
    CAShapeLayer* _circleLayer;

}

@property(nonatomic, retain)NSString* name;
@property(nonatomic)int age;
@property(nonatomic, retain)NSMutableArray* muarray;
@property(nonatomic, retain)NSArray* nsarray;
@property(nonatomic, retain)CAShapeLayer* circleLayer;

@end
