#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    CAShapeLayer* _rectLayer;
    CGSize          _screenSize;            
}

-(void) clickMe:(id) sender;
+ (BOOL)isiPad;

@end
