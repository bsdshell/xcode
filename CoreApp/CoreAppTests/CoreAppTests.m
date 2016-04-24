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

-(void)testarr{
}

-(void)testmynum{
    int arr[] = {10};
    [Core mynum:arr];
    XCTAssertTrue(arr[0] == 11);
}
-(void)testmm{
//    NSInteger num0 = [Core mm:@"m" index:0 step:1];
//    NSInteger num1 = [Core mm:@"m" index:1 step:1];
//    NSInteger num2 = [Core mm:@"m" index:2 step:1];
//    XCTAssertTrue(num0 == 4);
//    XCTAssertTrue(num1 == 5);
//    XCTAssertTrue(num2 == 6);
}

-(void)testNumberWith{
    NSMutableArray* array = [[NSMutableArray alloc]init];
    [array addObject:[NSNumber numberWithChar:'c']];
    char ch = [array[0] charValue];
    XCTAssertTrue(ch == 'c');
    
    NSMutableArray* arr1 = [[NSMutableArray alloc]init];
    [arr1 addObject:[NSNumber numberWithBool:false]];
    BOOL isTrue = [arr1[0] boolValue];
    XCTAssertTrue(isTrue == false);
    
    for(id ch in array){
        NSLog(@"[%@] [%@]", ch, [NSString stringWithFormat:@"%c", 'a']);
    }

//    + (NSNumber *)numberWithChar:(char)value;
//    + (NSNumber *)numberWithUnsignedChar:(unsigned char)value;
//    + (NSNumber *)numberWithShort:(short)value;
//    + (NSNumber *)numberWithUnsignedShort:(unsigned short)value;
//    + (NSNumber *)numberWithInt:(int)value;
//    + (NSNumber *)numberWithUnsignedInt:(unsigned int)value;
//    + (NSNumber *)numberWithLong:(long)value;
//    + (NSNumber *)numberWithUnsignedLong:(unsigned long)value;
//    + (NSNumber *)numberWithLongLong:(long long)value;
//    + (NSNumber *)numberWithUnsignedLongLong:(unsigned long long)value;
//    + (NSNumber *)numberWithFloat:(float)value;
//    + (NSNumber *)numberWithDouble:(double)value;
//    + (NSNumber *)numberWithBool:(BOOL)value;
//    + (NSNumber *)numberWithInteger:(NSInteger)value NS_AVAILABLE(10_5, 2_0);
//    + (NSNumber *)numberWithUnsignedInteger:(NSUInteger)value NS_AVAILABLE(10_5, 2_0);

    
}

-(void)testDictCGFloat{
    CGFloat f0 = 0.33;
    CGFloat f1 = 1.33;
    CGFloat f2 = 4.4400;

    NSMutableDictionary* dict = [[NSMutableDictionary alloc]initWithObjectsAndKeys:
                                 @"obj0",          [NSNumber numberWithFloat:f0],
                                 @"obj2",          [NSNumber numberWithFloat:f2],
                                 @"obj1",          [NSNumber numberWithFloat:f1],
                                 nil];
    
    NSArray* array = [dict keysSortedByValueUsingComparator:^NSComparisonResult(id obj1, id obj2){
        return [obj1 compare:obj2];
    }];
    
    for(NSString* str in array){
        NSLog(@"key=[%@] obj[%@]", str, dict[str]);
    }
}

-(void)testSortKey{
    NSMutableDictionary* dict = [[NSMutableDictionary alloc]initWithObjectsAndKeys:
                                                                        @"obj1",          @"1",
                                                                        @"obj0",          @"0",
                                                                        @"obj2",          @"2",
                                                                        nil];
    
    NSArray* array = [dict keysSortedByValueUsingComparator:^NSComparisonResult(id obj1, id obj2){
        return [obj1 compare:obj2];
    }];
    
    for(NSString* str in array){
        NSLog(@"key=[%@] obj[%@]", str, dict[str]);
    }
}
-(void)testprintSetPoint{
    NSMutableSet* set = [[NSMutableSet alloc]init];
    [set addObject:@"cat"];
    [set addObject:@"dog"];
    [set addObject:@"cow"];
    [Core printSetPoint:set];
}


-(void)testNSMutableSet{
    NSMutableSet* set = [[NSMutableSet alloc]init];
    [set addObject:@"cat"];
    [set addObject:@"dog"];
    [set addObject:@"cow"];
    
    for(NSString* str in set){
        NSLog(@"[%@]", str);
    }
}



-(void)testComparePoint{
  CGPoint p0 = CGPointMake(10.001, 20.0003); 
  CGPoint p1 = CGPointMake(10.001, 20.0003); 
  XCTAssertTrue([Core comparePoints:p0 p1:p1]);
}


-(void)testMyCGFloat{
    CGFloat f1 = 0.001;
    CGFloat f2 = 0.0001;
    XCTAssertTrue(f1 > f2);
    
    CGFloat f11 = 0.000001;
    CGFloat f22 = 0.000001;
    XCTAssertTrue(f11 == f22);

    float  d1 = 0.000001;
    double d2 = 0.000001;
    NSLog(@"d1[%.21f]", d1);
    NSLog(@"d2[%.21g]", d2);
    
    XCTAssertTrue(d1 == d2);

    NSLog(@"PI[%f]", M_PI);
    NSLog(@"PI[%@]", [NSString stringWithFormat:@"%f", M_PI]);
    NSLog(@"PI[%@]", [NSNumber numberWithDouble:M_PI]);

    NSLog(@"-PI[%.21g]", M_PI);
    NSLog(@"-PI[%.21Lg]", (long double)M_PI);
    NSLog(@"-PI[%.21Lg]", asinl(1.0)*2);
    
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
