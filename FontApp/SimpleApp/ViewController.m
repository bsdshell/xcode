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
	// Do any additional setup after loading the view, typically from a nib.
    //cool

    CGSize size = [UIScreen mainScreen].bounds.size;
    long buttonWidth = 300;
    long buttonHeight = 50;

    MyButton* mybut;
    mybut = [MyButton buttonWithType:UIBarStyleDefault];
    CGRect frame;
    frame = CGRectMake(10, 100, buttonWidth, buttonHeight);
    mybut.frame = frame;
    
    CGRect labelFrame = CGRectMake(0, -buttonHeight, buttonWidth, buttonHeight);
    [mybut addTarget:self action:@selector(clickMe:) forControlEvents:UIControlEventTouchUpInside];
    [mybut setTitle:@"Play Again" forState:(UIControlState) UIControlStateNormal];
    mybut.backgroundColor = [UIColor brownColor];
    self.view.backgroundColor = [UIColor clearColor];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:labelFrame];
    titleLabel.text = @"MarkerFelt-Thin";
    titleLabel.font = [UIFont fontWithName:@"MarkerFelt-Thin" size:24.0];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    //titleLabel.backgroundColor = [UIColor greenColor];
    
    titleLabel.numberOfLines = 2;
    titleLabel.lineBreakMode = NSLineBreakByClipping;
    [mybut addSubview:titleLabel]; //add label to button instead.

    
    // -------------------------------------------------------------------
    MyButton* mybut1;
    mybut1 = [MyButton buttonWithType:UIBarStyleDefault];
    CGRect frame1;
    frame1 = CGRectMake(10, 300, buttonWidth, buttonHeight);
    mybut1.frame = frame1;
    
    CGRect labelFrame1 = CGRectMake(0, -buttonHeight, buttonWidth, buttonHeight);
    [mybut1 addTarget:self action:@selector(clickMe:) forControlEvents:UIControlEventTouchUpInside];
    [mybut1 setTitle:@"Play Again" forState:(UIControlState) UIControlStateNormal];
    mybut1.backgroundColor = [UIColor brownColor];
    self.view.backgroundColor = [UIColor clearColor];
    
    UILabel *titleLabel1 = [[UILabel alloc] initWithFrame:labelFrame];
    //titleLabel.font = [UIFont boldSystemFontOfSize:24.0];
    titleLabel1.text = @"Georgia-BoldItalic";
    titleLabel1.font = [UIFont fontWithName:@"Georgia-BoldItalic" size:24.0];
    titleLabel1.textAlignment = NSTextAlignmentCenter;
    titleLabel1.numberOfLines = 2;
    titleLabel1.lineBreakMode = NSLineBreakByClipping;
    [mybut1 addSubview:titleLabel1]; //add label to button instead.
    // -------------------------------------------------------------------
    
    
    [self.view addSubview:mybut];
    [self.view addSubview:mybut1];

    
}
-(void) clickMe:(id) sender
{
    NSLog(@"Click Play Again Button");
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
