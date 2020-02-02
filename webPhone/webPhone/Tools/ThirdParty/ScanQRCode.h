//
//  ScanQRCode.h
//  webPhone
//
//  Created by ZXX on 2020/1/15.
//  Copyright © 2020 zxx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^BackQRCodeURL)(NSString  *stringValue);
typedef void(^Backfailure)(void);

@interface ScanQRCode : UIView

/**扫描成功回调*/
@property (nonatomic,copy) BackQRCodeURL backQRCodeURL;
/**扫描失败回调*/
@property (nonatomic,copy) Backfailure backfailure;

@end

NS_ASSUME_NONNULL_END
