//
//  AlertUtil.m
//  Customer
//
//  Created by apple on 2020/4/1.
//  Copyright © 2020 qiao. All rights reserved.
//

#import "AlertUtil.h"
#import <UIKit/UIKit.h>

@implementation AlertUtil

+ (void)alert:(NSString *)message {
    [AlertUtil alert:message confirm:@"确定" bloc:nil cancel:nil bloc:nil];
}

+ (void)alert:(NSString *)message confirm:(void (^)(void))confirmBlock cancel:(void (^)(void))cancelBlock {
    [AlertUtil alert:message confirm:@"确定" bloc:confirmBlock cancel:@"取消" bloc:cancelBlock];
}

+ (void)alert:(NSString *)message confirm:(NSString *)confirm bloc:(void (^)(void))confirmBlock cancel:(NSString *)cancel bloc:(void (^)(void))cancelBlock {
    
    if (message.length == 0) {
        return;
    }
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"温馨提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    if (confirm.length > 0) {
        UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:confirm style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (confirmBlock) {
                confirmBlock();
            }
        }];
        [alertController addAction:confirmAction];
    }
    if (cancel) {
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancel style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (cancelBlock) {
                cancelBlock();
            }
        }];
        [alertController addAction:cancelAction];
    }
    
    UIViewController *alertVC = [[UIViewController alloc] init];
    [[UIApplication sharedApplication].keyWindow addSubview:alertVC.view];
    [alertVC presentViewController:alertController animated:YES completion:^{
      [alertVC.view removeFromSuperview];
    }];
}


@end
