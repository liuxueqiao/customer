//
//  CUSLabel.m
//  Customer
//
//  Created by apple on 2020/4/2.
//  Copyright © 2020 qiao. All rights reserved.
//

#import "CUSLabel.h"

@implementation CUSLabel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.contentInsets = UIEdgeInsetsZero;
        self.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.contentInsets = UIEdgeInsetsZero;
        self.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    return UIEdgeInsetsInsetRect(textRect, UIEdgeInsetsMake(-self.contentInsets.top, -self.contentInsets.left, -self.contentInsets.bottom, -self.contentInsets.right));
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
