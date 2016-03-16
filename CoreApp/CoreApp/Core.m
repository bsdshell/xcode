#import "Core.h"
#import <UIKit/UIKit.h>
#import "AppDelegate.h"

#define LEN_RED     10 
#define LEN_GREEN   10
#define LEN_BLUE    10
#define LEN_ALPHA   10

@implementation XColor 

@synthesize color = _color;
@synthesize red   = _red;
@synthesize green = _green;
@synthesize blue  = _blue;
@synthesize alpha = _alpha;

@end

@implementation Core

+(BOOL)allOneArray2D:(int**)array col:(NSUInteger)col row:(NSUInteger)row{
    for(int i=0; i<col; i++){
        for(int j=0; j<row; j++)
            if(array[i][j] != 1)
                return false;
    }
    return true;
}



+(bool)isEqualArray:(NSMutableArray*)arr1 array:(NSMutableArray*)arr2{
    if([arr1 count] == [arr2 count]){
        for(int i=0; i<[arr1 count]; i++){
            if([[arr1 objectAtIndex:i] integerValue] != [[arr2 objectAtIndex:i] integerValue])
                return false;
        }
    }
    return true;
}

+(bool)equalPoints:(CGPoint)p1 point:(CGPoint)p2{
    return p1.x == p2.x && p1.y == p2.y;
}

// TODO: Need to fix the vector issue
+(CGPoint)subPoints:(CGPoint)p1 point:(CGPoint)p2{
    return CGPointMake(p1.x - p2.x, p1.y - p2.y);
}

+(CGPoint)vector:(CGPoint)p1 point:(CGPoint)p2{
    return CGPointMake(p2.x - p1.x, p2.y - p1.y);
}

+(CGPoint)addPoints:(CGPoint)p1 point:(CGPoint)p2{
    return CGPointMake(p1.x + p2.x, p1.y + p2.y);
}

+(double)norm:(CGPoint)p1 point:(CGPoint)p2{
    return pow(abs(p1.x - p2.x), 2.0) + pow(abs(p1.y - p2.y), 2.0);
}

+(double)dist:(CGPoint)p1 point:(CGPoint)p2{
    return sqrt([Core norm:p1 point:p2]);
}

// draw static circle
+(CAShapeLayer*)drawCircle:(CGPoint)location radius:(CGFloat)radius {
    CAShapeLayer* shapeLayer = [CAShapeLayer layer];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:location
                    radius:radius
                startAngle:0.0
                  endAngle:M_PI * 2.0
                 clockwise:YES];
    
    shapeLayer.path = [path CGPath];
    shapeLayer.strokeColor = [[UIColor brownColor] CGColor];
    shapeLayer.fillColor = [[UIColor yellowColor] CGColor];
    shapeLayer.lineWidth = 1.0;
    return shapeLayer;
}

// draw moving circle
+(void)drawOneCircle:(CAShapeLayer*)shapeLayer location:(CGPoint)location radius:(CGFloat)radius {
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:location
                    radius:radius
                startAngle:0.0
                  endAngle:M_PI * 2.0
                 clockwise:YES];
    
    shapeLayer.path = [path CGPath];
    shapeLayer.strokeColor = [[UIColor brownColor] CGColor];
    shapeLayer.fillColor = [[UIColor yellowColor] CGColor];
    shapeLayer.lineWidth = 1.0;
}


// draw circle on the a given view
+(void)drawCircleToView:(id)layer location:(CGPoint)location radius:(CGFloat)radius {
    CAShapeLayer* shapeLayer = [CAShapeLayer layer];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:location
                    radius:radius
                startAngle:0.0
                  endAngle:M_PI * 2.0
                 clockwise:YES];
    
    shapeLayer.path = [path CGPath];
    shapeLayer.strokeColor = [[UIColor brownColor] CGColor];
    shapeLayer.fillColor = [[UIColor yellowColor] CGColor];
    shapeLayer.lineWidth = 1.0;
    [layer addSublayer:shapeLayer];
}

// draw rectangle and return CAShaperLayer
-(CAShapeLayer*)drawRectangle:(CGPoint) location semiWidth:(CGFloat) semiWidth semiHeight:(CGFloat)semiHeight{
    CAShapeLayer* shapeLayer = [CAShapeLayer layer];
    UIBezierPath* path = [UIBezierPath bezierPath];
    
    // start point
    [path moveToPoint:CGPointMake(location.x - semiWidth, location.y - semiHeight)];
    
    // draw lines
    [path addLineToPoint:CGPointMake(location.x + semiWidth, location.y - semiHeight)];
    [path addLineToPoint:CGPointMake(location.x + semiWidth, location.y + semiHeight)];
    [path addLineToPoint:CGPointMake(location.x - semiWidth, location.y + semiHeight)];
    [path addLineToPoint:CGPointMake(location.x - semiWidth, location.y - semiHeight)];
    //[path closePath];
    
    shapeLayer.path = [path CGPath];
    
    shapeLayer.strokeColor = [[UIColor yellowColor] CGColor];
    shapeLayer.fillColor = [[UIColor blackColor] CGColor];
    shapeLayer.lineWidth = 1.0;
    return shapeLayer;
}

// draw rectangle to a given view
+(void)drawRectangleToView:(id)layer location:(CGPoint)location semiWidth:(CGFloat) semiWidth semiHeight:(CGFloat)semiHeight{
    CAShapeLayer* shapeLayer = [CAShapeLayer layer];
    UIBezierPath* path = [UIBezierPath bezierPath];
    
    // start point
    [path moveToPoint:CGPointMake(location.x - semiWidth, location.y - semiHeight)];
    
    // draw lines
    [path addLineToPoint:CGPointMake(location.x + semiWidth, location.y - semiHeight)];
    [path addLineToPoint:CGPointMake(location.x + semiWidth, location.y + semiHeight)];
    [path addLineToPoint:CGPointMake(location.x - semiWidth, location.y + semiHeight)];
    [path addLineToPoint:CGPointMake(location.x - semiWidth, location.y - semiHeight)];
    //[path closePath];
    
    shapeLayer.path = [path CGPath];
    
    shapeLayer.strokeColor = [[UIColor yellowColor] CGColor];
    shapeLayer.fillColor = [[UIColor blackColor] CGColor];
    shapeLayer.lineWidth = 1.0;
    [layer addSublayer:shapeLayer];
}


+(int*)generatePrime:(unsigned)n{
    int* array =(int*)malloc(sizeof(int)*n);
    if(n > 0)
    array[0] = 2;

    int count = 1;
    int prime = 3;
    while(count < n){
        bool isPrime = true;
        for(int i = 2; i < prime && isPrime; i++){
            if(prime % i == 0)
                isPrime = false;
        }
        if(isPrime){
            array[count] = prime;
            count++;
        }
        prime++;
    }
    return array;
}

