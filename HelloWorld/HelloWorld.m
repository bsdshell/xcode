#import <Foundation/Foundation.h>

//=============================================================================
//How to compile:
//Assume HelloWorld.m is in the current directory
//=============================================================================
//clang -fobjc-arc -framework Foundation HelloWorld.m
//=============================================================================

@interface TestClass : NSObject
    +(void)classOrInstanceMethod;
    -(void)classOrInstanceMethod;
    -(id)init;
@end


@implementation TestClass

+(void)classOrInstanceMethod{
    NSLog(@"%s", __PRETTY_FUNCTION__); 
}
-(void)classOrInstanceMethod{
    NSLog(@"%s", __PRETTY_FUNCTION__); 
}
-(id)init{
    NSLog(@"%s", __PRETTY_FUNCTION__); 
    if(self = [super init])
    {
        return self;
    }
    return nil;
}
@end

@interface SubClass : TestClass
@end
@implementation SubClass
@end


// Enable ARC, you can't create a double pointer like that
/*
@interface MyClass :NSObject
{
    TestClass** byRef;
}
@end
*/

// Enable ARC, you need a Variable Qualifier
@interface MyClass :NSObject
{
    TestClass* __autoreleasing * byRef;
}
@end


int main(int argc, const char* argv[])
{
    @autoreleasepool{
        NSLog(@"Hello World");
    }

    NSArray* arr = [NSArray arrayWithObjects:[[TestClass alloc]init],
                                            [TestClass class], nil];
    for(id obj in arr)
        [obj classOrInstanceMethod];

    // Variable Qualifier Syntax
    // ClassName* qualifier variableName
    NSString* string1 = [[NSString alloc] initWithFormat:@"name: %@", @"no __weak"];
    NSLog(@"no __weak string=[%@]", string1);

    // string2 will be set to null before NSLog(...)
    NSString* __weak string2 = [[NSString alloc] initWithFormat:@"name: %@", @"Yes __weak"];
    NSLog(@"Yes __weak string=[%@]", string2);

    // default 
    NSString* __strong string3 = [[NSString alloc] initWithFormat:@"name: %@", @"Yes __strong"];
    NSLog(@"Yes __strong string=[%@]", string3);

    // error syntax
    // TestClass** byRef;
    // valid syntax
    TestClass* __autoreleasing * byRef;

    SubClass* sub = [[SubClass alloc]init];
    TestClass* tt = [[TestClass alloc]init];

    if([tt isKindOfClass:[SubClass class]]){
        NSLog(@"tt is SubClass"); 
    }

    if([sub isKindOfClass:[TestClass class]]){
        NSLog(@"sub is TestClass"); 
    }

    NSObject* obj2 = [[NSObject alloc]init];
    NSObject* obj1 = nil;
    if([obj1 isEqual:obj2])
        NSLog(@"obj1 == obj2"); 
    else
        NSLog(@"obj1 != obj2"); 

    NSString* str1 = @"100";
    NSString* str2 = @"100";
    NSString* str3 = str1;
    NSString* str4 = [NSString stringWithFormat:@"%d", 100]; 
    NSString* str5 = [NSString stringWithFormat:@"%d", 100]; 

    NSLog(@"str1.hash=[%lu]", [str1 hash]); 
    NSLog(@"str2.hash=[%lu]", [str2 hash]); 
    NSLog(@"str3.hash=[%lu]", [str3 hash]); 
    NSLog(@"str4.hash=[%lu]", [str4 hash]); 
    NSLog(@"str5.hash=[%lu]", [str5 hash]); 

     //str1.hash=[487553076]
     //str2.hash=[487553076]
     //str3.hash=[487553076]
     //str4.hash=[487553076]
     //str5.hash=[487553076]
     //str1 == str2
     //str3 == str2
     //str1 != str4
     //str4 == str5

    if( str1 == str2 ) {
        NSLog(@"str1 == str2"); 
    }
    else{
        NSLog(@"str1 != str2"); 
    }

    if( str3 == str2 ) {
        NSLog(@"str3 == str2"); 
    }
    else{
        NSLog(@"str3 != str2"); 
    }

    if( str1 == str4 ) {
        NSLog(@"str1 == str4"); 
    }
    else{
        NSLog(@"str1 != str4"); 
    }

    if( str4 == str5 ) {
        NSLog(@"str4 == str5"); 
    }
    else{
        NSLog(@"str4 != str5"); 
    }
}
