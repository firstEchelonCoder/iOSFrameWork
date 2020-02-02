//
//  MBProgressHUD+ZXX.h
//  webPhone
//
//  Created by ZXX on 2020/2/1.
//  Copyright © 2020 zxx. All rights reserved.
//


#import "MBProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN

@interface MBProgressHUD (ZXX)

#pragma mark 在指定的view上显示hud
+ (void)ShowMessageHUD:(NSString *)message toView:(UIView *)view;
+ (void)ShowSuccessHUD:(NSString *)success toView:(UIView *)view;
+ (void)ShowErrorHUD:(NSString *)error toView:(UIView *)view;
+ (void)ShowWarningHUD:(NSString *)Warning toView:(UIView *)view;
+ (void)ShowMessageWithImageName:(NSString *)imageName message:(NSString *)message toView:(UIView *)view;
+ (MBProgressHUD *)ShowActivityMessageHUD:(NSString*)message view:(UIView *)view;
+ (MBProgressHUD *)ShowProgressBarToView:(UIView *)view;


#pragma mark 在window上显示hud
+ (void)ShowMessageHUD:(NSString *)message;
+ (void)ShowSuccessHUD:(NSString *)success;
+ (void)ShowErrorHUD:(NSString *)error;
+ (void)ShowWarningHUD:(NSString *)Warning;
+ (void)ShowMessageWithImageName:(NSString *)imageName message:(NSString *)message;
+ (MBProgressHUD *)ShowActivityMessage:(NSString*)message;


#pragma mark 移除hud
+ (void)HideHUDForView:(UIView *)view;
+ (void)HideHUD;

@end

NS_ASSUME_NONNULL_END
