//
//  NSObject+DictionaryToModel.m
//  RunTime
//
//  Created by xuxiwen on 16/6/18.
//  Copyright © 2016年 xuxiwen. All rights reserved.
//

#import "NSObject+DictionaryToModel.h"

@implementation NSObject (DictionaryToModel)



+ (void)transformToModelByDictionary:(NSDictionary *)dict
{
    
    // 根据类别拼接属性字符串代码
    NSMutableString *str = [NSMutableString string];
    
    // 遍历字典,把字典中的所有key取出来;生成对应的属性代码
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
       
        // 对各类新进行分类, 抽取出来
        
        NSString *type;
        
        // 需要 理解 系统底层 数据结构类型
        // 可以自行断点查看 各类型底层类型
        
        if ([obj isKindOfClass:NSClassFromString(@"__NSCFString")]) {
            type = @"NSString";
        } else if ([obj isKindOfClass:NSClassFromString(@"__NSArrayI")])
        {
            type = @"NSArray";
        } else if ([obj isKindOfClass:NSClassFromString(@"__NSArrayM")])
        {
            type = @"NSMutableArray";
        }
        else if ([obj isKindOfClass:NSClassFromString(@"__NSCFNumber")])
        {
            type = @"NSNumber";
        } else if ([obj isKindOfClass:NSClassFromString(@"__NSDictionaryI")])
        {
            type = @"NSDictionary";
        } else if ([obj isKindOfClass:NSClassFromString(@"__NSDictionaryM")])
        {
            type = @"NSMutableDictionary";
        }
        
        
        // 属性字符串
        NSString *property;
        if ([type containsString:@"NS"]) {
            property = [NSString stringWithFormat:@"@property (nonatomic, strong) %@ *%@", type, key];
        }
        else
        {
             property = [NSString stringWithFormat:@"@property (nonatomic, assign) %@ %@", type, key];
        }
        
        // 每生成一对属性字符串 就自动换行
        [str appendFormat:@"\n%@\n", property];
        
    }];
    
    // 打印出拼接的字符串
    NSLog(@"对应属性 -> %@", str);
    
    
}


@end
