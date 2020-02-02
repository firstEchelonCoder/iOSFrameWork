//
//  UIView+AddClickedEvent.h
//  QuitSmoking
//
//  Created by 朱啸 on 2019/8/7.
//  Copyright © 2019 zxzhuxiao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (AddClickedEvent)

- (void)addClickedBlock:(void(^)(id obj))tapAction;

@end

NS_ASSUME_NONNULL_END
