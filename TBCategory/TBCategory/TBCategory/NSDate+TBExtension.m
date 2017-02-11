//
//  NSDate+TBExtension.m
//  百思不得姐
//
//  Created by 张天兵 on 16/5/31.
//  Copyright © 2016年 张天兵. All rights reserved.
//

#import "NSDate+TBExtension.h"

@implementation NSDate (TBExtension)

- (BOOL)tb_isThisYear {

    NSCalendar *calendar = [NSCalendar tb_calendar];
    
    NSInteger selfYear = [calendar component:NSCalendarUnitYear fromDate:self];
    NSInteger nowYear = [calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
    
    return selfYear == nowYear;
}

//- (BOOL)isThisYear {
//
//    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
//    fmt.dateFormat = @"yyyy";
//
//    NSString *selfYear = [fmt stringFromDate:self];
//    NSString *nowYear = [fmt stringFromDate:[NSDate date]];
//
//    return [selfYear isEqualToString:nowYear];
//}

- (BOOL)tb_isToday {
    
    NSCalendar *calendar = [NSCalendar tb_calendar];

    // 获得年月日
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];

    return selfCmps.year == nowCmps.year
    && selfCmps.month == nowCmps.month
    && selfCmps.day == nowCmps.day;
}

//- (BOOL)isToday
//{
//    // 判断self这个日期是否为今天
//    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
//    fmt.dateFormat = @"yyyyMMdd";
//
//    NSString *selfString = [fmt stringFromDate:self];
//    NSString *nowString = [fmt stringFromDate:[NSDate date]];
//
//    return [selfString isEqualToString:nowString];
//}

- (BOOL)tb_isYesterday {

    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyyMMdd";

    NSString *selfString = [fmt stringFromDate:self];
    NSString *nowString = [fmt stringFromDate:[NSDate date]];
    
    NSDate *selfDate = [fmt dateFromString:selfString];
    NSDate *nowDate = [fmt dateFromString:nowString];
    
    NSCalendar *calendar = [NSCalendar tb_calendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmps = [calendar components:unit fromDate:selfDate toDate:nowDate options:0];
    
    return cmps.year == 0
    && cmps.month == 0
    && cmps.day == 1;
    
}

- (BOOL)tb_isTomorrow {
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyyMMdd";
    
    NSString *selfString = [fmt stringFromDate:self];
    NSString *nowString = [fmt stringFromDate:[NSDate date]];
    
    NSDate *selfDate = [fmt dateFromString:selfString];
    NSDate *nowDate = [fmt dateFromString:nowString];
    
    NSCalendar *calendar = [NSCalendar tb_calendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmps = [calendar components:unit fromDate:selfDate toDate:nowDate options:0];
    
    return cmps.year == 0
    && cmps.month == 0
    && cmps.day == -1;
    
}


@end