+(bool)isSquareNumber:(int)num{
    int n = (int)sqrt(num) + 0.5;
    return n*n == num;
}

+(bool)isUniqueArray:(int*)array length:(NSUInteger)length{
    NSMutableSet* set = [NSMutableSet setWithCapacity:length];

    for(int i=0; i<length; i++){
        if(![set containsObject:@(array[i])]){
            [set addObject:@(array[i])];
        }else{
            return false;
        }
    }
    return true;
}

+(bool)isUniqueArray2d:(int**)array2d height:(NSUInteger)height width:(NSUInteger)width{
    NSUInteger len = height*width;
    NSMutableSet* set = [NSMutableSet setWithCapacity:len];
    
    for(int c=0; c<height; c++){
        for(int r=0; r<width; r++){
            if(![set containsObject:@(array2d[c][r])]){
                [set addObject:@(array2d[c][r])];
            }else{
                return false;
            }
        }
    }
    return true;
}

+(int)arrayMin:(int*)array length:(NSUInteger)length{
    int min = INT_MAX;
    for(int i=0; i<length; i++){
        if(array[i] < min)
            min = array[i];
    }
    return min;
}

+(int)array2DMax:(int**)array height:(NSUInteger)height width:(NSUInteger)width{ 
    int max = INT_MIN;
    for(int i=0; i<height; i++){ 
        for(int j=0; j<width; j++){
            if(array[i][j] > max)
                max = array[i][j];
        }
    }
    return max;
}


+(int)array2DMin:(int**)array height:(NSUInteger)height width:(NSUInteger)width{ 
    int min = INT_MAX;
    for(int i=0; i<height; i++){ 
        for(int j=0; j<width; j++){
            if(array[i][j] < min)
                min = array[i][j];
        }
    }
    return min;
}

+(int)arrayMax:(int*)array length:(NSUInteger)length{
    int max = INT_MIN;
    for(int i=0; i<length; i++){
        if(array[i] > max)
            max = array[i];
    }
    return max;
}

+(int)arrayMinMutable:(NSMutableArray*)array{
    int min = INT_MAX;
    for(id item in array){
        if([item integerValue] < min)
            min = [item integerValue];
    }
    return min;
}

+(int)arrayMaxMutable:(NSMutableArray*)array{
    int max = INT_MIN;
    for(id item in array){
        if([item integerValue] > max)
            max = [item integerValue];
    }
    return max;
}

// generate unique random number from high to low inclusively
+(NSMutableArray*)geneUniqueRandomMutable:(unsigned)low high:(unsigned)high{
    int len = high - low + 1;
    NSMutableArray* array = [NSMutableArray arrayWithCapacity:len];
    for(int i=0; i<len; i++){
        [array addObject:@(i + low)];
    }
    
    for(int i=0; i <len; i++){
        unsigned r = arc4random_uniform(len-i);
        id tmp = [array objectAtIndex:r];
        [array setObject:[array objectAtIndex:len-1-i] atIndexedSubscript:r];
        [array setObject:tmp atIndexedSubscript:len-1-i];
    }
    return array;
}

// generate unique random number from high to low in 2D array inclusively
+(int**)generateUniqueRandom2D:(unsigned)height width:(unsigned)width{
    int low = 0;
    int hight = height*width-1;
    int* array = [Core generateUniqueRandom:low high:hight];
    
    int** array2d = (int**)calloc(height, sizeof(int*));
    for(int c=0; c<height; c++){
        array2d[c] = (int*)calloc(width, sizeof(int));
    }
    
    for(int i=low; i<=hight; i++){
        int c = i/height;
        int r = i%height;
        array2d[c][r] = array[i];
    }
    return array2d;
}


+(NSMutableArray*)listMatchBlock2D_NS:(unsigned)numGridHeight numGridWidth:(unsigned)numGridWidth numBlockHeight:(unsigned)numBlockHeight numBlockWidth:(unsigned)numBlockWidth level:(int)level{
    unsigned depth = numGridHeight*numGridWidth;
    assert(depth%2 == 0);
    
    int numRotation = level;
    NSMutableArray* nsarray3d = [NSMutableArray arrayWithCapacity:10];
    
    NSMutableArray* tmpArray = [Core difficulty:numBlockHeight width:numBlockWidth count:level-1];
    long quotietion = [tmpArray[0] integerValue];
    long reminder = [tmpArray[1] integerValue];
    
    int count = 0;
    int currConnection = 0;
    int prevConnection = 0;
    while(currConnection + prevConnection < depth/2){
        NSMutableArray* array2d = [Core randomBinaryBlock2D_NS:numBlockHeight width:numBlockWidth];
        NSMutableArray* invertArray2d = [Core invertBinaryBlock2D_NS:array2d height:numBlockHeight width:numBlockWidth];
        int invertSum = [Core sumConnection:invertArray2d height:numBlockHeight width:numBlockWidth];
        
        int sum = [Core sumConnection:array2d height:numBlockWidth width:numBlockWidth];
        if(reminder == 0){
            if(sum == quotietion - 1 && invertSum <= sum + 1){
                [nsarray3d addObject:array2d];
                [nsarray3d addObject:invertArray2d];
                prevConnection++;
                [Core print2DNSArray_NS:array2d width:numBlockWidth height:numBlockHeight];
                printf("\n");
                [Core print2DNSArray_NS:invertArray2d width:numBlockWidth height:numBlockHeight];
                printf("\n\n");                
            }
        }else{
            if(currConnection < reminder && sum == quotietion && invertSum <= sum + 1){
                [nsarray3d addObject:array2d];
                [nsarray3d addObject:invertArray2d];
                currConnection++;
                
                [Core print2DNSArray_NS:array2d width:numBlockWidth height:numBlockHeight];
                printf("\n");
                [Core print2DNSArray_NS:invertArray2d width:numBlockWidth height:numBlockHeight];
                printf("\n\n");
                
            }else if(prevConnection < (depth/2 - reminder) && sum == quotietion - 1 && invertSum <= sum + 1){
                [nsarray3d addObject:array2d];
                [nsarray3d addObject:invertArray2d];
                
                prevConnection++;
                
                [Core print2DNSArray_NS:array2d width:numBlockWidth height:numBlockHeight];
                printf("\n");
                [Core print2DNSArray_NS:invertArray2d width:numBlockWidth height:numBlockHeight];
                printf("\n\n");
            }
        }
    }
    return nsarray3d;
}



+(NSMutableArray*)gridBlock:(int)height width:(int)width{
    NSMutableArray* array2d = [[NSMutableArray alloc]initWithCapacity:height];
    NSMutableArray* array = [[NSMutableArray alloc]initWithCapacity:width];
    for(int i=0; i<width; i++){
        for(int j=0; j<height; j++){ 
          array[j] = @(1);
        }
        array2d[i] = array;
    }
    return array2d;
}

