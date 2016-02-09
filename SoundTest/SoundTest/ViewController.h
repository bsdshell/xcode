//
//  ViewController.h
//  SoundTest
//
//  Created by cat on 2/7/16.
//  Copyright (c) 2016 myxcode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioUnit/AudioUnit.h>


@interface ViewController : UIViewController{
    UILabel *frequencyLabel;
    UIButton *_playButton;
    UISlider *frequencySlider;
    AudioComponentInstance toneUnit;

    @public
    double frequency;
    double sampleRate;
    double theta;
}


@end

