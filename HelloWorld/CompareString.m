#import <Foundation/Foundation.h>

//=============================================================================
//How to compile:
//Assume CompareString.m is in the current directory
//=============================================================================
//clang -fobjc-arc -framework Foundation  -o comparestring CompareString.m
//=============================================================================

int main(int argc, const char* argv[]){
    @autoreleasepool{
        NSLog(@"Hello World");
    }
    NSString* s1 = @"foo";
    NSString* s2 = @"foo";
    NSString* s3 = [[NSString alloc] initWithString:@"foo"];
    
    NSLog(@"[%d]", s1 == s2);
    NSLog(@"[%d]", s1 == s3);
    NSLog(@"[%d]", [s1 isEqualToString:s2]);
    NSLog(@"[%d]", [s1 isEqualToString:s3]);
}


