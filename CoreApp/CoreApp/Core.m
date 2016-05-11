#import "Core.h"
#import <UIKit/UIKit.h>

//#define NSLog(...)     //
//#define printf(...)    //


@implementation Core



+(CGPoint)middlePoint:(CGPoint)p0 p1:(CGPoint)p1{
    return CGPointMake((p0.x + p1.x)/2, (p0.y + p1.y)/2);
}

+(CGFloat)norm:(CGPoint)p0 p1:(CGPoint)p1{
    return pow(fabs(p0.x - p1.x), 2.0) + pow(fabs(p0.y - p1.y), 2.0);
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

+(CAShapeLayer*)drawCircle:(CGPoint)center radius:(CGFloat)radius{
    CAShapeLayer* shapeLayer  = [CAShapeLayer layer];
    UIBezierPath* path        = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(center.x - radius,  center.y - radius, 2*radius, 2*radius)];
    shapeLayer.strokeColor    = [[UIColor redColor] CGColor];
    shapeLayer.fillColor      = [[UIColor clearColor] CGColor];
    shapeLayer.lineWidth      = 2.0f;
    [shapeLayer setPath:[path CGPath]];
    return shapeLayer;
}

+(CAShapeLayer*)drawListCircles:(NSMutableArray*)array{
    CGFloat radius = 2;
    CAShapeLayer* mainLayer = [CAShapeLayer layer];
    int count = 1;
    for(NSValue* center in array){
        CGPoint cen =[center CGPointValue];
        [mainLayer addSublayer:[Core drawCircle:cen radius:radius]];

        CATextLayer* textLayer = [CATextLayer layer]; 
        [textLayer setFrame:CGRectMake(cen.x-radius+2*count, cen.y-radius, 2*radius, 2*radius)];
        //[textLayer setString:[NSString stringWithFormat:@"%d", count]];
        [textLayer setFontSize:14.f];
        [textLayer setAlignmentMode:kCAAlignmentCenter];
        if(count % 2 == 0)
            [textLayer setForegroundColor:[UIColor redColor].CGColor];
        else
            [textLayer setForegroundColor:[UIColor blueColor].CGColor];

        [mainLayer addSublayer:textLayer];
        count++;
    }
    return mainLayer;
}

+(void)counterClockWisePoints:(NSMutableArray*)array{
    if([array count] == 3){
        CGPoint p0 = [array[0] CGPointValue];
        CGPoint p1 = [array[1] CGPointValue];
        CGPoint p2 = [array[2] CGPointValue];
        if(p1.x < p0.x){
            if(p0.y < p2.y){
                
            }else if(p0.y > p2.y){
            }else{
            }
        }else if(p1.x > p0.x){

        }else if(p1.x == p0.x){

        }
    }
}
+(NSInteger)map:(NSString*)str index:(NSInteger)index step:(NSInteger)step{
    if([str isEqualToString:@"m"])
        return 3*step + index + 1;
    else if([str isEqualToString:@"p"])
        return 3*(step-1) + index + 1;
    return -1;
}

