//
//  Dog.m
//  RunTime
//
//  Created by xuxiwen on 16/6/17.
//  Copyright © 2016年 xuxiwen. All rights reserved.
//

#import "Dog.h"
#import <objc/runtime.h>

@implementation Dog


- (void)run
{
    NSLog(@"一只狗正在奔跑。。。。");
}

+ (void)eat
{
    NSLog(@"一只狗正在吃。。。。");

}



// void(*)()
// 默认方法 都有两个隐式参数

void jump (id self, SEL sel)
{
    NSLog(@" eat ...... %@ --- %@  ", self, NSStringFromSelector(sel));
}


// 当一个对象调用未实现的方法,会调用这个方法处理,并且会把这个对应方法列表传过来
// 所以动态添加方法, 我们可以在这里做判断, 为我们未实现的方法动态添加自己的方法.


+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    if (sel == @selector(jump)) {
        
        // <#__unsafe_unretained Class cls#>  参数1 给哪个类添加方法
        // <#SEL name#>                       参数2 添加放啊编号
        // <#IMP imp#>                        参数3 添加方法函数实现 (函数地址)
        // <#const char *types#>    参数4 函数的类型 (返回值 + 参数类型) v:void @:对象-> self :表示SEL -> _cmd
        
        class_addMethod(self, @selector(jump), jump, "v@:");
    }
    
    return [super resolveInstanceMethod:sel];
}


@end
