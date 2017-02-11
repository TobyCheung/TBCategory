//
//  UIImageView+TBSetHead.m
//
//  Created by 张天兵 on 16/6/4.
//  Copyright © 2016年 张天兵. All rights reserved.
//

#import "UIImageView+TBSetHead.h"
#import <UIImageView+WebCache.h>

@implementation UIImageView (TBSetHead)

/** 设置头像 */
- (void)tb_setHead:(NSString *)url {

    [self tb_setCircleHead:url];
//    [self tb_setRectHead:url];
}

/** 圆形头像 */
- (void)tb_setCircleHead:(NSString *)url {
    
    UIImage *placeholder = [UIImage tb_circleImage:@"defaultUserIcon"];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        // 加载失败就显示占位图
        if (image == nil) return;
        // 加载成功就作圆形处理
        self.image = [image tb_circleImage];
    }];

}

/** 方形头像 */
- (void)tb_setRectHead:(NSString *)url {
    
    UIImage *placeholder = [UIImage imageNamed:@"defaultUserIcon"];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder];
    
}


@end
