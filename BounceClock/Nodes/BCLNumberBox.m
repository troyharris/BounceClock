//
//  BCLNumberBox.m
//  BounceClock
//
//  Created by Troy HARRIS on 8/22/13.
//  Copyright (c) 2013 Lone Yeti. All rights reserved.
//

#import "BCLNumberBox.h"

@implementation BCLNumberBox

- (id)initWithSize:(CGSize)size {
    UIColor *boxColor = [UIColor clearColor];
    self = [super initWithColor:boxColor size:CGSizeMake(size.width - 10, size.height)];
    if (self) {
        self.name = @"box";
        self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.size];
        self.physicsBody.restitution = 0.3;
        self.physicsBody.categoryBitMask = boxCategory;
        self.physicsBody.collisionBitMask = boxCategory | floorCategory;
        self.falling = YES;
        //self.physicsBody.mass = CGFLOAT_MIN;
        _number = [SKLabelNode labelNodeWithFontNamed:@"AvenirNextCondensed-DemiBold"];
        //_number = [SKLabelNode labelNodeWithFontNamed:@"AvenirNext-UltraLight"];
        _number.fontSize = size.height - 8;
        _number.text = @"";
        _number.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        _number.name = @"number";
        _number.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
        _number.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
        [self addChild:_number];
    }
    return self;
}

- (BOOL)isFalling {
    return _falling;
}

+ (BCLNumberBox *)numberBoxWithNumber:(NSNumber *)number size:(CGSize)size {
    BCLNumberBox *numberBox = [[BCLNumberBox alloc] initWithSize:size];
    numberBox.number.text = [NSString stringWithFormat:@"%d", [number integerValue]];
    numberBox.intNumber = [number unsignedIntegerValue];
    return numberBox;
}

+ (BCLNumberBox *)colonBoxWithSize:(CGSize)size {
    BCLNumberBox *numberBox = [[BCLNumberBox alloc] initWithSize:size];
    numberBox.number.text = @":";
    numberBox.name = @"colon";
    return numberBox;
}


@end
