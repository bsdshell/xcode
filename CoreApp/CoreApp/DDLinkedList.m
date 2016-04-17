//
//  DDLinkedList.m
//  MyLib
//
//  Created by cat on 9/19/15.
//  Copyright (c) 2015 myxcode. All rights reserved.
//

#import "DDLinkedList.h"

@implementation DDLinkedList
@synthesize first = _first;
@synthesize last  = _last;

-(id)init{
    if(self = [super init]){
        _first = nil;
        _last = nil;
        return self;
    }
    return nil;
}

-(void)append:(id)node{
    if(self.last == nil){
        self.first = [[Node alloc]initWithData:[node data]];
        self.last = self.first;
    }
    else{
        self.last.next = [[Node alloc]initWithData:[node data]];
        self.last.next.prev = self.last;
        self.last = self.last.next;
    }
}

-(void)delete:(id)node{
    Node* curr = self.first;
    Node* prev = nil;
    Node* next = self.first.next;
    while(curr != nil){
        if([curr isEqual:node]){
            
            if(prev == nil){
                
                // [curr]
                if(next == nil){
                    self.first = self.last = nil;
                }else{
                    // [curr]->[next]
                    self.first = next;
                    self.first.prev = nil;
                }
            }else{
                
                // [prev]->[curr]
                if(next == nil){
                    self.last = prev;
                    self.last.next = nil;
                }
                
                // [prev]->[curr]->[next]
                prev.next = next;
                next.prev = prev;
                curr.next = curr.prev = nil;
            }
            return;
        }
        prev = curr;
        curr = curr.next;
        if(next != nil)
            next = next.next;
    }
}

-(void)deleteFirst{
    if(self.first != nil){
        Node* tmpNext = self.first.next;
        self.first.next = nil;
        if(tmpNext != nil){
            tmpNext.prev = nil;
            self.first = tmpNext;
        }
        else{
            self.first = self.last = nil;
        }
    }
}
-(void)deleteLast{
    if(self.last != nil){
        Node* tmpPrev = self.last.prev;
        self.last.prev = nil;
        if(tmpPrev != nil){
            tmpPrev.next = nil;
        }else{
            self.first = self.last = nil;
        }
    }
}

-(int)count{
    Node* curr = self.first;
    int c = 0;
    while(curr != nil){
        c++;
        curr = curr.next;
    }
    return c;
}

-(void)insertInFront:(id)node{
    if(self.first != nil){
        self.first.prev = node;
        Node* node1 = (Node*)node;
        node1.next = self.first;
        self.first = node1;
    }else{
        self.first = self.last = node;
    }
}

-(Node*)findNode:(Node*)node{
    Node* curr = self.first;
    while(curr != nil){
        if([curr isEqual:node]){
            return curr;
        }else
            curr = curr.next;
    }
    return nil;
}

-(void)swapData:(Node*)node1 second:(Node*)node2{
    Node* n1 = [self findNode:node1];
    Node* n2 = [self findNode:node2];
    if( n1 != nil && n2 != nil){
        Node* data = n1.data;
        n1.data = n2.data;
        n2.data = data;
    }
}

@end