+(void)rotateGridIndex:(int***)array3d numGridHeight:(unsigned)numGridHeight numGridWidth:(unsigned)numGridWidth level:level{
    int depth = numGridHeight*numGridWidth;
    assert(depth%2 == 0);
    for(int i=0; i<depth/2; i++){
        
    }
}

+(void)randomGridIndex:(int***)array3d numGridHeight:(unsigned)numGridHeight numGridWidth:(unsigned)numGridWidth level:level{
    int depth = numGridHeight*numGridWidth;
    int offset = 2;
    int len = depth - offset;

    for(int i=0; i<len/2; i++){
        
    }
    for(int i=0; i<len; i++){
         unsigned r = arc4random_uniform(len-i);
         int** tmp = array3d[r];
         array3d[r] = array3d[len-1-i];
         array3d[len-1-i] = tmp;
    }
}

// random grid index from [0]-[len-1-offset]
+(void)randomIndex_NS:(NSMutableArray*)array3d numGridHeight:(unsigned)numGridHeight numGridWidth:(unsigned)numGridWidth{
    int depth = numGridHeight*numGridWidth;
    int offset = 2;
    int len = depth - offset;
    for(int i=0; i<len; i++){
        unsigned r = arc4random_uniform(len-i);
        id tmp = array3d[r];
        array3d[r] = array3d[len-1-i];
        array3d[len-1-i] = tmp;
    }
}

+(NSMutableArray*)convert3dto4d:(NSMutableArray*)array3d numGridHeight:(unsigned)numGridHeight numGridWidth:(unsigned)numGridWidth{
    NSMutableArray* array4d = [[NSMutableArray alloc] initWithCapacity:1];

    NSMutableArray* array = [[NSMutableArray alloc]initWithCapacity:1];
    for(int i=0; i<[array3d count]; i++){
        [array addObject:array3d[i]];
        if((i + 1) % numGridWidth == 0){
            [array4d addObject:array];
            array = [[NSMutableArray alloc]initWithCapacity:1];
        }
    }
    return array4d;
}

// random grid index from [0]-[len-1-offset]
+(void)randomIndex:(int***)array3d numGridHeight:(unsigned)numGridHeight numGridWidth:(unsigned)numGridWidth{
    int depth = numGridHeight*numGridWidth;
    int offset = 2;
    int len = depth - offset;
    for(int i=0; i<len; i++){
         unsigned r = arc4random_uniform(len-i);
         int** tmp = array3d[r];
         array3d[r] = array3d[len-1-i];
         array3d[len-1-i] = tmp;
    }
}

+(bool)match:(int**)array1 array:(int**)array2 height:(unsigned)height width:(unsigned)width{
    bool ret = true;
    int** array = [Core allocate2d:height width:width];
    for(int c=0; c<height; c++){ 
        for(int r=0; r<width; r++){
            array[c][r] = array1[c][r] ^ array2[c][r];
        }
    } 
    for(int c=0; c<height && ret; c++){ 
        for(int r=0; r<width && ret; r++){
            if(array[c][r] == 0)
                ret = false;;
        }
    } 
    [Core dellocate2d:height width:width array:array];
    return ret;
}


//+(NSMutableArray*)invertBinaryBlock2D_NS:(NSMutableArray*)nsarray2d height:(unsigned)height width:(unsigned)width{
//    NSMutableArray* invertArray2d = [NSMutableArray arrayWithCapacity:1];
//    for(int c=0; c<height; c++){
//        NSMutableArray* array = [NSMutableArray arrayWithCapacity:1];
//        for(int r=0; r<width; r++){
//            //invertArray2d[c][r] = nsarray2d[c][r]? 0 : 1;
//            [array addObject:[nsarray2d[c][r] integerValue] == 1 ? @(0) : @(1)];
//        }
//        [invertArray2d addObject:array];
//    }
//    return invertArray2d;
//}

+(int**)invertBinaryBlock2D:(int**)array2d height:(unsigned)height width:(unsigned)width{
    int** invertArray2d  = [Core allocate2d:height width:width]; 
    for(int c=0; c<height; c++){ 
        for(int r=0; r<width; r++){
            invertArray2d[c][r] = array2d[c][r]? 0 : 1;
        }
    } 
    return invertArray2d;
}

+(int**)randomBinaryBlock2D:(unsigned)height width:(unsigned)width{
    int** array2d = [Core allocate2d:height width:width];
    for(int c=0; c<height; c++){ 
        for(int r=0; r<width; r++){
            array2d[c][r] = arc4random_uniform(2);
        }
    } 
    return array2d;
}

+(NSMutableArray*)difficulty:(int)height width:(int)width  count:(int)count{
    int mod = height*width/2;
    int quotient =  count/mod + 2;
    int reminder = count % mod;
    NSMutableArray* array = [NSMutableArray arrayWithCapacity:1];
    [array addObject:@(quotient)];
    [array addObject:@(reminder)];
    return array;
}

//+(int)countConnection:(NSMutableArray*) array2d height:(int)height width:(int)width h:(int)h w:(int)w{
//    int c0 = 0;
//    int c1 = 0;
//    int c2 = 0;
//    int c3 = 0;
//    int c4 = 0;
//    
//    if([array2d[h][w] integerValue] == 1){
//        c4 = 1;
//        array2d[h][w] = @(3);
//        if(h + 1 < height){
//            c0 = [Core countConnection:array2d height:height width:width h:h+1 w:w];
//        }
//        if(h-1 >= 0){
//            c1 = [Core countConnection:array2d height:height width:width h:h-1 w:w];
//        }
//        if(w+1 < width){
//            c2 = [Core countConnection:array2d height:height width:width h:h w:w+1];
//        }
//        if(w-1 >= 0){
//            c3 = [Core countConnection:array2d height:height width:width h:h w:w-1];
//        }
//    }
//    return c0 + c1 + c2 + c3 + c4;
//}

+(int)sumConnection:(NSMutableArray*)array2d height:(int)height width:(int)width{
    NSMutableArray* tmpArray2d = [NSMutableArray arrayWithCapacity:1];
    for(int c=0; c<height; c++){
        NSMutableArray* tmpArray = [NSMutableArray arrayWithCapacity:1];
        for(int r=0; r<width; r++){
            [tmpArray addObject:array2d[c][r]];
        }
        [tmpArray2d addObject:tmpArray];
    }
    
    int numComponent = 0;
    for(int h=0; h<height; h++){
        for(int w=0; w<width; w++){
            int count = [Core countConnection:tmpArray2d height:(unsigned)[tmpArray2d count] width:(unsigned)[tmpArray2d[0] count] h:h w:w];
            if (count > 0) {
                numComponent++;
            }
        }
    }
    return numComponent;
}



