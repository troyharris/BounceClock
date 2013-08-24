//
//  BCLNumberBox.h
//  BounceClock
//
//  Created by Troy HARRIS on 8/22/13.
//  Copyright (c) 2013 Lone Yeti. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "BCLNodeGlobals.h"

typedef NS_ENUM(NSInteger, BCLNumberBoxElement) {
    BCLNumberBoxElementHourTen,
    BCLNumberBoxElementHourOne,
    BCLNumberBoxElementMinuteTen,
    BCLNumberBoxElementMinuteOne
};

@interface BCLNumberBox : SKSpriteNode

@property (nonatomic, strong) SKLabelNode *number;
@property NSUInteger intNumber;
@property BCLNumberBoxElement element;
@property (nonatomic, getter = isFalling) BOOL falling;

- (id)initWithSize:(CGSize)size;

+ (BCLNumberBox *)numberBoxWithNumber:(NSNumber *)number size:(CGSize)size;
+ (BCLNumberBox *)colonBoxWithSize:(CGSize)size;

@end
