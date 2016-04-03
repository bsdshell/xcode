#import "Core.h"
#import <UIKit/UIKit.h>

@implementation Core

+(CGPoint)middlePoint:(CGPoint)p0 p1:(CGPoint)p1{
    return CGPointMake((p0.x + p1.x)/2, (p0.y + p1.y)/2);
}

+(CGFloat)norm:(CGPoint)p0 p1:(CGPoint)p1{
    return pow(abs(p0.x - p1.x), 2.0) + pow(abs(p0.y - p1.y), 2.0);
}

+(CGFloat)dist:(CGPoint)p0 p1:(CGPoint)p1{
    return sqrt([Core norm:p0 p1:p1]);
}

+(CGPoint)subtractPoints:(CGPoint)p0 p1:(CGPoint)p1{
    return CGPointMake(p0.x - p1.x, p0.y - p1.y);
}

+(CGPoint)addPoints:(CGPoint)p0 p1:(CGPoint)p1{
    return CGPointMake(p0.x + p1.x, p0.y + p1.y);
}

+(BOOL)comparePoints:(CGPoint)p0 p1:(CGPoint)p1{
    return p0.x == p1.x && p0.y == p1.y;
}

+(void)quatricBezierCurve:(CGPoint)p0 p1:(CGPoint)p1 p2:(CGPoint)p2 scale:(CGFloat)scale array:(NSMutableArray*)array{
    if([Core comparePoints:p0 p1:p1] || [Core comparePoints:p1 p1:p2])
        return;

    CGFloat anchorDist = [Core dist:p0 p1:p2];
    CGFloat len0 = [Core dist:p0 p1:p1];
    CGFloat len1 = [Core dist:p1 p1:p2];
    if(scale*anchorDist <= (len0 + len1)){
        CGPoint lp = [Core middlePoint:p0 p1:p1];
        CGPoint rp = [Core middlePoint:p1 p1:p2];
        CGPoint midPoint = [Core middlePoint:lp p1:rp];
        [self quatricBezierCurve:p0 p1:lp p2:midPoint scale:scale array:array];
        [array addObject:[NSValue valueWithCGPoint:midPoint]];
        [self quatricBezierCurve:midPoint p1:rp p2:p2 scale:scale array:array];
    }
}
+(CAShapeLayer*)drawCurve:(NSMutableArray*)array layer:(CAShapeLayer*)shapeLayer{
    CGSize size          = [UIScreen mainScreen].bounds.size;
    UIBezierPath* path = [UIBezierPath bezierPath];

    if([array count] > 1){
        CGPoint point0 = [array[0] CGPointValue];
        [path moveToPoint:point0];
        for(int i=1; i<[array count]; i++){
            CGPoint point = [array[i] CGPointValue];
            [path addLineToPoint:point];
        }
    }else{
        NSLog(@"Need two points or more"); 
    }
    shapeLayer.path = [path CGPath];
    shapeLayer.strokeColor = [[UIColor blackColor] CGColor];
    shapeLayer.fillColor = [[UIColor brownColor] CGColor];
    shapeLayer.lineWidth = 1.0f;
    return shapeLayer;
}

+(CAShapeLayer*)drawRect{
    CGSize size = [UIScreen mainScreen].bounds.size;
    CGPoint center = CGPointMake(size.width/2, size.height/2);
    float width = 100;
    float height = 100;
    CAShapeLayer* shapeLayer = [CAShapeLayer layer];
    UIBezierPath* path = [UIBezierPath bezierPath];
    [path moveToPoint:center];
    [path addLineToPoint:CGPointMake(center.x + width, center.y)];
    [path addLineToPoint:CGPointMake(center.x + width, center.y + height)];
    [path addLineToPoint:CGPointMake(center.x, center.y + height)];
    [path closePath];
    shapeLayer.path = [path CGPath];

    shapeLayer.strokeColor = [[UIColor redColor] CGColor];
    shapeLayer.fillColor = [[UIColor brownColor] CGColor];
    shapeLayer.lineWidth = 1.0f;
    return shapeLayer;
}

//+(void)printArrayPoint:(NSMutableArray*)array{
//    for(int i=0; i<[array count]; i++){
//        NSLog(@"[%@]", array[i]);
//    }
//}

+(void)printArrayPoint:(NSMutableArray*)array{
    NSLog(@"[");
    for(int i=0; i<[array count]; i++){
        CGPoint p = [array[i] CGPointValue];
        NSLog(@"%lf,", p.x);
    }
    NSLog(@"]");

    NSLog(@"[");
    for(int i=0; i<[array count]; i++){
        CGPoint p = [array[i] CGPointValue];
        NSLog(@"%lf,", p.y);
    }
    NSLog(@"]");

}


@end


