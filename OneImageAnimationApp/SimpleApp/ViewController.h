//
//  ViewController.h
//  tut1
//
//  Created by aa aa on 12-06-16.
//  Copyright (c) 2012 asdfk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    UIImageView* _oriImageView;
    CAShapeLayer* _rectLayer;
    UIViewController* _myViewController;
    CAShapeLayer* _cartesianCoordinates;
}

@end

@interface MyButton: UIButton

-(id) initWithFrame:(CGRect)frame;
-(void) clickMe:(id) sender;
-(UIImage*) createGrayScaleImage:(UIImage*) originalImage;
@end
