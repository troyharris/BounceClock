//
//  MyScene.m
//  BounceClock
//
//  Created by Troy HARRIS on 8/22/13.
//  Copyright (c) 2013 Lone Yeti. All rights reserved.
//

#import "MyScene.h"
#import "BCLNumberBox.h"
#import "BCLFloorSegment.h"
#import "THTime.h"
#import "BCLFloater.h"

@interface MyScene ()

@property CGFloat boxWidth;
@property CGFloat boxHeight;
@property CGFloat colonWidth;
@property CGFloat colonGap;
@property CGFloat hourTenColumn;
@property CGFloat hourOneColumn;
@property CGFloat colonColumn;
@property CGFloat minuteTenColumn;
@property CGFloat minuteOneColumn;
@property CGFloat floorY;
@property BOOL physical;
@property BOOL backgroundUpTint;

@end

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        _boxWidth = CGRectGetWidth(self.frame) / 5;
        _boxHeight = _boxWidth * 2;
        _colonWidth = _boxWidth / 2;
        _colonGap = _colonWidth * 1.5;
        _hourTenColumn = (_boxWidth / 2) + (_colonWidth / 2);
        _hourOneColumn = _hourTenColumn + _boxWidth;
        _colonColumn = _hourOneColumn + _colonGap;
        _minuteTenColumn = _colonColumn + _colonGap;
        _minuteOneColumn = _minuteTenColumn + _boxWidth;
        _floorY = CGRectGetMidY(self.frame) / 1.5;
        _physical = YES;
        
        self.physicsWorld.gravity = CGPointMake(0, -2.0);
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        /*
        SKSpriteNode *floor = [[SKSpriteNode alloc] initWithColor:[UIColor clearColor] size:CGSizeMake(CGRectGetWidth(self.frame), 4)];
        floor.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) / 1.5);
        floor.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:floor.size];
        floor.physicsBody.dynamic = NO;
        [self addChild:floor];
        
        BCLNumberBox *numberBox = [BCLNumberBox numberBoxWithNumber:@8 size:CGSizeMake(CGRectGetWidth(self.frame) / 5, CGRectGetWidth(self.frame) / 2.5)];
        numberBox.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMaxY(self.frame));
        [self addChild:numberBox];
         */
        [self createBackground];
        [self makeFloor];
        [self makeFloaters];
        [self makeNumbers];
        [self startClockTimer];
    }
    return self;
}

-(void)makeFloor {
    _floorHourTen = [BCLFloorSegment floorSegmentWithWidth:_boxWidth position:CGPointMake(_hourTenColumn, _floorY)];
    _floorHourOne = [BCLFloorSegment floorSegmentWithWidth:_boxWidth position:CGPointMake(_hourOneColumn, _floorY)];
    _floorColon = [BCLFloorSegment floorSegmentWithWidth:_colonWidth position:CGPointMake(_colonColumn, _floorY)];
    _floorMinuteTen = [BCLFloorSegment floorSegmentWithWidth:_boxWidth position:CGPointMake(_minuteTenColumn, _floorY)];
    _floorMinuteOne = [BCLFloorSegment floorSegmentWithWidth:_boxWidth position:CGPointMake(_minuteOneColumn, _floorY)];
    [self addChild:_floorHourTen];
    [self addChild:_floorHourOne];
    [self addChild:_floorColon];
    [self addChild:_floorMinuteTen];
    [self addChild:_floorMinuteOne];
}

-(void)makeNumbers {
    [self makeHourTen];
    [self makeHourOne];
    [self makeColon];
    [self makeMinuteTen];
    [self makeMinuteOne];
}

- (void)makeHourTen {
    [_hourTen removeFromParent];
    if (!self.floorHourTen.isPhysical) {
        [self.floorHourTen addPhysics];
    }
    _hourTen = [BCLNumberBox numberBoxWithNumber:[NSNumber numberWithInteger:[THTime currentTenHour]] size:CGSizeMake(_boxWidth, _boxHeight)];
    _hourTen.element = BCLNumberBoxElementHourTen;
    if (_hourTen.intNumber == 0) {
        _hourTen.number.text = @"";
    }
    _hourTen.position = CGPointMake(_hourTenColumn, CGRectGetMaxY(self.frame));
    [self addChild:_hourTen];
}

