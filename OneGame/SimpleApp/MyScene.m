//
//  MyScene.m
//  SimpleApp
//
//  Created by cat on 3/31/16.
//  Copyright (c) 2016 myxcode. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene



-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        // 2
        NSLog(@"Size: %@", NSStringFromCGSize(size));
        
        // 3
        self.backgroundColor = [SKColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
        
        // 4
        self.node = [SKSpriteNode spriteNodeWithImageNamed:@"sprite.jpeg"];
        self.node.position = CGPointMake(100, 100);
        [self addChild:self.node];
        
    }
    return self;
}
@end
