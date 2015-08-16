#import <Foundation/Foundation.h>

//=============================================================================
// How to compile:
// Assume helloworld.m is in the current directory
//=============================================================================
// clang -fobjc-arc -framework Foundation helloworld.m
//=============================================================================
int main(int argc, const char* argv[])
{
    @autoreleasepool{
        NSLog(@"Hello World\n");
    }

    // simple block example
    void (^simpleBlock)(void);
    
    simpleBlock = ^{
        NSLog(@"This is Block Objective-C tutorial \r\n");
    };
    
    simpleBlock();
    
    // declare the block
    int (^returnBlock)(int, int);
    
    // implement the block
    returnBlock = ^ int (int x, int y){
        return x + y;
    };
    
    // use the block
    NSLog(@"return block=[%d]", returnBlock(3, 4));

    //=================================================
    // access non-local variables
    double pi = 3.1415;
    double radius = 10.0;
    double (^area)(double radius);

    area = ^double (double radius){
        return pi*radius*radius;
    };
    NSLog(@"The area of circle with radius [%f] = [%f]", radius, area(radius));

    // try to change non-local variable pi
    pi = 10000.0;

    // the output is still the same
    NSLog(@"The area of circle with radius [%f] = [%f]", radius, area(radius));

    //=================================================
    // modify the non-local variable
    __block int count = 0;
    int (^increase)(void) = ^{
        return count++;
    };
    NSLog(@"count= [%d]", increase());
    NSLog(@"count= [%d]", increase());
    NSLog(@"count= [%d]", increase());
}

