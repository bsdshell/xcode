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
    CGPoint p2 = CGPointMake(50, 50);
    CGPoint p1 = CGPointMake(300, 50);
    CGPoint p0 = CGPointMake(350, 500);
    NSInteger step = 2;

    NSMutableArray* pointArray = [[NSMutableArray alloc] initWithCapacity:20];

    [pointArray addObject:[NSValue valueWithCGPoint:p0]];
    [pointArray addObject:[NSValue valueWithCGPoint:p1]];
    [pointArray addObject:[NSValue valueWithCGPoint:p2]];

    [Core triangular:p0 p1:p1 p2:p2 array:array pointArray:pointArray step:step];
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
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
