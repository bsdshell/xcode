//
//  MyClass.m
//  SingleView
//
//  Created by cat on 1/10/16.
//  Copyright (c) 2016 myxcode. All rights reserved.
//

#import "MyClass.h"

@implementation MyClass
@synthesize name = _name;
@synthesize age = _age;
@synthesize muarray = _muarray;
@synthesize nsarray = _nsarray;

-(id)init{
    self = [super init];
    if(self){
        _nsarray = [[NSArray alloc]initWithObjects:@"dog", @"cow", nil];
        _muarray = [[NSMutableArray alloc] initWithCapacity:2];
        [_muarray addObject:@"2016"];
        [_muarray addObject:@"2017"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeInt:_age forKey:@"age"];
    [aCoder encodeObject:_nsarray forKey:@"nsarray"];
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [self init];
    if(self){
        _name = [aDecoder decodeObjectForKey:@"name"];
        _age = [aDecoder decodeInt32ForKey:@"age"];
        _nsarray = [aDecoder decodeObjectForKey:@"nsarray"];
        return self;
    }
    return self;
}

@end
