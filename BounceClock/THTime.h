//
//  THTime.h
//  clock
//
//  Created by Troy HARRIS on 6/5/13.
//  Copyright (c) 2013 Lone Yeti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface THTime : NSObject

+(NSUInteger)currentHour;
+(NSUInteger)currentMinute;
+(NSUInteger)currentSecond;
+(NSUInteger)currentTwelveHour;
+(NSString *)currentAmOrPm;

+(NSUInteger)currentTenHour;
+(NSUInteger)currentOneHour;
+(NSUInteger)currentTenMinute;
+(NSUInteger)currentOneMinute;

+(NSString *)currentTimeString;

+(NSUInteger)twentyFourToTwelve:(NSUInteger)hour;

+(NSDictionary *)litHours;
+(NSDictionary *)litSeconds;

+(NSDictionary *)binaryElements:(NSUInteger)time;

@end
