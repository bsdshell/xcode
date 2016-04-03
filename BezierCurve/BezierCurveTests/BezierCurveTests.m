//
//  BezierCurveTests.m
//  BezierCurveTests
//
//  Created by cat on 4/2/16.
//  Copyright © 2016 myxcode. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Core.h"

@interface BezierCurveTests : XCTestCase

@end

@implementation BezierCurveTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test1 {
    CGPoint p0 = CGPointMake(10, 100);
    CGPoint p1 = CGPointMake(100, 100);
    CGPoint p2 = CGPointMake(100, 200);

    NSMutableArray* array = [[NSMutableArray alloc] initWithCapacity:10];
    float scale = 1.0010;
    [Core quatricBezierCurve:p0 p1:p1 p2:p2 scale:scale array:array]; 

    // insert to first
    [array insertObject:[NSValue valueWithCGPoint:p0] atIndex:0];
    // insert to end 
    [array addObject:[NSValue valueWithCGPoint:p2]];

    [Core printArrayPoint:array];
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
