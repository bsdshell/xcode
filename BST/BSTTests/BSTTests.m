//
//  BSTTests.m
//  BSTTests
//
//  Created by cat on 11/19/15.
//  Copyright (c) 2015 myxcode. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "BNode.h"
#import "BST.h"

@interface BSTTests : XCTestCase

@end

@implementation BSTTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testNewNode {
    // This is an example of a functional test case.
    BNode* node = [[BNode alloc]init];
    XCTAssert([node left] == nil);
    XCTAssert([node right] == nil);
}

- (void)testBST {
    // This is an example of a functional test case.
    BST* bst = [[BST alloc]init];
    BNode* node = [[BNode alloc]initData:[NSNumber numberWithInt:3]];
    XCTAssert([[node data] integerValue] == 3);
    
    [bst insert:node];
    XCTAssert([[[bst root] data] integerValue] == 3);
}

- (void)testOrder {
    // This is an example of a functional test case.
    BST* bst = [[BST alloc]init];
    
    BNode* node10 = [[BNode alloc]initData:[NSNumber numberWithInt:10]];
    BNode* node8 = [[BNode alloc]initData:[NSNumber numberWithInt:8]];
    BNode* node14 = [[BNode alloc]initData:[NSNumber numberWithInt:14]];

    
    [bst insert:node10];
    [bst insert:node8];
    [bst insert:node14];
    
    NSMutableArray* array = [[NSMutableArray alloc] initWithCapacity:10];
    
    [bst inOrderTraveral:bst.root array:array];
    XCTAssert([array count] == 3);
    XCTAssert([[array objectAtIndex:0] integerValue] == 8);
    XCTAssert([[array objectAtIndex:1] integerValue] == 10);
    XCTAssert([[array objectAtIndex:2] integerValue] == 14);

    NSMutableArray* array1 = [[NSMutableArray alloc] initWithCapacity:10];

    [bst preOrderTraveral:bst.root array:array1];
    XCTAssert([array1 count] == 3);

    XCTAssert([[array1 objectAtIndex:0] integerValue] == 10);
    XCTAssert([[array1 objectAtIndex:1] integerValue] == 8);
    XCTAssert([[array1 objectAtIndex:2] integerValue] == 14);

    
    NSMutableArray* array2 = [[NSMutableArray alloc] initWithCapacity:10];
    [bst postOrderTraveral:bst.root array:array2];
    XCTAssert([array2 count] == 3);
    
    XCTAssert([[array2 objectAtIndex:0] integerValue] == 8);
    XCTAssert([[array2 objectAtIndex:1] integerValue] == 14);
    XCTAssert([[array2 objectAtIndex:2] integerValue] == 10);
    
//    XCTAssert([array count] == 3);
    
}

- (void)testContains{
    BST* bst = [[BST alloc]init];
    
    BNode* node10 = [[BNode alloc]initData:[NSNumber numberWithInt:10]];
    BNode* node8 = [[BNode alloc]initData:[NSNumber numberWithInt:8]];
    BNode* node14 = [[BNode alloc]initData:[NSNumber numberWithInt:14]];

    BNode* node15 = [[BNode alloc]initData:[NSNumber numberWithInt:15]];
    
    
    [bst insert:node10];
    [bst insert:node8];
    [bst insert:node14];
    XCTAssert([bst contains:node10]);
    XCTAssert([bst contains:node8]);
    XCTAssert([bst contains:node14]);
    XCTAssert([bst contains:node15] == false);
}


-(void)testRemove1{
    BST* bst = [[BST alloc]init];
    BNode* node10 = [[BNode alloc]initData:[NSNumber numberWithInt:10]];
    [bst insert:node10];

    XCTAssert([bst contains:node10]);
    BNode* parent = [bst remove:bst.root remove:node10];
    XCTAssert(parent == nil);
}

-(void)testRemove2{
    BST* bst = [[BST alloc]init];
    BNode* node10 = [[BNode alloc]initData:[NSNumber numberWithInt:10]];
    BNode* node8 = [[BNode alloc]initData:[NSNumber numberWithInt:8]];
    [bst insert:node10];
    [bst insert:node8];
    NSMutableArray* array = [[NSMutableArray alloc] initWithCapacity:10];
    [bst inOrderTraveral:bst.root array:array];

    XCTAssert([array count] == 2);

    array = [[NSMutableArray alloc] initWithCapacity:10];
    BNode* parent = [bst remove:bst.root remove:node10];
    [bst inOrderTraveral:parent array:array];

    XCTAssert([array count] == 1);

    XCTAssert([bst contains:node8]);
}

- (void)testRemove{
    BST* bst = [[BST alloc]init];
    
    BNode* node10 = [[BNode alloc]initData:[NSNumber numberWithInt:10]];
    BNode* node8 = [[BNode alloc]initData:[NSNumber numberWithInt:8]];
    BNode* node14 = [[BNode alloc]initData:[NSNumber numberWithInt:14]];
    
    BNode* node15 = [[BNode alloc]initData:[NSNumber numberWithInt:15]];
    
    [bst insert:node10];
    [bst insert:node8];
    [bst insert:node14];
    
    XCTAssert([bst contains:node10]);
    XCTAssert([bst contains:node8]);
    XCTAssert([bst contains:node14]);
    
    BNode* parent = [bst remove:bst.root remove:node8];

    NSMutableArray* array = [[NSMutableArray alloc] initWithCapacity:10];
    
    [bst inOrderTraveral:parent array:array];
    XCTAssert([array count] == 2);
    XCTAssert([[array objectAtIndex:0] integerValue] == 10);
    XCTAssert([[array objectAtIndex:1] integerValue] == 14);

    NSMutableArray* array1 = [[NSMutableArray alloc] initWithCapacity:10];
    parent = [bst remove:parent remove:node10];
    [bst inOrderTraveral:parent array:array1];

    XCTAssert([array1 count] == 1);
    XCTAssert([[array1 objectAtIndex:0] integerValue] == 14);

    parent = [bst remove:parent remove:node14];

    XCTAssert(parent == nil);

    BST* bst1 = [[BST alloc]init];
    [bst insert:node10];

    parent = [bst1 remove:bst1.root remove:node10];
    XCTAssert(parent == nil);
}



- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
