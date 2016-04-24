//
//  ViewController.m
//  CoreApp
//
//  Created by cat on 3/16/16.
//  Copyright (c) 2016 myxcode. All rights reserved.
//r

#import "ViewController.h"
#import "Core.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableArray* array = [[NSMutableArray alloc] initWithCapacity:20];
    self.view.backgroundColor = [UIColor whiteColor];
    CGPoint p0 = CGPointMake(350, 500);
    CGPoint p1 = CGPointMake(300, 50);
    CGPoint p2 = CGPointMake(50, 50);
    NSInteger step = 2;

    NSMutableArray* pointArray = [[NSMutableArray alloc] initWithCapacity:20];

    [pointArray addObject:[NSValue valueWithCGPoint:p0]];
    [pointArray addObject:[NSValue valueWithCGPoint:p1]];
    [pointArray addObject:[NSValue valueWithCGPoint:p2]];

    NSMutableDictionary* dict = [[NSMutableDictionary alloc]init];
    int carr[] = {0};
    //[Core triangular:p0 p1:p1 p2:p2 array:array pointArray:pointArray dict:dict step:step count:arr];
    [Core triangular:p0 p1:p1 p2:p2 array:array pointArray:pointArray dict:dict step:step];
    [Core printArrayPoint:array];

    for(NSValue* point in pointArray){
        NSLog(@"v %f %f %f", [point CGPointValue].x, [point CGPointValue].y, 0);
    }

    
    if([array count] > 1){
        for(int k=0; k<[array count]; k++){
        //for(int k=0; k<4; k++){
            CAShapeLayer* shapeLayer = [CAShapeLayer layer];
            UIBezierPath* path = [UIBezierPath bezierPath];
            if(k % 3 == 0){
                shapeLayer.strokeColor = [[UIColor brownColor] CGColor];
            }
            else if( k % 3 == 1){
                shapeLayer.strokeColor = [[UIColor blueColor] CGColor];
            }
            else if( k % 3 == 2){ 
                shapeLayer.strokeColor = [[UIColor redColor] CGColor];
            }

            shapeLayer.lineWidth   = 1.0f;
            shapeLayer.fillColor   = [[UIColor clearColor] CGColor];

            NSMutableArray* arr =  array[k];
            CGPoint point0 = [arr[0] CGPointValue];
            [path moveToPoint:point0];
            for(int i=1; i<[arr count]; i++){
                [path addLineToPoint:[arr[i] CGPointValue]];
            }
            [path closePath];
            //[path addLineToPoint:[arr[0] CGPointValue]];

            shapeLayer.path = [path CGPath];

            [self.view.layer addSublayer:shapeLayer];
        }
    }else{
        NSLog(@"Need two points or more"); 
    }
    

//    NSMutableArray* listPoints = [[NSMutableArray alloc]initWithObjects:
//                            [NSValue valueWithCGPoint:CGPointMake(350.000000,   500.000000)],
//                            [NSValue valueWithCGPoint:CGPointMake(300.000000,   50.000000)],
//                            [NSValue valueWithCGPoint:CGPointMake(50.000000,    50.000000)],
//                            [NSValue valueWithCGPoint:CGPointMake(325.000000,   275.000000)],
//                            [NSValue valueWithCGPoint:CGPointMake(175.000000,   50.000000)],
//                            [NSValue valueWithCGPoint:CGPointMake(200.000000,   275.000000)],
//                            [NSValue valueWithCGPoint:CGPointMake(250.000000,   162.500000)],
//                            [NSValue valueWithCGPoint:CGPointMake(237.500000,   50.000000)],
//                            [NSValue valueWithCGPoint:CGPointMake(312.500000,   162.500000)],
//                            [NSValue valueWithCGPoint:CGPointMake(337.500000,   387.500000)],
//                            [NSValue valueWithCGPoint:CGPointMake(275.000000,   387.500000)],
//                            [NSValue valueWithCGPoint:CGPointMake(262.500000,   275.000000)],
//                            [NSValue valueWithCGPoint:CGPointMake(187.500000,   162.500000)],
//                            [NSValue valueWithCGPoint:CGPointMake(125.000000,   162.500000)],
//                            [NSValue valueWithCGPoint:CGPointMake(112.500000,   50.000000)],
////                            [NSValue valueWithCGPoint:CGPointMake(250.000000,   162.500000)],
////                            [NSValue valueWithCGPoint:CGPointMake(187.500000,   162.500000)],
////                            [NSValue valueWithCGPoint:CGPointMake(262.500000,   275.000000)],
//                            nil];
//
    [self.view.layer addSublayer:[Core drawListCircles:pointArray]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
