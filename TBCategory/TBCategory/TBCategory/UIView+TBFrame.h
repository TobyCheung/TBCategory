//
//  UIView+TBFrame.h
//  UIView_Category
//
//  Created by 张天兵 on 16/5/8.
//  Copyright © 2016年 张天兵. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (TBFrame)

@property (nonatomic, assign) CGFloat tb_width;
@property (nonatomic, assign) CGFloat tb_height;
@property (nonatomic, assign) CGFloat tb_x;
@property (nonatomic, assign) CGFloat tb_y;
@property (nonatomic, assign) CGFloat tb_centerX;
@property (nonatomic, assign) CGFloat tb_centerY;
@property (nonatomic, assign) CGFloat tb_right;
@property (nonatomic, assign) CGFloat tb_bottom;

+ (instancetype)viewFromXib;

@end
