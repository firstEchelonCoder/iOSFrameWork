//
//  Macro.h
//  QuitSmoking
//
//  Created by ZXX on 2020/1/1.
//  Copyright © 2019 zxx. All rights reserved.
//

#ifndef Macro_h
#define Macro_h


/** 屏幕宽度 */
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
/** 屏幕高度 */
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
/** 去除导航条的高度*/
#define LoseNav_height (iphoneX ? SCREEN_HEIGHT - 88 : SCREEN_HEIGHT - 64)

// 判断是否是ipad
#define isPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
// 判断iPhone4系列
#define kiPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
// 判断iPhone5系列
#define kiPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
// 判断iPhone6系列
#define kiPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
// 判断iphone6+系列
#define kiPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
// 判断iPhoneX
#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
// 判断iPHoneXr
#define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
// 判断iPhoneXs
#define IS_IPHONE_Xs ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
// 判断iPhoneXs Max
#define IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)



// 在 iPhoneX 系列上 status bar的增量
#define STATUSBAR_HEIGHT_DELTA_ON_IPHONEX  ((IS_IPHONE_X || IS_IPHONE_Xr || IS_IPHONE_Xs || IS_IPHONE_Xs_Max) == NO ? 0.0 : 24.0 )
// 在 iPhoneX 系列上 bottom bar的增量
#define BOTTOM_HEIGHT_DELTA_ON_IPHONEX  ((IS_IPHONE_X || IS_IPHONE_Xr || IS_IPHONE_Xs || IS_IPHONE_Xs_Max) == NO ? 0.0 : 34.0 )


// 系统控件默认高度随之调整
#define STATUS_BAR_HEIGHT       (20.0 + STATUSBAR_HEIGHT_DELTA_ON_IPHONEX)
#define TOP_BAR_HEIGHT          (44.0)
#define NAVIGATION_BAR_HEIGHT   (STATUS_BAR_HEIGHT + TOP_BAR_HEIGHT)
#define TAB_BAR_HEIGHT          (49.0 + BOTTOM_HEIGHT_DELTA_ON_IPHONEX)
#define CELL_DEFAULT_HEIGHT     (44.0)
#define EnglishKeyboardHeight   (216.0)
#define ChineseKeyboardHeight   (252.0)


// View 坐标(x,y)和宽高(width,height)
#define X(v)                    (v).frame.origin.x
#define Y(v)                    (v).frame.origin.y

#define WIDTH(v)                (v).frame.size.width
#define HEIGHT(v)               (v).frame.size.height

#define MinX(v)                 CGRectGetMinX((v).frame)
#define MinY(v)                 CGRectGetMinY((v).frame)

#define MidX(v)                 CGRectGetMidX((v).frame)
#define MidY(v)                 CGRectGetMidY((v).frame)

#define MaxX(v)                 CGRectGetMaxX((v).frame)
#define MaxY(v)                 CGRectGetMaxY((v).frame)


// 沙盒路径
#define PATH_OF_APP_HOME    NSHomeDirectory()
#define PATH_OF_TEMP        NSTemporaryDirectory()
#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

// 颜色(RGB)
#define RGBCOLOR(r, g, b)       [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r, g, b, a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
// 随机颜色
#define RANDOM_UICOLOR     [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1]
// 主体颜色
#define MainColor [UIColor colorNamed:@"MainColor"]
#define MainBackGroundColor_View [UIColor colorNamed:@"MainBackGroundColor_View"]   //View的背景色
#define TabBarBackColor [UIColor colorNamed:@"TabBarBackColor"]  //TabBar的背景色

// View 圆角和加边框
#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

// View 圆角
#define ViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

#ifdef DEBUG        //判断是不是开发、调试状态，如果是开发、调试状态，就让ZXLog替换NSLog
#define ZXLog(...) NSLog(__VA_ARGS__)      //ZXLog是不限制参数的，中间用三个英文句号表示
#elif               //如果是发布状态SXTLog就直接为空
#define ZXLog(...)
#endif

//获取弱应用对象
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#define ServerIP @"http://127.0.0.1:9999/"

#endif /* Macro_h */
