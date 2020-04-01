//
//  CUSToastView.m
//  Customer
//
//  Created by apple on 2020/3/30.
//  Copyright © 2020 qiao. All rights reserved.
//

#import "CUSToastView.h"

@interface CUSToastView ()
{
    NSTimer *_timer;
}

@end

@implementation CUSToastView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)show:(NSString *)text {
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(dismiss) userInfo:nil repeats:NO];
}

- (void)dismiss {
    [self removeFromSuperview];
    if (_timer) {
        _timer = nil;
    }
}

@end
