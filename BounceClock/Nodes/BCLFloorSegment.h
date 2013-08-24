//
//  BCLFloorSegment.h
//  BounceClock
//
//  Created by Troy HARRIS on 8/22/13.
//  Copyright (c) 2013 Lone Yeti. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "BCLNodeGlobals.h"

@interface BCLFloorSegment : SKSpriteNode

@property (nonatomic, getter = isPhysical) BOOL physical;

- (id)initWithWidth:(CGFloat)width;
- (void)removePhysics;
- (void)addPhysics;

+ (BCLFloorSegment *)floorSegmentWithWidth:(CGFloat)width position:(CGPoint)position;

@end
