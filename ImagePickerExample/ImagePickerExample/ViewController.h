//
//  ViewController.h
//  EmptyApp
//
//  Created by cat on 7/29/15.
//  Copyright (c) 2015 myxcode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    UIButton* _cameraButton;
    UIView* _overlayView;
    UIImagePickerController* _imagePickerController;
}

@property (nonatomic) UIView *overlayView;
@property (nonatomic) UIImagePickerController* imagePickerController;
@property(nonatomic, retain)UIImagePickerController* imagePickercontroller;
@property(nonatomic, retain)UIButton* cameraButton;

@end

