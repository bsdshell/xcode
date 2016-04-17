//
//  Node.m
//  MyLib
//
//  Created by cat on 9/19/15.
//  Copyright (c) 2015 myxcode. All rights reserved.
//

#import "Node.h"

@implementation Node
@synthesize prev = _prev;
@synthesize next = _next;
@synthesize data = _data;

-(id)init{
    if(self = [super init]){
        _prev = nil;
        _next = nil;
        return self;
    }
    return nil;
}
-(id)initWithData:(id)data{
    if(self = [super init]){
        _data = data;
        return self;
    }
    return nil;
}
-(BOOL)isEqual:(id)object{
    if (object == nil)
        return false;
    if([self class] != [object class])
        return false;
    
    else{
        Node* no = (Node*)object;
        if( [self.data isEqual:no.data])
            return true;
        else
            return false;
    }
}

-(NSUInteger)hash{
    return [[self data] hash];
}

@end
