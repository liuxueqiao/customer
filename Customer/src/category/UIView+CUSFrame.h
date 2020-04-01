//
//  UIView+CUSFrame.h
//  Customer
//
//  Created by apple on 2020/4/1.
//  Copyright © 2020 qiao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (CUSFrame)

@property (nonatomic, assign, readonly) CGFloat x;
@property (nonatomic, assign, readonly) CGFloat y;
@property (nonatomic, assign, readonly) CGFloat width;
@property (nonatomic, assign, readonly) CGFloat height;
@property (nonatomic, assign, readonly) CGFloat centerX;
@property (nonatomic, assign, readonly) CGFloat centerY;
@property (nonatomic, assign, readonly) CGFloat bottomY;

@property (nonatomic, assign, readonly) CGFloat top;
@property (nonatomic, assign, readonly) CGFloat bottom;
@property (nonatomic, assign, readonly) CGFloat left;
@property (nonatomic, assign, readonly) CGFloat right;

@end

NS_ASSUME_NONNULL_END