//+(void)triangular:(CGPoint)p0 p1:(CGPoint)p1 p2:(CGPoint)p2 array:(NSMutableArray*)array pointArray:(NSMutableArray*)pointArray dict:(NSMutableDictionary*)dict step:(NSInteger)step{
//    if(step > 0){
//        CGPoint m0 = [Core middlePoint:p0 p1:p1];
//        CGPoint m1 = [Core middlePoint:p1 p1:p2];
//        CGPoint m2 = [Core middlePoint:p2 p1:p0];
//       
//        [pointArray addObject:[NSValue valueWithCGPoint:m0]];
//        [pointArray addObject:[NSValue valueWithCGPoint:m1]];
//        [pointArray addObject:[NSValue valueWithCGPoint:m2]];
//
//         
//        [Core triangular:m0 p1:p1 p2:m1 array:array pointArray:pointArray dict:dict step:step-1];
//        NSMutableArray* arr = [[NSMutableArray alloc] initWithCapacity:3];
//        arr = [[NSMutableArray alloc] initWithCapacity:3];
//        [arr addObject:[NSValue valueWithCGPoint:m0]];
//        [arr addObject:[NSValue valueWithCGPoint:p1]];
//        [arr addObject:[NSValue valueWithCGPoint:m1]];
//        [array addObject:arr];
//        NSLog(@"0:f %ld %ld %ld  step[%ld]", 3*step+1, 3*(step-1) + 2, 3*step+2, step);
//         
//        
//        [Core triangular:m1 p1:p2 p2:m2 array:array pointArray:pointArray dict:dict step:step-1];
//        arr = [[NSMutableArray alloc] initWithCapacity:3];
//        [arr addObject:[NSValue valueWithCGPoint:m0]];
//        [arr addObject:[NSValue valueWithCGPoint:m2]];
//        [arr addObject:[NSValue valueWithCGPoint:p0]];
//        [array addObject:arr];
//        NSLog(@"1:f %ld %ld %ld step[%ld]", 3*step + 2, 3*(step-1)+3, 3*step + 3, step);
//
//         
//        [Core triangular:m2 p1:p0 p2:m0 array:array pointArray:pointArray dict:dict step:step-1];
//        arr = [[NSMutableArray alloc] initWithCapacity:3];
//        [arr addObject:[NSValue valueWithCGPoint:m1]];
//        [arr addObject:[NSValue valueWithCGPoint:p2]];
//        [arr addObject:[NSValue valueWithCGPoint:m2]];
//        [array addObject:arr];
//        NSLog(@"2:f %ld %ld %ld step[%ld]", 3*step+3, 3*(step-1) + 1, 3*step + 1, step);
//         
//        [Core triangular:m0 p1:m1 p2:m2 array:array pointArray:pointArray dict:dict step:step-1];
//        arr = [[NSMutableArray alloc] initWithCapacity:3];
//        [arr addObject:[NSValue valueWithCGPoint:m0]];
//        [arr addObject:[NSValue valueWithCGPoint:m1]];
//        [arr addObject:[NSValue valueWithCGPoint:m2]];
//        [array addObject:arr];
//        NSLog(@"3:f %d %d %d step[%ld]", 3*step + 1, 3*step + 2, 3*step + 3, step);
//    }
//}
//


+(void)triangular:(CGPoint)p0 p1:(CGPoint)p1 p2:(CGPoint)p2 array:(NSMutableArray*)array pointArray:(NSMutableArray*)pointArray step:(NSInteger)step{
    if(step > 0){
        CGPoint m0 = [Core middlePoint:p0 p1:p1];
        CGPoint m1 = [Core middlePoint:p1 p1:p2];
        CGPoint m2 = [Core middlePoint:p2 p1:p0];
       
        [Core triangular:m0 p1:p1 p2:m1 array:array pointArray:pointArray step:step-1];
        NSMutableArray* arr = [[NSMutableArray alloc] initWithCapacity:3];
        arr = [[NSMutableArray alloc] initWithCapacity:3];
        [arr addObject:[NSValue valueWithCGPoint:m0]];
        [arr addObject:[NSValue valueWithCGPoint:p1]];
        [arr addObject:[NSValue valueWithCGPoint:m1]];
        [array addObject:arr];
        
        [Core triangular:m1 p1:p2 p2:m2 array:array pointArray:pointArray step:step-1];
        arr = [[NSMutableArray alloc] initWithCapacity:3];
        [arr addObject:[NSValue valueWithCGPoint:m0]];
        [arr addObject:[NSValue valueWithCGPoint:m2]];
        [arr addObject:[NSValue valueWithCGPoint:p0]];
        [array addObject:arr];
         
        [Core triangular:m2 p1:p0 p2:m0 array:array pointArray:pointArray step:step-1];
        arr = [[NSMutableArray alloc] initWithCapacity:3];
        [arr addObject:[NSValue valueWithCGPoint:m1]];
        [arr addObject:[NSValue valueWithCGPoint:p2]];
        [arr addObject:[NSValue valueWithCGPoint:m2]];
        [array addObject:arr];
         
        [Core triangular:m0 p1:m1 p2:m2 array:array pointArray:pointArray step:step-1];
        arr = [[NSMutableArray alloc] initWithCapacity:3];
        [arr addObject:[NSValue valueWithCGPoint:m0]];
        [arr addObject:[NSValue valueWithCGPoint:m1]];
        [arr addObject:[NSValue valueWithCGPoint:m2]];
        [array addObject:arr];
    }
}