+(int*)arrayToArray2D:(int**)array2d height:(unsigned)height width:(unsigned)width{
    int len = height*width;
    int* array = (int*)malloc(len*sizeof(int));
    for(int i=0; i<height; i++){ 
        for(int j=0; j<width; j++){
            int index = i*height + j;
            array[index] = array2d[i][j];
        }
    }
    return array;
}

// generate unique random number from high to low inclusively
+(int*)generateUniqueRandom:(unsigned)low high:(unsigned)high{
   int len = high - low + 1; 

   int* array = (int*)malloc(sizeof(int)*(len)); 
   for(int i=0; i<len; i++)
       array[i] = i;
    
   for(int i=0; i <len; i++){
         unsigned r = arc4random_uniform(len-i);
         NSLog(@"r=[%d]", r);   
         int tmp = array[r];
         array[r] = array[len-1-i];
         array[len-1-i] = tmp;
   }
   for(int i=0; i< len; i++)
       NSLog(@"array[%d]=[%d]", i, array[i]);   
   return array;
}

+(void)getCombination:(NSMutableArray*)array data:(NSMutableArray*)data element:(int)n choose:(int)k  length:(int)length subarray:(NSMutableArray*)subarray{
    if(k < 0 || k > n)
        return;
    if(n == k && k == 0){
        NSMutableArray* buf = [[NSMutableArray alloc]init];
        for(int i=1; i<=length; i++){
            [buf addObject:subarray[i]];
        }
        [data addObject:buf];
        NSLog(@"");
    }else{
        
        subarray[k] = [array objectAtIndex:n];
        [self getCombination:array data:data element:n-1 choose:k-1 length:length subarray:subarray];
        [self getCombination:array data:data element:n-1 choose:k length:length subarray:subarray];
    }
}

+(NSMutableArray*)getLinearList:(int)numGridWidth numGridHeight:(int)numGridHeight{
    int width = numGridWidth;
    int height = numGridHeight;
    int n = width*height;
    int k = 3;
    int length = 3;
    NSMutableArray* subarray = [[NSMutableArray alloc]initWithCapacity:1];
    NSMutableArray* array  = [NSMutableArray arrayWithCapacity:n+1];
    NSMutableArray* data = [NSMutableArray arrayWithCapacity:10];
    NSMutableArray* listList   = [[NSMutableArray alloc] initWithCapacity:50];
    
    for(int i=0; i<n+1; i++){
        NSNumber* num = [NSNumber numberWithInt:i-1];
        [array addObject:num];
    }
    
    [Core getCombination:array data:data element:n  choose:k length:length subarray:subarray];
    
    for(NSMutableArray* list in data){
        if([Core isLinear:[[list objectAtIndex:0] intValue] num2:[[list objectAtIndex:1] intValue] num3:[[list objectAtIndex:2]intValue] width:width height:height]){
            NSLog(@"->[%@ %@ %@]", [list objectAtIndex:0], [list objectAtIndex:1], [list objectAtIndex:2]);
            [listList addObject:list];
        }
    }
    return listList;
}

+(bool)isLinear:(int)indexNum1 num2:(int)indexNum2 num3:(int)indexNum3 width:(int)width height:(int)height{
    
    int indexCol1 = indexNum1 / width;
    int indexRow1 = indexNum1 % width;
    
    int indexCol2 = indexNum2 / width;
    int indexRow2 = indexNum2 % width;
    
    int indexCol3 = indexNum3 / width;
    int indexRow3 = indexNum3 % width;

    if(
       (indexRow1 == indexRow2  && indexCol1 == indexCol2) ||
       (indexRow2 == indexRow3  && indexCol2 == indexCol3) ||
       (indexRow1 == indexRow3  && indexCol1 == indexCol3)
       ){
        return false;
    }
    else{
        if(((abs(indexRow1 == indexRow2) && abs(indexRow2 == indexRow3)) ||
            (abs(indexCol1 == indexCol2) && abs(indexCol2 == indexCol3))) ||
           
           (abs(indexRow1 - indexRow2) == abs(indexCol1 - indexCol2) &&
            abs(indexRow2 - indexRow3) == abs(indexCol2 - indexCol3) &&
            abs(indexRow1 - indexRow3) == abs(indexCol1 - indexCol3))
           ) {
            return true;
        }
        return false;
    }
}

+(void)drawLabelInit:(id)view rect:(CGRect)rect int:(int)value{
    // create simple text label
    UILabel* label = [[UILabel alloc] initWithFrame:rect];
    [label setTextColor:[UIColor brownColor]];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont fontWithName: @"Trebuchet MS" size: 20.0f]];
    
    NSString* textValue;
    if(value < 10)
        textValue = [NSString stringWithFormat:@"   %d   ", value];
    else
        textValue = [NSString stringWithFormat:@"  %d  ", value];
    
    [label setText:textValue];
    [view addSubview:label];
}


+(void)drawLabel:(id)view rect:(CGRect)rect text:(NSString*)text{
    // create simple text label
    UILabel* label = [[UILabel alloc] initWithFrame:rect];
    [label setTextColor:[UIColor brownColor]];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont fontWithName: @"Trebuchet MS" size: 20.0f]];
    
    [label setText:text];
    [view addSubview:label];
}

+(void)rotate90ClockWise_NS:(int const)width array:(NSMutableArray*)array{
    int w = width;
    for(int i=0; i<w/2; i++)
    {
        for(int j=i; j<w-1-i; j++)
        {
            id tmp = array[i][j];
            array[i][j] = array[w-1-j][i];
            array[w-1-j][i] = array[w-1-i][w-1-j];
            array[w-1-i][w-1-j] = array[j][w-1-i];
            array[j][w-1-i] = tmp;
        }
    }
}

+(void)rotate90ClockWise:(int const)width array:(int**)array{
    int w = width;
    for(int i=0; i<w/2; i++)
    {
        for(int j=i; j<w-1-i; j++)
        {
            int tmp = array[i][j];
            array[i][j] = array[w-1-j][i];
            array[w-1-j][i] = array[w-1-i][w-1-j];
            array[w-1-i][w-1-j] = array[j][w-1-i];
            array[j][w-1-i] = tmp;
        }
    }
}

// low and high inclusively
+(NSMutableArray*)randomTwoNumbers:(unsigned)low high:(unsigned)high{
    NSMutableArray* tmpArray = [Core geneUniqueRandomMutable:low high:high];
    NSMutableArray* array = [NSMutableArray arrayWithCapacity:2]; 
    [array addObject:tmpArray[0]];
    [array addObject:tmpArray[1]];
    return array;
}

