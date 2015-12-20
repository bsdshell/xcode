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
    AppDelegate* appdelegate  = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    UIButton* mybut = [UIButton buttonWithType:UIButtonTypeSystem];
    CGRect frame = CGRectMake(100, 100, 200, 50);
    mybut.frame = frame;
    [mybut addTarget:self action:@selector(startClick:) forControlEvents:UIControlEventTouchUpInside];
    [mybut setTitle:@"UIAlertViewApp" forState:(UIControlState) UIControlStateNormal];
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
    ViewController* viewController = [[ViewController alloc]init];
    [self presentViewController:viewController animated:YES completion:nil];
    
    
//    NSLog(@"%s", __PRETTY_FUNCTION__);
//    UIAlertController* myalert = [UIAlertController alertControllerWithTitle:@"Alert"
//                                                                     message:@"Delete all your saved passwords info."
//                                                              preferredStyle:UIAlertControllerStyleAlert];
//    
//    UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
//                                                     handler:^(UIAlertAction * action)
//                               {
//                                   NSLog(@"OK");
//                                   [[self navigationController] popViewControllerAnimated:YES];
//                               }];
//    
//    [myalert addAction:okAction];
//    
//    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault
//                                                         handler:^(UIAlertAction * action)
//                                   {
//                                       NSLog(@"Cancel it");
//                                   }];
//    
//    [myalert addAction:cancelAction];
//    [self presentViewController:myalert animated:YES completion:nil];
}

@end
