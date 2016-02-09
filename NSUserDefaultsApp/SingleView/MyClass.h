#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef struct MyPoint MyPoint;

@interface MyClass : NSObject<NSCoding>{
    CGPoint _point;
    NSString* _name;
    int       _age;
    NSArray* _nsarray;
    CAShapeLayer* _circleLayer;
    CGPoint _myPoint;
    NSMutableArray* _nsarray;
}

@property(nonatomic, retain)NSString* name;
@property(nonatomic)int age;
@property(nonatomic, retain)NSMutableArray* muarray;
@property(nonatomic, retain)NSArray* nsarray;
@property(nonatomic, retain)CAShapeLayer* circleLayer;
@property(nonatomic)CGPoint myPoint;
@property(nonatomic)CGPoint point;
@property(nonatomic)NSMutableArray* nsarray;


-(void)encodeWithCoder:(NSCoder *)aCoder;
-(id)initWithCoder:(NSCoder *)aDecoder;
 
@end
