//
//  NewViewController.m
//  EmptyApp
//
//  Created by cat on 12/4/15.
//  Copyright (c) 2015 myxcode. All rights reserved.
//

#import "StartViewController.h"
#import "ViewController.h"
#import "AppDelegate.h"
#import "MyLib.h"

@interface StartViewController ()

@end

@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // create simple text label
    CGSize size          = [UIScreen mainScreen].bounds.size;

    [MyLib Label:self.view text:@"Switch the Controller"];
    [MyLib Button:self.view targe:self selector:@selector(startClick:)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)startClick:(id) sender
{
    NSLog(@"Switch Back");
    ViewController* viewController = [[ViewController alloc]init];
    AppDelegate* appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    appDelegate.window.rootViewController = viewController;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
