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
}

@property(nonatomic, retain)CAShapeLayer* shaperLayer;
@end

@interface MyButton: UIButton

-(id) initWithFrame:(CGRect)frame;
-(void) clickMe:(id) sender;

@end
