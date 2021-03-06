//
//  AppDelegate.h
//  EmptyApplication
//
//  Created by cat on 5/6/14.
//  Copyright (c) 2014 searchBarDemo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyViewController.h"

#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioUnit/AudioUnit.h>


@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    NSInteger _numClick;
    NSTimer* _tickFinish;
    MyViewController* _myView;
    MyViewController* _mainView;
    UILabel* _labelTimer;
    CATextLayer* _textLayer;
    NSInteger _numSecond;
    UIButton* _startButton;
    UIButton* _resetButton;
    AVAudioPlayer* _player;
    BOOL _pause;
    
    NSInteger _deltaCount;
    
}

@property (strong, nonatomic) UIWindow *window;

-(void)createTextLayer;
@end
