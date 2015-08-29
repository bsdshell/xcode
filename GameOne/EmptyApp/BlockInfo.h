//
//  BlockInfo.h
//  EmptyApp
//
//  Created by cat on 8/25/15.
//  Copyright (c) 2015 myxcode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface BlockInfo : NSObject
{
    CGPoint      _upLeft;
    CAShapeLayer* _shapeLayer;
    CGFloat       _width;
    CGFloat       _height;
    int           _numWidth;
    int           _numHeight;
    int           _indexRow;
    int           _indexCol;
    NSString*     _value;
    unsigned int  _layerIndex;
}

@property (nonatomic, retain) CAShapeLayer* shapeLayer;
@property (nonatomic) CGPoint                upLeft;
@property (nonatomic) CGFloat                width;
@property (nonatomic) CGFloat                height;
@property (nonatomic) int                    numWidth;
@property (nonatomic) int                    numHeight;
@property (nonatomic) int                    indexRow;
@property (nonatomic) int                    indexCol;
@property (nonatomic) NSString*              value;
@property (nonatomic) unsigned int           layerIndex;

-(UILabel*)drawLabel:(CGRect)Rect  text:(NSString*)numStr;

@end
