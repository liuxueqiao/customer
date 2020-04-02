//
//  EmptyView.m
//  Customer
//
//  Created by apple on 2020/4/2.
//  Copyright © 2020 qiao. All rights reserved.
//

#import "EmptyView.h"

@interface EmptyView ()
@property (nonatomic, strong) UILabel *text;
@end

@implementation EmptyView

+ (EmptyView *)showAtView:(UIView *)view {
    EmptyView *emptyView = [EmptyView new];
    emptyView.frame = CGRectMake(0, 0, view.width, view.height);
    [view addSubview:emptyView];
    [view bringSubviewToFront:emptyView];
    return emptyView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        _text = [UILabel new];
        _text.backgroundColor = [UIColor whiteColor];
        _text.font = [UIFont systemFontOfSize:14.0];
        _text.textColor = [UIColor CUS_lightGrayColor];
        _text.textAlignment = NSTextAlignmentCenter;
        _text.text = @"暂无数据...";
        [self addSubview:_text];
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    _text.frame = CGRectMake(newSuperview.width/2.0-60, newSuperview.height/2.0-20, 120, 40);
}

- (void)remove {
    [self removeFromSuperview];
}

- (void)dealloc {
    NSDebugLog(@"delloc===== %@", _text);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
