//
//  ViewController.m
//  SingleView
//
//  Created by cat on 12/17/15.
//  Copyright (c) 2015 myxcode. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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

-(void)startClick:(id) sender
{
    NSLog(@"click me");
    
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:nil
                                                                   message:nil
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction* encryptedPhotoImageAction = [UIAlertAction actionWithTitle:@"Click Option 1" style:UIAlertActionStyleDefault
                                                                      handler:^(UIAlertAction * action) {
                                                                          [self sendImageButton:@"option1"];
                                                                          NSLog(@"Click Option 1 Yes?");
                                                                      }];
    
    
    [alert addAction:encryptedPhotoImageAction];
    
    
    UIAlertAction* decryptedPhotoImageAction = [UIAlertAction actionWithTitle:@"Click Opiton 2" style:UIAlertActionStyleDefault
                                                                      handler:^(UIAlertAction * action) {
                                                                          [self sendImageButton:@"option2"];
                                                                          NSLog(@"Click Option 2 Yes?");
                                                                      }];
    
    
    [alert addAction:decryptedPhotoImageAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

-(void)sendImageButton:(id)sender
{
    NSString* selectOption = (NSString*)sender;
    if([selectOption compare:@"option1"] == 0){
        NSLog(@"1");
    }else if([selectOption compare:@"option2"] == 0){
        NSLog(@"2");
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
