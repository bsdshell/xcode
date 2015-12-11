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
 
    UIButton* mybut = [UIButton buttonWithType:UIButtonTypeSystem];
    CGRect frame = CGRectMake(100, 100, 200, 50);
    mybut.frame = frame;
    [mybut addTarget:self action:@selector(startClick:) forControlEvents:UIControlEventTouchUpInside];
    [mybut setTitle:@"Play Sound" forState:(UIControlState) UIControlStateNormal];
    [mybut setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    [mybut.titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
    [mybut setBackgroundColor:[UIColor brownColor]];
    [self.view addSubview:mybut];

    
    UIButton* stopButton = [UIButton buttonWithType:UIButtonTypeSystem];
    frame = CGRectMake(100, 200, 200, 50);
    stopButton.frame = frame;
    [stopButton addTarget:self action:@selector(stopClick:) forControlEvents:UIControlEventTouchUpInside];
    [stopButton setTitle:@"Stop Sound" forState:(UIControlState) UIControlStateNormal];
    [stopButton setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    [stopButton.titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
    [stopButton setBackgroundColor:[UIColor brownColor]];
    [self.view addSubview:stopButton];

    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"sound"
                                                              ofType:@"m4a"];
    NSLog(@"path=[%@]", soundFilePath);
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL
                                                    error:nil];
    player.numberOfLoops = -1; //Infinite
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)stopClick:(id) sender{
    [player stop];
}

-(void)startClick:(id) sender{
    [player play];
}

@end
