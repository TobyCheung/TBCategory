//
//  NSString+TBExtension.m
//  TBCategory
//
//  Created by ZhangTianbing on 2017/3/21.
//  Copyright © 2017年 张天兵. All rights reserved.
//

#import "NSString+TBExtension.h"

@implementation NSString (TBExtension)

/**
 截取字符串
 
 @param fromString 起始位置
 @param toString 结束位置
 @return 返回字符串
 */
- (NSArray *)tb_subStringFromString:(NSString *)fromString toString:(NSString *)toString {
    
    if (!fromString || !toString || fromString.length == 0 || toString.length == 0) {
        return nil;
    }
    NSMutableArray *subStringsArray = [[NSMutableArray alloc] init];
    NSString *tempString = self;
    NSRange range = [tempString rangeOfString:fromString];
    while (range.location != NSNotFound) {
        tempString = [tempString substringFromIndex:(range.location + range.length)];
        range = [tempString rangeOfString:toString];
        if (range.location != NSNotFound) {
            [subStringsArray addObject:[tempString substringToIndex:range.location]];
            range = [tempString rangeOfString:fromString];
        } else {
            break;
        }
    }
    return subStringsArray;
}

/**
 删除字符串中重复的部分
 
 @param aString 要查询的字符串
 @param backWard YES:保留最后一个， NO：保留第一个
 @return 返回字符串
 */
- (NSString *)tb_deleteRepeatedString:(NSString *)aString backWard:(BOOL)backWard{
    if ([self containsString:aString]) {
        NSMutableArray *array = (NSMutableArray *)[self componentsSeparatedByString:aString];
        if (array.count > 2) {
            NSString *resultString = [NSString string];
            if (backWard) {
                for (NSInteger i = 0; i < array.count - 1; i++) {
                    resultString = [resultString stringByAppendingString:array[i]];
                }
                resultString = [resultString stringByAppendingString:aString];
                resultString = [resultString stringByAppendingString:array.lastObject];
            } else {
                resultString = [array[0] stringByAppendingString:aString];
                [array removeObjectAtIndex:0];
                for (NSString *str in array) {
                    resultString = [resultString stringByAppendingString:str];
                }
            }
            return resultString;
        } else {
            return self;
        }
    } else {
        return nil;
    }
}


/**
 删除字符串中包含的指定数组中的所有字符串

 @param stringArray 指定字符串数组
 @return 删除指定数组中所有字符串后的字符串
 */
- (NSString *)tb_deleteStringArray:(NSArray *)stringArray {
    NSString *resultString = [[NSString alloc] initWithString:self];
    for (NSString *string in stringArray) {
        resultString = [self tb_deleteString:string];
    }
    return resultString;
}

/**
 删除字符串中的指定字符串

 @param aString 要删除的字符串
 @return 删除指定字符串后的字符串
 */
- (NSString *)tb_deleteString:(NSString *)aString {
    return [self stringByReplacingOccurrencesOfString:aString withString:@""];
}

/**
 Unicode转UTF-8
 
 @param aUnicodeString Unicode string
 @return UTF-8 string
 */
+ (NSString *)tb_replaceUnicode:(NSString *)aUnicodeString {
    
    NSString *tempStr1 = [aUnicodeString stringByReplacingOccurrencesOfString:@"\\u"withString:@"\\U"];
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\""withString:@"\\\""];
    NSString *tempStr3 = [[@"\""stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    
    NSString *returnStr = [NSPropertyListSerialization propertyListFromData:tempData
                                                           mutabilityOption:NSPropertyListImmutable
                                                                     format:NULL
                                                           errorDescription:NULL];
    
    return [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n"withString:@"\n"];
}


/**
 UTF-8转Unicode
 
 @param string UTF-8 string
 @return Unicode string
 */
+ (NSString *)tb_utf8ToUnicode:(NSString *)string {
    
    NSUInteger length = [string length];
    NSMutableString *s = [NSMutableString stringWithCapacity:0];
    
    for (int i = 0;i < length; i++) {
        unichar _char = [string characterAtIndex:i];
        //判断是否为英文和数字
        if (_char <= '9' && _char >='0'){
            [s appendFormat:@"%@",[string substringWithRange:NSMakeRange(i,1)]];
        } else if(_char >='a' && _char <= 'z') {
            [s appendFormat:@"%@",[string substringWithRange:NSMakeRange(i,1)]];
        } else if(_char >='A' && _char <= 'Z') {
            [s appendFormat:@"%@",[string substringWithRange:NSMakeRange(i,1)]];
        } else {
            [s appendFormat:@"\\u%x",[string characterAtIndex:i]];
        }
    }
    return s;
}


/**
 判断字符串中是否包含emoji表情

 @param string 原始字符串
 @return YES/NO
 */
+ (BOOL)tb_stringContainsEmoji:(NSString *)string {
    // 过滤所有表情。returnValue为NO表示不含有表情，YES表示含有表情
    __block BOOL returnValue = NO;
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        
        const unichar hs = [substring characterAtIndex:0];
        // surrogate pair
        if (0xd800 <= hs && hs <= 0xdbff) {
            if (substring.length > 1) {
                const unichar ls = [substring characterAtIndex:1];
                const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                if (0x1d000 <= uc && uc <= 0x1f77f) {
                    returnValue = YES;
                }
            }
        } else if (substring.length > 1) {
            const unichar ls = [substring characterAtIndex:1];
            if (ls == 0x20e3) {
                returnValue = YES;
            }
        } else {
            // non surrogate
            if (0x2100 <= hs && hs <= 0x27ff) {
                returnValue = YES;
            } else if (0x2B05 <= hs && hs <= 0x2b07) {
                returnValue = YES;
            } else if (0x2934 <= hs && hs <= 0x2935) {
                returnValue = YES;
            } else if (0x3297 <= hs && hs <= 0x3299) {
                returnValue = YES;
            } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                returnValue = YES;
            }
        }
    }];
    
    return returnValue;
}


