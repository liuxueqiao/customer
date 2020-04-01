//
//  NSDate+CUSString.m
//  Customer
//
//  Created by apple on 2020/4/1.
//  Copyright © 2020 qiao. All rights reserved.
//

#import "NSDate+CUSString.h"

@implementation NSDate (CUSString)

- (NSString *)ymdString {
    return [self ymdStringWithSeparator:@"-"];
}
- (NSString *)ymdhmString {
    NSDateFormatter *f = [NSDateFormatter new];
    f.dateFormat = @"yyyy-MM-dd hh:mm";
    return [f stringFromDate:self];
}

- (NSString *)ymdStringWithSeparator:(NSString *)separator {
    NSDateFormatter *f = [NSDateFormatter new];
    f.dateFormat = [NSString stringWithFormat:@"yyyy%@MM%@dd", separator, separator];
    return [f stringFromDate:self];
}

@end