+(CGColorRef)getColorMap:(NSInteger)index{
    //NSLog(@"%s", __PRETTY_FUNCTION__);
    int const lenColor = 48;
    if(index < lenColor){

        CGColorRef colorArray[]={
            [[UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.1] CGColor],
            [[UIColor colorWithRed:0   green:0   blue:0   alpha:0.5] CGColor],
            [[UIColor colorWithRed:0.3 green:0.9 blue:0.1 alpha:0.4] CGColor],
            [[UIColor colorWithRed:0.4 green:0.9 blue:0.1 alpha:0.4] CGColor],
            [[UIColor colorWithRed:0.5 green:0.9 blue:0.1 alpha:0.4] CGColor],
            [[UIColor colorWithRed:0.6 green:0.9 blue:0.1 alpha:0.4] CGColor],
            [[UIColor colorWithRed:0.7 green:0.9 blue:0.1 alpha:0.4] CGColor],
            [[UIColor colorWithRed:0.8 green:0.9 blue:0.1 alpha:0.4] CGColor],
            [[UIColor colorWithRed:0.9 green:0.9 blue:0.1 alpha:0.4] CGColor],

            [[UIColor colorWithRed:0.3 green:0.1 blue:0.1 alpha:0.4] CGColor],
            [[UIColor colorWithRed:0.4 green:0.2 blue:0.1 alpha:0.4] CGColor],
            [[UIColor colorWithRed:0.5 green:0.3 blue:0.1 alpha:0.4] CGColor],
            [[UIColor colorWithRed:0.6 green:0.4 blue:0.1 alpha:0.4] CGColor],
            [[UIColor colorWithRed:0.7 green:0.5 blue:0.1 alpha:0.4] CGColor],
            [[UIColor colorWithRed:0.8 green:0.6 blue:0.1 alpha:0.4] CGColor],
            [[UIColor colorWithRed:0.9 green:0.7 blue:0.1 alpha:0.4] CGColor],
            [[UIColor colorWithRed:0.9 green:0.8 blue:0.1 alpha:0.4] CGColor],
            [[UIColor colorWithRed:0.9 green:0.9 blue:0.1 alpha:0.4] CGColor],

            [[UIColor colorWithRed:0.3 green:0.1 blue:0.1 alpha:0.4] CGColor],
            [[UIColor colorWithRed:0.4 green:0.2 blue:0.2 alpha:0.4] CGColor],
            [[UIColor colorWithRed:0.5 green:0.3 blue:0.3 alpha:0.4] CGColor],
            [[UIColor colorWithRed:0.6 green:0.4 blue:0.4 alpha:0.4] CGColor],
            [[UIColor colorWithRed:0.7 green:0.5 blue:0.5 alpha:0.4] CGColor],
            [[UIColor colorWithRed:0.8 green:0.6 blue:0.6 alpha:0.4] CGColor],
            [[UIColor colorWithRed:0.9 green:0.7 blue:0.7 alpha:0.4] CGColor],
            [[UIColor colorWithRed:0.9 green:0.8 blue:0.8 alpha:0.4] CGColor],
            [[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:0.4] CGColor],

            [[UIColor colorWithRed:0.3 green:0.1 blue:0.1 alpha:0.1] CGColor],
            [[UIColor colorWithRed:0.4 green:0.2 blue:0.2 alpha:0.2] CGColor],
            [[UIColor colorWithRed:0.5 green:0.3 blue:0.3 alpha:0.3] CGColor],
            [[UIColor colorWithRed:0.6 green:0.4 blue:0.4 alpha:0.4] CGColor],
            [[UIColor colorWithRed:0.7 green:0.5 blue:0.5 alpha:0.5] CGColor],
            [[UIColor colorWithRed:0.8 green:0.6 blue:0.6 alpha:0.6] CGColor],
            [[UIColor colorWithRed:0.9 green:0.7 blue:0.7 alpha:0.7] CGColor],
            [[UIColor colorWithRed:0.9 green:0.8 blue:0.8 alpha:0.8] CGColor],
            [[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:0.9] CGColor],

            [[UIColor colorWithRed:0.8 green:0.8 blue:0.2 alpha:0.2] CGColor],
            [[UIColor colorWithRed:0.4 green:0.1 blue:0.2 alpha:0.7] CGColor],
            [[UIColor colorWithRed:0.2 green:0.9 blue:0.3 alpha:0.5] CGColor],
            [[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:0.8] CGColor],
            [[UIColor colorWithRed:0.8 green:0.8 blue:0.2 alpha:0.6] CGColor],
            [[UIColor colorWithRed:0.2 green:0.8 blue:0.4 alpha:0.7] CGColor],
            [[UIColor colorWithRed:0.8 green:0.2 blue:0.1 alpha:0.5] CGColor],
            [[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:0.9] CGColor],
            [[UIColor colorWithRed:0.1 green:0.4 blue:0.9 alpha:0.7] CGColor],
            [[UIColor colorWithRed:0.3 green:0.2 blue:0.6 alpha:0.9] CGColor],
            [[UIColor colorWithRed:0.4 green:0.1 blue:0.8 alpha:0.4] CGColor],
            [[UIColor colorWithRed:0.4 green:0.1 blue:0.2 alpha:0.1] CGColor],

            // transparent
            [[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.0] CGColor],
            [[UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:0.5] CGColor],
            [[UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.8] CGColor],
            [[UIColor colorWithRed:1.0 green:0.0 blue:0.5 alpha:0.4] CGColor],
            [[UIColor colorWithRed:0.6 green:1.0 blue:0.2 alpha:0.5] CGColor],
            [[UIColor colorWithRed:0.8 green:0.6 blue:0.7 alpha:0.8] CGColor],
        };

        return colorArray[index];
    }else{
        NSLog(@"ERROR: Invalide index for colorArray  lenColor=[%d]  index=[%d]", lenColor, index);
        exit(1);
    }
}

+(UIColor*)getUIColorMap:(int)index{
    //NSLog(@"%s", __PRETTY_FUNCTION__);
    int const lenColor = 16;
    if(index < lenColor){
        UIColor* colorArray[lenColor];
        colorArray[6] = [UIColor colorWithRed:0.8 green:0.8 blue:0.2 alpha:0.8];
        colorArray[0] = [UIColor colorWithRed:0.8 green:0.8 blue:0.2 alpha:0.2];
        colorArray[7] = [UIColor colorWithRed:0.8 green:0.8 blue:0.2 alpha:0.6];
        colorArray[13] = [UIColor colorWithRed:0.4 green:0.1 blue:0.8 alpha:0.4];
        colorArray[10] = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.1];
        colorArray[12] = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:0.8];
        colorArray[8] = [UIColor colorWithRed:0.3 green:0.2 blue:0.6 alpha:0.9];
        colorArray[14] = [UIColor colorWithRed:0.4 green:0.1 blue:0.2 alpha:0.1];
        colorArray[15] = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.0];
        
        colorArray[9] = [UIColor colorWithRed:0.8 green:0.2 blue:0.1 alpha:0.8];
        colorArray[5] = [UIColor colorWithRed:0.2 green:0.8 blue:0.4 alpha:0.7];
        colorArray[3] = [UIColor colorWithRed:0.1 green:0.4 blue:0.9 alpha:0.7];
        colorArray[2] = [UIColor colorWithRed:0.3 green:0.9 blue:0.1 alpha:0.4];
        colorArray[4] = [UIColor colorWithRed:0.4 green:0.1 blue:0.2 alpha:0.5];
        colorArray[11] = [UIColor colorWithRed:0   green:0   blue:0   alpha:0.5];
        colorArray[1] = [UIColor colorWithRed:0.2 green:0.9 blue:0.3 alpha:0.5];
        return colorArray[index];
    }else{
        NSLog(@"ERROR: Invalide index for colorArray  lenColor=[%d]  index=[%d]", lenColor, index);
        exit(1);
    }
}

