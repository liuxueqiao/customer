//
//  EmptyView.h
//  Customer
//
//  Created by apple on 2020/4/2.
//  Copyright © 2020 qiao. All rights reserved.
//

#import "CUSBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface EmptyView : CUSBaseView

+ (EmptyView *)showAtView:(UIView *)view;

- (void)remove;

@end

NS_ASSUME_NONNULL_END
