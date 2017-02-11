//
//  NSDate+TBExtension.h
//
//  Created by 张天兵 on 16/5/31.
//  Copyright © 2016年 张天兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (TBExtension)

/** 是否为今年 */
- (BOOL)tb_isThisYear;

/** 是否为今天 */
- (BOOL)tb_isToday;

/** 是否为昨天 */
- (BOOL)tb_isYesterday;

/** 是否为明天 */
- (BOOL)tb_isTomorrow;

@end
