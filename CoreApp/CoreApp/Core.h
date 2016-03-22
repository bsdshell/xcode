
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#include <CoreGraphics/CGBase.h>
#include <CoreGraphics/CGGeometry.h>
#include <CoreGraphics/CGAffineTransform.h>

#define GRID_NUM_COLOR      3
#define GRIDGRID_WIDTH      3
#define GRIDGRID_HEIGHT     3
#define BLOCKWIDTH          18
#define BLOCKHEIGHT         18
#define GRID_MARGIN_WIDTH   4
#define GRID_MARGIN_HEIGHT  4

#define NUM_BLOCK_WIDTH     4
#define NUM_BLOCK_HEIGHT    4

#define NUM_GRID_WIDTH      4
#define NUM_GRID_HEIGHT     6

#define NUM_SHAPE           8
#define EPSILION            300
#define STACK_SIZE          30
#define DELTA               0.000001

#define OPTION_BUT_HEIGHT   50
#define OPTION_BUT_WIDTH    300


#define MOVE_ZERO           0
#define MOVE_RIGHT          1
#define MOVE_DOWN           2
#define MOVE_LEFT           3
#define MOVE_UP             4
#define MOVE_RIGHT_UP       5
#define MOVE_RIGHT_DOWN     6
#define MOVE_LEFT_UP        7
#define MOVE_LEFT_DOWN      8

#define SELECT_NEW_GAME            1
#define SELECT_RELOAD_GAME         2

#define GRID_HIGH_LIGHT     9
#define COUNT_DOWN          100

#define BLOCK_BLOCKUPLEFT     @"blockUpLeft"
#define BLOCK_SHAPELAYER      @"shapeLayer"
#define BLOCK_STROKECOLORFLAG @"strokeColorFlag"
#define BLOCK_BLOCKCOLORFLAG  @"blockColorFlag"
#define BLOCK_WIDTH           @"width"
#define BLOCK_HEIGHT          @"height"
#define BLOCK_BLOCKHIGHLIGHT  @"blockHighLight"



#define BLOCK_COLOR_ZERO      0
#define BLOCK_COLOR_NON_ZERO  11
#define BLOCK_COLOR_MERGE     13
#define BLOCK_COLOR_STROKE    3

#define COLOR_IMG_BG        @"COLOR_IMG_BG"
#define COLOR_ZERO_KEY      @"COLOR_ZERO_KEY"
#define COLOR_NON_ZERO_KEY  @"COLOR_NON_ZERO_KEY"
#define COLOR_MERGE_KEY     @"COLOR_MERGE_KEY"
#define COLOR_STROKE_KEY    @"COLOR_STROKE_KEY"

#define GRID_SELECT_BOOL    @"GRID_SELECT_BOOL"

#define NEW_GAME            @"newgame"
#define SAVE_GAME           @"savegame"
#define RELOAD_GAME         @"reloadgame"
#define RESUME_GAME         @"resumegame"


#define NSARRAY4D_KEY       @"nsarray4d"
#define GRIDGRIDGRID_KEY    @"gridgridgrid"
#define LEVELCOUNT_KEY      @"levelcount"
#define COUNTDOWN_KEY       @"COUNTDOWN"
#define SCORE_KEY           @"SCORE"

#define HLROW               @"hlrow"
#define HLCOL               @"hlcol"


#define NSARRAYGRIDGRID  @"nsarrayGridGrid"
#define UPLEFTGRIDGRID   @"upLeftGridGrid"
#define NUMGRIDWIDTH     @"numGridWidth"
#define NUMGRIDHEIGHT    @"numGridHeight"
#define GRIDMARGINWIDTH  @"gridMarginWidth"
#define GRIDMARGINHEIGHT @"gridMarginHeight"
#define NSSELECTARRAY    @"nsselectArray"
#define STACK            @"stack"



@interface XColor: NSObject{
    UIColor* _color;
    CGFloat _red;
    CGFloat _green;
    CGFloat _blue;
    CGFloat _alpha;
}
@property(nonatomic)UIColor* color;
@property(nonatomic)CGFloat  red;
@property(nonatomic)CGFloat  green;
@property(nonatomic)CGFloat  blue;
@property(nonatomic)CGFloat  alpha;
@end


@class MyDrawGrid;

@interface Core : NSObject

+(CAShapeLayer*)drawCircle:(CGPoint)location radius:(CGFloat)radius;
+(void)drawCircleToView:(id)view location:(CGPoint)location radius:(CGFloat)radius;
+(CAShapeLayer*)drawRectangle:(CGPoint) location semiWidth:(CGFloat) semiWidth semiHeight:(CGFloat)semiHeight;
+(void)drawRectangleToView:(id)layer location:(CGPoint)location semiWidth:(CGFloat) semiWidth semiHeight:(CGFloat)semiHeight;