+(void)print1DArray:(int*)array width:(int)width{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSLog(@"-------------------------------------");
    for(int i=0; i<width; i++){
        printf("[%d]=[%d]", array[i]);
    }
    printf("\n");
    NSLog(@"-------------------------------------");
}

+(void)print2DNSArray_NS:(NSMutableArray*)array2d width:(int)width height:(int)height{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSLog(@"-------------------------------------");
    for(int i=0; i<height; i++){
        for(int j=0; j<width; j++){
            printf("[%ld]",(long)[array2d[i][j] integerValue]);
            //NSLog(@"[%ld]",(long)[array2d[i][j] integerValue]);
        }
        printf("\n");
    }
    NSLog(@"-------------------------------------");
}



+(void)print2DArray:(int**)array width:(int)width height:(int)height{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSLog(@"-------------------------------------");
    for(int i=0; i<height; i++){
        for(int j=0; j<width; j++){
            printf("[%d]", array[i][j]);
        }
        printf("\n");
    }
    NSLog(@"-------------------------------------");
}

+(UIColor*)RGB:(CGFloat)r g:(CGFloat)g b:(CGFloat)b a:(CGFloat)a{
    return [UIColor colorWithRed:r green:g blue:b alpha:a];
}

+(CGColorRef)RGBcolorRef:(CGFloat)r g:(CGFloat)g b:(CGFloat)b a:(CGFloat)a{
    return [[UIColor colorWithRed:r green:g blue:b alpha:a] CGColor];
}

// component[0] = R
// component[1] = G
// component[2] = B
// component[3] = Alpha
// get r g b alpha from UIColor
+(void)getColorComponent:(UIColor*)color component:(int*)component{
    CGColorRef colorRef = [color CGColor];
    size_t count = CGColorGetNumberOfComponents(colorRef);
    if (count == 4) {
        component = CGColorGetComponents(colorRef);

        const CGFloat *components = CGColorGetComponents(colorRef);
        CGFloat red   = components[0];
        CGFloat green = components[1];
        CGFloat blue  = components[2];
        CGFloat alpha = components[3];
        
        NSLog(@"r=[%f] g=[%f] b=[%f] alpha=[%f]",red,green,blue,alpha);
    }
}

+(void)getComponentFromColorRef:(CGColorRef)colorRef components:(CGFloat*)components{
    size_t _countComponents = CGColorGetNumberOfComponents(colorRef);
    
    if (_countComponents == 4) {
        const CGFloat* com = CGColorGetComponents(colorRef);
        components[0] = com[0];
        components[1] = com[1];
        components[2] = com[2];
        components[3] = com[3];
         
        CGFloat red     = components[0];
        CGFloat green   = components[1];
        CGFloat blue    = components[2];
        CGFloat alpha   = components[3];
        
        NSLog(@"r=[%f] g=[%f] b=[%f] alpha=[%f]",red,green,blue,alpha);
    }
}

+(int***)allocate3d:(int)depth height:(int)height width:(int)width{
    int*** array3d = (int***)malloc(depth*sizeof(int**));
    for(int d=0; d<depth; d++){ 
        array3d[d] = (int**)malloc(height*sizeof(int*));
        for(int i=0; i<height; i++){
            array3d[d][i] = (int*)malloc(width*sizeof(int));
        }
    } 
    return array3d;
}

+(void)deallocate3d:(int)depth height:(int)height width:(int)width array:(int***)array3d{
    for(int d=0; d<depth; d++){
        for(int h=0; h<height; h++){
            if(array3d[d][h]);
                free(array3d[d][h]);
        }
    }
    for(int d=0; d<depth; d++){
        if(array3d[d])
            free(array3d[d]);
    }

    if(array3d){
        free(array3d);
    }
}
+(int**)allocate2d:(int)height width:(int)width{
    int** array = (int**)malloc(height*sizeof(int*));
    for(int i=0; i<height; i++){
        array[i] = (int*)malloc(width*sizeof(int));
    }
    return array;
}
+(void)dellocate2d:(int)height width:(int)width array:(int**)array{
    for(int i=0; i<height; i++){
       free(array[i]); 
       array[i] = NULL;
    }
    free(array);
    array = NULL;
}

+(NSMutableArray*)createColRowArray:(NSUInteger)col row:(NSUInteger)row{
    NSMutableArray* array = [[NSMutableArray alloc] initWithCapacity:2];
    [array addObject:@(col)];
    [array addObject:@(row)];
    return array;
}
+(NSNumber*)NumInt:(int)num{
    return [NSNumber numberWithInteger:num];
}

+(int)getRow:(int)index width:(int)width{
    return index % width;
}

+(int)getCol:(int)index width:(int)width{
    return index/width;
}

+(bool)isSamePoint:(CGPoint)p1 point:(CGPoint)p2{
    return [Core compareDouble:p1.x second:p2.x] && [Core compareDouble:p1.y second:p2.y];
}

+(bool)compareDouble:(double)d1 second:(double)d2{
    double diff = fabs(d1 - d2);
    return diff <= DELTA;
}

