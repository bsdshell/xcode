#import <Foundation/Foundation.h>

//=============================================================================
//How to compile:
//Assume  StaticMethod.m is in the current directory
//=============================================================================
//clang -fobjc-arc -framework Foundation HelloWorld.m
//=============================================================================

@interface TestClass : NSObject
    +(void)classOrInstanceMethod;
    -(void)classOrInstanceMethod;
@end

@implementation TestClass

+(void)classOrInstanceMethod{
    NSLog(@"%s", __PRETTY_FUNCTION__); 
}
-(void)classOrInstanceMethod{
    NSLog(@"%s", __PRETTY_FUNCTION__); 
}
@end

int main(int argc, const char* argv[])
{
    @autoreleasepool{
        NSLog(@"Static method in ObjectiveC");
    }

    NSArray* arr = [NSArray arrayWithObjects:[[TestClass alloc]init],
                                            [TestClass class], nil];
    for(id obj in arr)
        [obj classOrInstanceMethod];
}
