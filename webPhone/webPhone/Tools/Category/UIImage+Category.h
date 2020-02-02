//
//  UIImage+Category.h
//  QuitSmoking
//
//  Created by 朱啸 on 2019/8/4.
//  Copyright © 2019 zxzhuxiao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Category)

/** 根据颜色生成纯色图片 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/*!
 @function
 @abstract      创建UIImage方法
 
 @param         imageName               图片名称,需有后缀名;如果没有后缀名,则默认为png格式
 @param         bundle                  图片位于的资源包;如果值为nil,则认为图片位置mainBundle中
 
 @note          该方法创建的UIImage对象不会被系统缓存
 
 @result        UIImage的实例              如果创建失败返回nil
 */
+ (UIImage *)imageWithContentsOfFile:(NSString *)imageName imageBundle:(NSString *)bundle;



/*!
 @function
 @abstract      创建UIImage方法
 
 @param         imageName               图片名称,需有后缀名;如果没有后缀名,则默认为png格式
 @param         bundle                  图片位于的资源包;如果值为nil,则认为图片位置mainBundle中
 
 @note          该方法创建的UIImage对象将会被系统缓存,对于tableView中大量服用的图片,使用该方法可以提高tableView的性能
 
 @result        UIImage的实例              如果创建失败返回nil
 */
+ (UIImage *)imageNamed:(NSString *)imageName imageBundle:(NSString *)bundle;
@end

NS_ASSUME_NONNULL_END
