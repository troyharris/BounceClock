//
//  BCLNodeGlobals.h
//  BounceClock
//
//  Created by Troy HARRIS on 8/23/13.
//  Copyright (c) 2013 Lone Yeti. All rights reserved.
//

#import <Foundation/Foundation.h>

static const uint32_t boxCategory     =  0x1 << 0;
static const uint32_t floorCategory   =  0x1 << 1;
static const uint32_t floaterCategory =  0x1 << 2;
static const uint32_t noneCategory    =  0x1 << 3;

@interface BCLNodeGlobals : NSObject

+ (UIColor *)randomColor;

@end
