//
//  NSString+TBSizeForFile.m
//
//  Created by 张天兵 on 16/5/29.
//  Copyright © 2016年 张天兵. All rights reserved.
//

#import "NSString+TBSizeForFile.h"

@implementation NSString (TBSizeForFile)

- (unsigned long long)fileSize {
    // 总大小
    unsigned long long size = 0;
    // 文件管理者
    NSFileManager *mgr = [NSFileManager defaultManager];
    // 是否为文件夹
    BOOL isDirectory = NO;
    // 文件是否存在
    BOOL exists = [mgr fileExistsAtPath:self isDirectory:&isDirectory];
    if (!exists) return size;
    
    if (isDirectory) { //是文件夹
        // 文件夹迭代器
        NSDirectoryEnumerator *enumerator = [mgr enumeratorAtPath:self];
        for (NSString *subpath in enumerator) {
            // 全路径
            NSString *fullPath = [self stringByAppendingPathComponent:subpath];
            // 累加文件大小
            size += [mgr attributesOfItemAtPath:fullPath error:nil].fileSize;
        }
    }else { //文件
        size = [mgr attributesOfItemAtPath:self error:nil].fileSize;
    }
    
    return size;
}



@end
