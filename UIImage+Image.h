//
//  UIImage+Image.h
//  RunTime
//
//  Created by xuxiwen on 16/6/17.
//  Copyright © 2016年 xuxiwen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Image)



// 创建一个类方法

// 传入 一个字符串 -> 返回 不被 渲染的原始图片

+ (id)ImageOriginalWithStrName:(NSString *)name;
@end
