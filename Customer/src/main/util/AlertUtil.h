//
//  AlertUtil.h
//  Customer
//
//  Created by apple on 2020/4/1.
//  Copyright © 2020 qiao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AlertUtil : NSObject

+ (void)alert:(NSString *)message;
+ (void)alert:(NSString *)message confirm:(void (^__nullable)(void))confirmBlock cancel:(void (^__nullable)(void))cancelBlock;
+ (void)alert:(NSString *)message confirm:(NSString *__nullable)confirm bloc:(void (^__nullable)(void))confirmBlock cancel:(NSString *__nullable)cancel bloc:(void (^__nullable)(void))cancelBlock;

@end

NS_ASSUME_NONNULL_END
