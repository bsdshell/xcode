//
//  MyClass.m
//  OneEncodeCATransform3D
//
//  Created by cat on 3/20/16.
//  Copyright (c) 2016 myxcode. All rights reserved.
//

#import "MyClass.h"
#import "Core.h"

@implementation MyClass
@synthesize transform = _transform;
@synthesize point = _point;


-(void)encodeWithCoder:(NSCoder *)aCoder{
    //[aCoder encodeObject:[NSValue valueWithCATransform3D:_transform]  forKey:@"transform"];
    [aCoder encodeCGPoint:_point forKey:@"point"];
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    if(self){
        _transform = [(NSValue*)[aDecoder decodeObjectForKey:@"transform"] CATransform3DValue];
        _point = [aDecoder decodeCGPointForKey:@"point"];
        //[Core printCATransform3D:_transform];
    }
    return self;
}

@end
