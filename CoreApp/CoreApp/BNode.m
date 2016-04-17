//
//  Node.m
//  MyLib
//
//  Created by cat on 9/19/15.
//  Copyright (c) 2015 myxcode. All rights reserved.
//

#import "BNode.h"

@implementation BNode : NSObject 

-(id)init{
    if(self = [super init]){
        _left = nil;
        _right = nil;
        return self;
    }
    return nil;
}

-(id)initData:(NSNumber*)num{
    if(self = [super init]){
        _left = nil;
        _right = nil;
        _data = num;
        return self;
    }
    return nil;
}

@end
