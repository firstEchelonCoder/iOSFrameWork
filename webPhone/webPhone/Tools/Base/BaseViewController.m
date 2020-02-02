//
//  BaseViewController.m
//  QuitSmoking
//
//  Created by 朱啸 on 2019/8/5.
//  Copyright © 2019 zxzhuxiao. All rights reserved.
//

#import "BaseViewController.h"
#import <IQKeyboardManager.h>

#define BaseViewSize self.baseView.bounds.size
#define BaseViewSizeHeight self.baseView.bounds.size.height
#define BaseViewSizeWidth self.baseView.bounds.size.width

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
    // 判断是否有上级页面，有的话再调用
    if ([self.navigationController.viewControllers indexOfObject:self] > 0) {
        self.navigationController.navigationBar.hidden = NO;    //判断是否要显示导航栏。这里主要是为了首页使用TabBar的时候不展示导航栏
        [self setupLeftBarButton];
    }else {
        self.navigationController.navigationBar.hidden = YES;
    }
}

- (void)setupViews {
    // 设置应用的背景色
    self.view.backgroundColor = MainBackGroundColor_View;
    // 不允许 viewController 自动调整，我们自己布局；如果设置为YES，视图会自动下移 64 像素
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.baseView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - TAB_BAR_HEIGHT - STATUS_BAR_HEIGHT )];
    // 是否反弹
    self.baseView.bounces = NO;
    // 是否显示滚动指示器
    self.baseView.showsVerticalScrollIndicator = NO;
    self.baseView.showsHorizontalScrollIndicator = NO;
    
    [self.view addSubview:self.baseView];
    self.baseView.contentSize = BaseViewSize;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    //点击背景收回键盘
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    
    CGFloat baseViewHeight = 0;
    CGFloat baseViewWidth = 0;
    NSArray *subViews = self.baseView.subviews;

    // 遍历视图中的所有控件，求出最大的Y值和最大的X值
    for (UIView *view in subViews) {
        if (CGRectGetMaxY(view.frame) > baseViewHeight) {
            baseViewHeight = CGRectGetMaxY(view.frame);
        }
        if (CGRectGetMaxX(view.frame) > baseViewWidth) {
            baseViewWidth = CGRectGetMaxX(view.frame);
        }
    }

    // 三目运算方法求出最大的宽和最大的高
    CGFloat Height = baseViewHeight > BaseViewSizeHeight ? baseViewHeight:BaseViewSizeHeight;
    CGFloat Width = baseViewWidth > BaseViewSizeWidth ? baseViewWidth:BaseViewSizeWidth;

    self.baseView.contentSize = CGSizeMake(Width, Height);
}

#pragma mark - 自定义返回按钮
- (void)setupLeftBarButton {
    // 自定义 leftBarButtonItem ，UIImageRenderingModeAlwaysOriginal 防止图片被渲染
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
                                             initWithImage:[[UIImage imageNamed:@"leftArrow"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                             style:UIBarButtonItemStylePlain
                                             target:self
                                             action:@selector(leftBarButtonClick)];
    // 防止返回手势失效
    self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
}

#pragma mark - 返回按钮的点击事件
- (void)leftBarButtonClick {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
