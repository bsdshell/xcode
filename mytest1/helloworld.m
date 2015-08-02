#import <Foundation/Foundation.h>

//=============================================================================
//How to compile:
//Assume helloworld.m is in the current directory
//=============================================================================
//clang -fobjc-arc -framework Foundation helloworld.m
//=============================================================================
int main(int argc, const char* argv[])
{
    @autoreleasepool{
        NSLog(@"Hello World");
    }
}
