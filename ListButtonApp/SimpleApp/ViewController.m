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

-(id) initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        [self.layer setBorderWidth:1.0];
        [self.layer setCornerRadius:0];
        CGColorSpaceRef rgb=CGColorSpaceCreateDeviceRGB();
        CGFloat mycolor[] = {0.5, 0.5, 0.5, 0.5};
        CGColorRef col=CGColorCreate(rgb, mycolor);
        [self.layer setBackgroundColor:col];
        [self.layer setBorderColor:[[UIColor colorWithWhite:0.3 alpha:0.7]CGColor]];
        //cool
        
    }
    return self;
}


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self bottomButton];
}
-(void) clickMe:(id) sender
{
    NSLog(@"click me");
    
    
}


-(void)bottomButton{    
    NSInteger leftTopX= 10;
    NSInteger leftTopY= 420;
    NSInteger butWidth = 60;
    NSInteger butHeight= 50;
    //-------------------------------------
    UIButton* mybut1 = [UIButton buttonWithType:UIButtonTypeSystem];
    mybut1.frame = CGRectMake(leftTopX + 0*(10 + butWidth), leftTopY, butWidth, butHeight);
    [mybut1 addTarget:self action:@selector(change1:) forControlEvents:UIControlEventTouchUpInside];
    [mybut1 setTitle:@"bottom1" forState:(UIControlState) UIControlStateNormal];
    [mybut1.titleLabel setFont:[UIFont fontWithName:@"Arial" size:12.0]];
    [mybut1 setBackgroundColor:[UIColor brownColor]];
    [self.view addSubview:mybut1];
    //-------------------------------------
    UIButton* mybut2 = [UIButton buttonWithType:UIButtonTypeSystem];
    mybut2.frame = CGRectMake(leftTopX + 1*(10 + butWidth), leftTopY, butWidth, butHeight);
    [mybut2 addTarget:self action:@selector(change2:) forControlEvents:UIControlEventTouchUpInside];
    [mybut2 setTitle:@"bottom2" forState:(UIControlState) UIControlStateNormal];
    
    [mybut2.titleLabel setFont:[UIFont fontWithName:@"Arial" size:12.0]];
    [mybut2 setBackgroundColor:[UIColor brownColor]];
    [self.view addSubview:mybut2];
    //-------------------------------------
    UIButton* mybut3 = [UIButton buttonWithType:UIButtonTypeSystem];
    mybut3.frame = CGRectMake(leftTopX + 2*(10 + butWidth), leftTopY, butWidth, butHeight);
    [mybut3 addTarget:self action:@selector(change3:) forControlEvents:UIControlEventTouchUpInside];
    [mybut3 setTitle:@"bottom3" forState:(UIControlState) UIControlStateNormal];
    
    [mybut3.titleLabel setFont:[UIFont fontWithName:@"Arial" size:12.0]];
    [mybut3 setBackgroundColor:[UIColor brownColor]];
    [self.view addSubview:mybut3];
    
    //-------------------------------------
    UIButton* mybut4 = [UIButton buttonWithType:UIButtonTypeSystem];
    mybut4.frame = CGRectMake(leftTopX + 3*(10 + butWidth), leftTopY, butWidth, butHeight);
    [mybut4 addTarget:self action:@selector(change4:) forControlEvents:UIControlEventTouchUpInside];
    [mybut4 setTitle:@"bottom4" forState:(UIControlState) UIControlStateNormal];
    [mybut4.titleLabel setFont:[UIFont fontWithName:@"Arial" size:12.0]];
    [mybut4 setBackgroundColor:[UIColor brownColor]];
    [self.view addSubview:mybut4];
}

-(void)change1:(id)sender {
    NSLog(@"change 1");
}

-(void)change2:(id)sender {
    NSLog(@"change 2");
}

-(void)change3:(id)sender {
    NSLog(@"change 3");
}

-(void)change4:(id)sender {
    NSLog(@"change 4");
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
