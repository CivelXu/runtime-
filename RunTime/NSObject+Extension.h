//
//  NSObject+Extension.h
//  RunTime
//
//  Created by dllo on 16/6/25.
//  Copyright © 2016年 xuxiwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Extension)

- (NSArray *)ignoredNames;
- (void)encode:(NSCoder *)aCoder;
- (void)decode:(NSCoder *)aDecoder;

@end
