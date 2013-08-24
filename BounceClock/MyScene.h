//
//  MyScene.h
//  BounceClock
//

//  Copyright (c) 2013 Lone Yeti. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "BCLNodeGlobals.h"

@class BCLNumberBox;
@class BCLFloorSegment;

@interface MyScene : SKScene

@property (nonatomic, strong) BCLNumberBox *hourTen;
@property (nonatomic, strong) BCLNumberBox *hourOne;
@property (nonatomic, strong) BCLNumberBox *minuteTen;
@property (nonatomic, strong) BCLNumberBox *minuteOne;
@property (nonatomic, strong) BCLNumberBox *colon;
@property (nonatomic, strong) BCLFloorSegment *floorHourTen;
@property (nonatomic, strong) BCLFloorSegment *floorHourOne;
@property (nonatomic, strong) BCLFloorSegment *floorColon;
@property (nonatomic, strong) BCLFloorSegment *floorMinuteTen;
@property (nonatomic, strong) BCLFloorSegment *floorMinuteOne;
@property (nonatomic, strong) NSTimer *clockTimer;
@property (nonatomic, strong) SKSpriteNode *background;

@end
