//
//  SubClass.h
//  NSUserDefaultApp
//
//  Created by cat on 1/11/16.
//  Copyright (c) 2016 myxcode. All rights reserved.
//

#import "MyClass.h"

@interface SubClass : MyClass<NSCoding>{
    NSString* _subname;
}

@property(nonatomic, retain)NSString* subname;

@end
