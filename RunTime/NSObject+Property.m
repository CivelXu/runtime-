//
//  NSObject+Property.m
//  RunTime
//
//  Created by xuxiwen on 16/6/18.
//  Copyright © 2016年 xuxiwen. All rights reserved.
//

#import "NSObject+Property.h"
#import <objc/runtime.h>

static const char *key = "name";

@implementation NSObject (Property)

- (NSString *)name
{
    // 根据关联的key,获取关联的值
    return objc_getAssociatedObject(self, key);
}


- (void)setName:(NSString *)name
{
    // 参数1 <#id object#> 给那个对象添加关联
    // 参数2 <#const void *key#> 关联的key 值,通过这个key 值获取
    // 参数3 <#id value#> 关联的value
    // 参数4 <#objc_AssociationPolicy policy#> 关联的策略
    
    
//    typedef OBJC_ENUM(uintptr_t, objc_AssociationPolicy) {
//        OBJC_ASSOCIATION_ASSIGN = 0,           /**< Specifies a weak reference to the associated object. */
//        OBJC_ASSOCIATION_RETAIN_NONATOMIC = 1, /**< Specifies a strong reference to the associated object.
//                                                *   The association is not made atomically. */
//        OBJC_ASSOCIATION_COPY_NONATOMIC = 3,   /**< Specifies that the associated object is copied.
//                                                *   The association is not made atomically. */
//        OBJC_ASSOCIATION_RETAIN = 01401,       /**< Specifies a strong reference to the associated object.
//                                                *   The association is made atomically. */
//        OBJC_ASSOCIATION_COPY = 01403          /**< Specifies that the associated object is copied.
//                                                *   The association is made atomically. */
//    };
    
    objc_setAssociatedObject(self, key, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


@end
