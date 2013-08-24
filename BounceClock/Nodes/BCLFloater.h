//
//  BCLFloater.h
//  BounceClock
//
//  Created by Troy HARRIS on 8/23/13.
//  Copyright (c) 2013 Lone Yeti. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "BCLNodeGlobals.h"

@interface BCLFloater : SKSpriteNode

- (id)initWithSize:(CGSize)size;

+(BCLFloater *)floaterOfRandomSizeWithMaxWidth:(int)maxWidth minWidth:(int)minWidth;


@end
