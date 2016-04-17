//
//  Node.h
//  MyLib
//
//  Created by cat on 9/19/15.
//  Copyright (c) 2015 myxcode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject
{
    Node* _prev;
    Node* _next;
    id    _data;
}

@property (nonatomic, retain)Node* prev;
@property (nonatomic, retain)Node* next;
@property (nonatomic, retain)id data;

-(id)init;

-(id)initWithData:(id)data;
-(NSUInteger)hash;

@end
