//
//  mytestTests.m
//  mytestTests
//
//  Created by cat on 3/20/16.
//  Copyright (c) 2016 myxcode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "MyClass.h"
#import "Core.h"

@interface mytestTests : XCTestCase

@end

@implementation mytestTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}
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

//-(void)testCATransform3D {
//    
//    MyClass* myClass = [[MyClass alloc]init];
//    [myClass setTransform:CATransform3DMakeTranslation(1, 2, 3)];
//    
//    
//    NSUserDefaults* defaultUser = [NSUserDefaults standardUserDefaults];
//    
//    NSData* archieverClass = [NSKeyedArchiver archivedDataWithRootObject:myClass];
//    [defaultUser setObject:archieverClass forKey:@"myclass"];
//    [defaultUser synchronize];
//    
//    NSData* unarchieverClass = [defaultUser objectForKey:@"myclass"];
//    MyClass* unMyClass = [NSKeyedUnarchiver unarchiveObjectWithData:unarchieverClass];
//    CATransform3D transform = [unMyClass transform];
//    [Core printCATransform3D:transform];
//}


-(void)testArrayCGFloat {
    CATransform3D tran = CATransform3DIdentity;
    NSMutableArray* array = [[NSMutableArray alloc]initWithObjects:
                             [NSNumber numberWithFloat:tran.m11],
                             [NSNumber numberWithFloat:tran.m12],
                             [NSNumber numberWithFloat:tran.m13],
                             [NSNumber numberWithFloat:tran.m14],
                             
                             [NSNumber numberWithFloat:tran.m21],
                             [NSNumber numberWithFloat:tran.m22],
                             [NSNumber numberWithFloat:tran.m23],
                             [NSNumber numberWithFloat:tran.m24],
                             
                             [NSNumber numberWithFloat:tran.m31],
                             [NSNumber numberWithFloat:tran.m32],
                             [NSNumber numberWithFloat:tran.m33],
                             [NSNumber numberWithFloat:tran.m34],
                             
                             [NSNumber numberWithFloat:tran.m41],
                             [NSNumber numberWithFloat:tran.m42],
                             [NSNumber numberWithFloat:tran.m43],
                             [NSNumber numberWithFloat:tran.m44],
                              nil];
    
    
    XCTAssert(YES, @"Pass");

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
