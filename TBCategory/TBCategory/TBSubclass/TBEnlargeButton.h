//
//  TBEnlargeButton.h
//  TBCategory
//
//  Created by ZhangTianbing on 2017/4/26.
//  Copyright © 2017年 张天兵. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TBEnlargeButton : UIButton

/**
 按钮创建
 */
+ (instancetype)button;

/**
 扩大按钮点击范围
 */
- (void)setEnlargeEdgeTop:(CGFloat)top left:(CGFloat)left bottom:(CGFloat)bottom right:(CGFloat)right;


@end
