//
//  ViewController.h
//  tut1
//
//  Created by aa aa on 12-06-16.
//  Copyright (c) 2012 asdfk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    CAShapeLayer* _shapeLayer;
    CAShapeLayer* _rectLayer;
    UILabel *_myLabel1;
    UILabel *_myLabel2;
}

@property(nonatomic, retain)CAShapeLayer* shaperLayer;
@property(nonatomic, retain)CAShapeLayer* rectLayer;
@end

@interface MyButton: UIButton

-(id) initWithFrame:(CGRect)frame;
-(void) clickMe:(id) sender;

@end
