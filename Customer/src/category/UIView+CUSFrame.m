//
//  UIView+CUSFrame.m
//  Customer
//
//  Created by apple on 2020/4/1.
//  Copyright © 2020 qiao. All rights reserved.
//

#import "UIView+CUSFrame.h"

@implementation UIView (CUSFrame)


- (CGFloat)x {
    return self.frame.origin.x;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (CGFloat)centerY {
    return self.center.y;
}

- (CGFloat) bottomY {
    return [self y] + [self height];
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)left {
    return self.frame.origin.x;
}

@end
