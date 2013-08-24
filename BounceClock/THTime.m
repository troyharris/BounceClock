//
//  THTime.m
//  clock
//
//  Created by Troy HARRIS on 6/5/13.
//  Copyright (c) 2013 Lone Yeti. All rights reserved.
//

#import "THTime.h"

@implementation THTime

+ (NSUInteger)currentHour {
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSHourCalendarUnit fromDate:now];
    return [components hour];
}

+ (NSUInteger)currentMinute {
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSMinuteCalendarUnit fromDate:now];
    return [components minute];
}

+ (NSUInteger)currentSecond {
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSSecondCalendarUnit fromDate:now];
    return [components second];
}

+ (NSUInteger)currentTwelveHour {
    return [self twentyFourToTwelve:[self currentHour]];
}

+ (NSUInteger)twentyFourToTwelve:(NSUInteger)hour {
    NSUInteger twelveHour = hour > 12 ? hour - 12 : hour;
    if (twelveHour == 0) {
        twelveHour = 12;
    }
    return twelveHour;
}

+ (NSString *)currentAmOrPm {
    return ([self currentHour] > 11) ? @"pm" : @"am";
}

+(NSUInteger)currentTenHour {
    NSInteger hour = (NSInteger)[self currentTwelveHour];
    if ((hour - 10) >= 0) {
        return (NSUInteger)hour / 10;
    } else {
        return 0;
    }
}

+(NSUInteger)currentOneHour {
    NSUInteger hour = [self currentTwelveHour];
    return hour >= 10 ? hour % 10 : hour;
}

+(NSUInteger)currentTenMinute {
    NSInteger hour = (NSInteger)[self currentMinute];
    if ((hour - 10) >= 0) {
        return (NSUInteger)hour / 10;
    } else {
        return 0;
    }
}

+(NSUInteger)currentOneMinute {
    NSUInteger hour = [self currentMinute];
    return hour >= 10 ? hour % 10 : hour;
}

+ (NSString *)currentTimeString {
    NSUInteger currentMinute = [self currentMinute];
    NSString *minStr = currentMinute < 10 ? [NSString stringWithFormat:@"0%d", currentMinute] : [NSString stringWithFormat:@"%d", currentMinute];
    return [NSString stringWithFormat:@"%d:%@ %@", [self currentTwelveHour], minStr, [self currentAmOrPm]];
}

+ (NSDictionary *)litHours {
    NSNumber *nope = [NSNumber numberWithBool:NO];
    NSNumber *yep = [NSNumber numberWithBool:YES];
    NSDictionary *hoursTemp = [NSDictionary dictionaryWithObjectsAndKeys:nope,@"20",nope,@"10",nope,@"8",nope,@"4",nope,@"2",nope,@"1", nil];
    NSMutableDictionary *hours = [[NSMutableDictionary alloc] initWithDictionary:hoursTemp];
    NSUInteger hour = [self currentHour];
    if (hour >= 20) {
        [hours setObject:yep forKey:@"20"];
        hour = hour - 20;
    }
    if (hour >= 10) {
       [hours setObject:yep forKey:@"10"];
        hour = hour - 10;
    }
    if (hour >= 8) {
        [hours setObject:yep forKey:@"8"];
        hour = hour - 8;
    }
    if (hour >= 4) {
        [hours setObject:yep forKey:@"4"];
        hour = hour - 4;
    }
    if (hour >= 2) {
        [hours setObject:yep forKey:@"2"];
        hour = hour - 2;
    }
    if (hour >= 1) {
        [hours setObject:yep forKey:@"1"];
    }
    return hours;
}

+ (NSDictionary *)litSeconds {
    NSNumber *nope = [NSNumber numberWithBool:NO];
    NSNumber *yep = [NSNumber numberWithBool:YES];
    NSDictionary *secTemp = [NSDictionary dictionaryWithObjectsAndKeys:nope,@"40",nope,@"20",nope,@"10",nope,@"8",nope,@"4",nope,@"2",nope,@"1", nil];
    NSMutableDictionary *sec = [[NSMutableDictionary alloc] initWithDictionary:secTemp];
    NSUInteger second = [self currentSecond];
    //NSUInteger hour = 21;
    if (second >= 40) {
        [sec setObject:yep forKey:@"40"];
        second = second - 40;
    }
    if (second >= 20) {
        [sec setObject:yep forKey:@"20"];
        second = second - 20;
    }
    if (second >= 10) {
        [sec setObject:yep forKey:@"10"];
        second = second - 10;
    }
    if (second >= 8) {
        [sec setObject:yep forKey:@"8"];
        second = second - 8;
    }
    if (second >= 4) {
        [sec setObject:yep forKey:@"4"];
        second = second - 4;
    }
    if (second >= 2) {
        [sec setObject:yep forKey:@"2"];
        second = second - 2;
    }
    if (second >= 1) {
        [sec setObject:yep forKey:@"1"];
    }
    return sec;
}

+ (NSDictionary *)binaryElements:(NSUInteger)time {
    NSNumber *nope = [NSNumber numberWithBool:NO];
    NSNumber *yep = [NSNumber numberWithBool:YES];
    NSDictionary *template = [NSDictionary dictionaryWithObjectsAndKeys:nope,@"40",nope,@"20",nope,@"10",nope,@"8",nope,@"4",nope,@"2",nope,@"1", nil];
    NSMutableDictionary *elements = [[NSMutableDictionary alloc] initWithDictionary:template];
    //NSUInteger hour = 21;
    if (time >= 40) {
        [elements setObject:yep forKey:@"40"];
        time = time - 40;
    }
    if (time >= 20) {
        [elements setObject:yep forKey:@"20"];
        time = time - 20;
    }
    if (time >= 10) {
        [elements setObject:yep forKey:@"10"];
        time = time - 10;
    }
    if (time >= 8) {
        [elements setObject:yep forKey:@"8"];
        time = time - 8;
    }
    if (time >= 4) {
        [elements setObject:yep forKey:@"4"];
        time = time - 4;
    }
    if (time >= 2) {
        [elements setObject:yep forKey:@"2"];
        time = time - 2;
    }
    if (time >= 1) {
        [elements setObject:yep forKey:@"1"];
    }
    return elements;
}

@end
