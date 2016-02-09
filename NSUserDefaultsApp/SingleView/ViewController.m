//
//  ViewController.m
//  SingleView
//
//  Created by cat on 12/17/15.
//  Copyright (c) 2015 myxcode. All rights reserved.
//

#import "ViewController.h"
#import "MyLib.h"
#import "MyClass.h"
#import "SubClass.h"

@interface ViewController ()

@end

// searchkey: Add custom object to NSUserDefaults, implement NSCoding protocol, CALayer works too.
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect rect = CGRectMake(10, 10, 400, 200);
    [MyLib drawLabel:self.view rect:rect text:@"Code in test cases: NSUserDefaults, CALayer"];
    
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
    
    CALayer* circleLayer = person.circleLayer;
    
    //[self.view.layer addSublayer:circleLayer];
    [self subClass];
}
// searchkey: add subclass to NSUserDefaults  
-(void)subClass{
    NSUserDefaults* defaultUser = [NSUserDefaults standardUserDefaults];
    SubClass* subclass = [[SubClass alloc]init];
    [subclass setName:@"cool name"];
    [subclass setAge:100];
    
    NSData* data = [NSKeyedArchiver archivedDataWithRootObject:subclass];
    
    [defaultUser setObject:data forKey:@"person"];
    [defaultUser synchronize];
    
    NSData* undata = [defaultUser objectForKey:@"person"];
    
    SubClass* person = [NSKeyedUnarchiver unarchiveObjectWithData:undata];
    
    for(NSArray* arr in person.nsarray){
        NSLog(@"person.nsarray=[%@]", arr);
    }
    
    NSLog(@"person.name=[%@]", person.name);
    NSLog(@"person.age=[%u]", person.age);
    
    CALayer* circleLayer = person.circleLayer;
    
    [self.view.layer addSublayer:circleLayer];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
