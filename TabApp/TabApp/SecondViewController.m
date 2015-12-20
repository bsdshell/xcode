//
//  SecondViewController.m
//  TabApp
//
//  Created by cat on 12/17/15.
//  Copyright (c) 2015 myxcode. All rights reserved.
//

#import "SecondViewController.h"
#import "MyViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.hidesBackButton = NO;
    self.navigationItem.title = @"Home";
    // Do any additional setup after loading the view, typically from a nib.
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
    NSLog(@"click me");
//    MyViewController* myViewController = [[MyViewController alloc]init];
//    [self.navigationController pushViewController:myViewController animated:YES];
}


@end
