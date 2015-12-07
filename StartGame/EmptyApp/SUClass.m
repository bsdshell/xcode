//
//  SUClass.m
//  EmptyApp
//
//  Created by cat on 11/26/15.
//  Copyright (c) 2015 myxcode. All rights reserved.
//

#import "SUClass.h"

@implementation SUClass
@synthesize myStr = _myStr;


-(id)init{
    if(self = [super init]){
        _myStr = @"dog";
        return self;
    }
    return nil;
}

-(id)initString:(NSString*)str{
    if(self = [super init]){
        _myStr = str;
        return self;
    }
    return nil;
}

@end
