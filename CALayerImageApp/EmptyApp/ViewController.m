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

    UIImage*    backgroundImage = [UIImage imageNamed:@"images.jpeg"];
    CALayer*    aLayer = [CALayer layer];
    CGFloat nativeWidth = CGImageGetWidth(backgroundImage.CGImage);
    CGFloat nativeHeight = CGImageGetHeight(backgroundImage.CGImage);
    //CGRect      startFrame = CGRectMake(0.0, 0.0, nativeWidth, nativeHeight);
    CGFloat leftX = 100;
    CGFloat leftY = 100;
    CGRect      startFrame = CGRectMake(leftX, leftY, 100, 100);
    aLayer.contents = (id)backgroundImage.CGImage;
    aLayer.frame = startFrame;
    [self.view.layer addSublayer:aLayer];
    
    UIImage*    backgroundImage1 = [UIImage imageNamed:@"block.jpeg"];
    CALayer*    aLayer1 = [CALayer layer];
    //CGRect      startFrame = CGRectMake(0.0, 0.0, nativeWidth, nativeHeight);
    CGRect      startFrame1 = CGRectMake(leftX+4, leftY+4, 92, 92);
    aLayer1.contents = (id)backgroundImage1.CGImage;
    aLayer1.frame = startFrame1;
    [self.view.layer addSublayer:aLayer1];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}
-(void)startClick:(id) sender
{
}

@end
