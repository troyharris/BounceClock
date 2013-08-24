//
//  BCLFloater.m
//  BounceClock
//
//  Created by Troy HARRIS on 8/23/13.
//  Copyright (c) 2013 Lone Yeti. All rights reserved.
//

#import "BCLFloater.h"
#import "UIColor+FlatUI.h"

@implementation BCLFloater

- (id)initWithSize:(CGSize)size {
    UIColor *boxColor = [self randomColor];
    //self = [super initWithColor:boxColor size:size];
    self = [super initWithImageNamed:@"circle"];
    if (self) {
        self.name = @"floater";
        self.color = boxColor;
        self.size = size;
        NSUInteger alphaRandom = arc4random_uniform(20);
        CGFloat alphaToFloat = (CGFloat)alphaRandom / 100.0;
        self.alpha = alphaToFloat;
        self.colorBlendFactor = 0.5;
        self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.size];
        self.physicsBody.affectedByGravity = NO;
        self.physicsBody.categoryBitMask = floaterCategory;
        self.physicsBody.collisionBitMask = noneCategory;
        self.physicsBody.mass = 0.1;
        //self.physicsBody.density = 1;
    }
    return self;
}

- (UIColor *)randomColor {
    NSArray *colorArr = @[
                          [UIColor emerlandColor],
                          [UIColor turquoiseColor],
                          [UIColor carrotColor],
                          [UIColor midnightBlueColor],
                          [UIColor pomegranateColor],
                          [UIColor orangeColor],
                          [UIColor greenSeaColor],
                          [UIColor peterRiverColor],
                          [UIColor belizeHoleColor],
                          [UIColor nephritisColor],
                          [UIColor wisteriaColor],
                          [UIColor amethystColor],
                          [UIColor asbestosColor],
                          [UIColor concreteColor],
                          [UIColor wetAsphaltColor],
                          [UIColor alizarinColor],
                          [UIColor sunflowerColor],
                          [UIColor pumpkinColor]
                          ];
    UIColor *solidColor = (UIColor *)[colorArr objectAtIndex:arc4random_uniform([colorArr count])];
    NSUInteger alphaRandom = arc4random_uniform(20);
    CGFloat alphaToFloat = (CGFloat)alphaRandom / 100.0;
    return [solidColor colorWithAlphaComponent:alphaToFloat];
}

+(BCLFloater *)floaterOfRandomSizeWithMaxWidth:(int)maxWidth minWidth:(int)minWidth {
    int widthInt = arc4random_uniform(maxWidth - minWidth) + minWidth;
    CGFloat width = (CGFloat)widthInt;
    return [[BCLFloater alloc] initWithSize:CGSizeMake(width, width)];
}

@end
