//
//  UIGestureRecognizer+Block.h
//  Test
//
//  Created by dllo on 16/6/23.
//  Copyright © 2016年 xuxiwen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^XXWGestureBlock)(id gestureRecognizer);

@interface UIGestureRecognizer (Block)



/**
 *  使用类方法 初始化 添加手势
 *
 *  @param block 手势回调
 *
 *  @return block 内部 action 
 *
 *
 *  使用 __unsafe_unretained __typeof(self) weakSelf = self;
 *  防止循环引用
 *
 */






+ (instancetype)xxw_gestureRecognizerWithActionBlock:(XXWGestureBlock)block;

@end
