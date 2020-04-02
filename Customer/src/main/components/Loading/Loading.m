//
//  Loading.m
//  Customer
//
//  Created by apple on 2020/4/2.
//  Copyright © 2020 qiao. All rights reserved.
//

#import "Loading.h"

@interface Loading ()
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;

- (void)_show;
- (void)_remove;
@end

@implementation Loading

#pragma mark - 需要在window上全屏展示

static int _loadingCount = 0;

+ (void)show {
    [Loading showAtView:[UIApplication sharedApplication].keyWindow];
}
+ (void)showAtView:(UIView *)view {
    BOOL isShow = NO;
    for (UIView *item in view.subviews) {
        if ([item isKindOfClass:[Loading class]]) {
            isShow = YES;
            break;
        }
    }
    if (isShow) {
        _loadingCount ++;
    }
    if (_loadingCount == 0) {
        Loading *loading = [Loading new];
        loading.frame = [UIScreen mainScreen].bounds;
        [view addSubview:loading];
        [loading _show];
    }
}

+ (void)remove {
    if (_loadingCount > 0) {
        _loadingCount --;
    } else {
        for (UIView *item in [UIApplication sharedApplication].keyWindow.subviews) {
            if ([item isKindOfClass:[Loading class]]) {
                Loading *loading = (Loading *)item;
                [loading _remove];
            }
        }
    }
}

#pragma mark - privite

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor CUS_grayColor] colorWithAlphaComponent:0.3];
        [self _setupSubviews];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_onTapGesture)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)_show {
    [self.indicatorView startAnimating];
}

- (void)_remove {
    [UIView animateWithDuration:0.25 animations:^{
        self.backgroundColor = [UIColor clearColor];
        self.contentView.alpha = .0;
    } completion:^(BOOL finished) {
        [self.indicatorView stopAnimating];
        self.indicatorView = nil;
        [self removeFromSuperview];
    }];
}

- (void)_onTapGesture {
    [self _remove];
    _loadingCount = 0;
}

- (void)_setupSubviews {
    _contentView = [UIView new];
    _contentView.frame = CGRectMake(SCREEN_WIDTH/2.0-50, SCREEN_HEIGHT/2.0-50, 100, 100);
    _contentView.backgroundColor = [[UIColor CUS_grayColor] colorWithAlphaComponent:0.6];
    _contentView.layer.cornerRadius = 4.0;
    [self addSubview:_contentView];
    
    _indicatorView = [UIActivityIndicatorView new];
    _indicatorView.frame = CGRectMake(0, 10, 100, 60);
    _indicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    [self.contentView addSubview:_indicatorView];
    
    UILabel *label = [UILabel new];
    label.frame = CGRectMake(0, 70, 100, 16);
    label.font = [UIFont systemFontOfSize:14];
    label.text = @"加载中...";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:label];
}

- (void)dealloc {
    NSDebugLog(@"delloc====indicator %@", _indicatorView);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
