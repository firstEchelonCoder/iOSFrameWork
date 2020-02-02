//
//  TopSearch.m
//  webPhone
//
//  Created by 朱啸 on 2020/1/10.
//  Copyright © 2020 zxx. All rights reserved.
//

#import "TopSearch.h"

@interface TopSearch ()

@end

@implementation TopSearch

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.searchBar];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    WS(ws);
    [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.height.mas_equalTo(ws);
    }];
}

- (UISearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc] init];
        // 自适应大小
        [_searchBar sizeToFit];
        // 1.设置搜索框的样式
        [_searchBar setSearchBarStyle:UISearchBarStyleDefault];
        // 2.设置背景图片(该方法可以去掉UISearchBar上下的两条线)
//        _searchBar.backgroundImage = [UIImage imageWithColor:[UIColor clearColor]];
        // 3.设置主题颜色
        _searchBar.barTintColor = [UIColor whiteColor];
        // 5.设置光标颜色
        _searchBar.tintColor = [UIColor blueColor];
        // 6.设置是否透明
        _searchBar.translucent = YES;
        // 7.设置占位文字
        _searchBar.placeholder = @"查询房源核验/不动产权证";
        // 14.设置键盘的样式
        _searchBar.keyboardType = UIKeyboardTypeDefault;
        // 21.显示右侧的取消按钮(有动画)
        [_searchBar setShowsCancelButton:YES animated:YES];
        for (UIView *view in [[_searchBar.subviews lastObject] subviews]) {
            if (@available(iOS 13.0, *)) {
                for (UIView *buttonView in view.subviews) {
                    if ([buttonView isKindOfClass:[UIButton class]]) {
                        UIButton *cancelBtn = (UIButton *)buttonView;
                        [cancelBtn setBackgroundImage:[UIImage imageNamed:@"scanCode"] forState:UIControlStateNormal];
                        [cancelBtn setTitle:@"" forState:UIControlStateNormal];
                    }
                    if ([buttonView isKindOfClass:[UITextField class]]) {
                        UITextField *searTextField = (UITextField *)buttonView;
                        searTextField.backgroundColor = [UIColor whiteColor];
                    }
                }
            }else {
                if ([view isKindOfClass:[UIButton class]]) {
                    UIButton * cancelBtn = (UIButton *)view;
                    [cancelBtn setBackgroundImage:[UIImage imageNamed:@"scanCode"] forState:UIControlStateNormal];
                    [cancelBtn setTitle:@"" forState:UIControlStateNormal];
                }
            }
        }
        for (UIView *subview in _searchBar.subviews) {
            for(UIView* grandSonView in subview.subviews){
                if ([grandSonView isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
                    grandSonView.alpha = 0.0f;
                }else if([grandSonView isKindOfClass:NSClassFromString(@"UISearchBarTextField")] ){
                    ZXLog(@"Keep textfiedld bkg color");
                }else{
                    grandSonView.alpha = 1.0f;
                }
            }
        }
    }
    return _searchBar;
}

@end
