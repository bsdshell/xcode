//
//  MyClass.m
//  SingleView
//
//  Created by cat on 1/10/16.
//  Copyright (c) 2016 myxcode. All rights reserved.
//

#import "MyClass.h"

@implementation MyClass
@synthesize name        = _name;
@synthesize age         = _age;
@synthesize muarray     = _muarray;
@synthesize nsarray     = _nsarray;
@synthesize circleLayer = _circleLayer;
@synthesize myPoint     = _myPoint;
@synthesize point       = _point;

-(id)init{
    self = [super init];
    if(self){
        _nsarray = [[NSArray alloc]initWithObjects:@"dog", @"cow", nil];
        _muarray = [[NSMutableArray alloc] initWithCapacity:2];
        [_muarray addObject:@"2016"];
        [_muarray addObject:@"2017"];
        
        _point = CGPointMake(5, 5);
        _circleLayer = [CAShapeLayer layer];
        CGFloat leftX = 100.0f;
        CGFloat leftY = 100.0f;
        CGFloat Width = 200.0f;
        CGFloat Height = 200.0f;
        UIBezierPath* path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(leftX, leftY, Width, Height)];
        [_circleLayer setPath:[path CGPath]];

    }
    return self;
}


-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [self init];
    if(self){
        _name        = [aDecoder decodeObjectForKey:@"name"];
        _age         = [aDecoder decodeInt32ForKey:@"age"];
        _nsarray     = [aDecoder decodeObjectForKey:@"nsarray"];
        _circleLayer = [aDecoder decodeObjectForKey:@"calayer"];
        _point       = [aDecoder decodeCGPointForKey:@"point"];
        return self;
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeInt:_age forKey:@"age"];
    [aCoder encodeObject:_nsarray forKey:@"nsarray"];
    [aCoder encodeObject:_circleLayer forKey:@"calayer"];
    [aCoder encodeCGPoint:_point forKey:@"point"];
}

@end
