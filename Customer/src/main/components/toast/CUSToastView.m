//
//  CUSToastView.m
//  Customer
//
//  Created by apple on 2020/3/30.
//  Copyright © 2020 qiao. All rights reserved.
//

#import "CUSToastView.h"
#import <Masonry/Masonry.h>

#define INTERVAL 3.0

@interface CUSToastView ()
{
    NSTimer *_timer;
}
@property (nonatomic, strong) UILabel *tipLabel;

@end

@implementation CUSToastView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.CUS_grayColor;
        self.layer.cornerRadius = 2.0;
        [[UIApplication sharedApplication].keyWindow addSubview:self];
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(0);
        }];
        
        _tipLabel = [UILabel new];
        _tipLabel.textColor = UIColor.whiteColor;
        _tipLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:_tipLabel];
        [_tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(5, 5, 5, 5));
        }];
        
        self.alpha = .0;
    }
    return self;
}

- (void)show:(NSString *)text {
    _tipLabel.text = text;
    _timer = [NSTimer scheduledTimerWithTimeInterval:INTERVAL target:self selector:@selector(dismiss) userInfo:nil repeats:NO];
    
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 1.0;
    }];
}

- (void)dismiss {
    [UIView animateWithDuration:0.25 animations:^{
           self.alpha = .0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
    if (_timer) {
        _timer = nil;
    }
}

- (void)dealloc {
    NSDebugLog(@"delloc----%@", _timer);
}

@end
