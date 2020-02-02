//
//  HomeViewController.m
//  webPhone
//
//  Created by 朱啸 on 2020/1/9.
//  Copyright © 2020 zxx. All rights reserved.
//

#import "HomeViewController.h"
#import "TopSearch.h"
#import "ScanQRCodeViewController.h"
#import "SDCycleScrollView.h"

@interface HomeViewController ()<UISearchBarDelegate>

@property (strong, nonatomic) TopSearch *topSearch;
@property (strong, nonatomic) SDCycleScrollView *cycleScrollView;

@end

@implementation HomeViewController
{
    NSArray *_imagesURLStrings;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.baseView.backgroundColor = MainColor;
    [self.baseView addSubview:self.topSearch];
    WS(ws);
    [_topSearch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.centerX.mas_equalTo(ws.baseView);
        make.width.mas_equalTo(ws.baseView.mas_width);
        make.height.mas_equalTo(80);
    }];
    _topSearch.searchBar.delegate = self;
    UILabel *lab = [[UILabel alloc] init];
    lab.text = @"Hi, ZXX ! Say HelloWorld !  嗨，ZXX，你好世界";
    lab.font = [UIFont fontWithName:@"FZHuangCao-S09S" size:18];//FZHuangCao-S09S、FZQiTi-S14S
    [self.baseView addSubview:lab];
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.topSearch.mas_bottom).offset(20);
        make.width.left.mas_equalTo(ws.baseView);
        make.height.mas_equalTo(@30);
    }];
    [self getCycleScrollData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)getCycleScrollData {
    [HttpTool getWithPath:@"realEstate/app/banner/getBanners" params:@{} success:^(id  _Nonnull json) {
        ZXLog(@"%@",json);
    } failure:^(NSError * _Nonnull error) {
        
    }];
}

- (TopSearch *)topSearch {
    if (!_topSearch) {
        _topSearch = [[TopSearch alloc] init];
    }
    return _topSearch;
}

#pragma mark UISearchBarDelegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
        // called when text starts editing
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    // called when text ends editing
}


- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    // called when text changes (including clear)
}

//点击键盘上搜索时的相应事件
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    // called when keyboard search button pressed
    [HttpTool getWithPath:@"realEstate/app/cx/getBdcxx" params:@{@"bdczh": searchBar.text} success:^(id  _Nonnull json) {
        ZXLog(@"json:::%@", json);
    } failure:^(NSError * _Nonnull error) {
        ZXLog(@"error:%@", error);
    }];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    // CancelButtonClick Method
    ZXLog(@"searchBarCancelButtonClicked");
    ScanQRCodeViewController *scanVC = [[ScanQRCodeViewController alloc] init];
    [self.navigationController pushViewController:scanVC animated:YES];
}

@end