- (void)makeHourOne {
    [_hourOne removeFromParent];
    if (!self.floorHourOne.isPhysical) {
        [self.floorHourOne addPhysics];
    }
    _hourOne = [BCLNumberBox numberBoxWithNumber:[NSNumber numberWithInteger:[THTime currentOneHour]] size:CGSizeMake(_boxWidth, _boxHeight)];
    _hourOne.element = BCLNumberBoxElementHourOne;
    _hourOne.position = CGPointMake(_hourOneColumn, CGRectGetMaxY(self.frame));
    [self addChild:_hourOne];
}

- (void)makeColon {
    _colon = [BCLNumberBox colonBoxWithSize:CGSizeMake(_colonWidth, _boxHeight)];
    _colon.position = CGPointMake(_colonColumn, CGRectGetMaxY(self.frame));
    [self addChild:_colon];
}

- (void)makeMinuteTen {
    [_minuteTen removeFromParent];
    if (!self.floorMinuteTen.isPhysical) {
        [self.floorMinuteTen addPhysics];
    }
    if (!self.floorColon.isPhysical) {
        [self.floorColon addPhysics];
    }
    _minuteTen = [BCLNumberBox numberBoxWithNumber:[NSNumber numberWithInteger:[THTime currentTenMinute]] size:CGSizeMake(_boxWidth, _boxHeight)];
    _minuteTen.element = BCLNumberBoxElementMinuteTen;
    _minuteTen.position = CGPointMake(_minuteTenColumn, CGRectGetMaxY(self.frame));
    [self addChild:_minuteTen];
}

- (void)makeMinuteOne {
    [self.minuteOne removeFromParent];
    if (!self.floorMinuteOne.isPhysical) {
        [self.floorMinuteOne addPhysics];
    }
    [self.floorMinuteOne addPhysics];
    _minuteOne = [BCLNumberBox numberBoxWithNumber:[NSNumber numberWithInteger:[THTime currentOneMinute]] size:CGSizeMake(_boxWidth, _boxHeight)];
    _minuteOne.element = BCLNumberBoxElementMinuteOne;
    _minuteOne.position = CGPointMake(_minuteOneColumn, CGRectGetMaxY(self.frame));
    [self addChild:_minuteOne];
}

-(void)startClockTimer {
    self.clockTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(checkForClockChanges) userInfo:nil repeats:YES];
}

-(void)checkForClockChanges {
    /*
    if (self.background.colorBlendFactor == 0) {
        self.background.color = [BCLNodeGlobals randomColor];
        self.background.colorBlendFactor = 0.01;
    } else if (self.background.colorBlendFactor == 1) {
        self.background.colorBlendFactor -= 0.01;
    } else {
        int rand = arc4random_uniform(100);
        if (rand >= 50) {
            self.background.colorBlendFactor += 0.01;
        } else {
            self.background.colorBlendFactor -= 0.01;
        }
    }
     */
    NSLog(@"Background going up? %@ Tint level %f", self.backgroundUpTint ? @"YES" : @"NO", self.background.colorBlendFactor);
    
    NSUInteger nowMinuteOne = [THTime currentOneMinute];
    NSUInteger nowMinuteTen = [THTime currentTenMinute];
    NSUInteger nowHourOne = [THTime currentOneHour];
    NSUInteger nowHourTen = [THTime currentTenHour];
    
    BOOL change = NO;
    if (nowMinuteOne != self.minuteOne.intNumber) {
        [self.floorMinuteOne removePhysics];
        self.minuteOne.falling = YES;
        change = YES;
    }
    if (nowMinuteTen != self.minuteTen.intNumber) {
        //NSLog(@"MinuteOne is falling: %@", self.minuteOne.isFalling ? @"YES" : @"NO");
        [self.floorColon removePhysics];
        [self.floorMinuteTen removePhysics];
        self.minuteTen.falling = YES;
        change = YES;
    }
    if (nowHourOne != self.hourOne.intNumber) {
        [self.floorHourOne removePhysics];
        self.hourOne.falling = YES;
        change = YES;
    }
    if (nowHourTen != self.hourTen.intNumber) {
        [self.floorHourTen removePhysics];
        self.hourTen.falling = YES;
        change = YES;
    }
    
    if (!change && !self.colon.physicsBody.affectedByGravity) {
        self.colon.name = @"colon";
        self.colon.physicsBody.affectedByGravity = YES;
    }
    if (change && self.colon.physicsBody.affectedByGravity) {
        self.colon.name = @"restfulColon";
        self.colon.physicsBody.affectedByGravity = NO;
    }
}

