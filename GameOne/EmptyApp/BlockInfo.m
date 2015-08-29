//
//  BlockInfo.m
//  EmptyApp
//
//  Created by cat on 8/25/15.
//  Copyright (c) 2015 myxcode. All rights reserved.
//

#import "BlockInfo.h"

@interface BlockInfo ()

@end

@implementation BlockInfo

@synthesize shapeLayer = _shapeLayer;
@synthesize upLeft     = _upLeft;
@synthesize numWidth   = _numWidth;
@synthesize numHeight  = _numHeight;
@synthesize indexRow   = _indexRow;
@synthesize indexCol   = _indexCol;
@synthesize value      = _value;
@synthesize layerIndex = _layerIndex;

-(UILabel*)drawLabel:(CGRect)Rect text:(NSString*) text{
    // create simple text label
    UILabel *myLabel = [[UILabel alloc] initWithFrame:Rect];
    [myLabel setTextColor:[UIColor whiteColor]];
    [myLabel setBackgroundColor:[UIColor clearColor]];
    [myLabel setFont:[UIFont fontWithName: @"Trebuchet MS" size: 20.0f]];
    [myLabel setText:text];
    return  myLabel;
}

@end
