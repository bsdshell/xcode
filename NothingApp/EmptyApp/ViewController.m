//
//  ViewController.m
//  EmptyApp
//
//  Created by cat on 7/29/15.
//  Copyright (c) 2015 myxcode. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    AppDelegate* appdelegate  = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    UIButton* mybut = [UIButton buttonWithType:UIButtonTypeSystem];
    CGRect frame = CGRectMake(100, 100, 200, 50);
    mybut.frame = frame;
    [mybut addTarget:self action:@selector(startClick:) forControlEvents:UIControlEventTouchUpInside];
    [mybut setTitle:@"Switch Controller" forState:(UIControlState) UIControlStateNormal];
    [mybut setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    [mybut.titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
    [mybut setBackgroundColor:[UIColor brownColor]];
    [self.view addSubview:mybut];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}
-(void)startClick:(id) sender
{
}

@end