+(int)moveDirection:(CGPoint)initPoint current:(CGPoint)currPoint{
    int dir = MOVE_ZERO;
    int diffX = initPoint.x - currPoint.x;
    int diffY = initPoint.y - currPoint.y;

    if(diffX == 0){
        if(diffY == 0){
            dir = MOVE_ZERO;
        }else if(diffY > 0){
            dir = MOVE_UP;
        }else{
            dir = MOVE_DOWN;
        }
    }else if(diffX > 0){
        if(diffY == 0){
            dir = MOVE_LEFT;
        }else if(diffY > 0){
            if(diffX > diffY)
                dir = MOVE_LEFT;
            else if(diffX < diffY)
                dir = MOVE_UP;
            else
                dir = MOVE_LEFT_UP;
        }else{
            if(diffX > abs(diffY))
                dir = MOVE_LEFT;
            else if(diffX < abs(diffY))
                dir = MOVE_DOWN;
            else
                dir = MOVE_LEFT_DOWN;
        }
    }else{
        if(diffY == 0){
            dir = MOVE_RIGHT;
        }else if(diffY > 0){
            if(abs(diffX) > diffY)
                dir = MOVE_RIGHT;
            else if(abs(diffX) < diffY)
                dir = MOVE_UP; 
            else
                dir = MOVE_RIGHT_UP;
        }else{
            if(abs(diffX) > abs(diffY))
                dir = MOVE_RIGHT;
            else if(abs(diffX) < abs(diffY))
                dir = MOVE_DOWN;
            else
                dir = MOVE_RIGHT_DOWN;
        }
    }

    return dir;
}

+(bool)isClosedZero:(double)d{
    return fabs(d) <= DELTA;
}

-(NSMutableArray*)shape:(int)low width:(int)high{
    return [Core geneUniqueRandomMutable:low high:high];
}

-(NSMutableArray*)complementShape:(NSMutableArray*)array{
    NSMutableArray* compleArr = [NSMutableArray arrayWithCapacity:[array count]];
    for(id item in array){
        int num = [item integerValue]? 0 : 1;
        [compleArr addObject:@(num)];
    }
    return compleArr;
}

+(int)gridShape:(NSUInteger)index col:(NSUInteger)col row:(NSUInteger)row array:(int***)array{
    return array[index][col][row];
}

+(void)printMatrix:(CGAffineTransform) m{
    NSLog(@"[%f] [%f] [%f] ", m.a, m.b, m.tx); 
    NSLog(@"[%f] [%f] [%f] ", m.c, m.d, m.ty); 
    NSLog(@"[%f] [%f] [%f] ", 0, 0, 1); 
}

+(CGAffineTransform)rotateCenter:(CGAffineTransform)matrix center:(CGPoint)center{
    CGAffineTransform translate = CGAffineTransformTranslate(CGAffineTransformIdentity, -center.x, -center.y);
    matrix = CGAffineTransformConcat(matrix, translate);
    CGAffineTransform rotateTransform = CGAffineTransformMakeRotation(3.1415/2);
    matrix = CGAffineTransformConcat(matrix, rotateTransform);
    CGAffineTransform mat = CGAffineTransformMakeTranslation(center.x, center.y);
    matrix = CGAffineTransformConcat(matrix, mat);
    return matrix;
}

