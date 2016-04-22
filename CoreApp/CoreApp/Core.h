#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#include <CoreGraphics/CGBase.h>
#include <CoreGraphics/CGGeometry.h>
#include <CoreGraphics/CGAffineTransform.h>

@interface Core : NSObject
+(CGPoint)middlePoint:(CGPoint)p0 p1:(CGPoint)p1;
+(CGFloat)norm:(CGPoint)p0 p1:(CGPoint)p1;
+(CGFloat)dist:(CGPoint)p0 p1:(CGPoint)p1;
+(void)quatricBezierCurve:(CGPoint)p0 p1:(CGPoint)p1 p2:(CGPoint)p2 scale:(CGFloat)scale array:(NSMutableArray*)array;
+(void)printArrayPoint:(NSMutableArray*)array;
+(CAShapeLayer*)drawCurve:(NSMutableArray*)array;
+(CAShapeLayer*)drawRect;
+(CAShapeLayer*)drawCurve:(NSMutableArray*)array layer:(CAShapeLayer*)shapeLayer;
+(CGPoint)subtractPoints:(CGPoint)p0 p1:(CGPoint)p1;
+(CGPoint)addPoints:(CGPoint)p0 p1:(CGPoint)p1;
+(BOOL)comparePoints:(CGPoint)p0 p1:(CGPoint)p1;
+(CAShapeLayer*)drawCurve:(NSMutableArray*)array layer:(CAShapeLayer*)shapeLayer;
+(void)linearBezierCurve:(CGPoint)p0 p1:(CGPoint)p1 scale:(CGFloat)scale array:(NSMutableArray*)array;
+(void)printSetPoint:(NSMutableSet*)set;
+(void)triangular:(CGPoint)p0 p1:(CGPoint)p1 p2:(CGPoint)p2 array:(NSMutableArray*)array pointArray:(NSMutableArray*)pointArray step:(NSInteger)step;
@end
