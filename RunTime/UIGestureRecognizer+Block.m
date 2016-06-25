//
//  UIGestureRecognizer+Block.m
//  Test
//
//  Created by dllo on 16/6/23.
//  Copyright © 2016年 xuxiwen. All rights reserved.
//

#import "UIGestureRecognizer+Block.h"
#import <objc/runtime.h>

static const int target_key;
@implementation UIGestureRecognizer (Block)


+ (instancetype)xxw_gestureRecognizerWithActionBlock:(XXWGestureBlock)block {
    return [[self alloc]initWithActionBlock:block];
}

- (instancetype)initWithActionBlock:(XXWGestureBlock)block {
    self = [self init];
    [self addActionBlock:block];
    [self addTarget:self action:@selector(invoke:)];
    return self;
}




/**
 * Returns the value associated with a given object for a given key.
 *
 * @param object The source object for the association.
 * @param key The key for the association.
 *
 * @return The value associated with the key \e key for \e object.
 *
 * @see objc_setAssociatedObject
 */





//OBJC_EXPORT id objc_getAssociatedObject(id object, const void *key)
//__OSX_AVAILABLE_STARTING(__MAC_10_6, __IPHONE_3_1);




- (void)addActionBlock:(XXWGestureBlock)block {
    if (block) {
        objc_setAssociatedObject(self, &target_key, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
}

- (void)invoke:(id)sender {
    XXWGestureBlock block = objc_getAssociatedObject(self, &target_key);
    if (block) {
        block(sender);
    }
}
@end
