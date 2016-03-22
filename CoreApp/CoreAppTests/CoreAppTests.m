//
//  CoreAppTests.m
//  CoreAppTests
//
//  Created by cat on 3/16/16.
//  Copyright (c) 2016 myxcode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "MyClass.h"
#import "MyEncodeCATransform3D.h"
#import "Core.h"

@interface CoreAppTests : XCTestCase

@end

@implementation CoreAppTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testNumComponentColor{
    CGColorRef color1 = [[UIColor brownColor]CGColor];
    int num1 = CGColorGetNumberOfComponents(color1);
    XCTAssertTrue(num1 == 4);
}

-(void)testClearColor{
    CGColorRef color2 = [[UIColor clearColor]CGColor];
    int num2 = CGColorGetNumberOfComponents(color2);
    XCTAssertTrue(num2 == 2);
}

-(void)testColor{
    CGColorRef color = [[UIColor colorWithRed:0.1 green:0.2 blue:0.3 alpha:0.5] CGColor];
    int numComponents = CGColorGetNumberOfComponents(color);
    XCTAssertTrue(numComponents == 4);
    
    CGColorRef color1 = [Core getColorMap:10];
    int num1 = CGColorGetNumberOfComponents(color);
    XCTAssertTrue(num1 == 4);
}

-(void)testGetColorComponent{
    CGColorRef color = [[UIColor colorWithRed:(102.0/255.0) green:(204.0/255.0) blue:(255.0/255.0) alpha:1.0] CGColor];
    int numComponents = CGColorGetNumberOfComponents(color);
    
    if (numComponents == 4){
        const CGFloat *components = CGColorGetComponents(color);
        CGFloat red = components[0];
        CGFloat green = components[1];
        CGFloat blue = components[2];
        CGFloat alpha = components[3];

        NSLog(@"-------------------------------");
        NSLog(@"red[%@] green[%@] blue[%@] alpha[%@]",
              [NSNumber numberWithFloat:red],
              [NSNumber numberWithFloat:green],
              [NSNumber numberWithFloat:blue],
              [NSNumber numberWithFloat:alpha]
              );
        NSLog(@"-------------------------------");
    }
}

//-(void)testCATransform3D {
//    MyEncodeCATransform3D* myClass = [[MyEncodeCATransform3D alloc]init];
//    CATransform3D tran = CATransform3DMakeTranslation(1, 2, 3);
//    [myClass setTransform:tran];
//    
//    NSUserDefaults* defaultUser = [NSUserDefaults standardUserDefaults];
//    
//    NSData* archieverClass = [NSKeyedArchiver archivedDataWithRootObject:myClass];
//    [defaultUser setObject:archieverClass forKey:@"tran"];
//    [defaultUser synchronize];
//    
//    NSData* unarchieverClass = [defaultUser objectForKey:@"tran"];
//    MyClass* unMyClass = [NSKeyedUnarchiver unarchiveObjectWithData:unarchieverClass];
//    CATransform3D myTran = [unMyClass transform];
//    [Core printCATransform3D:myTran];
//}


-(void)testCGPoint {
    MyClass* myClass = [[MyClass alloc]init];
    [myClass setPoint:CGPointMake(1, 2)];
        
    NSUserDefaults* defaultUser = [NSUserDefaults standardUserDefaults];
    
    NSData* archieverClass = [NSKeyedArchiver archivedDataWithRootObject:myClass];
    [defaultUser setObject:archieverClass forKey:@"myclass"];
    [defaultUser synchronize];
    
    NSData* unarchieverClass = [defaultUser objectForKey:@"myclass"];
    MyClass* unMyClass = [NSKeyedUnarchiver unarchiveObjectWithData:unarchieverClass];
    CGPoint point = [unMyClass point];
    NSLog(@"[%@]", [NSValue valueWithCGPoint:point]);
    
}


- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