- (void)makeFloaters {
    int maxSize = (int)CGRectGetWidth(self.frame) / 2;
    int minSize = maxSize / 5;
    for (int i = 0; i < 21; i++) {
        BCLFloater *floater = [BCLFloater floaterOfRandomSizeWithMaxWidth:maxSize minWidth:minSize];
        floater.position = CGPointMake(arc4random_uniform((int)CGRectGetMaxX(self.frame)), arc4random_uniform((int)CGRectGetMaxY(self.frame)));
        [self addChild:floater];
    }
}

-(void)createBackground {
    self.background = [[SKSpriteNode alloc] initWithImageNamed:@"BCLbg1"];
    self.background.size = CGSizeMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    self.background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    self.background.name = @"background";
    self.background.color = [BCLNodeGlobals randomColor];
    self.background.colorBlendFactor = 0.1;
    self.backgroundUpTint = YES;
    [self addChild:self.background];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    if (self.physical) {
        self.physical = NO;
        [self.floorMinuteOne removePhysics];
    } else {
        self.physical = YES;
        [self.floorMinuteOne addPhysics];
    }
    for (UITouch *touch in touches) {
        /*
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        sprite.position = location;
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:sprite];
         */
    }
}

-(void)update:(CFTimeInterval)currentTime {
    [self enumerateChildNodesWithName:@"background" usingBlock:^(SKNode *node, BOOL *stop) {
        SKSpriteNode *spriteNode = (SKSpriteNode *)node;
        if (spriteNode.colorBlendFactor <= 0) {
            spriteNode.color = [BCLNodeGlobals randomColor];
            spriteNode.colorBlendFactor += 0.0001;
            self.backgroundUpTint = YES;
        } else if (spriteNode.colorBlendFactor >= 1) {
            spriteNode.colorBlendFactor -= 0.0001;
            self.backgroundUpTint = NO;
        } else {
            if (self.backgroundUpTint) {
                spriteNode.colorBlendFactor += 0.0001;
            } else {
                spriteNode.colorBlendFactor -= 0.0001;
            }
        }
    }];
    
    /* Called before each frame is rendered */
    [self enumerateChildNodesWithName:@"floater" usingBlock:^(SKNode *node, BOOL *stop) {
        NSUInteger shouldForce = arc4random_uniform(10);
        if (shouldForce == 5) {
            NSUInteger randomForceX = arc4random_uniform(200);
            CGFloat randomFloatX = ((CGFloat)randomForceX / 100.0) - 1.0;
            randomFloatX = randomFloatX * 10;
            NSUInteger randomForceY = arc4random_uniform(200);
            CGFloat randomFloatY = ((CGFloat)randomForceY / 100.0) - 1.0;
            randomFloatY = randomFloatY * 10;
            [node.physicsBody applyForce:CGVectorMake(randomFloatX, randomFloatY)];
        }
    }];
   
    [self enumerateChildNodesWithName:@"colon" usingBlock:^(SKNode *node, BOOL *stop) {
        if (node.physicsBody.isResting) {
            node.name = @"restfulColon";
            if (node.physicsBody.affectedByGravity) {
                node.physicsBody.affectedByGravity = NO;
                node.physicsBody.mass = 1000;
            }
            *stop = YES;
        }
    }];
    
   // [self enumerateChildNodesWithName:@"restfulColon" usingBlock:^(SKNode *, BOOL *stop) {
   //     if (self.floorCo)
   // }];
    [self enumerateChildNodesWithName:@"box" usingBlock:^(SKNode *node, BOOL *stop) {
        BCLNumberBox *box = (BCLNumberBox *)node;
        if (box.physicsBody.isResting) {
            box.falling = NO;
        }
        if (node.position.y < CGRectGetMinY(self.frame)) {
            switch (box.element) {
                case BCLNumberBoxElementHourTen: {
                    [self makeHourTen];
                    break;
                }
                case BCLNumberBoxElementHourOne: {
                    [self makeHourOne];
                    break;
                }
                case BCLNumberBoxElementMinuteTen: {
                    [self makeMinuteTen];
                }
                case BCLNumberBoxElementMinuteOne: {
                    [self makeMinuteOne];
                }
                default: {
                    break;
                }
            }
        }
    }];
}

@end
