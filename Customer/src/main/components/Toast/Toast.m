//
//  Toast.m
//  Customer
//
//  Created by apple on 2020/3/30.
//  Copyright © 2020 qiao. All rights reserved.
//

#import "Toast.h"
#import "CUSToastView.h"

@implementation Toast

+ (void)show:(NSString *)text {
    CUSToastView *view = [CUSToastView new];
    [view show:text];
}

@end
