//
//  BaseViewController.h
//  QuitSmoking
//
//  Created by 朱啸 on 2019/8/5.
//  Copyright © 2019 zxzhuxiao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

/** 子视图容器 */
@property (nonatomic, strong) UIScrollView *baseView;

@end

NS_ASSUME_NONNULL_END
