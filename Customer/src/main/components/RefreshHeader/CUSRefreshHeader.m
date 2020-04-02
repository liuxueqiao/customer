//
//  CUSRefreshHeader.m
//  Customer
//
//  Created by apple on 2020/4/2.
//  Copyright © 2020 qiao. All rights reserved.
//

#import "CUSRefreshHeader.h"
#import "UIColor+CUSColor.h"

@implementation CUSRefreshHeader

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.lastUpdatedTimeLabel.hidden = YES;
        self.labelLeftInset = 30;
        self.stateLabel.hidden = NO;
        self.stateLabel.textColor = [UIColor CUS_grayColor];
        
        [self setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
        [self setTitle:@"松开刷新" forState:MJRefreshStatePulling];
        [self setTitle:@"正在刷新中..." forState:MJRefreshStateRefreshing];
        [self setTitle:@"已全部加载完成" forState:MJRefreshStateNoMoreData];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