// TODO delete it
//+(void)drawOneBlock:(id)view layer:(CAShapeLayer*)shapeLayer blockInfo:(BlockInfo*)blockInfo text:(NSString*)text color:(UIColor*)color;
//+(bool)isLinearBlock:(BlockInfo*)box0 box1:(BlockInfo*)box1 box2:(BlockInfo*)box2;
//+(void)drawBlock:(BlockInfo*)blockInfo color:(UIColor*)color;
//+(void)drawBlock:(id)view blockInfo:(BlockInfo*)blockInfo text:(NSString*)text color:(UIColor*)color;
+(void)drawGrid:(id)view upLeft:(CGPoint)upLeft marginWidth:(CGFloat)marginWidth marginHeight:(CGFloat)marginHeight numCol:(int)numCol numRow:(int)numRow;
+(NSMutableArray*)drawGridArray:(id)view upLeft:(CGPoint)upLeft marginWidth:(CGFloat)marginWidth marginHeight:(CGFloat)marginHeight numCol:(int)numCol numRow:(int)numRow;
+(void)drawOneCircle:(CAShapeLayer*)shapeLayer location:(CGPoint)location radius:(CGFloat)radius;
+(void)printLayerInfo:(CALayer*)layer text:(NSString*)text;




+(int*)generatePrime:(unsigned) n;
+(int*)generateUniqueRandom:(unsigned)low high:(unsigned)high;
//+(void)getCombination:(NSMutableArray*)array data:(NSMutableArray*)data element:(int)n choose:(int)k  length:(int)r subarray:(int[])subarray;
+(void)getCombination:(NSMutableArray*)array data:(NSMutableArray*)data element:(int)n choose:(int)k  length:(int)length subarray:(NSMutableArray*)subarray;
+(bool)isLinear:(int)indexNum1 num2:(int)indexNum2 num3:(int)indexNum3 width:(int)width height:(int)height;
+(NSMutableArray*)getLinearList:(int)numGridWidth numGridHeight:(int)numGridHeight;
//+(CGColorRef)getColorMap:(int)index;
+(CGColorRef)getColorMap:(NSInteger)index;

+(UIColor*)getUIColorMap:(int)index;

+(void)printArray:(int**)array width:(int)width height:(int)height;
+(UIColor*)RGB:(CGFloat)r g:(CGFloat)g b:(CGFloat)b a:(CGFloat)a;
+(CGColorRef)RGBcolorRef:(CGFloat)r g:(CGFloat)g b:(CGFloat)b a:(CGFloat)a;
+(void)getColorComponent:(UIColor*)color component:(int*)component;
+(void)getComponentFromColorRef:(CGColorRef)colorRef components:(CGFloat*)components;
+(NSNumber*)NumInt:(int)num;
+(int)getRow:(int)index width:(int)width;
+(int)getCol:(int)index width:(int)width;
+(double)norm:(CGPoint)p1 point:(CGPoint)p2;
+(double)dist:(CGPoint)p1 point:(CGPoint)p2;
+(BOOL)allOneArray2D:(int**)array col:(NSUInteger)col row:(NSUInteger)row;
+(BOOL)allOneArray2D_NS:(NSMutableArray*)array col:(NSUInteger)col row:(NSUInteger)row;
+(NSMutableArray*)createColRowArray:(NSUInteger)col row:(NSUInteger)row;
+(int**)allocate2d:(int)height width:(int)width;
+(void)dellocate2d:(int)height width:(int)width array:(int**)array;
+(bool)compareDouble:(double)d1 second:(double)d2;
+(bool)isSamePoint:(CGPoint)p1 point:(CGPoint)p2;
+(bool)isClosedZero:(double)d;
+(int)moveDirection:(CGPoint)initPoint current:(CGPoint)currPoint;
+(CGPoint)addPoints:(CGPoint)p1 point:(CGPoint)p2;
+(CGPoint)subPoints:(CGPoint)p1 point:(CGPoint)p2;
+(CGPoint)vector:(CGPoint)p1 point:(CGPoint)p2;
+(bool)equalPoints:(CGPoint)p1 point:(CGPoint)p2;
+(bool)isEqualArray:(NSMutableArray*)arr1 array:(NSMutableArray*)arr2;
+(void)swapGrid:(MyDrawGrid* __strong*)grid1 grid:(MyDrawGrid* __strong*)grid2;
+(void)printMatrix:(CGAffineTransform) m;
+(CGAffineTransform)rotateCenter:(CGAffineTransform)matrix center:(CGPoint)center;
+(NSMutableArray*)geneUniqueRandomMutable:(unsigned)low high:(unsigned)high;
+(int**)generateUniqueRandom2D:(unsigned)height width:(unsigned)width;
+(bool)isSquareNumber:(int)num;
+(bool)isUniqueArray:(int*)array length:(NSUInteger)length;
+(bool)isUniqueArray2d:(int**)array2d height:(NSUInteger)height width:(NSUInteger)width;
+(int)arrayMin:(int*)array length:(NSUInteger)length;
+(int)arrayMax:(int*)array length:(NSUInteger)length;
+(int*)arrayToArray2D:(int**)array2d height:(unsigned)height width:(unsigned)width;
+(int)array2DMin:(int**)array height:(NSUInteger)height width:(NSUInteger)width;
+(int)array2DMax:(int**)array height:(NSUInteger)height width:(NSUInteger)width;
+(int**)randomBinaryBlock2D:(unsigned)height width:(unsigned)width;
+(NSMutableArray*)randomBinaryBlock2D_NS:(int)height width:(int)width;
+(NSMutableArray*)difficulty:(int)height width:(int)width  count:(int)count;
+(int)sumConnection:(NSMutableArray*)array2d height:(int)height width:(int)width;
+(NSMutableArray*)convert3dto4d:(NSMutableArray*)array3d numGridHeight:(unsigned)numGridHeight numGridWidth:(unsigned)numGridWidth;


