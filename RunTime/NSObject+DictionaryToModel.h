//
//  NSObject+DictionaryToModel.h
//  RunTime
//
//  Created by xuxiwen on 16/6/18.
//  Copyright © 2016年 xuxiwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (DictionaryToModel)


// 自动打印属性字符串

+ (void)transformToModelByDictionary:(NSDictionary *)dict;

@end
