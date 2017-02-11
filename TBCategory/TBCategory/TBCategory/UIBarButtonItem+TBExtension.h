//
//  UIBarButtonItem+TBExtension.h
//  百思不得姐
//
//  Created by 张天兵 on 16/5/26.
//  Copyright © 2016年 张天兵. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (TBExtension)

+ (instancetype)itemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action;

@end