+(void)Button:(UIView*)view targe:(id)targe selector:(SEL)selector{
    CGSize size          = [UIScreen mainScreen].bounds.size;
    UIButton* mybut = [UIButton buttonWithType:UIButtonTypeSystem];
    int height = 40;
    int width = 200;
    CGRect frame = CGRectMake(size.width/2-width/2, 40, width, height);
    mybut.frame = frame;
    [mybut addTarget:targe action:selector forControlEvents:UIControlEventTouchUpInside];
    [mybut setTitle:@"Start Game" forState:(UIControlState) UIControlStateNormal];
    [mybut setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    [mybut.titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
    [mybut setBackgroundColor:[UIColor brownColor]];
    [view addSubview:mybut];
}

+(void)Button:(UIView*)view text:(NSString*)text targe:(id)targe selector:(SEL)selector{
    CGSize size          = [UIScreen mainScreen].bounds.size;
    UIButton* mybut = [UIButton buttonWithType:UIButtonTypeSystem];
    int height = 60;
    int width = 200;
    CGRect frame = CGRectMake(size.width/2-width/2, 40, width, height);
    mybut.frame = frame;
    [mybut addTarget:targe action:selector forControlEvents:UIControlEventTouchUpInside];
    [mybut setTitle:text forState:(UIControlState) UIControlStateNormal];
    [mybut setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    [mybut.titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
    [mybut setBackgroundColor:[UIColor brownColor]];
    [view addSubview:mybut];
}

+(NSMutableArray*)allXColor{
    int lenColor = LEN_RED*LEN_GREEN*LEN_BLUE*LEN_ALPHA;
    NSMutableArray* array = [[NSMutableArray alloc] initWithCapacity:lenColor];
    for(int a=1; a<LEN_ALPHA; a++){
        for(int r=1; r<LEN_RED; r++){
            for(int g=1; g<LEN_GREEN; g++){
                for(int b=1; b<LEN_BLUE; b++){
                    int index = a*(LEN_RED*LEN_GREEN*LEN_BLUE) + r*(LEN_GREEN*LEN_BLUE) + g*LEN_BLUE + b;
                    XColor* xcolor = [[XColor alloc]init];
                    xcolor.red   = r*0.1;
                    xcolor.green = g*0.1;
                    xcolor.blue  = b*0.1;
                    xcolor.alpha = a*0.1;
                    UIColor* uicolor = [UIColor colorWithRed:xcolor.red green:xcolor.green blue:xcolor.blue alpha:xcolor.alpha];
                    xcolor.color = uicolor;
                    [array addObject:xcolor];
                }
            }
        }
    }
    return array;
}

+(UIColor*__strong*)allColor{
    int lenColor = LEN_RED*LEN_GREEN*LEN_BLUE*LEN_ALPHA;
    UIColor*__strong* colorArray = (UIColor*__strong*)malloc(lenColor*sizeof(UIColor*));
    for(int r=0; r<LEN_RED; r++){
        for(int g=0; g<LEN_GREEN; g++){
            for(int b=0; b<LEN_BLUE; b++){
                for(int a=0; a<LEN_ALPHA; a++){
                    int index = r*(LEN_GREEN*LEN_BLUE*LEN_ALPHA) + g*(LEN_BLUE*LEN_ALPHA) + b*LEN_ALPHA + a;
                    colorArray[index] = [UIColor colorWithRed:r*0.1 green:g*0.1 blue:b*0.1 alpha:a*0.1];
                }
            }
        }
    }
    return colorArray;
}

+(void)LabelList:(UIView*)view{
    CGSize size          = [UIScreen mainScreen].bounds.size;
    int margin = 3;
    int numRow = 4;
    int quarter = (size.width-(numRow+1)*margin)/numRow;

    int lenRed   = 10;
    int lenGreen = 10;
    int lenBlue  = 10;
    int lenAlpha = 10;

    int lenColor = LEN_RED*LEN_GREEN*LEN_BLUE*LEN_ALPHA;
    UIColor* colorArray[lenColor];
    for(int r=0; r<LEN_RED; r++){
        for(int g=0; g<LEN_GREEN; g++){
            for(int b=0; b<LEN_BLUE; b++){
                for(int a=0; a<LEN_ALPHA; a++){
                    int index = r*(LEN_GREEN*LEN_BLUE*LEN_ALPHA) + g*(LEN_BLUE*LEN_ALPHA) + b*LEN_ALPHA + a;
                    colorArray[index] = [UIColor colorWithRed:r*0.1 green:g*0.1 blue:b*0.1 alpha:a*0.1];
                }
            }
        }
    }

    for(int j=0; j<10; j++){
        for(int i=0; i<numRow; i++){
            UILabel* gameInfoTextField = [[UILabel alloc] initWithFrame:CGRectMake(i*(quarter + margin) + margin, j*(quarter/2+ margin) + margin, quarter, quarter/2)];
            gameInfoTextField.font = [UIFont fontWithName:@"Arial" size:12.0];
            int index = j*numRow+i + 200;
            gameInfoTextField.backgroundColor = colorArray[index]; 

            gameInfoTextField.layer.borderWidth = 0.2f;
            gameInfoTextField.layer.borderColor = [[UIColor whiteColor]CGColor];
            gameInfoTextField.textAlignment = NSTextAlignmentCenter; 
            gameInfoTextField.text = @"na";
            gameInfoTextField.textColor = [UIColor brownColor];
            [view addSubview:gameInfoTextField];
        }
    }
}

+(void)GameInfoTextField:(UIView*)view text1:(NSString*)text1 text2:(NSString*)text2 text3:(NSString*)text3 text4:(NSString*)text4{
    CGSize size          = [UIScreen mainScreen].bounds.size;
    int margin = 3;
    int quarter = (size.width-5*margin)/4;
    int height = 20;
    UILabel* gameInfoTextField = [[UILabel alloc] initWithFrame:CGRectMake(margin, 20, quarter, height)];
    gameInfoTextField.font = [UIFont fontWithName:@"Arial" size:12.0];
    gameInfoTextField.backgroundColor = [UIColor redColor];

    gameInfoTextField.layer.borderWidth = 0.0f;
    gameInfoTextField.layer.borderColor = [[UIColor redColor]CGColor];
    gameInfoTextField.textAlignment = NSTextAlignmentCenter; 
    gameInfoTextField.text = text1;
    gameInfoTextField.layer.shadowColor = [[UIColor blackColor]CGColor];
    gameInfoTextField.layer.shadowOpacity = 0.5;
    gameInfoTextField.shadowOffset = CGSizeMake(0, 1);
    gameInfoTextField.textColor = [UIColor whiteColor];
    [view addSubview:gameInfoTextField];

    UILabel* middleField = [[UILabel alloc] initWithFrame:CGRectMake(2*margin+quarter, 20, quarter, height)];
    middleField.font = [UIFont fontWithName:@"Arial" size:12.0];
    middleField.backgroundColor = [UIColor redColor];
    middleField.layer.borderWidth = 0.0f;
    middleField.layer.borderColor = [[UIColor redColor]CGColor];
    middleField.textAlignment = NSTextAlignmentCenter;
    middleField.text = text2;
    [view addSubview:middleField];

    UILabel* thirdField= [[UILabel alloc] initWithFrame:CGRectMake(3*margin+2*quarter, 20, quarter, height)];
    thirdField.font = [UIFont fontWithName:@"Arial" size:12.0];
    thirdField.backgroundColor = [UIColor redColor];
    thirdField.layer.borderWidth = 0.0f;
    thirdField.layer.borderColor = [[UIColor redColor]CGColor];
    thirdField.textAlignment = NSTextAlignmentCenter; 
    thirdField.text = text3;
    [view addSubview:thirdField];

    UILabel* fourthField= [[UILabel alloc] initWithFrame:CGRectMake(4*margin+3*quarter, 20, quarter, height)];
    fourthField.font = [UIFont fontWithName:@"Arial" size:12.0];
    fourthField.backgroundColor = [UIColor redColor];
    fourthField.layer.borderWidth = 0.0f;
    fourthField.layer.borderColor = [[UIColor redColor]CGColor];
    fourthField.textAlignment = NSTextAlignmentCenter; 
    fourthField.text = text4;
    [view addSubview:fourthField];
}

+(void)Label:(UIView*)view text:(NSString*)text{
    UILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 400, 300)];
    [myLabel setTextColor:[UIColor redColor]];
    [myLabel setBackgroundColor:[UIColor clearColor]];
    [myLabel setFont:[UIFont fontWithName: @"Trebuchet MS" size: 20.0f]];
    [myLabel setText:text];
    [view setBackgroundColor:[UIColor blackColor]];
    [view addSubview:myLabel];
}

+(void)printLayerInfo:(CALayer*)layer text:(NSString*)text{
    CGPoint anchorPoint = layer.anchorPoint;
    CGPoint position = layer.position;
    CGRect frame = layer.frame;
    CGRect bounds = layer.bounds;
    NSLog(@"--------------------[begin %@]------------------------------", text);
    NSLog(@"anchor  [%@]", [NSValue valueWithCGPoint:anchorPoint]);
    NSLog(@"position[%@]", [NSValue valueWithCGPoint:position]);
    NSLog(@"frame   [%@]", [NSValue valueWithCGRect:frame]);
    NSLog(@"bounds  [%@]", [NSValue valueWithCGRect:bounds]);
    NSLog(@"--------------------[end   %@]------------------------------", text);
}


+(CAShapeLayer*)CartesianCoordinate{
    CGSize size          = [UIScreen mainScreen].bounds.size;
    
    CAShapeLayer* shapeLayer = [CAShapeLayer layer];
    UIBezierPath* path = [UIBezierPath bezierPath];

    // Vertical line
    [path moveToPoint:CGPointMake(size.width/2, 0)];
    [path addLineToPoint:CGPointMake(size.width/2, size.height)];

    // Horizontal line
    [path moveToPoint:CGPointMake(0, size.height/2)];
    [path addLineToPoint:CGPointMake(size.width, size.height/2)];

    shapeLayer.path = [path CGPath];
    shapeLayer.strokeColor = [[UIColor blackColor] CGColor];
    shapeLayer.fillColor = [[UIColor brownColor] CGColor];
    shapeLayer.lineWidth = 1.0f;
    return shapeLayer;
}
+(void)printCATransform3D:(CATransform3D)transform{
    NSLog(@"-------------------------------------------------------------------------------");
    NSLog(@"[%f] [%f] [%f] [%f]", transform.m11, transform.m12, transform.m13, transform.m14);
    NSLog(@"[%f] [%f] [%f] [%f]", transform.m21, transform.m22, transform.m23, transform.m24);
    NSLog(@"[%f] [%f] [%f] [%f]", transform.m31, transform.m32, transform.m33, transform.m34);
    NSLog(@"[%f] [%f] [%f] [%f]", transform.m41, transform.m42, transform.m43, transform.m44);
    NSLog(@"-------------------------------------------------------------------------------");
}

@end


