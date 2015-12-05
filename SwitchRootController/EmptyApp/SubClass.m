//
//  SubClass.m
//  EmptyApp
//
//  Created by cat on 11/26/15.
//  Copyright (c) 2015 myxcode. All rights reserved.
//

#import "SubClass.h"

@implementation SubClass

-(void)printStuff{
    NSString* str = _myStr;
    NSLog(@"this is");
}

-(id)init{
    if(self = [super initString:@"cat"]){
        _myStr = @"super";
        return self;
    }
    return nil;
}

@end
