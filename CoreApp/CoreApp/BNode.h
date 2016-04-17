//
//  Node.h
//  MyLib
//
//  Created by cat on 9/19/15.
//  Copyright (c) 2015 myxcode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNode : NSObject
{
    BNode* _left;
    BNode* _right;
    id     _data;
}

@property (nonatomic, retain)BNode* left;
@property (nonatomic, retain)BNode* right;
@property (nonatomic, retain)id data;

-(id)init;
-(id)initData:(NSNumber*)num;
@end
