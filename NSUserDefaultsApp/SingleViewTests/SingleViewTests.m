//
//  SingleViewTests.m
//  SingleViewTests
//
//  Created by cat on 12/17/15.
//  Copyright (c) 2015 myxcode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "MyClass.h"

@interface SingleViewTests : XCTestCase

@end

@implementation SingleViewTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

-(void)testEncode{
    NSUserDefaults* defaultUser = [NSUserDefaults standardUserDefaults];
    MyClass* c = [[MyClass alloc]init];
    [c setName:@"cool name"];
    [c setAge:100];
    
    NSData* data = [NSKeyedArchiver archivedDataWithRootObject:c];
    
    [defaultUser setObject:data forKey:@"person"];
    [defaultUser synchronize];

    NSData* undata = [defaultUser objectForKey:@"person"];
    
    MyClass* person = [NSKeyedUnarchiver unarchiveObjectWithData:undata];
    
    for(NSArray* arr in person.nsarray){
        NSLog(@"person.nsarray=[%@]", arr);
    }
    
    NSLog(@"person.name=[%@]", person.name);
    NSLog(@"person.age=[%u]", person.age);
}

- (void)testArray{
    
    NSUserDefaults* defaultUser = [NSUserDefaults standardUserDefaults];
    NSMutableArray* array = [NSMutableArray arrayWithCapacity:2];
    [array addObject:@"1"];
    [array addObject:@"2"];
    [array addObject:@"3"];

    [defaultUser setObject:array forKey:@"key"];
    NSMutableArray* myarray = [defaultUser objectForKey:@"key"];
    
    for(NSMutableArray* arr in myarray){
        NSLog(@"arr=[%@]", arr);
    }

    
    NSUserDefaults* defaultUser1 = [NSUserDefaults standardUserDefaults];
    
    NSArray* nsarray  = [[NSArray alloc] initWithObjects:@"str1", @"str2", nil];
    [defaultUser1 setObject:nsarray forKey:@"nskey"];
    NSMutableArray* mynsarray = [defaultUser1 objectForKey:@"nskey"];
    
    for(NSMutableArray* arr in mynsarray){
        NSLog(@"arr=[%@]", arr);
    }
    
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
