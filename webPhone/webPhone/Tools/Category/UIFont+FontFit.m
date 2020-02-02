//
//  UIFont+FontFit.m
//  webPhone
//
//  Created by ZXX on 2020/1/17.
//  Copyright © 2020 zxx. All rights reserved.
//

#import "UIFont+FontFit.h"
#import <QMUIRuntime.h>

//防止横屏
#define unit (SCREEN_WIDTH < SCREEN_HEIGHT ? SCREEN_WIDTH : SCREEN_HEIGHT) / 375.0

@implementation UIFont (FontFit)

+ (void)load {
    // 获取替换后的类方法
    Method newMethod = class_getClassMethod([self class], @selector(adjustFont:));
    // 获取替换前的类方法
    Method method = class_getClassMethod([self class], @selector(systemFontOfSize:));
    
    Method newMethod2 = class_getClassMethod([self class], @selector(adjustFont:WithName:));
    Method method2 = class_getClassMethod([self class], @selector(fontWithName:size:));
    
    // 然后交换类方法，交换两个方法的IMP指针，(IMP代表了方法的具体的实现）
    method_exchangeImplementations(newMethod, method);
    
    method_exchangeImplementations(newMethod2, method2);
}

//注意:在调用此方法时, 方法的指针已经交换:
+ (UIFont *)adjustFont:(CGFloat)fontSize {
    if (unit < 1) {//5s
        fontSize = fontSize - 2;
    }else if (unit == 1) {//8
        //fontSize = fontSize
    }else if (unit > 1) {//8p
        fontSize = fontSize + 2;
    }
    UIFont *newFont = nil;
    newFont = [UIFont adjustFont:fontSize];
    return newFont;
}

+ (UIFont *)adjustFont:(CGFloat)fontSize WithName:(NSString *)fontName {
    if (unit < 1) {//5s
        fontSize = fontSize - 2;
    }else if (unit == 1) {//8
        //fontSize = fontSize
    }else if (unit > 1) {//8p
        fontSize = fontSize + 2;
    }
    return [UIFont adjustFont:fontSize WithName:fontName];
}

@end
