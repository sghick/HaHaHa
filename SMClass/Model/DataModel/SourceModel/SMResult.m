//
//  SMResult.m
//  Demo-SMFrameWork
//
//  Created by 丁治文 on 15/8/9.
//  Copyright (c) 2015年 buding. All rights reserved.
//

#import "SMResult.h"
#import "SMJoke.h"

@implementation SMResult

+ (NSDictionary *)classNameMapper {
    NSMutableDictionary *mapper = [NSMutableDictionary dictionaryWithDictionary:[super classNameMapper]];
    [mapper setObject:NSStringFromClass([SMJoke class]) forKey:@"detail"];
    return mapper;
}

@end
