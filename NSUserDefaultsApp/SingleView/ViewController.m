//
//  ViewController.m
//  SingleView
//
//  Created by cat on 12/17/15.
//  Copyright (c) 2015 myxcode. All rights reserved.
//

#import "ViewController.h"
#import "MyLib.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect rect = CGRectMake(10, 10, 400, 200);
    [MyLib drawLabel:self.view rect:rect text:@"Code in test cases: NSUserDefaults"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
