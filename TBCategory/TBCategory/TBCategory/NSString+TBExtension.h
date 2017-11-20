//
//  NSString+TBExtension.h
//  TBCategory
//
//  Created by ZhangTianbing on 2017/3/21.
//  Copyright © 2017年 张天兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TBExtension)

/**
 截取字符串
 
 @param fromString 起始位置
 @param toString 结束位置
 @return 返回字符串
 */
- (NSArray *)tb_subStringFromString:(NSString *)fromString toString:(NSString *)toString;

/**
 删除字符串中重复的部分
 
 @param aString 要查询的字符串
 @param backWard YES:保留最后一个， NO：保留第一个
 @return 返回字符串
 */
- (NSString *)tb_deleteRepeatedString:(NSString *)aString backWard:(BOOL)backWard;

/**
 删除字符串中包含的指定数组中的所有字符串
 
 @param stringArray 指定字符串数组
 @return 删除指定数组中所有字符串后的字符串
 */
- (NSString *)tb_deleteStringArray:(NSArray *)stringArray;

/**
 删除字符串中的指定字符串
 
 @param aString 要删除的字符串
 @return 删除指定字符串后的字符串
 */
- (NSString *)tb_deleteString:(NSString *)aString;

/**
 判断字符串中是否包含emoji表情
 
 @param string 原始字符串
 @return YES/NO
 */
+ (BOOL)tb_stringContainsEmoji:(NSString *)string;

/**
 去除字符串中的emoji表情
 
 @param string 原始字符串
 @return 去除emoji的表情字符串
 */
+ (NSString *)tb_stringFilterEmoji:(NSString *)string;

/**
 Unicode转UTF-8
 
 @param aUnicodeString Unicode string
 @return UTF-8 string
 */
+ (NSString *)tb_replaceUnicode:(NSString *)aUnicodeString;

/**
 UTF-8转Unicode
 
 @param string UTF-8 string
 @return Unicode string
 */
+ (NSString *)tb_utf8ToUnicode:(NSString *)string;

/**
 是否匹配正则表达式
 
 @param regex 指定正则表达式
 @return 是否匹配
 */
- (BOOL)tb_isValidateByRegex:(NSString *)regex;

/**
 获取字符串中匹配指定正则条件的第一个字符串
 
 @param string 原始字符串
 @param regex 正则表达式
 @return 符合条件的第一个字符串
 */
+ (NSString *)tb_stringFrom:(NSString *)string withRegex:(NSString *)regex;

/**
 获取字符串中匹配指定正则条件的所有字符串
 
 @param string 原始字符串
 @param regex 正则表达式
 @return 符合条件的字符串数组
 */
+ (NSArray *)tb_stringArrayFrom:(NSString *)string withRegex:(NSString *)regex;

@end
