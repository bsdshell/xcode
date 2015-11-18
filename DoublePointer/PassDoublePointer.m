#import <Foundation/Foundation.h>

//=============================================================================
//How to compile:
//Assume passDoublePointer.m is in the current directory
//=============================================================================
//clang -fobjc-arc -framework Foundation HelloWorld.m
//=============================================================================

@interface MyClass : NSObject
{
    NSString* _mystr;
}
@property(nonatomic)NSString* mystr;
@end

@implementation MyClass 
@synthesize mystr = _mystr;

-(id)initWithString:(NSString*) mystr{
    if(self = [super init]){
        _mystr = mystr;
        return self;
    }
    return nil;
}
-(NSString*)print{
    return _mystr;
}

+(void)swap:(MyClass*__strong*)pp1  pointer:(MyClass* __strong*)pp2{
    MyClass* p = *pp1;
    *pp1 = *pp2;
    *pp2 = p;
    NSLog(@"[*pp1 mystr]=[%@]", [*pp1 mystr]);
    NSLog(@"[*pp2 mystr]=[%@]", [*pp2 mystr]);
}

@end

int main(int argc, const char* argv[])
{
    @autoreleasepool{
        NSLog(@"Double Pointer");
        MyClass* p1 = [MyClass alloc];
        MyClass* p2 = [MyClass alloc];
        p1.mystr = @"p1"; 
        p2.mystr = @"p2"; 

        [MyClass swap:&p1 pointer:&p2];
        NSLog(@"p1.mystr=[%@]", [p1 print]);
        NSLog(@"p2.mystr=[%@]", [p2 print]);
    }
}
