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
    UIButton* _cancelButton;
    UIView* _overlayView;
    UIImagePickerController* _imagePickerController;
    NSMutableArray* _capturedImages;
}

@property (nonatomic) UIView *overlayView;
@property (nonatomic) UIImagePickerController* imagePickerController;
@property(nonatomic, retain)UIImagePickerController* imagePickercontroller;
@property(nonatomic, retain)UIButton* cameraButton;
@property(nonatomic, retain)UIButton* cancelButton;
@property(nonatomic, retain)NSMutableArray* capturedImages;

@end

