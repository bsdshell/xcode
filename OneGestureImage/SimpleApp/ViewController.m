//
//  ViewController.m
//  tut1
//
//  Created by aa aa on 12-06-16.
//  Copyright (c) 2012 asdfk. All rights reserved.
//

#import "ViewController.h"
#import "QuartzCore/QuartzCore.h"

@interface ViewController ()

@end

@implementation MyButton


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGRect originalFrame = CGRectMake(50, 10, 80, 80);
    CGRect frame = CGRectMake(50, 250, 100, 100);
    self.view.backgroundColor = [UIColor grayColor];

    UIImageView* oriImageView = [[UIImageView alloc]initWithFrame:originalFrame];
    UIImage* oriImage = [UIImage imageNamed:@"tap.png"];
    oriImageView.layer.opacity = 0.5f;
    oriImageView.backgroundColor = [UIColor clearColor];
    oriImageView.opaque = NO;
    oriImageView.tintColor = [UIColor clearColor];
    oriImageView.image = oriImage;
    [self.view addSubview:oriImageView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

@end
