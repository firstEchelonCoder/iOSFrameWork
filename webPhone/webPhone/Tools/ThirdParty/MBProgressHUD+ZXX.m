//
//  MBProgressHUD+ZXX.m
//  webPhone
//
//  Created by ZXX on 2020/2/1.
//  Copyright © 2020 zxx. All rights reserved.
//

#import "MBProgressHUD+ZXX.h"


// 统一的显示时长
#define HudShowTime 1.5

@implementation MBProgressHUD (ZXX)

#pragma mark 显示带图片或者不带图片的信息
+ (void)ShowMessage:(NSString *)message withIcon:(NSString *)icon withView:(UIView *)view {
    if (view == nil) {
        view = [[UIApplication sharedApplication].windows lastObject];
    }
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = message;
    // 判断是否显示图片
    if (icon == nil) {
        hud.mode = MBProgressHUDModeText;
    }else {
        // 设置图片
//        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]];
        UIImage *img = [UIImage imageNamed:icon imageBundle:@"MBProgressHUD"];
        img = img == nil ? [UIImage imageNamed:icon] : img;
        hud.customView = [[UIImageView alloc] initWithImage:img];
        // 再设置模式
        hud.mode = MBProgressHUDModeCustomView;
    }
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // 指定时间之后再消失
    [hud hideAnimated:YES afterDelay:HudShowTime];
}

#pragma mark 显示一条信息
+ (void)ShowMessageHUD:(NSString *)message toView:(UIView *)view {
    [self ShowMessage:message withIcon:nil withView:view];
}

#pragma mark 显示成功信息
+ (void)ShowSuccessHUD:(NSString *)success toView:(UIView *)view {
    [self ShowMessage:success withIcon:@"success.png" withView:view];
}

#pragma mark 显示错误信息
+ (void)ShowErrorHUD:(NSString *)error toView:(UIView *)view {
    [self ShowMessage:error withIcon:@"error.png" withView:view];
}

#pragma mark 显示警告信息
+ (void)ShowWarningHUD:(NSString *)warning toView:(UIView *)view {
    [self ShowMessage:warning withIcon:@"warn" withView:view];
}

#pragma mark 显示自定义图片信息
+ (void)ShowMessageWithImageName:(NSString *)imageName message:(NSString *)message toView:(UIView *)view {
    [self ShowMessage:message withIcon:imageName withView:view];
}

#pragma mark 加载中
+ (MBProgressHUD *)ShowActivityMessageHUD:(NSString*)message view:(UIView *)view {
    if (view == nil) {
        view = [[UIApplication sharedApplication].windows lastObject];
    }
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = message;
    // 细节文字
    //    hud.detailsLabelText = @"请耐心等待";
    // 再设置模式
    hud.mode = MBProgressHUDModeIndeterminate;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    return hud;
}

+ (MBProgressHUD *)ShowProgressBarToViewHUD:(UIView *)view {
    if (view == nil) {
        view = [[UIApplication sharedApplication].windows lastObject];
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeDeterminate;
    hud.label.text = @"加载中...";
    return hud;
}

+ (void)ShowMessageHUD:(NSString *)message {
    [self ShowMessageHUD:message toView:nil];
}

+ (void)ShowSuccessHUD:(NSString *)success {
    [self ShowSuccessHUD:success toView:nil];
}

+ (void)ShowErrorHUD:(NSString *)error {
    [self ShowErrorHUD:error toView:nil];
}

+ (void)ShowWarningHUD:(NSString *)Warning {
    [self ShowWarningHUD:Warning toView:nil];
}

+ (void)ShowMessageWithImageName:(NSString *)imageName message:(NSString *)message {
    [self ShowMessageWithImageName:imageName message:message toView:nil];
}

+ (MBProgressHUD *)showActivityMessage:(NSString*)message {
    return [self ShowActivityMessageHUD:message view:nil];
}

+ (void)HideHUDForView:(UIView *)view {
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    [self hideHUDForView:view animated:YES];
}

+ (void)HideHUD {
    [self HideHUDForView:nil];
}
@end
