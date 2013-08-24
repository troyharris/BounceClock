//
//  BCLNodeGlobals.m
//  BounceClock
//
//  Created by Troy HARRIS on 8/23/13.
//  Copyright (c) 2013 Lone Yeti. All rights reserved.
//

#import "BCLNodeGlobals.h"
#import "UIColor+FlatUI.h"

@implementation BCLNodeGlobals

+ (UIColor *)randomColor {
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
    return (UIColor *)[colorArr objectAtIndex:arc4random_uniform([colorArr count])];
}


@end