+(int)countConnection:(NSMutableArray*) array2d height:(int)height width:(int)width h:(int)h w:(int)w;

+(void)print2DArray:(int**)array width:(int)width height:(int)height;
+(void)printGrid_NS:(NSMutableArray*)array2d width:(int)width height:(int)height;
+(void)print2DNSArray_NS:(NSMutableArray*)array2d width:(int)width height:(int)height;


+(int**)invertBinaryBlock2D:(int**)array2d height:(unsigned)height width:(unsigned)width;
+(NSMutableArray*)invertBinaryBlock2D_NS:(NSMutableArray*)nsarray2d height:(unsigned)height width:(unsigned)width;

+(bool)match:(int**)array1 array:(int**)array2 height:(unsigned)height width:(unsigned)width;
+(int***)allocate3d:(int)depth height:(int)height width:(int)width;
+(void)deallocate3d:(int)depth height:(int)height width:(int)width array:(int***)array3d;
+(int)arrayMaxMutable:(NSMutableArray*)array;
+(int)arrayMinMutable:(NSMutableArray*)array;
+(int***)listMatchBlock2D:(unsigned)numGridHeight numGridWidth:(unsigned)numGridWidth numBlockHeight:(unsigned)numBlockHeight numBlockWidth:(unsigned)numBlockWidth level:(int)level;



+(NSMutableArray*)listMatchBlock2D_NS:(unsigned)numGridHeight numGridWidth:(unsigned)numGridWidth numBlockHeight:(unsigned)numBlockHeight numBlockWidth:(unsigned)numBlockWidth level:(int)level;


+(int)gridShape:(NSUInteger)index col:(NSUInteger)col row:(NSUInteger)row array:(int***)array;
+(void)randomIndex:(int***)array3d numGridHeight:(unsigned)numGridHeight numGridWidth:(unsigned)numGridWidth;
+(void)randomIndex_NS:(NSMutableArray*)array3d numGridHeight:(unsigned)numGridHeight numGridWidth:(unsigned)numGridWidth;


+(NSMutableArray*)randomTwoNumbers:(unsigned)low high:(unsigned)high;
+(void)Button:(UIView*)view targe:(id)targe selector:(SEL)selector;
+(void)Button:(UIView*)view text:(NSString*)text targe:(id)targe selector:(SEL)selector;

+(void)Label:(UIView*)view text:(NSString*)text;
+(void)GameInfoTextField:(UIView*)view text1:(NSString*)text1 text2:(NSString*)text2 text3:(NSString*)text3 text4:(NSString*)text4;
+(void)LabelList:(UIView*)view;
+(UIColor*__strong*)allColor;
+(NSMutableArray*)allXColor;
+(void)drawLabel:(id)view rect:(CGRect)rect text:(NSString*)text;
+(CAShapeLayer*)CartesianCoordinate;
+(CAShapeLayer*)verticalLine:(NSInteger)offset;
+(void)printCATransform3D:(CATransform3D)transform;
@end
