#import <Foundation/Foundation.h>

//=============================================================================
//How to compile:
//Assume DoublePointer.m is in the current directory
//=============================================================================
//clang -fobjc-arc -framework Foundation HelloWorld.m
//=============================================================================

@interface MyClass : NSObject
{
    NSString* _mystr;
}
@end


@implementation MyClass 

-(id)initWithString:(NSString*) mystr{
    if(self = [super init]){
        _mystr = mystr;
        return self;
    }
    return nil;
}
-(void)printString{
    NSLog(@"%@", _mystr);
}

@end


int main(int argc, const char* argv[])
{
    @autoreleasepool{
        NSLog(@"Double Pointer");
    }

    NSLog(@"1D array");
    int width = 4;
    MyClass* __autoreleasing * array1d;
    array1d = (MyClass* __autoreleasing*)calloc(width, sizeof(MyClass*));
    for(int i=0; i<width; i++) {
        array1d[i] = [[MyClass alloc]initWithString:
                         [NSString stringWithFormat:@"%d", i]]; 
    }

    for(int i=0; i<width; i++)
        [array1d[i] printString];


    int height = 5;
    MyClass* __autoreleasing ** array2d;
    array2d = (MyClass* __autoreleasing**)calloc(height, sizeof(MyClass* __autoreleasing*));
    for(int i=0; i<height; i++) {
        array2d[i] = (MyClass* __autoreleasing*)calloc(width, sizeof(MyClass*));
    }
    
    for(int i=0; i<height; i++) {
        for(int j=0; j<width; j++) {
            array2d[i][j] = [[MyClass alloc]initWithString:
                                [NSString stringWithFormat:@"%d", i*width+j]]; 
        }
    }

    NSLog(@"2D array");
    for(int i=0; i<height; i++)
    for(int j=0; j<width; j++)
        [array2d[i][j] printString];

}
