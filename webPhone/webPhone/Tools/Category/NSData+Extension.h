//
//  NSData+Extension.h
//  QuitSmoking
//
//  Created by 朱啸 on 2019/8/7.
//  Copyright © 2019 zxzhuxiao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (Extension)

//计算传入的时间与当前时间的时间差
+ (NSTimeInterval)insertStarTime:(NSString *)starTime;

//计算两个时间的时间差
+ (NSTimeInterval)insertStarTime:(NSString *)starTime andInsertEndTime:(NSString *)endTime;

//将时间秒转换为 HH:MM:SS
+ (NSString *)getHHMMSSFromSS:(NSInteger)totalTime;

//将时间秒转换为 DD
+ (NSString*)getDDFromSS:(NSInteger)totalTime;

//将时间秒转换为 HH
+ (NSString*)getHHFromSS:(NSInteger)totalTime;

@end

NS_ASSUME_NONNULL_END
