//
//  BCLFloorSegment.m
//  BounceClock
//
//  Created by Troy HARRIS on 8/22/13.
//  Copyright (c) 2013 Lone Yeti. All rights reserved.
//

#import "BCLFloorSegment.h"

@implementation BCLFloorSegment

- (id)initWithWidth:(CGFloat)width {
    UIColor *boxColor = [UIColor clearColor];
    self = [super initWithColor:boxColor size:CGSizeMake(width, 4)];
    if (self) {
        self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.size];
        self.physicsBody.dynamic = NO;
        self.physicsBody.categoryBitMask = floorCategory;
        self.physicsBody.collisionBitMask = boxCategory | floorCategory;
    }
    return self;
}

- (BOOL)isPhysical {
    //self.color = [UIColor greenColor];
    return _physical;
}

- (void)removePhysics {
    //self.color = [UIColor clearColor];
    self.physicsBody = nil;
}

- (void)addPhysics {
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.size];
    self.physicsBody.dynamic = NO;
}

+ (BCLFloorSegment *)floorSegmentWithWidth:(CGFloat)width position:(CGPoint)position {
    BCLFloorSegment *floor = [[BCLFloorSegment alloc] initWithWidth:width];
    floor.position = position;
    return floor;
}

@end
