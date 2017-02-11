//
//  NSCalendar+TBExtension.m
//  百思不得姐
//
//  Created by 张天兵 on 16/5/31.
//  Copyright © 2016年 张天兵. All rights reserved.
//

#import "NSCalendar+TBExtension.h"

@implementation NSCalendar (TBExtension)

+ (instancetype)tb_calendar {

    if ([NSCalendar respondsToSelector:@selector(calendarWithIdentifier:)]) {
        return [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    } else {
        return [NSCalendar currentCalendar];
    }
}

@end
