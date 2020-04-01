//
//  NSDate+CUSValue.h
//  Customer
//
//  Created by apple on 2020/4/1.
//  Copyright © 2020 qiao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (CUSValue)

@property (nonatomic, assign, readonly) NSUInteger year;
@property (nonatomic, assign, readonly) NSUInteger month;
@property (nonatomic, assign, readonly) NSUInteger day;
@property (nonatomic, assign, readonly) NSUInteger hour;
@property (nonatomic, assign, readonly) NSUInteger minute;
@property (nonatomic, assign, readonly) NSUInteger seconds;
@property (nonatomic, assign, readonly) NSUInteger week;
@property (nonatomic, assign, readonly) NSUInteger weekday;
@property (nonatomic, copy, readonly) NSString *weekdayStr;

@property (nonatomic, assign, readonly) NSUInteger nthWeekday;
@property (nonatomic, assign, readonly) NSUInteger nearestHour;


@end

NS_ASSUME_NONNULL_END
