//
//  TBKeyChainTool.m
//  TBCategory
//
//  Created by ZhangTianbing on 2017/3/21.
//  Copyright © 2017年 张天兵. All rights reserved.
//

#import "TBKeyChainTool.h"
#import <UIKit/UIKit.h>

@implementation TBKeyChainTool

/**
 获取设备IDFV
 
 @return IDFV（对应于设备和应用开发商的混合唯一标识）
 */
+ (NSString *)getIDFV {
    
    NSString *IDFV = (NSString *)[self loadData_ForService:@"IDFV"];
    
    if (!IDFV || [IDFV isEqualToString:@""]) {
        IDFV = [UIDevice currentDevice].identifierForVendor.UUIDString;
        [self saveData:IDFV forService:@"IDFV"];
    }
    
    return IDFV;
}

/**
 存储数据到钥匙串
 
 @param data 要存储的数据
 @param service 数据key值
 */
+ (void)saveData:(id)data forService:(NSString *)service {
    //Get search dictionary
    NSMutableDictionary *keychainQuery = [self getKeychainQuery_ForService:service];
    //Delete old item before add new item
    SecItemDelete((CFDictionaryRef)keychainQuery);
    //Add new object to search dictionary(Attention:the data format)
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(id)kSecValueData];
    //Add item to keychain with the search dictionary
    SecItemAdd((CFDictionaryRef)keychainQuery, NULL);
}


/**
 加载钥匙串中的数据
 
 @param service 数据key值
 @return key对应的数据
 */
+ (id)loadData_ForService:(NSString *)service {
    id data = nil;
    NSMutableDictionary *keychainQuery = [self getKeychainQuery_ForService:service];
    //Configure the search setting
    //Since in our simple case we are expecting only a single attribute to be returned (the password) we can set the attribute kSecReturnData to kCFBooleanTrue
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    [keychainQuery setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
        @try {
            data = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
        } @catch (NSException *e) {
            NSLog(@"Unarchive of %@ failed: %@", service, e);
        } @finally {
        }
    }
    if (keyData)
        CFRelease(keyData);
    return data;
}


/**
 删除钥匙串中的信息
 
 @param service 数据key值
 */
+ (void)delete_DataAndkey_ForService:(NSString *)service {
    NSMutableDictionary *keychainQuery = [self getKeychainQuery_ForService:service];
    SecItemDelete((CFDictionaryRef)keychainQuery);
}


/**
 获取钥匙串查询对象
 
 @param service 数据key值
 @return 数据key值对应的查询对象
 */
+ (NSMutableDictionary *)getKeychainQuery_ForService:(NSString *)service {
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (id)kSecClassGenericPassword,(id)kSecClass,
            service, (id)kSecAttrService,
            service, (id)kSecAttrAccount,
            (id)kSecAttrAccessibleAfterFirstUnlock,(id)kSecAttrAccessible,
            nil];
}


@end
