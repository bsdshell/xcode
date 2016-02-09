//
//  NSUserDefaultAppMyTests.m
//  NSUserDefaultAppMyTests
//
//  Created by cat on 1/11/16.
//  Copyright (c) 2016 myxcode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "MyClass.h"
#import "SubClass.h"

@interface NSUserDefaultAppMyTests : XCTestCase

@end

@implementation NSUserDefaultAppMyTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testSubClass{
    NSUserDefaults* defaultUser = [NSUserDefaults standardUserDefaults];
    SubClass* subclass = [[SubClass alloc]init];
    
    [subclass setName:@"setname"];
    [subclass setAge:101];
    subclass.subname = @"subname";

    NSLog(@"subclass.name=[%@]", subclass.name);
    NSLog(@"subclass.age=[%u]", subclass.age);
    NSLog(@"subclass.subname=[%@]", subclass.subname);

    
    
    NSData* data = [NSKeyedArchiver archivedDataWithRootObject:subclass];
    [defaultUser setObject:data forKey:@"person"];
    [defaultUser synchronize];

    NSData* mydata = [defaultUser objectForKey:@"person"];
    SubClass* person = [NSKeyedUnarchiver unarchiveObjectWithData:mydata];

    for(NSArray* arr in person.nsarray){
        NSLog(@"person.nsarray=[%@]", arr);
    }
    
    NSLog(@"person.name=[%@]", person.name);
    NSLog(@"person.age=[%u]", person.age);
    NSLog(@"person.subname=[%@]", person.subname);
    
}


-(void)testEncode{
    NSUserDefaults* defaultUser = [NSUserDefaults standardUserDefaults];
    MyClass* c = [[MyClass alloc]init];
    [c setName:@"cool name"];
    [c setAge:100];
    c.myPoint = CGPointMake(3, 4);
    c.point = CGPointMake(13, 14);
    
    NSData* data = [NSKeyedArchiver archivedDataWithRootObject:c];
    NSData* pointData = [NSKeyedArchiver archivedDataWithRootObject:[NSValue valueWithCGPoint:c.point]];
    
    
    
    [defaultUser setObject:data forKey:@"person"];
    [defaultUser synchronize];
    
    NSData* undata = [defaultUser objectForKey:@"person"];
    
    MyClass* person = [NSKeyedUnarchiver unarchiveObjectWithData:undata];
    NSValue* value = [NSKeyedUnarchiver unarchiveObjectWithData:pointData];
    CGPoint coPoint = [value CGPointValue];
    
    for(NSArray* arr in person.nsarray){
        NSLog(@"person.nsarray=[%@]", arr);
    }
    
    NSLog(@"person.name=[%@]", person.name);
    NSLog(@"person.age=[%u]", person.age);
    NSLog(@"person.myPoint.x=[%f]", person.myPoint.x);
    NSLog(@"person.myPoint.y=[%f]", person.myPoint.y);
    NSLog(@"person.point.x=[%f]", person.point.x);
    NSLog(@"person.point.y=[%f]", person.point.y);

    NSLog(@"person.coPoint.x=[%f]", coPoint.x);
    NSLog(@"person.coPoint.y=[%f]", coPoint.y);
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}


- (void)testNSUserDefaults {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
    
    SubClass* subclass = [[SubClass alloc]init];
    subclass.subname = @"my subname";
    subclass.age = 100;
    subclass.name = @"name";
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
