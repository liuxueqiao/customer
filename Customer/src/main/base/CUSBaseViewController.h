//
//  CUSBaseViewController.h
//  Customer
//
//  Created by apple on 2020/3/30.
//  Copyright © 2020 qiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+CUSColor.h"
#import "Toast.h"

NS_ASSUME_NONNULL_BEGIN

@interface CUSBaseViewController : UIViewController

// 关联viewModel
- (void)bindViewModel;

// 刷新数据
- (void)reloadDatas:(id __nullable)params;
- (void)reloadView:(NSInteger)index params:(id __nullable)params;

@end

NS_ASSUME_NONNULL_END
