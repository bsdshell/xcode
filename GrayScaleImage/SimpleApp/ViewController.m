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
    CGRect originalFrame = CGRectMake(50, 10, 200, 200);
    CGRect frame = CGRectMake(50, 250, 200, 200);
    self.view.backgroundColor = [UIColor grayColor];

    UIImageView* oriImageView = [[UIImageView alloc]initWithFrame:originalFrame];
    UIImage* oriImage = [UIImage imageNamed:@"food.jpg"];
    oriImageView.image = oriImage;
    [self.view addSubview:oriImageView];

    UIImageView* grayScaleVeiw = [[UIImageView alloc]initWithFrame:frame];
    UIImage* grayScaleImage = [UIImage imageNamed:@"food.jpg"];
    grayScaleVeiw.image = [self createGrayScaleImage:grayScaleImage];
    [self.view addSubview:grayScaleVeiw];
}

-(UIImage*) createGrayScaleImage:(UIImage*) originalImage{
    //create gray device colorspace.
    CGColorSpaceRef space = CGColorSpaceCreateDeviceGray();
    //create 8-bit bimap context without alpha channel.
    CGContextRef bitmapContext = CGBitmapContextCreate(NULL, originalImage.size.width, originalImage.size.height, 8, 0, space, kCGImageAlphaNone);
    CGColorSpaceRelease(space);
    //Draw image.
    CGRect bounds = CGRectMake(0.0, 0.0, originalImage.size.width, originalImage.size.height);
    CGContextDrawImage(bitmapContext, bounds, originalImage.CGImage);
    //Get image from bimap context.
    CGImageRef grayScaleImage = CGBitmapContextCreateImage(bitmapContext);
    CGContextRelease(bitmapContext);
    //image is inverted. UIImage inverts orientation while converting CGImage to UIImage.
    UIImage* image = [UIImage imageWithCGImage:grayScaleImage];
    CGImageRelease(grayScaleImage);
    return image;
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

@end
