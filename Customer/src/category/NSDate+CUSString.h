//
//  NSDate+CUSString.h
//  Customer
//
//  Created by apple on 2020/4/1.
//  Copyright © 2020 qiao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (CUSString)

- (NSString *)ymdString;
- (NSString *)ymdhmString;

- (NSString *)ymdStringWithSeparator:(NSString *)separator;

@end

NS_ASSUME_NONNULL_END
