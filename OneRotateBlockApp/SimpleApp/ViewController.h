#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    UILabel* _clickPos;
    UILabel* _anchorLabel;
    UILabel* _coordinates;
    UILabel* _mainLabel;
    CGSize _size;
    CAShapeLayer* _rectLayer;
    CAShapeLayer* _mainLayer;
    CGPoint _prevPos;
    CABasicAnimation* _rotationAnimation;
    CGFloat _mainWidth;
    CGFloat _mainHeight;


}
@end
