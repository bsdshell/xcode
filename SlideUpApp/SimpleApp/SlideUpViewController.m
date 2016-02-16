//
//  SlideUpViewController.m
//  SimpleApp
//
//  Created by cat on 2/16/16.
//  Copyright (c) 2016 myxcode. All rights reserved.
//

#import "SlideUpViewController.h"

@interface SlideUpViewController ()

@end

@implementation SlideUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UIButton* mybut = [UIButton buttonWithType:UIButtonTypeSystem];
    mybut.frame = CGRectMake(100, 200, 200, 50);
    
    [mybut addTarget:self action:@selector(clickMe:) forControlEvents:UIControlEventTouchUpInside];
    [mybut setTitle:@"Slide Down" forState:(UIControlState) UIControlStateNormal];
    
    mybut.layer.shadowColor = [[UIColor blackColor]CGColor];
    mybut.layer.shadowOpacity = 0.2;
    
    [mybut setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [mybut.titleLabel setFont:[UIFont fontWithName:@"Arial" size:30.0]];
    [mybut setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:mybut];
}

-(void)clickMe:(id)sender{
    NSLog(@"Dismiss Slide Up View Controller");
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"Dismiss Controller");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
