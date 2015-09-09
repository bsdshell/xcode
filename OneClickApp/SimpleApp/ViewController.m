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
@synthesize label = _label;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //cool
    MyButton* mybut;
    mybut = [MyButton buttonWithType:UIButtonTypeSystem];
    CGRect frame;
    frame = CGRectMake(100, 100, 100, 50);
    mybut.frame = frame;
    
    [mybut addTarget:self action:@selector(clickMe:) forControlEvents:UIControlEventTouchUpInside];
    [mybut setBackgroundImage:[[UIImage imageNamed:@"pic.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [mybut setTitle:@"mybut" forState:(UIControlState) UIControlStateNormal];
    self.view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:mybut];
    
    
    // create simple text label
     self.label= [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 300, 300)];
    [self.label setTextColor:[UIColor yellowColor]];
    [self.label setBackgroundColor:[UIColor clearColor]];
    [self.label setFont:[UIFont fontWithName: @"Trebuchet MS" size: 20.0f]];
    [self.label setText:@"OneClickApp"];
    [self.view addSubview:self.label];
    
}
-(void) clickMe:(id) sender
{
    NSLog(@"Add label");
    
    [self.label removeFromSuperview];
    
    UILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 30, 300, 300)];
    myLabel.numberOfLines = 0;
    [myLabel setTextColor:[UIColor yellowColor]];
    [myLabel setBackgroundColor:[UIColor clearColor]];
    [myLabel setFont:[UIFont fontWithName: @"Trebuchet MS" size: 12.0f]];
    [myLabel setText:@"Remove old label and add new label \n with removeFromSuperView  \n myLabel.numberOfLines = 0;"];
    
    [self.view addSubview:myLabel];

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
