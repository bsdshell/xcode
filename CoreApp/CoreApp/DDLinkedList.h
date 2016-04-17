//
//  DDLinkedList.h
//  MyLib
//
//  Created by cat on 9/19/15.
//  Copyright (c) 2015 myxcode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

@interface DDLinkedList : NSObject
{
    Node* _first;
    Node* _last;
}

@property (nonatomic, retain)Node* first;
@property (nonatomic, retain)Node* last;


-(id)init;
-(void)append:(id)node;
-(void)delete:(id)node;
-(void)deleteFirst;
-(void)deleteLast;
-(int)count;
-(void)insertInFront:(id)node;
-(void)swapData:(Node*)node1 second:(Node*)node2;
-(Node*)findNode:(Node*)node;


@end
