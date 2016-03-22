//
//  MyEncodeCATransform3D.m
//  CoreApp
//
//  Created by cat on 3/20/16.
//  Copyright (c) 2016 myxcode. All rights reserved.
//

#import "MyEncodeCATransform3D.h"
#import "Core.h"

@implementation MyEncodeCATransform3D
@synthesize transform = _transform;

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:[NSValue valueWithCATransform3D:_transform]  forKey:@"transform"];
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    if(self = [self init]){
        _transform = [(NSValue*)[aDecoder decodeObjectForKey:@"transform"] CATransform3DValue];
        [Core printCATransform3D:_transform];
    }
    return self;
}


@end
