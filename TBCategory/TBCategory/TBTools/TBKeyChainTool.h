//
//  TBKeyChainTool.h
//  TBCategory
//
//  Created by ZhangTianbing on 2017/3/21.
//  Copyright © 2017年 张天兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TBKeyChainTool : NSObject

/** 存储信息到钥匙串 */
+ (void)saveData:(id)data forService:(NSString *)service;
/** 加载钥匙串中的信息 */
+ (id)loadData_ForService:(NSString *)service;
/** 删除钥匙串中的信息 */
+ (void)delete_DataAndkey_ForService:(NSString *)service;

/** 获取设备IDFV */
+ (NSString *)getIDFV;

@end
