//
//  EventEmitter.h
//  Customer
//
//  Created by apple on 2020/4/2.
//  Copyright © 2020 qiao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EventEmitter : NSObject

+ (void)emit:(NSString *)name;
+ (void)emit:(NSString *)name params:(nullable id)params;

+ (EventEmitter *)addListener:(NSString *)name then:(void(^)(id params))thenBlock;

- (void)remove;
- (void)removeAllListeners;


@end

NS_ASSUME_NONNULL_END