//+(void)triangular:(CGPoint)p0 p1:(CGPoint)p1 p2:(CGPoint)p2 array:(NSMutableArray*)array pointArray:(NSMutableArray*)pointArray dict:(NSMutableDictionary*)dict step:(NSInteger)step count:(int[])carr{
//
//    if(step > 0){
//        CGPoint m0 = [Core middlePoint:p0 p1:p1];
//        CGPoint m1 = [Core middlePoint:p1 p1:p2];
//        CGPoint m2 = [Core middlePoint:p2 p1:p0];
//               
//        [pointArray addObject:[NSValue valueWithCGPoint:m0]];
//        [pointArray addObject:[NSValue valueWithCGPoint:m1]];
//        [pointArray addObject:[NSValue valueWithCGPoint:m2]];
//
//        [Core triangular:m0 p1:p1 p2:m1 array:array pointArray:pointArray dict:dict step:step-1 count:carr];
//        NSMutableArray* arr = [[NSMutableArray alloc] initWithCapacity:3];
//        arr = [[NSMutableArray alloc] initWithCapacity:3];
//        [arr addObject:[NSValue valueWithCGPoint:m0]];
//        [arr addObject:[NSValue valueWithCGPoint:p1]];
//        [arr addObject:[NSValue valueWithCGPoint:m1]];
//        [array addObject:arr];
//        NSLog(@"0:f %ld %ld %ld  step[%ld]", carr[0]+1, carr[0]+2, carr[0]+3, step); 
//        carr[0] = carr[0] + 3;
//
//        [Core triangular:m0 p1:m2 p2:p0 array:array pointArray:pointArray dict:dict step:step-1 count:carr];
//        arr = [[NSMutableArray alloc] initWithCapacity:3];
//        [arr addObject:[NSValue valueWithCGPoint:m0]];
//        [arr addObject:[NSValue valueWithCGPoint:m2]];
//        [arr addObject:[NSValue valueWithCGPoint:p0]];
//        [array addObject:arr];
//        NSLog(@"1:f %ld %ld %ld  step[%ld]", carr[0] + 1, carr[0] + 2, carr[0] + 3, step); 
//        carr[0] = carr[0] + 3;
//        //NSLog(@"1:f %ld %ld %ld step[%ld]", 3*step+1, 3*step+3, 3*(step-1) + 1, step);
//        
//        
//        [Core triangular:m1 p1:p2 p2:m2 array:array pointArray:pointArray dict:dict step:step-1 count:carr];
//        arr = [[NSMutableArray alloc] initWithCapacity:3];
//        [arr addObject:[NSValue valueWithCGPoint:m1]];
//        [arr addObject:[NSValue valueWithCGPoint:p2]];
//        [arr addObject:[NSValue valueWithCGPoint:m2]];
//        [array addObject:arr];
//        NSLog(@"2:f %ld %ld %ld  step[%ld]", carr[0] + 1, carr[0] + 2, carr[0] + 3, step); 
//        carr[0] = carr[0] + 3;
//        //NSLog(@"2:f %ld %ld %ld step[%ld]", 3*step+2, 3*(step-1) + 3, 3*step+3, step);
//
//        [Core triangular:m0 p1:m1 p2:m2 array:array pointArray:pointArray dict:dict step:step-1 count:carr];
//        arr = [[NSMutableArray alloc] initWithCapacity:3];
//        [arr addObject:[NSValue valueWithCGPoint:m0]];
//        [arr addObject:[NSValue valueWithCGPoint:m1]];
//        [arr addObject:[NSValue valueWithCGPoint:m2]];
//        [array addObject:arr];
//        NSLog(@"3:f %ld %ld %ld  step[%ld]", carr[0] + 1, carr[0] + 2, carr[0] + 3, step); 
//        carr[0] = carr[0] + 3;
//        //NSLog(@"3:f %ld %ld %ld step[%ld]", 3*step+1, 3*step+2, 3*step+3, step); 
//    }
//}
//
+(void)linearBezierCurve:(CGPoint)p0 p1:(CGPoint)p1 scale:(CGFloat)scale array:(NSMutableArray*)array{
    if([Core comparePoints:p0 p1:p1])
        return;
    CGPoint midPoint = [Core middlePoint:p0 p1:p1];
    if([Core dist:p0 p1:midPoint] > scale){
        [Core linearBezierCurve:p0 p1:midPoint scale:scale array:array];
        [array addObject:[NSValue valueWithCGPoint:midPoint]];
        [Core linearBezierCurve:midPoint p1:p1 scale:scale array:array];
    }
}

