//
//  DatePicker.h
//  Customer
//
//  Created by apple on 2020/4/2.
//  Copyright © 2020 qiao. All rights reserved.
//

#import "CUSBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DatePicker : CUSBaseView

/**
 日期字符串格式：yyyy-MM-dd
 */
@property (nonatomic, strong) NSString *defaultDateString;

/**
 date 用户点击确定，返回日期字符串格式yyyy-MM-dd; 取消返回空@""
 */
- (void)show:(void(^)(NSString *date))resultBlock;

@end

NS_ASSUME_NONNULL_END
