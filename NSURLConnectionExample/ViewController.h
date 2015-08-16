//
//  ViewController.h
//  tut1
//
//  Created by aa aa on 12-06-16.
//  Copyright (c) 2012 asdfk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<NSURLConnectionDelegate>
{
    NSMutableData* _receivedData;
    NSString* _fileName;
}

@property(nonatomic, retain)NSMutableData* receivedData;
@property(nonatomic, retain)NSString* fileName;;

-(NSMutableURLRequest*)sendRequest:(NSData*)nsData fileName:(NSString*)fileName;

@end

@interface MyButton: UIButton

-(id) initWithFrame:(CGRect)frame;
-(void) clickMe:(id) sender;



@end
