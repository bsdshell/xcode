#import <Foundation/Foundation.h>

//=============================================================================
//How to compile:
//Assume HelloWorld.m is in the current directory
//=============================================================================
//clang -fobjc-arc -framework Foundation HelloWorld.m
//=============================================================================
int main(int argc, const char* argv[])
{
    @autoreleasepool{
        NSLog(@"Hello World");
    }
}
