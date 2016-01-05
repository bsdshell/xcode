//
//  ViewController.m
//  AppUIAlert
//
//  Created by cat on 1/4/16.
//  Copyright (c) 2016 myxcode. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:nil
                                                                   message:nil
                                                            preferredStyle:UIAlertActionStyleDefault];
    
    
    UIAlertAction* encryptedPhotoImageAction = [UIAlertAction actionWithTitle:@"Send encrypted Images" style:UIAlertActionStyleDefault
                                                                      handler:^(UIAlertAction * action) {
                                                                          [self sendImageButton:@"option1"];
                                                                          NSLog(@"send encrypted images");
                                                                      }];
    
    
    [alert addAction:encryptedPhotoImageAction];
    
    
    UIAlertAction* decryptedPhotoImageAction = [UIAlertAction actionWithTitle:@"Send decrypted Images" style:UIAlertActionStyleDefault
                                                                      handler:^(UIAlertAction * action) {
                                                                          [self sendImageButton:@"option2"];
                                                                          NSLog(@"send decrypted images");
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
