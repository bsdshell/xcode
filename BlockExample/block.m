#import <Foundation/Foundation.h>

//=============================================================================
// How to compile:
// Assume block.m is in the current directory
//=============================================================================
// clang -fobjc-arc -framework Foundation block.m
//=============================================================================
int main(int argc, const char* argv[])
{
    @autoreleasepool{
        NSLog(@"ObjectiveC Block Example\n");
    }

    // 1. simple block example
    void (^simpleBlock)(void);
    
    simpleBlock = ^{
        NSLog(@"This is Block Objective-C tutorial \r\n");
    };
    
    simpleBlock();
    
    // 2. a bit more complicated block example 
    int (^returnBlock)(int, int);
    
    returnBlock = ^ int (int x, int y){
        return x + y;
    };
    
    // use the block
    NSLog(@"return block=[%d]", returnBlock(3, 4));

    // 3. access non-local variables
    double pi = 3.1415;
    double radius = 10.0;
    double (^area)(double radius);

    area = ^double (double radius){
        return pi*radius*radius;
    };
    NSLog(@"The area of circle with radius [%f] = [%f]", radius, area(radius));

    pi = 10000.0;
    // the output is still the same
    NSLog(@"The area of circle with radius [%f] = [%f]", radius, area(radius));

    // 4. modify the non-local variable
    __block int count = 0;
    int (^increase)(void) = ^{
        return count++;
    };

    NSLog(@"count= [%d]", increase());
    NSLog(@"count= [%d]", increase());
    NSLog(@"count= [%d]", increase());

    int(^index)(int, int, int) = ^(int col, int row, int width){
        return col*width+row;
    };
 
    NSLog(@"index[2, 1, 10]= [%d]", index(2, 1, 10));
    NSLog(@"index[0, 0, 10]= [%d]", index(0, 0, 10));
    NSLog(@"index[1, 1, 10]= [%d]", index(1, 1, 10));
}