/**
 去除字符串中的emoji表情

 @param string 原始字符串
 @return 去除emoji的表情字符串
 */
+ (NSString *)tb_stringFilterEmoji:(NSString *)string {
    // 过滤所有表情。returnValue为NO表示不含有表情，YES表示含有表情
    __block NSString *resultString = [NSString stringWithString:string];
    
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        
        const unichar hs = [substring characterAtIndex:0];
        // surrogate pair
        if (0xd800 <= hs && hs <= 0xdbff) {
            if (substring.length > 1) {
                const unichar ls = [substring characterAtIndex:1];
                const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                if (0x1d000 <= uc && uc <= 0x1f77f) {
                    //                    returnValue = YES;
                    resultString = [resultString tb_deleteString:substring];
                }
            }
        } else if (substring.length > 1) {
            const unichar ls = [substring characterAtIndex:1];
            if (ls == 0x20e3) {
                //                returnValue = YES;
                resultString = [resultString tb_deleteString:substring];
            }
        } else {
            // non surrogate
            if (0x2100 <= hs && hs <= 0x27ff) {
                //                returnValue = YES;
                resultString = [resultString tb_deleteString:substring];
            } else if (0x2B05 <= hs && hs <= 0x2b07) {
                //                returnValue = YES;
                resultString = [resultString tb_deleteString:substring];
            } else if (0x2934 <= hs && hs <= 0x2935) {
                //                returnValue = YES;
                resultString = [resultString tb_deleteString:substring];
            } else if (0x3297 <= hs && hs <= 0x3299) {
                //                returnValue = YES;
                resultString = [resultString tb_deleteString:substring];
            } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                //                returnValue = YES;
                resultString = [resultString tb_deleteString:substring];
            }
        }
    }];
    
    //    return returnValue;
    return resultString;
}

/**
 是否匹配正则表达式
 
 @param regex 指定正则表达式
 @return 是否匹配
 */
- (BOOL)tb_isValidateByRegex:(NSString *)regex {
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pre evaluateWithObject:self];
}

/**
 获取字符串中匹配指定正则条件的第一个字符串
 
 @param string 原始字符串
 @param regex 正则表达式
 @return 符合条件的第一个字符串
 */
+ (NSString *)tb_stringFrom:(NSString *)string withRegex:(NSString *)regex {
    
    NSError *error;
    NSRegularExpression *regular = [NSRegularExpression
                                  regularExpressionWithPattern:regex
                                  options:0
                                  error:&error];
    if (!error) {
        NSTextCheckingResult *match = [regular firstMatchInString:string
                                                        options:0
                                                          range:NSMakeRange(0, [string length])];
        if (match) {
            NSString *result = [string substringWithRange:match.range];
            NSLog(@"%@",result);
            return result;
        } else {
            return nil;
        }
    } else { // 如果有错误，则把错误打印出来
        NSLog(@"error - %@", error);
        return nil;
    }
    
}


/**
 获取字符串中匹配指定正则条件的所有字符串
 
 @param string 原始字符串
 @param regex 正则表达式
 @return 符合条件的字符串数组
 */
+ (NSArray *)tb_stringArrayFrom:(NSString *)string withRegex:(NSString *)regex {
    
    NSError *error;
    NSRegularExpression *regular = [NSRegularExpression regularExpressionWithPattern:regex
                                                                             options:NSRegularExpressionCaseInsensitive
                                                                               error:&error];
    //对string字符串进行匹配
    NSArray *matches = [regular matchesInString:string
                                        options:0
                                          range:NSMakeRange(0, string.length)];
    //遍历匹配后的每一条记录
    NSMutableArray *matchArray = [NSMutableArray array];
    for (NSTextCheckingResult *match in matches) {
        NSRange range = [match range];
        NSString *mStr = [string substringWithRange:range];
        [matchArray addObject:mStr];
        NSLog(@"%@", mStr);
    }
    return matchArray;
}

@end
