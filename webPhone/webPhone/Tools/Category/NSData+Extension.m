//
//  NSData+Extension.m
//  QuitSmoking
//
//  Created by 朱啸 on 2019/8/7.
//  Copyright © 2019 zxzhuxiao. All rights reserved.
//

#import "NSData+Extension.h"

@implementation NSData (Extension)

//计算传入的时间与当前时间的时间差
+ (NSTimeInterval)insertStarTime:(NSString *)starTime{
    //获取当前时间
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    //现在时间,你可以输出来看下是什么格式
    NSDate *datenow = [NSDate date];
    //----------将nsdate按formatter格式转成nsstring
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    NSLog(@"currentTimeString =  %@",currentTimeString);
    NSString *endTime = currentTimeString;
    
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"YYYY-MM-dd HH:mm:ss"];//根据自己的需求定义格式
    if ([starTime hasSuffix:@".0"]) {    //为了解决后台返回的数据格式为“2019-07-12 08:00:00.0”
        starTime = [starTime componentsSeparatedByString:@"."][0];
    }
    NSDate* startDate = [formater dateFromString:starTime];
    NSDate* endDate = [formater dateFromString:endTime];
    NSTimeInterval time = [endDate timeIntervalSinceDate:startDate];
    return time;
}

//计算两个时间的时间差
+ (NSTimeInterval)insertStarTime:(NSString *)starTime andInsertEndTime:(NSString *)endTime{
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"YYYY-MM-dd HH:mm:ss"];//根据自己的需求定义格式
    NSDate* startDate = [formater dateFromString:starTime];
    NSDate* endDate = [formater dateFromString:endTime];
    NSTimeInterval time = [endDate timeIntervalSinceDate:startDate];
    return time;
}

#pragma mark 将时间秒转换为 HH:MM:SS
+ (NSString *)getHHMMSSFromSS:(NSInteger)totalTime {
    
    //format of hour
    NSString *str_hour = [NSString stringWithFormat:@"%02ld",totalTime/3600%24];
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(totalTime%3600)/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%02ld",totalTime%60];
    //format of time
    NSString *format_time = [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
    
    return format_time;
    
}

#pragma mark 将时间秒转换为 DD
+ (NSString*)getDDFromSS:(NSInteger)totalTime {
    return [NSString stringWithFormat:@"%ld",totalTime/60/60/24];
}

#pragma mark 将时间秒转换为 HH
+ (NSString*)getHHFromSS:(NSInteger)totalTime {
    return [NSString stringWithFormat:@"%ld",totalTime/3600];;
}

@end
