//
//  SubClass.m
//  NSUserDefaultApp
//
//  Created by cat on 1/11/16.
//  Copyright (c) 2016 myxcode. All rights reserved.
//

#import "SubClass.h"

@implementation SubClass
@synthesize subname = _subname;

-(id)init{
    self = [super init];
    if(self){
        _subname = @"init subname";
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:_subname forKey:@"subname"];
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        _subname = [aDecoder decodeObjectForKey:@"subname"];
    }
    return self;
}

@end
