//
//  ViewController.m
//  tut1
//
//  Created by aa aa on 12-06-16.
//  Copyright (c) 2012 asdfk. All rights reserved.
//

#import "ViewController.h"
#import "QuartzCore/QuartzCore.h"
#import "MyScene.h"

@interface ViewController ()

@end

@implementation MyButton

//-(id) initWithFrame:(CGRect)frame
//{
//    if(self = [super initWithFrame:frame])
//    {
//        [self.layer setBorderWidth:1.0];
//        [self.layer setCornerRadius:0];
//        CGColorSpaceRef rgb=CGColorSpaceCreateDeviceRGB();
//        CGFloat mycolor[] = {0.5, 0.5, 0.5, 0.5};
//        CGColorRef col=CGColorCreate(rgb, mycolor);
//        [self.layer setBackgroundColor:col];
//        [self.layer setBorderColor:[[UIColor colorWithWhite:0.3 alpha:0.7]CGColor]];
//        //cool
//        
//    }
//    return self;
//}
//

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //cool
    MyButton* mybut;
//    mybut = [MyButton buttonWithType:UIBarStyleDefault];
//    CGRect frame;
//    frame = CGRectMake(100, 100, 100, 50);
//    mybut.frame = frame;
//    
//    [mybut addTarget:self action:@selector(clickMe:) forControlEvents:UIControlEventTouchUpInside];
//    [mybut setBackgroundImage:[[UIImage imageNamed:@"pic.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:0.0] forState:UIControlStateNormal];
//    [mybut setTitle:@"mybut" forState:(UIControlState) UIControlStateNormal];
//    self.view.backgroundColor = [UIColor grayColor];
//    [self.view addSubview:mybut];
}
-(void) clickMe:(id) sender
{
    NSLog(@"click me");
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

-(void)viewWillAppear:(BOOL)animated{
    CGSize size          = [UIScreen mainScreen].bounds.size;
    MyScene* scene = [[MyScene alloc]initWithSize:CGSizeMake(size.width, size.height)];
    SKView* skView = (SKView*)self.view;
    if(scene == nil){
        NSLog(@"scene is nullable");
    }else{
        NSLog(@"scene is not nullable");
    }
    [skView presentScene:scene];
}

@end
