//
//  BaseTabBarViewController.m
//  QuitSmoking
//
//  Created by 朱啸 on 2019/8/4.
//  Copyright © 2019 zxzhuxiao. All rights reserved.
//

#import "BaseTabBarViewController.h"
#import "BaseNavigationController.h"

@interface BaseTabBarViewController ()

/**
 用来存储从plist文件中获取的数据
 */
@property(strong, nonatomic) NSArray *tabBarMessageArry;

@end

@implementation BaseTabBarViewController

- (NSArray *) tabBarMessageArry{
    if (!_tabBarMessageArry) {
        _tabBarMessageArry = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"TabBarViewController" ofType:@"plist"]];
    }
    return _tabBarMessageArry;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //通过appearance统一设置所有的UITabBarItem的文字属性
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:56/255.0 green:165/255.0 blue:241/255.0 alpha:1]} forState:(UIControlStateSelected)];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]} forState:(UIControlStateNormal)];
    
    //添加子控制器
    for (NSDictionary *dic in self.tabBarMessageArry) {
        Class viewControllerClass = NSClassFromString(dic[@"tabbarController"]);
        UIViewController *viewController = [[viewControllerClass alloc] init];
        viewController.tabBarItem.image = [UIImage imageNamed:dic[@"tabbarImage"]];
        viewController.tabBarItem.selectedImage = [UIImage imageNamed:dic[@"tabbarSelectImage"]];
        viewController.title = dic[@"tabbarTitle"];
        //因为这里我不需要添加导航栏，故注释掉了
        BaseNavigationController *navgation = [[BaseNavigationController alloc] initWithRootViewController:viewController];
        [self addChildViewController:navgation];
    }
}

//- (void)viewWillLayoutSubviews{
//    CGRect tabFrame = self.tabBar.frame; //self.TabBar is IBOutlet of your TabBar
//    tabFrame.size.height = 75;
//    tabFrame.origin.y = self.view.frame.size.height - 75;
//    self.tabBar.frame = tabFrame;
//}

@end
