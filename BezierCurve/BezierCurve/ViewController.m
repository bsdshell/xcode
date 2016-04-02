//
//  ViewController.m
//  BezierCurve
//
//  Created by cat on 4/2/16.
//  Copyright © 2016 myxcode. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    _mySlider = [[UISlider alloc] initWithFrame:CGRectMake(50, 200, 200, 23)];
    [self.view addSubview:_mySlider];
    _mySlider.minimumValue = 10.0;
    _mySlider.maximumValue = 99.0;
    _mySlider.continuous = YES;
    [_mySlider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
}

-(void)sliderChanged:(id)sender{
    NSLog(@"value=[%lf]", _mySlider.value); 
}

@end
