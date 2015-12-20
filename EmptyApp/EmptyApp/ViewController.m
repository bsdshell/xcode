//
//  ViewController.m
//  EmptyApp
//
//  Created by cat on 7/29/15.
//  Copyright (c) 2015 myxcode. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "MyViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate* appdelegate  = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    self.navigationItem.hidesBackButton = NO;
    self.navigationItem.title = @"Home";
    
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

-(void)startClick:(id) sender{
    NSLog(@"click me");
    
    AppDelegate* appDelegate = [[UIApplication sharedApplication]delegate];
    
    NSArray* array = [[UIApplication sharedApplication] windows];
    for (UIWindow* window in array) {
        NSLog(@"window: %@", window.description);
        if(window.rootViewController == nil){
            NSLog(@"this is null window");
        }
    }
    
    
    MyViewController* myViewController = [[MyViewController alloc]init];
    //[self.navigationController pushViewController:myViewController animated:YES];
    
    //UINavigationController* nav = [[UINavigationController alloc]initWithRootViewController:myViewController];
    
    //[appDelegate.navigationController pushViewController:myViewController animated:YES];
    [appDelegate.window addSubview:myViewController.view];
    //[appDelegate.window setRootViewController:myViewController];
    
    //[appDelegate.navigationController pushViewController:[nav view] animated:YES];
    
    //[appDelegate.navigationController pushViewController:myViewController animated:YES];
}

@end
