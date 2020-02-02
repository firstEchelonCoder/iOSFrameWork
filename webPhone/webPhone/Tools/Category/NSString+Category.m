//
//  NSString+Category.m
//  webPhone
//
//  Created by ZXX on 2020/2/2.
//  Copyright © 2020 zxx. All rights reserved.
//

#import "NSString+Category.h"


@implementation NSString (Category)

+ (NSString *)SafeString:(NSString *)str {
    if (![str isKindOfClass:[NSString class]] || [str isKindOfClass:[NSNull class]] || (!str)) {
        return @"";
    }else {
        return str;
    }
}

@end
