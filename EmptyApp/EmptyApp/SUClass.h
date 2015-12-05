//
//  SUClass.h
//  EmptyApp
//
//  Created by cat on 11/26/15.
//  Copyright (c) 2015 myxcode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SUClass : NSObject
{
    NSString* _myStr;
}

@property(nonatomic)NSString* myStr;

-(id)init;
-(id)initString:(NSString*)str;


@end
