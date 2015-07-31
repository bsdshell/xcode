//
//  ViewController.m
//  EmptyApp
//
//  Created by cat on 7/29/15.
//  Copyright (c) 2015 myxcode. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize cameraButton = _cameraButton;
@synthesize overlayView = _overlayView;
@synthesize imagePickerController = _imagePickerController;
@synthesize capturedImages = _capturedImages;
@synthesize cancelButton = _cancelButton;

- (void)viewDidLoad {
    [super viewDidLoad];

    self.capturedImages = [[NSMutableArray alloc] init];
    
    self.view.backgroundColor = [UIColor clearColor];
    
    self.overlayView = [[UIView alloc]initWithFrame:self.view.bounds];
    
    self.cancelButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 320, 60, 30)];
    self.cancelButton.backgroundColor = [UIColor redColor];
    [self.cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    [self.cancelButton addTarget:self action:@selector(imagePickerControllerDidCancel:) forControlEvents:UIControlEventTouchUpInside];
    [self.overlayView addSubview:self.cancelButton];

    self.cameraButton = [[UIButton alloc]initWithFrame:CGRectMake(130, 320, 60, 30)];
    self.cameraButton.backgroundColor = [UIColor blueColor];
    
    [self.cameraButton setTitle:@"Picture" forState:UIControlStateNormal];
    [self.cameraButton addTarget:self action:@selector(takePicture:) forControlEvents:UIControlEventTouchUpInside];
    [self.overlayView addSubview:self.cameraButton];
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.modalPresentationStyle = UIModalPresentationCurrentContext;
    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    if (imagePickerController.sourceType == UIImagePickerControllerSourceTypeCamera){

        imagePickerController.showsCameraControls = NO;
        imagePickerController.cameraOverlayView = self.overlayView;
        imagePickerController.delegate = self;
        self.overlayView = nil;
    }
    self.imagePickerController = imagePickerController;
}

// The method have to pass (id)sender as parameter in order to work:)
- (void)takePicture:(id)sender{
    NSLog(@"takePicture()");
    [self.imagePickerController takePicture];
}

-(void) viewDidAppear:(BOOL)animated{
    [self presentViewController:self.imagePickerController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIImagePickerControllerDelegate

// This method is called when an image has been chosen from the library or taken from the camera.
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    [self.capturedImages addObject:image];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self.imagePickerController dismissViewControllerAnimated:YES completion:NULL];
}

@end
