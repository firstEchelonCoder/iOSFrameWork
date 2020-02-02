//
//  ScanQRCodeViewController.m
//  webPhone
//
//  Created by ZXX on 2020/1/15.
//  Copyright © 2020 zxx. All rights reserved.
//

#import "ScanQRCodeViewController.h"
#import "ScanQRCode.h"//扫描控件

@interface ScanQRCodeViewController ()

@end

@implementation ScanQRCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    //页面标题
    self.navigationItem.title = @"扫一扫";
    __weak typeof(self) weakSelf = self;
    ScanQRCode *qrcodeView = [[ScanQRCode alloc] initWithFrame:self.view.bounds];
    qrcodeView.backQRCodeURL = ^(NSString *stringValue) {
        [weakSelf alertViewTitle:@"扫描成功" Message:stringValue];
    };
    qrcodeView.backfailure = ^{
        [weakSelf alertViewTitle:@"扫描失败" Message:@"扫描失败"];
    };
    [self.view addSubview:qrcodeView];
}

- (void)alertViewTitle:(NSString *)title Message:(NSString *)message
{
    __weak typeof(self) weakSelf = self;
    UIAlertController *alertV = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertV addAction:[UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [weakSelf.navigationController popViewControllerAnimated:YES];
    }]];
    [self presentViewController:alertV animated:YES completion:nil];
}

@end
