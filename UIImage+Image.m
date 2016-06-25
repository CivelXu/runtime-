//
//  UIImage+Image.m
//  RunTime
//
//  Created by xuxiwen on 16/6/17.
//  Copyright © 2016年 xuxiwen. All rights reserved.
//

#import "UIImage+Image.h"
#import <objc/runtime.h>

@implementation UIImage (Image)



// 加载内存时调用

+ (void)load
{
    // 交换方法
    
    // 获取 ImageOriginalWithStrName: 方法
    Method imageWithName = class_getClassMethod(self, @selector(ImageOriginalWithStrName:));
    
    // 获取 imageName 方法
    Method imageName = class_getClassMethod(self, @selector(imageNamed:));
    
    // 交换方法地址, 相当于交换实现
    
    method_exchangeImplementations(imageWithName, imageName);
    
}

// 注意 // 这里 返回值是一个函数结果类型 使用instancetype 会产生类型不匹配, 所以使用id
// 不能在改分类UIImage中重写 imageNamed:因为系统会把imageNamed:原来的功能覆盖掉
// 分类中不能调用super本身

+ (id)ImageOriginalWithStrName:(NSString *)name
{
    UIImage *image = [[self ImageOriginalWithStrName:name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    if (image == nil) {
        NSLog(@"加载图片为空...");
    }
    
    return image;
    
}


@end