+(void)quatricBezierCurve:(CGPoint)p0 p1:(CGPoint)p1 p2:(CGPoint)p2 scale:(CGFloat)scale array:(NSMutableArray*)array{
    if([Core comparePoints:p0 p1:p1] || [Core comparePoints:p1 p1:p2])
        return;

    CGFloat anchorDist = [Core dist:p0 p1:p2];
    CGFloat len0       = [Core dist:p0 p1:p1];
    CGFloat len1       = [Core dist:p1 p1:p2];
    CGFloat diff       = len0 + len1 - anchorDist;
    CGFloat scale_diff       = (len0 + len1) - scale*anchorDist;

//    NSLog(@"scale            = [%.21g]", scale);
//    NSLog(@"len0             = [%.21g]", len0);
//    NSLog(@"len1             = [%.21g]", len1);
//    NSLog(@"len0+len1        = [%.21g]", len0+len1);
//    NSLog(@"anchorDist       = [%.21g]", anchorDist);
//    NSLog(@"scale*anchorDist = [%.21g]", scale*anchorDist);
//    NSLog(@"diff             = [%.21g]", diff);
//    NSLog(@"scale_diff       = [%.21g]", scale_diff);
//    NSLog(@"---------------------------------");

    if(scale*anchorDist <= (len0 + len1)){
        CGPoint lp       = [Core middlePoint:p0 p1:p1];
        CGPoint rp       = [Core middlePoint:p1 p1:p2];
        CGPoint midPoint = [Core middlePoint:lp p1:rp];
        
        [self quatricBezierCurve:p0 p1:lp p2:midPoint scale:scale array:array];
        [array addObject:[NSValue valueWithCGPoint:midPoint]];
        [self quatricBezierCurve:midPoint p1:rp p2:p2 scale:scale array:array];
    }
}

+(CAShapeLayer*)drawCurve:(NSMutableArray*)array layer:(CAShapeLayer*)shapeLayer{
    CGSize size        = [UIScreen mainScreen].bounds.size;
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
    shapeLayer.path        = [path CGPath];
    shapeLayer.strokeColor = [[UIColor brownColor] CGColor];
    shapeLayer.fillColor   = [[UIColor clearColor] CGColor];
    shapeLayer.lineWidth   = 2.0f;
    return shapeLayer;
}

+(CAShapeLayer*)drawRect{
    CGSize size              = [UIScreen mainScreen].bounds.size;
    CGPoint center           = CGPointMake(size.width/2, size.height/2);
    float width              = 100;
    float height             = 100;
    CAShapeLayer* shapeLayer = [CAShapeLayer layer];
    UIBezierPath* path       = [UIBezierPath bezierPath];
    [path moveToPoint:center];
    [path addLineToPoint:CGPointMake(center.x + width, center.y)];
    [path addLineToPoint:CGPointMake(center.x + width, center.y + height)];
    [path addLineToPoint:CGPointMake(center.x, center.y + height)];
    [path closePath];
    shapeLayer.path        = [path CGPath];

    shapeLayer.strokeColor = [[UIColor redColor] CGColor];
    shapeLayer.fillColor   = [[UIColor brownColor] CGColor];
    shapeLayer.lineWidth   = 1.0f;
    return shapeLayer;
}

+(void)printArrayPoint:(NSMutableArray*)array{
    for(int i=0; i<[array count]; i++){
        NSLog(@"[%@]", array[i]);
    }
}

+(void)printSetPoint:(NSMutableSet*)set{
    for(NSValue* point in set){
        NSLog(@"[%@]", point);
    }
}

+(void)mynum:(int[])arr{
    arr[0]++;
}

//+(void)printArrayPoint:(NSMutableArray*)array{
//    NSLog(@"[");
//    for(int i=0; i<[array count]; i++){
//        CGPoint p = [array[i] CGPointValue];
//        NSLog(@"%lf,", p.x);
//    }
//    NSLog(@"]");
//
//    NSLog(@"[");
//    for(int i=0; i<[array count]; i++){
//        CGPoint p = [array[i] CGPointValue];
//        NSLog(@"%lf,", p.y);
//    }
//    NSLog(@"]");
//}


@end


