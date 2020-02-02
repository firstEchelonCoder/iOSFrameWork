//
//  AppDelegate.m
//  webPhone
//
//  Created by 朱啸 on 2020/1/8.
//  Copyright © 2020 zxx. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseTabBarViewController.h"
#import "HomeViewController.h"
#import "BaseNavigationController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor colorNamed:@"MainColor"];
    HomeViewController *homeVC = [[HomeViewController alloc] init];
//    self.window.rootViewController = archiveList;
    BaseTabBarViewController *baseVC = [[BaseTabBarViewController alloc] init];
    self.window.rootViewController = baseVC;
    [self.window makeKeyAndVisible];
    return YES;
}



@end
