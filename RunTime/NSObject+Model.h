//
//  NSObject+Model.h
//  RunTime
//
//  Created by dllo on 16/6/24.
//  Copyright © 2016年 xuxiwen. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol DictionaryDelegate <NSObject>

- (NSDictionary *)arrayContainModelClass;

@end

@interface NSObject (Model)



+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary;

@end
